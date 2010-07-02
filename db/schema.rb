# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100630021929) do

  create_table "counties", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "school_id"
    t.string   "state_school_id"
    t.string   "state_abbr"
    t.integer  "total_students"
    t.integer  "prek_students"
    t.integer  "kindergarten_students"
    t.integer  "first_grade_students"
    t.integer  "second_grade_students"
    t.integer  "third_grade_students"
    t.integer  "fourth_grade_students"
    t.integer  "fifth_grade_students"
    t.integer  "sixth_grade_students"
    t.integer  "seventh_grade_students"
    t.integer  "eigth_grade_students"
    t.integer  "ninth_grade_students"
    t.integer  "tenth_grade_students"
    t.integer  "eleventh_grade_students"
    t.integer  "twelfth_grade_students"
    t.integer  "ungraded_students"
    t.integer  "free_lunch_eligible"
    t.integer  "reduced_price_lunch_eligible"
    t.integer  "free_and_reduced_lunch"
    t.integer  "total_male_students"
    t.integer  "total_female_students"
    t.integer  "american_indian_students"
    t.integer  "asian_students"
    t.integer  "black_non_hispanic_students"
    t.integer  "hispanic_students"
    t.integer  "white_students"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.integer  "county_id"
    t.integer  "state_id"
    t.integer  "school_district_id"
    t.string   "name"
    t.string   "mailing_address"
    t.string   "mailing_city"
    t.string   "mailing_state_abbr"
    t.string   "mailing_zip"
    t.string   "mailing_zip4"
    t.string   "phone"
    t.string   "location_address"
    t.string   "location_city"
    t.string   "location_state_abbr"
    t.string   "location_zip"
    t.string   "location_zip4"
    t.string   "school_type"
    t.string   "agency_type"
    t.string   "school_id_nces_assigned"
    t.string   "agency_id_nces_assigned"
    t.string   "charter_school"
    t.string   "magnet_school"
    t.string   "shared_time_school"
    t.string   "urban_centric_locale"
    t.string   "school_wide_title_i"
    t.string   "title_i_eligible_school"
    t.string   "state_fips"
    t.string   "cbsa_name"
    t.string   "cbsa_id"
    t.string   "csa_name"
    t.string   "csa_id"
    t.string   "operational_status"
    t.string   "state_school_id"
    t.string   "state_agency_id"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "congressional_code"
    t.string   "pupil_teacher_ratio"
    t.integer  "fte_teachers"
    t.string   "school_level_code"
    t.string   "low_grade"
    t.string   "high_grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbrev"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end