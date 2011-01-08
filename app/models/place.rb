class Place < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :designations, :facilities
  has_many :comments, :dependent => :destroy
  belongs_to :user

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
