class Comment < ActiveRecord::Base
  belongs_to :nugget
  belongs_to :user

  validates_presence_of :text, :user, :nugget
end
