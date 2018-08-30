class Concert < ActiveRecord::Base
  has_many :tickets
  has_many :attendees, through: :tickets

  validates :title, :venue, :date, presence: true
  validates :title, uniqueness: true
end
