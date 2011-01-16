class Place < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :designations, :facilities
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :ratings
  has_many :raters, :through => :ratings, :source => :users
  belongs_to :user
  validates_presence_of :user_id, :message => "must be logged in"
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :latitude
  validates_presence_of :longitude

  def author
    if user
      user.email
    else
      "unknown"
    end
  end

end
