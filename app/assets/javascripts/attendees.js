class Attendee {
  constructor(data) {
    this.id = data.id;
    this.first_name = data.first_name;
    this.last_name = data.last_name;
    this.profession = data.profession;
    this.age = data.age;
    this.wealth_rating = data.wealth_rating;
    this.notes = data.notes;
    this.user = data.user;
    this.tickets_count = data.tickets.length;
  }

  displayName() {
    return `${this.first_name} ${this.last_name}`
  }
}

// $(document).on('turbolinks:load', addSortListener)
// $("div#sort-button").on("render", getAttendees())

function addSortListener() {
  $("div#sort-button form").on("submit", function(e) {
    e.preventDefault();
    const action = e.target.action
    const sortRequest = e.target.elements[1].value
    requestAttendees(action, sortRequest);
  })
}

function getAttendees() {
  alert("hi")
  // const action = "http://localhost:3000/attendees/sort";
  // const sortRequest = "Alphabetical";
  // requestAttendees(action, sortRequest);
}

function requestAttendees(action, sortRequest) {
  $.getJSON(action, {sort: sortRequest}, function(data) {
    let attendees = []
    data.attendees.forEach(function(attendeeData) {
      attendees.push(new Attendee(attendeeData));
    });
    $("#sort-display").html(HandlebarsTemplates['attendees_template'](attendees));
    $("#sort-status").html(`Sorted by: ${sortRequest}`);
  });
}
