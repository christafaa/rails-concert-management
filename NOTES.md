***OTHER***
Authorization Note: A user can change an attendee's prospect status and user only if it is their prospect
Nested Resources: When adding an attendee to a concert:

/concerts/:concert_id/attendees/new
/concerts/:concert_id/attendees/:id/edit
/concerts/:concert_id/attendees/:id/destroy

/attendees/:id

***TO-DO***

-add and remove prospects
-nested form in edit user to bring over seat_number to update
-make select box for wealth_rating (1-9)
-add title to user schema
-user can add concerts via an attendees show page

-got good at googling
-using helpers and partials to create a thin controller


-if attendee exists, just create new ticket, redirect back to concert page
-if attendee doesn't exist, create one via concerts/:concert_id/attendees/new which creates
a new attendee then redirects to a tickets#create which redirects back to concert page
