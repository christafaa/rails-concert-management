class Concert < ActiveRecord::Base
  has_many :tickets
  has_many :attendees, through: :tickets

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :venue, presence: true
  validates :date, presence: true
end
