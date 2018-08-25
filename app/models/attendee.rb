class Attendee < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :tickets
  has_many :concerts, through: :tickets

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :age, numericality: { greater_than: 0 }

  validates :wealth_rating, numericality: { greater_than: 0 }
  validates :wealth_rating, numericality: { less_than: 10 }

  scope :best_wealth_rating, -> { order('wealth_rating ASC') }

  scope :most_tickets, -> { joins(:tickets).group('attendees.id').order('COUNT(attendees.id) DESC') }

  scope :prospects, -> { where.not('user.id' => nil) }

end
