class TrailLocation < ActiveRecord::Base

  belongs_to :trail
  belongs_to :location
  has_many   :quests

  validates :location_id, :trail_id, :presence => true
  validates :location_id, :uniqueness => { :scope => :trail_id }
end