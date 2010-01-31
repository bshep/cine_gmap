$(document).ready(function() {
	
	
    initMap();
});


var theater_data;
var map;
var directions;
var directionsPanel;
// var current_loc;
var current_loc_marker;
var dest_loc_marker;

function detectBrowser() {
    var useragent = navigator.userAgent;
    var mapdiv = document.getElementById("map_canvas");

    if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1) {
        mapdiv.style.width = '70%';
        mapdiv.style.height = '350px';
    } else {
        mapdiv.style.width = '70%';
        mapdiv.style.height = '500px';
    }
}

function initMap() {
    detectBrowser();

    map = new GMap2($("#map_canvas")[0]);
	directionsPanel = $("#route")[0];

    setLocation();

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(pos) {
            setLocation(pos);
        },
        function(err) {
            setLocation_error();
        });
        // document.getElementById("map_canvas").innerHTML = "waiting for location...";
    } else {
        // alert("I'm sorry, but geolocation services are not supported by your browser.");
        }
}

function setLocation_error() {
    alert("Error with location");
}


function setLocation(pos) {
    var point;

    // map = new GMap2(document.getElementById("map_canvas"));			
    if (pos) {
        // $("#spinner").hide();
        point = new GLatLng(pos.coords.latitude, pos.coords.longitude);
        current_loc_marker.setLatLng(point);
		doRouting(null);
		// map.setCenter(point, 13);
		return;
    } else {
        point = new GLatLng(18.226047, -66.519928);
        map.setCenter(point, 9);
    }

    current_loc = point;
    // var point = new GLatLng(17.993197,-66.617457);
    map.addControl(new GLargeMapControl3D());
    map.enableScrollWheelZoom();

    map.clearOverlays();

    var blueIcon = new GIcon(G_DEFAULT_ICON);
    blueIcon.image = "http://gmaps-samples.googlecode.com/svn/trunk/markers/blue/blank.png";

    pt_opts = {
        title: 'You are here',
        icon: blueIcon,
        draggable: true
    };
    current_loc_marker = new GMarker(point, pt_opts);
    current_loc_marker.bindInfoWindowHtml('You are here');


    GEvent.addListener(current_loc_marker, "dragend",
    function(dest) {
        doRouting(null);
    });
    GEvent.addListener(map, "dblclick",
    function(overlay, dest, overdest) {
        if (overlay) {
            return;
        }
        current_loc_marker.setLatLng(dest);
        doRouting(null);
    });

    map.addOverlay(current_loc_marker);

    jQuery.ajax({
        url: 'http://www.sheplan.com/maps/theater_locations.php',
        dataType: 'json',
        success: function(data) {
            theaterData_loaded(data);
        }
    });
}

function theaterData_loaded(data) {
    theater_data = data;

	theater_list = $("#theater_list")[0];
	
	theater_list.innerHTML = '';

    for (var i = 0; i < data.length; i++) {
        var theater = data[i];

		theater_list.innerHTML += '<div class="theater_item" onclick="$(\'.theater_item\').removeClass(\'selected\'); $(this).addClass(\'selected\'); doRouting(new GLatLng(' + theater.lat + ',' + theater.lon + '));">' +
					'<img src="http://maps.google.com/mapfiles/ms/micons/arts.png"><span>' + theater.name + '</span>'+
				'</div>';

        point = new GLatLng(theater.lat, theater.lon);
        var greenIcon = new GIcon(G_DEFAULT_ICON);
        greenIcon.image = "http://maps.gstatic.com/intl/en_ALL/mapfiles/icon_green.png";

        pt_opts = {
            title: theater.name,
            icon: greenIcon
        };
        marker = new GMarker(point, pt_opts);
        marker.bindInfoWindowHtml(theater.name);
        map.addOverlay(marker);

        GEvent.addListener(marker, "click",
        function(dest) {
            doRouting(dest);
        });
    }
}

function doRouting(dest) {
    // current_loc_marker.hide();
    if (dest == null) {
        if (dest_loc_marker == null) {
            return;
        }
    } else {
        dest_loc_marker = dest;
    }

    if (directions) {
        directions.clear();
    }

    current_loc = current_loc_marker.getPoint();
    dest_loc = dest_loc_marker;

    directions = new GDirections(map, directionsPanel);
    directions.load("from: " + current_loc.lat() + "," + current_loc.lng() +
    " to: " + dest_loc.lat() + "," + dest_loc.lng(),
    {
        preserveViewport: false
    });
}