class Nugget < ActiveRecord::Base
  def self.MAX_LENGTH
    1000
  end

  def self.per_page
    15
  end

  belongs_to :user
  has_many :comments, :order => 'updated_at ASC'

  validates_presence_of :title, :body, :user
  validates_length_of :body, :maximum => Nugget.MAX_LENGTH

  has_friendly_id :title, :use_slug => true
  acts_as_taggable_on :tags

  def self.paged_nuggets(page)
    Nugget.paginate :page => page, :order => 'updated_at DESC'
  end
end
