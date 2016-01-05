class Post < ActiveRecord::Base

  validates :title, 
  presence: true,
  length: { 
    minimum: 20,
    maximum: 100,
    too_short: "must have at least 20 words",
    too_long: "must have at most 100 words"
  }

  validates :link,
    presence: true,
    :format => URI::regexp(%w(http https))

  belongs_to :user

end
