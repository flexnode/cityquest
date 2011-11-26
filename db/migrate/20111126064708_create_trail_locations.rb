class CreateTrailLocations < ActiveRecord::Migration
  def change
    create_table :trail_locations do |t|
      t.integer :trail_id
      t.integer :location_id
      t.timestamps
    end
  end
end
