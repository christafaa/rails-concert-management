class Attendee {
  constructor(data) {
    this.first_name = data.first_name;
    this.last_name = data.last_name;
    this.profession = data.profession;
    this.age = data.age;
    this.wealth_rating = data.wealth_rating;
    this.notes = data.notes;
    this.user_id = data.user_id;
    this.tickets_count = data.tickets.length;
  }

  displayName() {
    return `${this.first_name} ${this.last_name}`
  }
}

$(addSortListener)
$(document).on('page:change', addSortListener)

// document.addEventListener("turbolinks:load", function() {
//   addSortListener();
// })

function addSortListener() {
  $("div#sort-button form").on("click", function(e) {
    e.preventDefault();
    console.log(this)
    // getConcerts();
  })
}

// function appendAttendees(data) {
//   let attendees = [];
//   let unique = true;
//   data.forEach(function(attendeeData) {
//     let newAttendee = new Attendee(attendeeData)
//     attendees.forEach(function(attendee){
//       if (attendee.displayName() === newAttendee.displayName()) {
//         unique = false;
//       }
//     });
//     if (unique) {
//       attendees.push(newAttendee)
//     }
//   });
//   $("#display").append(HandlebarsTemplates['attendees_template'](attendees));
// }
