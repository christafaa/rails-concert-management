module AttendeesHelper
  def display_solicitor(attendee)
    if attendee.user
      attendee.user.username
    else
      "N/A"
    end
  end
end
