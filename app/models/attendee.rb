class Attendee < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :tickets
  has_many :concerts, through: :tickets

  validates :name, presence: true
  validates :name, uniqueness: true
end
