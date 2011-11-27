setPosition = (position) ->
  window.gpsCoordinates = position.coords
  window.gpsSince =  position.timestamp
  url = "/api/users"
  gpsData = latitude: window.gpsCoordinates.latitude, longitude: window.gpsCoordinates.longitude
  $.ajax({
    url: url,
    dataType: 'json',
    data: gpsData,
    type: 'PUT'
  });
  
gpsError = (err) ->
  alert("Please enable location in your browser")

if Modernizr.geolocation
  navigator.geolocation.getCurrentPosition(setPosition, gpsError)
  watchProcess = navigator.geolocation.watchPosition(setPosition, gpsError)
else
  alert("No Location Support")
