class Quest < ActiveRecord::Base

  attr_accessible :name, :description
  belongs_to :user
  belongs_to :trail
  belongs_to :trail_location

  validates :trail_location_id, :trail_id, :user_id, :presence => true
  
end
