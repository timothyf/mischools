class State < ActiveRecord::Base
  has_many :counties
  has_many :schools
end
