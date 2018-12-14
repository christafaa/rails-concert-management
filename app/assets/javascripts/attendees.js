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

$(document).ready(addSortListener)
$(document).on('page:change', addSortListener)


function addSortListener() {
  $("div#sort-button form").on("submit", function(e) {
    e.preventDefault();
    const sortRequest = e.target.elements[1].value
    getAttendees(sortRequest);
  })
}
//change "/attendees/sort to be dynamic, grab from e.target.elements"
function getAttendees(sortRequest) {
  $.getJSON("/attendees/sort", {sort: sortRequest}, function(data) {
    let attendees = []
    data.attendees.forEach(function(attendeeData) {
      attendees.push(new Attendee(attendeeData));
    });
    $("#sort-display").html(HandlebarsTemplates['attendees_template'](attendees));
  });
}
