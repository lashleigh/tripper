class Rating < ActiveRecord::Base
  attr_accessible :value

  belongs_to :place
  belongs_to :user
end
