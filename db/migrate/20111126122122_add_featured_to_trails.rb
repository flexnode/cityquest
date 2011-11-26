class AddFeaturedToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :featured, :boolean, :default => false
  end
end
