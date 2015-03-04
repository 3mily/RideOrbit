$(function(){
  function initialize(search) {
  var input = document.getElementById(search);
  if (input) {
    var autocomplete = new google.maps.places.Autocomplete(input);
    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        autocomplete.getPlace();
     });
  };
}
google.maps.event.addDomListener(window, 'load', function() {
  initialize('street1');
  initialize('street2');
});

// upon submit, two AJAX requests are made.
$("#new_place").on("submit", function(e){
  e.preventDefault();
  var query = $("#street1").val() + " and " + $("#street2").val();
  console.log('testing query(xst): ' + query);
  var xstData;
  var name = $("#place_name").val();


// 1 - POST to Google Maps. Sends concatinated input (cross-street name) as query. Receives location data.
// Data is parced to get lat & long of the cross-street
  $.ajax({
    url: "http://maps.googleapis.com/maps/api/geocode/json?address="+query+"&sensor=false",
    type: "POST",
    error: function(xhr, status, thrownError){
      console.log("oh noes!", thrownError); //this is never called
    },
    success: function(data){
      console.log("data: ", data);
      var lat = data.results[0].geometry.location.lat;
      var lng = data.results[0].geometry.location.lng;
      xstData = data;
      var params = {
        "name": name,
        "results": data["results"],
      }

// 2 - POST to /places - creates new Place  where params = previously retrieved data. 
// Append new Place info to #places div
      $.ajax({
        url: "/places",
        type: "POST",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: params,
        error: function(xhr, status, thrownError){
          console.log('oh noesssss....', thrownError);
        },
        success: function(response) {
          console.log('success!');
          console.log(response);
          $("<p><strong>" + response.name + '</strong> <span class="glyphicon glyphicon-remove"></span><br>' + response.cross_street + "</p>").appendTo("#places");
          $(".flash").empty();
          $("<span>New place added!</span>").appendTo(".flash");
        }
      });

    }
  });
});

$(".glyphicon-remove").on("click",function(){
  var removedPlace = $(this)
  var placeId = $(this).data("place-id");
  $.ajax({
    url: "/places/" + placeId,
    type: "DELETE",
    error: function(xhr, status, thrownError){
      console.log("oh noes!", thrownError);
    },
    success: function(response){
      console.log("place deleted!");
      
    }
  })
});
});


