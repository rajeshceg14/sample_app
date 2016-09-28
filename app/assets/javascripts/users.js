function initMap(lat, lng) {
	handler = Gmaps.build('Google');
	handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
	  markers = handler.addMarkers([
	    {
	      "lat": lat,
	      "lng": lng,

	      "picture": {
	        "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
	        "width":  32,
	        "height": 32

	      },
	      "infowindow": "hello!"
	    }
	  ]);		  
	  handler.bounds.extendWith(markers);
	  handler.fitMapToBounds();
	});
}

jQuery(document).on('ready', function() {
	console.log( "ready!" );	
	initMap(0,0);
	console.log( "Map called!" );
});
