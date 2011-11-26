class AddUserDetails < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string :name
      t.string :nick
      t.string :gender
      t.string :dob
      t.string :location
      t.string :avatar_url
      t.string :provider
      t.string :uid
      t.string :token
      t.text   :raw_data
    end
  end
end
