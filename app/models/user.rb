class User < ActiveRecord::Base
  has_many :places
  has_many :comments
  has_many :ratings
  has_many :rated_places, :through => :ratings, :source => :places
  validates_uniqueness_of :openid
  validates_uniqueness_of :name, :allow_nil => true, :allow_blank => true
  validates_uniqueness_of :email, :allow_nil => true, :allow_blank => true

end
