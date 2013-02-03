# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # added the password attr after creating them and testing
  attr_accessible :email, :name, :password, :password_confirmation
  # once a app uses password_digest below can be used to ensure passwds match and are authenticated
  has_secure_password

  # this changes the inputted email in lowercase b4 its saved in db
  before_save { |user| user.email = email.downcase }

  # validates uniqueness of name and email, users a regxp to make sure the email matches the email format. Use this
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # this validates the there is an actual password there
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
