# README

Concert Donor Management

A web application built on Ruby on Rails that allows users to create concerts, add attendees to concerts, and track attendees as prospects.

[Try out a live demo!](https://frozen-dusk-71320.herokuapp.com)

Create a concert:
1. Click the Concerts button
2. Click Create a Concert<br />
Concert titles must be unique.

Add an existing attendee to a concert:
1. When viewing a concert's page, click the Select an existing attendee dropdown
2. Select an attendee
3. Add a seat number
4. Click Add to Concert

Add a new attendee to a concert:
1. To add an attendee who is new to the organization, fill out the form on a concert's page
2. Click Add Attendee<br />
Attendees must have unique names. If an existing attendee's name is submitted in this form,
the existing attendee will be added to the concert's list and a new attendee will not be created.<br /><br />
After prospect research is received, prospect information can be added and updated by visiting an attendee's page
and clicking Edit Attendee.

Start tracking prospects:
1. Click the Attendees button
2. Click an attendee who does not have a Solicitor
3. Click Edit Attendee
4. Select your username under the User dropdown
5. Click update Attendee<br />
When you visit your profile page, all of your prospects will be listed and you can click their names
to see when they are attending upcoming concerts.

Find the best prospects:
1. When viewing a list of attendees, click the sort dropdown
2. Select Best Wealth Rating and click Sort<br />
In this example, an attendee with a wealth rating of 1 has extraordinary giving capacity.<br />

Great prospects can also be found by measuring interest in the organization.<br />
Sort by interest:<br />
1. When you are viewing a list of attendees, click the sort dropdown
2. Select Most Season Tickets and click Sort

# Install Instructions
Fork and clone the GitHub repo.
Run bundle install
Run rake db:migrate

To run a local server, use rails s

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/christafaa/rails-concert-management. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

# License
The application is available as open source under the terms of the MIT License.
