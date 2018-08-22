class Attendee < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  has_many :concerts, through: :tickets
end
