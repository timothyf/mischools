class School < ActiveRecord::Base
  has_one :enrollment
  belongs_to :county
  belongs_to :school_district
  belongs_to :state
end
