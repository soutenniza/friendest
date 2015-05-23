<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
		  rel="stylesheet" type="text/css">
	<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
		  rel="stylesheet" type="text/css">
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
			<div class="col-md-3">
				<img class="img-responsive" src="http://maps.googleapis.com/maps/api/staticmap?center=Tombouctou,Mali&amp;zoom=12&amp;size=200x200&amp;sensor=false">
			</div>
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