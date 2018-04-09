<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
			<link rel="stylesheet" href="assets/css/main.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
  	
	<title>noted | upload notes</title>
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="homepage.jsp">noted</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">Home</a></li>
	        <li><a href="login.jsp">Login</a></li>
	        <li><a href="signup.jsp">Signup</a></li>
	        <li><a href="about.jsp">About</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<!-- NAVBAR -->
	<!-- START GAME -->
	<div class="new-game">
		<div class="container"> 
			<div id="title">
				<h1>Start a Game</h1>
			</div>
			<form name="newGame" method="POST" action="ValidateNewGame">
				<div class="form-row">
				    	<div class="form-group col-md-6"">
				    		<label for="gameName">Game Name</label>
				      	<input type="text" class="form-control" id="gameName" aria-describedby="gameNameHelp" placeholder="ex: Best Quiz">
				    		<small id="gameNameHelp" class="form-text text-muted">Please only use letters and numbers.</small>
				    </div>
				    <div class="form-group col-md-3">
				    		<label for="numPlayers">Num Players</label>			    			
					  	<select id="numPlayers">
						    <option val="">Players</option>
						    <option val="2">2</option>
						    <option val="3">3</option>
						    <option val="4">4</option>
						</select>
						
			  		</div>
			  		<div class="form-group col-md-3">
			  			<label for="selectClass">Select Class</label>
						<select id="selectClass">
						    <option val="">Class</option>
						    <option val="csci109">CSCI 109</option>
						    <option val="csci103">CSCI 103</option>
						    <option val="csci104">CSCI 104</option>
						    <option val="csci170">CSCI 170</option>
						    <option val="csci201">CSCI 201</option>
						    <option val="csci270">CSCI 270</option>
						</select>
			  		</div>
			  	</div>
			  	<div class="form-row"> 
			  		<div class="form-group col-md-12">
			  			<a class="btn btn-primary btn-lg"  id="submit-button" href="gameSession.jsp" role="button">Create Game</a>
		  			</div>
		  		</div>
		  	</form>
		</div>
	</div>
</body>
</html>