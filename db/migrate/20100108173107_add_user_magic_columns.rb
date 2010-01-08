class AddUserMagicColumns < ActiveRecord::Migration
  def self.up
    add_column :users, :login_count, :integer, :null => false, :default => 0
    add_column :users, :failed_login_count, :integer, :null => false, :default => 0
    add_column :users, :current_login_at, :datetime
  end

  def self.down
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :current_login_at
  end
end
