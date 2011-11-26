class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  has_many :trail_locations
  has_many :trails, :through => :trail_locations

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?  


  def self.to_dropdown
    Location.all.map {|l| [l.address, l.id]}
  end

end
