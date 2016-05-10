// kick off a new search

var params = {
  upperRange: $('#borrowing-power').val(),
  lowerRange: 0,
  locality: $('#locality').val()
}

var settings = {
  url: 'http://localhost:3000/api/suburbs',
  data: {
    'lowerRange': params.lowerRange,
    'upperRange': params.upperRange
  }
};


$('#search').on('click', function() {
  $.ajax(settings).done(console.log(response))
});
