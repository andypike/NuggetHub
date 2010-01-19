class Nugget < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :body, :user
  validates_length_of :body, :maximum => 2000

end
