class Attendee < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :tickets
  has_many :concerts, through: :tickets

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :wealth_rating, numericality: { greater_than: 0 }
  validates :wealth_rating, numericality: { less_than: 10 }
end
