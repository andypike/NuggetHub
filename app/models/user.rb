class User < ActiveRecord::Base
  acts_as_authentic

  validates_presence_of :full_name, :username, :email
  validates_uniqueness_of :username, :email
end
