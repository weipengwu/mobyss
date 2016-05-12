<?php
    session_start();
    $_SESSION['WaitingRoomAdmin']='admin';
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="generator" content="Lucidifer">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1"><!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>MOBYSS NOTIFIER</title><!-- Bootstrap -->
  <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"><!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <link href="bower_components/bootstrap-table/dist/bootstrap-table.min.css" rel="stylesheet" type="text/css"><!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <link href="bower_components/bootstrap-3-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css"><!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <link href="css/bootstrap-select.css" rel="stylesheet" type="text/css">
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
	.actions { width: 120px; }
	.disabled {
	    -moz-opacity: 0.5;
	    -webkit-opacity: 0.5;
	    opacity: 0.5;
	}
	#nav {
	    margin: 1em;
	    padding: 0 1em;
	    border-bottom: 10px solid #ccc;
	}
	#nav a {
	    display: inline-block;
	    width: 140px;
	    height: 30px;
	    background: #eee;
	    border: 1px solid #ccc;
	    border-bottom: 0;
	    text-align: center;
	    line-height: 30px;
	}
	.waitTime { width: 3em; }
	#editBus .well {
	    height: 100px;
	}
    </style>
</head>

<body>

<nav id="nav">
    <a href="#addNewPatient">Add New Patient</a>
    <a href="#patientList">Waiting Room</a>
    <a href="#adminPanel">Admin</a>
</nav>

  <div class="container" id="container">
    <!-- stuff will populate here -->
  </div>
  <div>
    <script type="text/template" id="signin">

	<form class="form-signin" data-bind="loginForm">
	  <h2 class="form-signin-heading">Please sign in</h2><label for="inputEmail" class="sr-only">Email address</label> <input type="username" id="inputUsername" class="form-control" placeholder="Username" required="" autofocus=""> <label for="inputPassword" class="sr-only">Password</label> <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">

	  <div class="checkbox">
	    <label><input type="checkbox" value="remember-me"> Remember me</label>
	  </div>

	  <!--<p><a href="#" id="forgotPassword">Forgot your password?</a></p>-->
	  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	</form>

    </script>

    <script type="text/template" id="forgotPassword">
	<div id="forgotPassword" class="-hide">
	  <h2>Forgot your password?</h2>Please submit the email you registered with: <input type="text" name="email" placeholder="Email Address">
    </div>
</script>

<script type="text/template" id="adminPanel">
    <div id="adminPanel" data-prebind="setupAdminPanel">
	<date>{{today}}</date>
	<form class="form-signin" id="editAdmin" data-bind="adminEdit">

	    <!--<div class="form-group well">
		<label for="activeBus">Bus is active?</label>
		<input name="busIsActive" type="hidden" class="btn-input" value="{{busIsActive}}" />
		<div class="btn-group" data-bind="btns">
		    <button class="btn btn-default" data-name="busIsActive">No</button>
		    <button class="btn btn-default" data-name="busIsActive">Yes</button>
		</div>
	    </div>-->

	    <!--<div class="form-group pull-left well">
		<label>Current Stop:</label><br/>
		<div class="btn-group">
		  <button type="button" class="btn btn-default dropdown-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">{{currentBusStop}}<span class="caret"></span>
		  </button>
		  
		  <input class="dropdown-input" type="hidden" name="currentStop" value="{{currentStop}}" />
		  <ul class="dropdown-menu" role="menu" id="currentBusStop" data-bind="busStop">{{#busStops}}<li><a href="#">{{stop}}</a></li>{{/busStops}}
		  </ul>
		</div>
	    </div>

	    <div class="form-group pull-left well">
		<label for="timepicker1">Leaving at:</label>

		<div class="input-append bootstrap-timepicker">
		    <input name="leavingAt" id="timepicker1" type="text" class="input-small" data-bind="timepicker" value="{{leavingAt}}"/>
		    <span class="glyphicon glyphicon-time"></span>
		</div>

	    </div>-->
	    <div class="form-group pull-left well">
		<p>Box 1</p>
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="dayonetime" value="{{dayonetime}}" />
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="dayonetitle" value="{{dayonetitle}}" />
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="dayonelocation" value="{{dayonelocation}}" />
		</div>

	    <div class="clearfix"></div>
	    <!--<div class="form-group pull-left well">
		<label>Next Stop:</label><br/>
		<div class="btn-group">
		  <button type="button" class="btn btn-default dropdown-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">{{nextBusStop}}<span class="caret"></span>
		  </button>
		  <input class="dropdown-input" type="hidden" name="nextStop" value="{{nextStop}}" />
		  <ul class="dropdown-menu" role="menu" id="nextBusStop" data-bind="busStop">{{#busStops}}<li><a href="#">{{stop}}</a></li>{{/busStops}}
		  </ul>
		</div>
	    </div>

	    <div class="form-group pull-left well">
		<label for="currentBusTime">Arriving at:</label>

		<div class="input-append bootstrap-timepicker">
		    <input name="arrivingAt" id="timepicker2" type="text" class="input-small" data-bind="timepicker" value="{{arrivingAt}}" />
		    <span class="glyphicon glyphicon-time"></span>
		</div>

	    </div>-->
	    <div class="form-group pull-left well">
		<p>Box 2</p>
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="daytwotime" value="{{daytwotime}}" />
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="daytwotitle" value="{{daytwotitle}}" />
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="daytwolocation" value="{{daytwolocation}}" />
		</div>

		<div class="clearfix"></div>
		<div class="form-group pull-left well">
		<p>Box 3</p>
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="daythreetime" value="{{daythreetime}}" />
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="daythreetitle" value="{{daythreetitle}}" />
		</div>
		<div class="form-group pull-left well">
		<input class="form-control" type="text" name="daythreelocation" value="{{daythreelocation}}" />
		</div>
	    <div class="clearfix"></div>
	    <div class="form-group pull-left well">
		<label for="currentWait">Current wait time:</label>
		<input class="waitTime form-control" type="text" name="waitTime" value="{{waitTime}}" />
	    </div>

	    <div class="clearfix"></div>
	    <button class="btn" type="submit">Submit</button>
	  </form>
	  <div class="clearfix"></div>

        </div>
    </script>

    <script type="text/template" id="patientList">
	<h2>Patients</h2>
	<div data-prebind="patientList">
	<table class="table table-bordered table-striped" data-page-number="1">
	    <thead><tr>
		<th>Date</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Phone</th>
		<th>Email</th>
		<th>Waiting Room</th>
		<th>Requesting</th>
		<th>Status</th>
		<th>Toggle</th>
		<th class='actions'>Actions</th>
	    </tr></thead>
	    <tbody>

		{{#patientList}}
		<tr>
		    <td>{{stamp}}</td>
		    <td>{{firstName}}</td>
		    <td>{{lastName}}</td>
		    <td>{{phone}}</td>
		    <td>{{email}}</td>
		    <td>{{inwaitingroom}}</td>
		    <td>{{requesting}}</td>
		    <td>{{status}}</td>
		    <td><a href="#toSeen/{{id}}"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a></td>
		    <td class='actions'>
			<a href="#editPatient/{{id}}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a> |
			<a href="#downPatient/{{id}}"><span class="glyphicon glyphicon-hand-down" aria-hidden="true"></span></a> |
			<a href="#upPatient/{{id}}"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a> |
			<a href="#notifyPatient/{{id}}"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span></a> |
			<a href="#removePatient/{{id}}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
		    </td>
		</tr>
		{{/patientList}}

		{{#patientSeenList}}
		<tr>
		    <td>{{stamp}}</td>
		    <td>{{firstName}}</td>
		    <td>{{lastName}}</td>
		    <td>{{phone}}</td>
		    <td>{{email}}</td>
		    <td>{{inwaitingroom}}</td>
		    <td>{{requesting}}</td>
		    <td>{{status}}</td>
		    <td><a href="#toWaiting/{{id}}"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
		    <td class='actions'>
			<a href="#editPatient/{{id}}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
		    </td>
		</tr>
		{{/patientSeenList}}


	    </tbody>
	    <tfoot></tfoot>
	</table>
	</div>
    </script>

    <script type="text/template" id="editPatient">
      <form class="form-signin" id="editPatientForm" data-bind="editPatient">
        <h2 class="form-signin-heading">Edit Patient</h2>

        <div class="form-group">
          <label for="inputFirstName" class="sr-only">First Name</label>
	  <input type="text" name="firstName" id="inputFirstName" class="form-control" placeholder="First Name" required="" autofocus="">
	  </div>
	  <div class="form-group">
	  <label for="inputLastName" class="sr-only">Last Name</label> 
	  <input type="text" name="lastName" id="inputLastName" class="form-control" placeholder="Last Name" required="">
        </div>
     <div class="form-group">
	<label for="inputEmail" class="sr-only">Email</label>
	<input type="text" name="email" id="inputEmail" class="form-control" placeholder="Email" required="">
	</div>
	<div class="form-group">
	<label for="inputPhone" class="sr-only">Phone</label>
	<input type="text" name="phone" id="inputPhone" class="form-control" placeholder="Phone" required="">
	</div>
	<div class="form-group">
	<label for="notes">Notes</label>
	<textarea name="notes" id="notes" class="form-control" placeholder="Notes"></textarea>
	</div>
	<button class="btn btn-lg btn-primary" type="submit">Save</button>
      </form>

    <h3>Notification History</h3>
    <table class="table table-bordered table-striped">
    <thead><tr><th>Date</th><th>Status</th></tr></thead>
	<tbody>
	{{#notifications}}
	    <tr><td>{{date}}</td><td>{{status}}</td></tr>
	{{/notifications}}
	</tbody>
    </table>


    <h3>Visit History</h3>
    <table class="table table-bordered table-striped">
    <thead><tr><th>Date</th><th>Seen by</th><th>Start Time</th><th>Edit Time</th></tr></thead>
	<tbody>
	{{#history}}
	    <tr><td>{{date}}</td><td>{{seenBy}}</td><td>{{startTime}}</td><td>{{endTime}}</td></tr>
	{{/history}}
	</tbody>
    </table>

    </div>
  </script>

    <script type="text/template" id="addedPatient">
	<div class="hero" data-prebind="addedPatient">
	    <h1>Patient has successfully been added to the Waiting Room.</h1>
	    <a class="btn btn-primary" href="#addNewPatient">Add new patient</a>
	    <a class="btn btn-primary" href="#editPatient/{{id}}">Edit patient info</a>
	</div>
    </script>

    <script type="text/template" id="addNewPatient">
      <form class="form-signin" id="addPatient" data-bind="addPatient" data-toggle="validator" role="form">

        <h2 class="form-signin-heading">Add New Patient</h2>
	<!-- owner is set on server, but needs to be not null to store -->
	<input type="hidden" name="owner" value="" />
	<input type="hidden" name="status" value="Waiting" />
	<input type="hidden" name="requesting" value="" />

        <div class="form-group">
          <label for="inputFirstName" class="sr-only">First Name</label>
	  <input type="text" name="firstName" id="inputFirstName" class="form-control" placeholder="First Name" required="" autofocus="">
		<div class="help-block with-errors"></div>
	  <label for="inputLastName" class="sr-only">Last Name</label> 
	  <input type="text" name="lastName" id="inputLastName" class="form-control" placeholder="Last Name" required="">
		<div class="help-block with-errors"></div>
        </div>
        <div class="form-group">
	    <label for="inputEmail" class="sr-only">Email</label>
	    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email">
	    <div class="help-block with-errors"></div>
        </div>
        <div class="form-group">
	    <label for="inputCEmail" class="sr-only">Confirm Email</label>
	    <input type="email" id="inputCEmail" class="form-control" placeholder="Confirm Email" required="" data-match="#inputEmail" data-match-error="Email does not match">
	    <div class="help-block with-errors"></div>
        </div>
        <div class="form-group">
	    <label for="inputPhone" class="sr-only">Phone</label>
	    <input type="text" name="phone" id="inputPhone" class="form-control" placeholder="Phone">
	    <div class="help-block with-errors"></div>
        </div>
        <div class="form-group">
	    <label for="inwaitingroom">In Waiting Room</label>
	    <input type="checkbox" name="inwaitingroom" id="inwaitingroom" style="margin-left:20px;" value="yes">
        </div>
        <div class="form-group">
	    <label>Patient Requesting Service From</label>
	    <p>
	    <select name="requestings[]" class="requesting" multiple="multiple">
	    	<option value="Peer Support Specialist">Peer Support Specialist</option>
	    	<option value="Nurse Practitioner">Nurse Practitioner</option>
	    	<option value="Youth Councillor">Youth Councillor</option>
	    	<option value="No Preference">No Preference</option>
	    </select>
	    </p>
        </div>

        <div class="panel" id="contactBy">

	    <label for="contactBy">Method of contact</label>
	    <div class="form-group" data-bind="btns">

		<div>
		  <div class="help-block with-errors"></div>

		  <input type="text" id="contactBy" name="contactBy" style="border:0;width:0px;"/>
		  <div class="btn btn-lg btn-default" id="byPhone" data-name="contactBy">Phone</div>

		  <div class="btn btn-lg btn-default" id="byEmail" data-name="contactBy">Email</div>

		  <div class="btn btn-lg btn-default" id="byText" data-name="contactBy">Texts</div>
		</div>

        </div>

	<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
      </form>
    </div>
  </script>

    <script type="text/template" id="removePatient">
	<form data-bind="removePatient"></form>
    </script>

    <script type="text/template" id="notifyPatient">
	<form data-bind="notifyPatient"></form>
    </script>


    <script type="text/template" id="downPatient">
	<form data-bind="downPatient"></form>
    </script>
    <script type="text/template" id="upPatient">
	<form data-bind="upPatient"></form>
    </script>

    <script type="text/template" id="toSeen">
	<form data-bind="toSeen"></form>
    </script>

    <script type="text/template" id="toWaiting">
	<form data-bind="toWaiting"></form>
    </script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script><!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="bower_components/mustache/mustache.min.js" type="text/javascript"></script>

  <script src="bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>

  <script src="bower_components/bootstrap-validator/dist/validator.min.js" type="text/javascript"></script>

  <script src="bower_components/bootstrap-table/dist/bootstrap-table-all.min.js " type="text/javascript"></script>
  <script src="bower_components/bootstrap-3-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>

  <script src="js/bootstrap-select.min.js" type="text/javascript"></script>

  <script src="js/maskedinput.js" type="text/javascript"></script>

  <script src="js/main.js" type="text/javascript"></script>

</script>
</body>
</html>
