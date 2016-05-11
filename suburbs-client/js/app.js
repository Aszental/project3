// kick off a new search

var lowerRange = 0;
var upperRange = $('#borrowing-power').val();

var settings = { url: 'http://localhost:3000/api/suburbs' + '/' + lowerRange + '/' + upperRange };

$('#search').on('click', function(event) {
  debugger
  event.preventDefault();
  $.ajax(settings).done(console.log(response))
});
