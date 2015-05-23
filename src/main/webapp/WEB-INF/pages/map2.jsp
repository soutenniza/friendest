<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/sandstone/bootstrap.min.css" rel="stylesheet">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<meta charset="utf-8">
	<style>
		#map-canvas {
			height: 250px;
			width: 250px;
		}
		#outputDiv{
			font-size: 11px;
		}
	</style>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMBs2_RTKJAhyhEqN0NLy1cID1a6Bf1G8"></script>
	<script>
		var map;
		var bounds = new google.maps.LatLngBounds();
		var markersArray = [];


		var destinationIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=D|FF0000|000000';
		var originIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=O|FFFF00|000000';
		function initialize() {
			var mapOptions = {
				center: { lat: -34.397, lng: 150.644},
				zoom: 8
			};
			var map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
			var geocoder = new google.maps.Geocoder();
		}
	function test(){
		alert('lol');
	}
		function calculateDistances(){
			var service = new google.maps.DistanceMatrixService();
			service.getDistanceMatrix(
					{
						origins: ['6422 Briarwood Drive, Belleville, MI 48111'],
						destinations: ['4626 3rd St Detroit, MI 48201'],
						travelMode: google.maps.TravelMode.DRIVING,
						unitSystem: google.maps.UnitSystem.IMPERIAL
					}, callback);
		}

		function callback(response, status) {
			if (status != google.maps.DistanceMatrixStatus.OK) {
				alert('Error was: ' + status);
			} else {
				var origins = response.originAddresses;
				var destinations = response.destinationAddresses;
				var outputDiv = document.getElementById('outputDiv');
				outputDiv.innerHTML = '';
				//deleteOverlays();
lkdfjldfds
				for (var i = 0; i < origins.length; i++) {
					var results = response.rows[i].elements;
					addMarker(origins[i], false);
					for (var j = 0; j < results.length; j++) {
						addMarker(destinations[j], true);
						alert(outputDiv.innerHtml += 'Origin ' + origins[i] + j + ' to ' + 'destination '
								+ destinations[j] + ' = ' + results[j].distance.text + '.');

					}
				}
			}
		}

		function addMarker(location, isDestination) {
			var icon;
			if (isDestination) {
				icon = destinationIcon;
			} else {
				icon = originIcon;
			}
			geocoder.geocode({'address': location}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					bounds.extend(results[0].geometry.location);
					map.fitBounds(bounds);
					var marker = new google.maps.Marker({
						map: map,
						position: results[0].geometry.location,
						icon: icon
					});
					markersArray.push(marker);
				} else {
					alert('Geocode was not successful for the following reason: '
							+ status);
				}
			});
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>

</head>

<body>
<div class="navbar navbar-default navbar-inverse navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/"><span>Friendest</span></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active">
					<a href="/">Home</a>
				</li>
				<li>
					<a href="/map">Maps<br></a>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form role="form" method="POST" action="/submitlocations">
					<div class="form-group">
						<div>
							<label class="control-label">Friend's Address</label>
						</div>
						<div>
							<input name="addressOneFriend" type="text" class="form-control" placeholder="Friend's Address" required>
						</div>
						<hr>
						<div>
							<input name="addressTwoFriend" type="text" class="form-control" placeholder="Friend's Address" required>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label">Potential Locations</label>
						</div>
						<div>
							<input name="addressOneDest" type="text" class="form-control" placeholder="Potential Address" required>
						</div>
						<hr>
						<div>
							<input name="addressTwoDest" type="text" class="form-control" placeholder="Potential Address" required>
						</div>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
<div style="height:50%; width:50%; position: absolute;">
	<div id = "inputs">
	<button type="button" onclick="calculateDistances();">Calculate
		distances</button></p>
	</div>
	<div id="outputDiv"></div>
	<div id="map-canvas"></div>

</div>
<div>${msg}</div>
<script type="text/javascript">
	function initialize() {
		var mapOptions = {
			center: { lat: 0, lng: 0},
			zoom: 8
		};
		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>

</body>
</html>