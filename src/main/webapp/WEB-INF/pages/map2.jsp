<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/flatly/bootstrap.min.css" rel="stylesheet">
	<style>
		#map-canvas {
			height: 100%;
			width: 100%;
		}
		#outputDiv{
			font-size: 11px;
		}
	</style>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMBs2_RTKJAhyhEqN0NLy1cID1a6Bf1G8"></script>
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
				<li>
					<a href="/">Home</a>
				</li>
				<li class="active">
					<a href="/map">Maps<br></a>
				</li>
			</ul>
		</div>
	</div>
</div>
<div>
	${msg}
</div>
<div class="section">
	<div id="resulttables" class="container"></div>
	<div class="container column">
		<div class="row">
			<div class="col-md-6">
				<form role="form" method="POST" action="/submitlocations">
					<div id="friendfields" class="form-group">
						<div>
							<label class="control-label">Friend's Address</label>
						</div>
						<div>
							<input id="address1Friend" name="address1Friend" type="text" class="form-control" placeholder="Friend's Address" required>
						</div>
						<hr>
						<div>
							<input id="address2Friend" name="address2Friend" type="text" class="form-control" placeholder="Friend's Address" required>
						</div>
					</div>
					<div>
						<input type="button" class="btn btn-info btn-xs" id="moreFriends" onclick="addFriend()" value="Add Friend Address"/>
					</div>
					<hr>
					<div id="locationfields"class="form-group">
						<div>
							<label class="control-label">Potential Locations</label>
						</div>
						<div>
							<input id="address1Dest" name="address1Dest" type="text" class="form-control" placeholder="Potential Address" required>
						</div>
						<hr>
						<div>
							<input id="address2Dest" name="address2Dest" type="text" class="form-control" placeholder="Potential Address" required>
						</div>
					</div>
					<div>
						<input type="button" class="btn btn-info btn-xs" id="moreLocations" onclick="addLocation()" value="Add Potential Location"/>
					</div>
					<hr>

					<input type="button" onclick="calculateDistance()" class="btn btn-lg btn-success" value="submit"/>
				</form>
			</div>
			<div class="col-md-6">
				<div style="height:50%; width:100%;">
					<div id="map-canvas">

					</div>
				</div>

				<script type="text/javascript">
					var map;
					var geocoder;
					var bounds = new google.maps.LatLngBounds();
					var map;
					var friendLocations = [];
					var potentialLocations = [];
					var results = [];

					function initialize() {
						var mapOptions = {
							center: { lat: 42.340805, lng: -83.051657},
							zoom: 8

						};

						map = new google.maps.Map(document.getElementById('map-canvas'),
								mapOptions);
						geocoder = new google.maps.Geocoder();
					}


					var friendCount = 2;
					function addFriend(){
						friendCount++;
						var objTo = document.getElementById('friendfields');
						var createDiv = document.createElement("div");
						createDiv.innerHTML = '<div> <hr> <input id="address' + friendCount + 'Friend" name="address' + friendCount + 'Friend" type="text" class="form-control" placeholder="Friend\'s Address" >';
						objTo.appendChild(createDiv);
					}

					var locationCount = 2;
					function addLocation(){
						locationCount++;
						var objTo = document.getElementById('locationfields');
						var createDiv = document.createElement("div");
						createDiv.innerHTML = '<div> <hr> <input id="address' + locationCount + 'Dest" name="address' + locationCount + 'Dest" type="text" class="form-control" placeholder="Potential Address" >';
						objTo.appendChild(createDiv);
					}

					function calculateDistance(){

						//Gets the addresses of friends and throws into array
						for(v = 1; v <= friendCount; v++){
							var id = "address" + v + "Friend";
							friendLocations.push(document.getElementById(id).value);
						}
						//Potential addresses and throws into array
						for(p = 1; p <= locationCount; p++){
							var id = "address" + p + "Dest";
							potentialLocations.push(document.getElementById(id).value);
						}

						//initializes array based on the total addresses
						var friends = new Array(friendCount + 1);
						for(a = 1; a < friendCount; a++){
							friends[a] = new Array(locationCount + 1);
						}


						var service = new google.maps.DistanceMatrixService();
						service.getDistanceMatrix(
								{
									origins: friendLocations,
									destinations: potentialLocations,
									travelMode: google.maps.TravelMode.DRIVING,
									unitSystem: google.maps.UnitSystem.IMPERIAL
								}, callback);

						friendLocations = [];
						potentialLocations = [];

					}

					function callback(response, status) {
						if (status != google.maps.DistanceMatrixStatus.OK) {
							alert('Error was: ' + status);
						} else {
							var origins = response.originAddresses;
							var destinations = response.destinationAddresses;
							//var outputDiv = document.getElementById('outputDiv');
							//outputDiv.innerHTML = '';
							var distances = new Array();
							for (i = 0; i < origins.length; i++) {
								distances[i] = new Array();
							}
							var duration = new Array(origins.length);
							for (var i = 0; i < origins.length; i++)
								duration[i] = new Array(destinations.length);
							for (var i = 0; i < origins.length; i++) {
								var results = response.rows[i].elements;
								for (var j = 0; j < results.length; j++) {
									//		outputDiv.innerHtml += 'Origin ' + origins[i] + ' to ' + 'destination '
									//				+ destinations[j] + ' = ' + results[j].distance.text + '.';
									var str = results[j].distance.value;
									var str2 = str * 0.000621371;
									distances[i][j] = str2;
									duration[i][j] = results[j].duration.value / 60;
								}
							}

							var avgDist = [];
							for (var i = 0; i < destinations.length; i++) {
								var sum = 0;
								for (var j = 0; j < origins.length; j++) {
									sum += distances[j][i];
								}
								sum /= origins.length;
								avgDist[i] = sum;
							}

							var avgTime = [];
							//Average Driving Distance
							for (var i = 0; i < results.length; i++) {
								var sum = 0;
								for (var j = 0; j < origins.length; j++) {
									sum += duration[j][i];
								}
								sum /= origins.length;
								avgTime[i] = sum;
							}

							var destCopy = [];
							for(i = 0; i < destinations.length; i++)
								destCopy[i] = destinations[i];


							//Bubble Sort Avg Time
							for(i = 0; i < avgTime.length; i++){
								for(j = i; j >0; j--){
									if(avgTime[j] < avgTime[j-1]){
										var temp = avgTime[j];
										avgTime[j] = avgTime[j-1];
										avgTime[j-1] = temp;
										var temp2 = destCopy[j];
										destCopy[j] = destCopy[j-1];
										destCopy[j-1] = temp2;
									}
								}
							}



							//Bubble Sort Avg Dist
							for(i = 0; i < avgDist.length; i++){
								for(j = i; j >0; j--){
									if(avgDist[j] < avgDist[j-1]){
										var temp = avgDist[j];
										avgDist[j] = avgDist[j-1];
										avgDist[j-1] = temp;
										var temp2 = destinations[j];
										destinations[j] = destinations[j-1];
										destinations[j-1] = temp2;
									}
								}
							}

							//Destination[0] Most Shortest
							markBest(destinations[0]);

							function markBest(location){
								var markIcon;
								markIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=O|FFFF00|000000';
								geocoder.geocode({'address': location}, function(results, status) {
									if (status == google.maps.GeocoderStatus.OK) {
										bounds.extend(results[0].geometry.location);
										map.fitBounds(bounds);
										var marker = new google.maps.Marker({
											map: map,
											position: results[0].geometry.location,
											icon: markIcon
										});
										//markersArray.push(marker);
									} else {
										alert('Geocode was not successful for the following reason: '
												+ status);
									}
								});
							}

							var obj = document.getElementById("resulttables");
							var td = document.createElement("div");
							var tableDistance = '<div><h1>Closest Locations by Distance</h1><div><hr><div> <table class="table table-striped table-hover" > <thead><tr> <th> # </th> <th>Address</th><th>Average Distance</th></tr></thead><tbody>'
							for(i = 0; i < avgDist.length; i++){
								tableDistance += '<tr><td>' + (i + 1) + '</td><td>' + destinations[i] + '</td><td>' + avgDist[i].toFixed(1) +  ' miles </td></tr>';
							}
							tableDistance += '<tbody></table>';
							td.innerHTML = tableDistance;
							obj.appendChild(td);

							var obj = document.getElementById("resulttables");
							var tt = document.createElement("div");
							var tableTime = '<div><h1>Closest Locations by Driving Time</h1><div><hr><div> <table class="table table-striped table-hover" > <thead><tr> <th> # </th> <th>Address</th><th>Average Time</th></tr></thead><tbody>'
							for(i = 0; i < avgTime.length; i++){
								tableTime += '<tr><td>' + (i + 1) + '</td><td>' + destCopy[i] + '</td><td>' + avgTime[i].toFixed(1) +  ' minutes </td></tr>';
							}
							tableTime += '<tbody></table>';
							tt.innerHTML = tableTime;
							obj.appendChild(tt);

						}
					}

					google.maps.event.addDomListener(window, 'load', initialize);
				</script>
			</div>
		</div>
	</div>


</div>
</body>

</html>