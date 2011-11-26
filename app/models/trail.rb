class Trail < ActiveRecord::Base

  attr_accessible :name, :description, :featured
  has_many :trail_locations
  has_many :locations, :through => :trail_locations

  scope :featured, where(:featured => true)

end
