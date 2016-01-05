class User < ActiveRecord::Base
  validates :my_email_attribute, 
  email: true,
  presence: true,
  uniqueness: {case_sensitive: false}


  validates :name,
  presence: true,
  length: { maximum: 20,
  too_long: "20 characters is the maximum allowed" }

  has_secure_password

  has_many :post

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end