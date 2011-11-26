class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :trail_id
      t.integer :trail_location_id
      t.timestamps
    end
  end
end