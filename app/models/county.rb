class County < ActiveRecord::Base
  has_many :schools, :order => 'name ASC'
  belongs_to :state
end
