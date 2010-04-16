class AddTwitterNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_name, :string
  end

  def self.down
    remove_column :users, :twitter_name
  end
end
