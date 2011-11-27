class Quest < ActiveRecord::Base
  belongs_to :user
  belongs_to :trail
  belongs_to :trail_location

  validates :trail_location_id, :trail_id, :user_id, :presence => true
 

  scope :done, where(:done => true)
  scope :todo, where(:done => false)
end