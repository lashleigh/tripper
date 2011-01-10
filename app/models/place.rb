class Place < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :designations, :facilities
  has_many :comments, :dependent => :destroy
  belongs_to :user
  has_many :ratings
  has_many :raters, :through => :ratings, :source => :users
  validates_presence_of :user_id, :message => "must be logged in"
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :description
  validates_presence_of :latitude
  validates_presence_of :longitude

  def short_content(maxlen = 100)
    s = description[0..maxlen]
    if( s.length > maxlen and s.include? ' ')
      s[0..s.rindex(' ')-1] + '...'
    else
      s
    end
  end

  def author
    if user
      user.name
    else
      "unknown"
    end
  end

end
