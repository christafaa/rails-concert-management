class Attendee < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :tickets
  has_many :concerts, through: :tickets

  validates :first_name, :last_name, presence: true

  validates :age, numericality: { greater_than: 0, allow_nil: true }

  validates :wealth_rating, numericality: { greater_than: 0, allow_nil: true }
  validates :wealth_rating, numericality: { less_than: 10, allow_nil: true }

  def self.alpha(collection)
    collection.sort_by {|attendee| attendee.last_name}
  end

  def self.best_wealth_rating(collection)
    collection.sort { |a,b| a.wealth_rating && b.wealth_rating ? a.wealth_rating <=> b.wealth_rating : a.wealth_rating ? -1 : 1 }
  end

  def self.most_tickets(collection)
    collection.sort_by {|attendee| attendee.tickets.count}.reverse
  end

  def self.top_prospects(collection)
    collection.sort_by {|attendee| attendee.points}.reverse
  end

  def self.collection_of(association)
    where(id: association.attendees.map(&:id))
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def points
    total = 0

    if self.wealth_rating
      case self.wealth_rating
      when 1 then total += 50
      when 2 then total += 45
      when 3 then total += 40
      when 4 then total += 35
      when 5 then total += 30
      when 6 then total += 25
      when 7 then total += 20
      when 8 then total += 15
      end
    end
    total += self.tickets.count
  end
end
