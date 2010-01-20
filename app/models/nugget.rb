class Nugget < ActiveRecord::Base
  def self.MAX_LENGTH
    1000
  end

  def self.per_page
    15
  end

  belongs_to :user

  validates_presence_of :title, :body, :user
  validates_length_of :body, :maximum => Nugget.MAX_LENGTH

  has_friendly_id :title, :use_slug => true

  def self.paged_nuggets(page)
    Nugget.paginate :page => page, :order => 'updated_at DESC'
  end
end
