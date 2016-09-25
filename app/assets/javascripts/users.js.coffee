# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

foo = () ->
  console.log "loaded!, Hello world!"

# initMap = ->
# # Create a map object and specify the DOM element for display.
# map = new (google.maps.Map)(document.getElementById('map'),
#   center:
#     lat: -34.397
#     lng: 150.644
#   scrollwheel: false
#   zoom: 8)
# return

initMap = ->
  handler = Gmaps.build('Google')
  handler.buildMap {
    provider: {}
    internal: id: 'map'
  }, ->
    markers = handler.addMarkers([ {
      'lat': 0
      'lng': 0
      'picture':
        'url': 'http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png'
        'width': 32
        'height': 32
      'infowindow': 'hello!'
    } ])
    handler.bounds.extendWith markers
    handler.fitMapToBounds()
    return


$(document).ready(() ->
  console.log( "ready!" );
  foo();
  initMap();
  console.log( "Map called!" );
);


