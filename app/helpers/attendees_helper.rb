module AttendeesHelper
  def display_seats(concert, attendee)
    tickets = Ticket.all.select {|ticket| ticket.concert == concert && ticket.attendee == attendee}
    seat_numbers = tickets.map {|ticket| ticket.seat_number}.join(", ")
  end

  def attendees_and_sort_status(collection, sort_method)
    if sort_method
      case sort_method
        when "Alphabetical"
          attendees = collection.alpha
          sort_status = "Alphabetical"
        when "Best Wealth Rating"
          attendees = collection.best_wealth_rating
          sort_status = "Best Wealth Rating"
        when "Most Tickets"
          attendees = collection.most_tickets
          sort_status = "Most Tickets"
      end
    else
      attendees = collection.alpha
      sort_status = "Alphabetical"
    end
    [attendees, sort_status]
  end
end
