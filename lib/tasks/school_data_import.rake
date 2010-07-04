namespace :db do
  desc "load user data from csv"
  task :load_csv_data  => :environment do
    require 'fastercsv'
    
    FasterCSV.foreach("doc/data/NCES_Report_Set1-raw.csv") do |row|
      if row[0] == 'STATE NAME' 
        next
      end     
      state = State.find_or_create_by_name(:name => row[0], :abbrev => row[3])   
      county = County.find_or_create_by_name(:name => row[4], :number => row[5], :state_id => state.id)
      district = SchoolDistrict.find_or_create_by_name(:name => row[1])
      
      school = School.create(
                    :county_id => county.id, :state_id => state.id, :school_district_id => district.id,
                    :name => row[2], :mailing_address => row[6], :mailing_city => row[7],
                    :mailing_state_abbr => row[8], :mailing_zip => row[9], :mailing_zip4 => row[10], :phone => row[11],
                    :location_address => row[12], :location_city => row[13], :location_state_abbr => row[14],
                    :location_zip => row[15], :location_zip4 => row[16], :school_type => row[17], :agency_type => row[18],
                    :school_id_nces_assigned => row[19], :agency_id_nces_assigned => row[20],
                    :charter_school => row[21], :magnet_school => row[22], :shared_time_school => row[23],
                    :urban_centric_locale => row[24], :school_wide_title_i => row[25], :title_i_eligible_school => row[26],
                    :state_fips => row[27], :cbsa_name => row[28], :cbsa_id => row[29], :csa_name => row[30],
                    :csa_id => row[31], :operational_status => row[32], :latitude => row[33], :longitude => row[34],
                    :state_school_id => row[35], :state_agency_id => row[36], :congressional_code => row[37],
                    :school_level_code => row[46], :low_grade => row[47], :high_grade => row[48]
                    )
                    
      Enrollment.create(
        :school_id => school.id, :state_school_id => row[35], :state_abbr => row[3],
        :total_students => row[38], :total_male_students => row[39], :total_female_students => row[40],
        :american_indian_students => row[41], :asian_students => row[42], 
        :black_non_hispanic_students => row[43], :hispanic_students => row[44], :white_students => row[45]
      )
    end
    
    
    FasterCSV.foreach("doc/data/NCES_Report_Set2-raw.csv") do |row|
      if row[0] == 'STATE NAME' 
        next
      end     
      state = State.find_or_create_by_name(:name => row[0], :abbrev => row[3])
      county = County.find_or_create_by_name(:name => row[4], :number => row[5], :state_id => state.id)
      district = SchoolDistrict.find_or_create_by_name(:name => row[1])
      
      school = School.find_by_state_school_id(row[24])
      school.update_attributes(
        :pupil_teacher_ratio => row[45],
        :fte_teachers => row[46]
      )
      
      enrollment = school.enrollment
      enrollment.update_attributes(
        :prek_students => row[27],
        :kindergarten_students => row[28],
        :first_grade_students => row[29],
        :second_grade_students => row[30],
        :third_grade_students => row[31],
        :fourth_grade_students => row[32],
        :fifth_grade_students => row[33],
        :sixth_grade_students => row[34],
        :seventh_grade_students => row[35],
        :eigth_grade_students => row[36],
        :ninth_grade_students => row[37],
        :tenth_grade_students => row[38],
        :eleventh_grade_students => row[39],
        :twelfth_grade_students => row[40],
        :ungraded_students => row[41],
        :free_lunch_eligible => row[42],
        :reduced_price_lunch_eligible => row[43],
        :free_and_reduced_lunch => row[44]
      )
    end
      
    
    FasterCSV.foreach("doc/data/NCES_Report_Set3-raw.csv") do |row|
      if row[0] == 'STATE NAME' 
        next
      end
      state = State.find_or_create_by_name(:name => row[0], :abbrev => row[3])
      county = County.find_or_create_by_name(:name => row[4], :number => row[5], :state_id => state.id)
      district = SchoolDistrict.find_or_create_by_name(:name => row[1])
      school = School.find_by_state_school_id(row[6])
      
      enrollment = school.enrollment
      enrollment.update_attributes(
        :american_indian_male_students => row[8],
        :american_indian_male_students => row[9],
        :asian_male_students => row[10],
        :asian_female_students => row[11],
        :black_non_hispanic_male_students => row[12],
        :black_non_hispanic_female_students => row[13],
        :hispanic_male_students => row[14],
        :hispanic_female_students => row[15],
        :white_male_students => row[16],
        :white_female_students => row[17],
        :prek_male_students => row[18],
        :prek_female_students => row[19],
        :kindergarten_male_students => row[20],
        :kindergarten_female_students => row[21],
        :first_grade_male_students => row[22],
        :first_grade_female_students => row[23],
        :second_grade_male_students => row[24],
        :second_grade_female_students => row[25],
        :third_grade_male_students => row[26],
        :third_grade_female_students => row[27],
        :fourth_grade_male_students => row[28],
        :fourth_grade_female_students => row[29],
        :fifth_grade_male_students => row[30],
        :fifth_grade_female_students => row[31],
        :sixth_grade_male_students => row[32],
        :sixth_grade_female_students => row[33],
        :seventh_grade_male_students => row[34],
        :seventh_grade_female_students => row[35],
        :eighth_grade_male_students => row[36],
        :eighth_grade_female_students => row[37],
        :ninth_grade_male_students => row[38],
        :ninth_grade_female_students => row[39],
        :tenth_grade_male_students => row[40],
        :tenth_grade_female_students => row[41],
        :eleventh_grade_male_students => row[42],
        :eleventh_grade_female_students => row[43],
        :twelfth_grade_male_students => row[44],
        :twelfth_grade_female_students => row[45],
        :ungraded_male_students => row[46],
        :ungraded_female_students => row[47]
      )
    end

    
  end
end

