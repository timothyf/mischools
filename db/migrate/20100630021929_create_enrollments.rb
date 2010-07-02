class CreateEnrollments < ActiveRecord::Migration
  def self.up
    create_table :enrollments do |t|
      t.references  :school
      t.string      :state_school_id
      t.string      :state_abbr
      
      t.integer   :total_students
      t.integer   :prek_students
      t.integer   :kindergarten_students
      t.integer   :first_grade_students
      t.integer   :second_grade_students
      t.integer   :third_grade_students
      t.integer   :fourth_grade_students
      t.integer   :fifth_grade_students
      t.integer   :sixth_grade_students
      t.integer   :seventh_grade_students
      t.integer   :eigth_grade_students
      t.integer   :ninth_grade_students
      t.integer   :tenth_grade_students
      t.integer   :eleventh_grade_students
      t.integer   :twelfth_grade_students
      t.integer   :ungraded_students
      t.integer   :free_lunch_eligible
      t.integer   :reduced_price_lunch_eligible
      t.integer   :free_and_reduced_lunch
      t.integer   :total_male_students
      t.integer   :total_female_students
      t.integer   :american_indian_students
      t.integer   :asian_students
      t.integer   :black_non_hispanic_students
      t.integer   :hispanic_students
      t.integer   :white_students
      
      t.timestamps
    end
  end

  def self.down
    drop_table :enrollments
  end
end
