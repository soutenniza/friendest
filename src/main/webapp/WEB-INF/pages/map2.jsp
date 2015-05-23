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
			height: 400px;
			width: 400px;
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
				<form role="form">
					<div class="form-group">
						<label class="control-label" for="exampleInputEmail1">Friend's Address</label>
						<input class="form-control" id="exampleInputEmail1"
							   placeholder="Address 1" type="text">
					</div>
					<div class="form-group">
						<input class="form-control" id="exampleInputPassword1" placeholder="Address 2"
							   type="text">
					</div>
				</form>
			</div>
			<div id="map-canvas"></div>
			<script type="text/javascript">
				function initialize() {
					var mapOptions = {
						center: { lat: -34.397, lng: 150.644},
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
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form role="form">
					<div class="form-group">
						<label class="control-label" for="exampleInputEmail1">Locations
							<br>
						</label>
						<input class="form-control" id="exampleInputEmail1" placeholder="Address 1"
							   type="email">
					</div>
					<div class="form-group">
						<label class="control-label" for="exampleInputPassword1"></label>
						<input class="form-control" id="exampleInputPassword1"
							   placeholder="Address 2" type="text">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>

</html>