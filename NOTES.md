MODELS

***MIGRATIONS***
User:
  string :username
  string :password_digest

Attendee:
  string :name
  string :profession
  integer :age
  integer :wealth_rating
  text :notes
  integer :user_id
  boolean :prospect

Concert:
  string :title
  string :venue
  string :date

Ticket:
  integer :concert_id
  integer :attendee_id
  integer :seat_number

***ASSOCIATIONS***
User:
  has_many :attendees

Attendee:
  belongs_to :user
  has_many :tickets
  has_many :concerts, through: :tickets

Concert:
  has_many :tickets
  has_many :attendees, through: :tickets

Ticket:
  belongs_to :concert
  belongs_to :attendee

***VALIDATIONS***
User:
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true
  has_secure_password

Attendee:
  validates :name, presence: true

Concert:
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :venue, presence: true
  validates :date, presence: true

Ticket:
  validates :seat_number, presence: true
  validates :seat_number, numericality: { greater_than: 0 }

***OTHER***
Authorization Note: A user can change an attendee's prospect status and user only if it is their prospect
Nested Resources: When adding an attendee to a concert:

/concerts/:concert_id/attendees/new
/concerts/:concert_id/attendees/:id/edit
/concerts/:concert_id/attendees/:id/destroy

/attendees/:id

***TO-DO***
-make a table for attendees (and prospects?) in the concert and user show pages
-create attendees controller and views
-add ticket functionality (ticket controller, no views)
-User must be logged in to see any page
-omniauth, github
-make numericality validation for wealth_rating (1-5), maybe select box
-use scope method and where
