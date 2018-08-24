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
  []
]

users.each do |username, password|
  User.create(username: username, password: password)
end

concerts.each do |title, venue, date|
  Concert.create(title: title, venue: venue, date: date)
end
