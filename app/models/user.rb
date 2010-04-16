class User < ActiveRecord::Base
  acts_as_authentic

  has_many :nuggets
  has_many :comments

  validates_presence_of :full_name, :username, :email
  validates_uniqueness_of :username, :email
  validates_format_of :username, :with => /^[a-z0-9_-]{3,16}$/, :message => "can only contain letters, numbers, underscores and hyphens. Must be between 3 and 16 characters long."

  def display_name
    if(twitter_name)
      if twitter_name.starts_with?('@')
        "@#{twitter_name[1..-1]}"
      else
        "@#{twitter_name}"
      end
    else
      username
    end
  end
end
