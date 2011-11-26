class Trail < ActiveRecord::Base

  attr_accessible :name
  has_many :trail_locations
  has_many :locations, :through => :trail_locations

end
