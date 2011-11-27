class AddDoneToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :done, :boolean, :default => false, :null => false
  end
end
