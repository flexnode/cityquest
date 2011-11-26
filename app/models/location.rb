class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  geocoded_by :address

  has_many :trail_locations
  has_many :trails, :through => :trail_locations

end
