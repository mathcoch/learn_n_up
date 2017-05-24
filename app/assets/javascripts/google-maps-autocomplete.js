$(document).ready(function() {
  var lesson_address = $('#lesson_address').get(0);

  if (lesson_address) {
    var autocomplete = new google.maps.places.Autocomplete(lesson_address, { types: ['geocode'] });
    google.maps.event.addDomListener(lesson_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
