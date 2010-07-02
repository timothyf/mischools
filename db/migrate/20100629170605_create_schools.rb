

class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.references :county
      t.references :state
      t.references :school_district
      t.string    :name
      t.string    :mailing_address
      t.string    :mailing_city
      t.string    :mailing_state_abbr
      t.string    :mailing_zip
      t.string    :mailing_zip4
      t.string    :phone
      t.string    :location_address
      t.string    :location_city
      t.string    :location_state_abbr
      t.string    :location_zip
      t.string    :location_zip4
      t.string    :school_type
      t.string    :agency_type
      t.string    :school_id_nces_assigned
      t.string    :agency_id_nces_assigned
      t.string    :charter_school
      t.string    :magnet_school
      t.string    :shared_time_school
      t.string    :urban_centric_locale
      t.string    :school_wide_title_i
      t.string    :title_i_eligible_school
      t.string    :state_fips
      t.string    :cbsa_name
      t.string    :cbsa_id
      t.string    :csa_name
      t.string    :csa_id
      t.string    :operational_status
      t.string    :state_school_id
      t.string    :state_agency_id
      t.string    :latitude
      t.string    :longitude
      t.string    :congressional_code
      t.string    :pupil_teacher_ratio
      t.integer   :fte_teachers
      t.string    :school_level_code
      t.string    :low_grade
      t.string    :high_grade
      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end




