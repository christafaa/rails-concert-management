The Concert Donor Management web application is built with Ruby on Rails and allows users to create concerts, add attendees to concerts, and track attendees as prospects for upcoming concerts.<br />

[Try out a live demo!](https://frozen-dusk-71320.herokuapp.com/)<br />

**Create a concert:**<br />

To create a concert, complete the following steps:<br />

1. Log in to the Concert Donor Management application.
* To log in, enter demo as both the username and password.
2. Click Concerts.
Near the bottom of the page, click Create a Concert.
Note: Concert titles must be unique.
Add an attendee:
To add an existing attendee to a concert, complete the following steps:
Log in to the Concert Donor Management application.
To log in, enter demo as both the username and password.
Click Concerts.
Select a concert.
On the Concert page, select a name from the Attendee drop-down list.
In the Seat Number text box, enter a seat number.
After confirming the attendee’s name and seat information, click Add to Concert.
To add a new attendee to a concert, complete the following steps:
Log in to the Concert Donor Management application.
To log in, enter demo as both the username and password.
Click Concerts.
Select a concert.
On the Concert page, in the text boxes near the bottom of the page, enter a first name, last name, and seat number for the new attendee.
Note: All attendees must have unique names.
After confirming the attendee’s name and seat information, click Add Attendee.
To add additional information about the attendee—for example, their profession, age, and/or wealth ranking—click Attendees, select a name, and, near the bottom of the page, click Edit Attendee. After you have confirmed the new information, click Update Attendee.
Track new prospects:
To track a new prospect, complete the following steps:
Log in to the Concert Donor Management application.
To log in, enter demo as both the username and password.
Click Attendees.
Select a name that does not have an associated Solicitor.
A Solicitor is a user assigned to a prospect.
Near the bottom of the page, click Edit Attendee.
Within the User drop-down list, select a user.
After confirming the user, click Update Attendee.
Now, when you visit the Home page, you can view all of your assigned prospects and you can click an assigned attendee’s name to see when they are attending upcoming concerts.
Tips for using the application:
To find the best prospects, On the Home page, select a sort value from the Sorted by drop-down list (e.g., Alphabetical, Best Wealth Rating, Most Season Tickets), and click Sort.
Note: Attendees with a lower wealth rating number are (generally) more likely to donate than attendees with a higher wealth rating number.
Find great prospects by sorting by their interests! To sort by interest, click the Sorted by drop-down list on the Attendees page, select a sort value (e.g., Alphabetical, Best Wealth Rating, Most Season Tickets), and click Sort.
Install the Concert Donor Management application:
To install the application, fork and then clone this GitHub repository, then: Run bundle install Run rake db:migrate
To run a local server, use rails s
Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/christafaa/rails-concert-management. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.
License
The application is available as open source under the terms of the MIT License.
