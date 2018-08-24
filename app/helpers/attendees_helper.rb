module AttendeesHelper
  def display_seats(concert, attendee)
    tickets = Ticket.all.select {|ticket| ticket.concert == concert && ticket.attendee == attendee}
    seat_numbers = tickets.map {|ticket| ticket.seat_number}.join(", ")
  end
end
