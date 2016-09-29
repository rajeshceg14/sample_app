

function initMap(lat, lng) {

	var mapOptions = {
	  center: new google.maps.LatLng(0,0),
	  zoom: 2
	};


	handler = Gmaps.build('Google');
	handler.buildMap({ provider: mapOptions, internal: {id: 'map'}}, function(){
	  markers = handler.addMarkers([
	    {
	      "lat": lat,
	      "lng": lng,

	      "picture": {
	        "url": "http://icons.iconarchive.com/icons/paomedia/small-n-flat/24/map-marker-icon.png",
	        "width":  32,
	        "height": 32

	      },
	      "infowindow": "Your Photo was shot here"
	    }
	  ]);		  
	  handler.map.centerOn([lat,lng]);	  
	  handler.bounds.extendWith(markers);
	  handler.getMap().setZoom(9);
	});
}

jQuery(document).on('ready', function() {
	console.log( "ready!" );	
	initMap(12.9696196,80.24402269999996);
	console.log( "Map called!" );
});
