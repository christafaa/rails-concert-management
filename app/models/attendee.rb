class Attendee < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :tickets
  has_many :concerts, through: :tickets

  validates :first_name, :last_name, presence: true

  validates :age, numericality: { greater_than: 0, allow_nil: true }

  validates :wealth_rating, numericality: { greater_than: 0, allow_nil: true }
  validates :wealth_rating, numericality: { less_than: 10, allow_nil: true }

  scope :alpha, -> { order('last_name ASC') }

  scope :best_wealth_rating, -> { order('-wealth_rating DESC') }

  scope :most_tickets, -> { joins(:tickets).group('tickets.attendee_id').order('COUNT(tickets.attendee_id) DESC') }

  # scope :top_prospect, -> { best_wealth_rating.most_tickets }

  def self.collection_of(association)
    where(id: association.attendees.map(&:id))
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
