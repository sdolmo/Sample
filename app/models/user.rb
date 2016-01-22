class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

# This is a method that allows: securely saved PW to DB, presence and matching validation, and
# an authentication method that returns the user when the PW is correct
# For the method to work the model must pocess the password_digest attribute
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
