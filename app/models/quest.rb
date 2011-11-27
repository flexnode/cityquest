class Quest < ActiveRecord::Base
  belongs_to :user
  belongs_to :trail
  belongs_to :trail_location

  validates :trail_location_id, :trail_id, :user_id, :presence => true
  validates :trail_location_id, :uniqueness => { :scope => [:trail_id, :user_id] }
 

  scope :done, where(:done => true)
  scope :todo, where(:done => false)
end