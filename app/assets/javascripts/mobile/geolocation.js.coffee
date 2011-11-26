setPosition = (position) ->
  window.gpsCoordinates = position.coords
  window.gpsSince =  position.timestamp
  
  
gpsError = (err) ->
  alert("Please enable location in your browser")

if Modernizr.geolocation
  navigator.geolocation.getCurrentPosition(setPosition, gpsError)
  watchProcess = navigator.geolocation.watchPosition(setPosition, gpsError)
else
  alert("No Location Support")
