class Attendee < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :tickets
  has_many :concerts, through: :tickets

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :age, numericality: { greater_than: 0, allow_nil: true }

  validates :wealth_rating, numericality: { greater_than: 0, allow_nil: true }
  validates :wealth_rating, numericality: { less_than: 10, allow_nil: true }

  scope :best_wealth_rating, -> { order('wealth_rating ASC') }

  scope :most_tickets, -> { joins(:tickets).group('attendees.id').order('COUNT(attendees.id) DESC') }

  scope :prospects, -> { where.not('user.id' => nil) }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
