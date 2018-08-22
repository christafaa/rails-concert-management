class User < ActiveRecord::Base
  has_many :attendees

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true
  has_secure_password
end