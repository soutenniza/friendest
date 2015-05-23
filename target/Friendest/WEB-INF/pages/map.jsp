<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/sandstone/bootstrap.min.css" rel="stylesheet">
	<style>
		#map-canvas {
			height: 100%;
			width: 100%;
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
	<div class="container column">
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
			<div class="col-md-6">
				<div style="height:50%; width:100%;">
					<div id="map-canvas">

					</div>
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
			</div>
		</div>
	</div>

</div>
</body>

</html>