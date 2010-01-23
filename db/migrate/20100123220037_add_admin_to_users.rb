class AddAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_admin, :boolean, :default => false, :null => false

    me = User.find_by_username('andypike')
    me.update_attribute :is_admin, true unless me.nil?
  end

  def self.down
    remove_column :users, :is_admin
  end
end
