users = [
  ["frank", "password"],
  ["judy", "password"]
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
  ["Skylar", "Huffman", "Auctioneer", 28, 7, "Learning how to play piano", 1],
  ["Taylor", "Mohamed", "Politician", 42, 9, "Ticket buy since 1992", 2],
  ["Angelica", "Nicholson", "Art critic", 32, 4, "Hates new music", 1],
  ["Rylan", "Cisneros", "Lawyer", 56, 1, "Interested in joining the board", 2],
  ["Terence", "Haas", "Baker", 35, 7, "", nil],
  ["Rico", "Weber", "Aircraft engineer", 67, 2, "", nil],
  ["Raymond", "Delarosa", "Dental nurse", 45, 5, "", nil],
  ["Maddie", "Mcculloch", "Driving instructor", 56, 8, "", nil],
  ["Lacey", "Browning", "Computer programmer", 33, 3, "Went to Flatiron School", 1],
  ["Caiden", "Baird", "Bank manager", 41, 2, "Loves Mozart", 2],
  ["Paisley", "Brennan", "Butcher", 49, 6, "Lives in Florida during the summer", 1],
  ["Klara", "Wyatt", "Musician", 58, 7, "Interested in hosting a home concert", 2]
]

puts "Generating Users..."
users.each do |username, password|
  User.create(username: username, password: password)
end

puts "Generating Concerts..."
concerts.each do |title, venue, date|
  Concert.create(title: title, venue: venue, date: date)
end

puts "Generating Attendees..."
attendees.each do |first_name, last_name, profession, age, wealth_rating, notes, user_id|
  Attendee.create(first_name: first_name, last_name: last_name, profession: profession, age: age, wealth_rating: wealth_rating, notes: notes, user_id: user_id)
end

number = 101

puts "Generating Tickets for Concert 1..."
Attendee.all.each do |attendee|
  Ticket.create(concert: Concert.find(1), attendee: attendee, seat_number: number)
  number += 1
end

puts "Generating 50 additional ticket orders..."
50.times do
  concert = Concert.find(rand(1..Concert.all.count))
  attendee = Attendee.find(rand(1..Attendee.all.count))
  Ticket.create(concert: concert, attendee: attendee, seat_number: number)
  number += 1
end

puts "Complete!"
