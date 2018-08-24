users = [
  ["chris", "password"],
  ["fred", "password"],
  ["julia", "password"]
]

#date format: "2018-08-09" "year-month-day"
concerts = [
  ["Russian Inspiration", "Alice Tully Hall", "2018-10-16"],
  ["Quartet Variations", "Alice Tully Hall", "2018-10-21"],
  ["The Kreutzer Connection", "Alice Tully Hall", "2018-10-28"],
  ["The Art of the Quintet", "Alice Tully Hall", "2018-11-02"],
  ["The Trout Quintet", "Alice Tully Hall", "2018-11-13"],
  ["Death and the Maiden", "Alice Tully Hall", "2018-11-18"],
  ["Windstorm", "Alice Tully Hall", "2018-11-30"],
  ["Baroque Collection", "Alice Tully Hall", "2018-12-09"],
  ["Brandenburg Concertos", "Alice Tully Hall", "2018-12-14"]
]

attendees = [
  ["Skylar Huffman", "Auctioneer", 28, 7, "Learning how to play piano", 3],
  ["Taylor Mohamed", "Politician", 42, 9, "Ticket buy since 1992", 2],
  ["Angelica Nicholson", "Art critic", 32, 4, "Hates new music", 1],
  ["Rylan Cisneros", "Lawyer", 56, 1, "Interested in joining the board", 3],
  ["Terence Haas", "Baker", 35, 7, "", nil],
  ["Rico Weber", "Aircraft engineer", 67, 2, "", nil],
  ["Raymond Delarosa", "Dental nurse", 45, 5, "", nil],
  ["Maddie Mcculloch", "Driving instructor", 56, 8, "", nil],
  ["Lacey Browning", "Computer programmer", 33, 3, "Went to Flatiron School", 3],
  ["Caiden Baird", "Bank manager", 41, 2, "Loves Mozart", 2],
  ["Paisley Brennan", "Butcher", 49, 6, "Lives in Florida during the summer", 1],
  ["Klara Wyatt", "Musician", 58, 7, "Interested in hosting a home concert", 3]
]

users.each do |username, password|
  User.create(username: username, password: password)
end

concerts.each do |title, venue, date|
  Concert.create(title: title, venue: venue, date: date)
end

attendees.each do |name, profession, age, wealth_rating, notes, user_id|
  Attendee.create(name: name, profession: profession, age: age, wealth_rating: wealth_rating, notes: notes, user_id: user_id)
end
