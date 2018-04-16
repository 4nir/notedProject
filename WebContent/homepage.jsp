<%@page import="notedProject.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.io.*"%>
<%@ page import= "notedProject.LoadDatabase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
  	<%
  	String username = request.getParameter("username");
	String profilePic = request.getParameter("url");
	boolean guest = true;
	
	if (username == null){
	} else {
		if (!username.equalsIgnoreCase("")){
			guest = false;
		}
	}
  	%>
  	<script>
	  	var myVideo =  iframe.getElementById('myVideo'); 
	  	myVideo.mute();
  	</script>
  	<style>
	    /* Remove the navbar's default margin-bottom and rounded borders */ 
	    .navbar {
	      margin-bottom: 0;
	      border-radius: 0;
	    }
	    /* Add a gray background color and some padding to the footer */
	    footer {
	      background-color: #f2f2f2;
	      padding: 25px;
	    }
	    .navbar-right img {
			margin-top: 5px;
			width: 40px; 
			height: 40px;
			border-radius: 20%; 
		}
		#profileButton {
			background-color: #262626;
			height: 50px;
			width: 50px;
			padding: 0px;
			outline: 0;
		}
		#profileButton:focus, #profileButton:active {
		   outline: none;
		   border: orange; 
		   box-shadow: none;
		}
		.dropdown-menu, .dropdown-item {
			width: 70px;
			color: orange;
			text-align: center; 
			width: 10px;
		}
		.dropdown-item:hover {
			text-decoration: none; 
			font-weight: bold;
			color: orange;
		}
		
		* { box-sizing: border-box; }
			.video-background {
			  background: #000;
			  position: fixed;
			  top: 0; right: 0; bottom: 0; left: 0;
			  z-index: -99;
			}
			.video-foreground,
			.video-background iframe {
			  position: absolute;
			  top: 0;
			  left: 0;
			  width: 100%;
			  height: 100%;
			  pointer-events: none;
			}
			#vidtop-content {
				top: 0;
				color: #fff;
			}
			.vid-info { position: absolute; top: 0; right: 0; width: 33%; background: rgba(0,0,0,0.3); color: #fff; padding: 1rem; font-family: Avenir, Helvetica, sans-serif; }
			.vid-info h1 { font-size: 2rem; font-weight: 700; margin-top: 0; line-height: 1.2; }
			.vid-info a { display: block; color: #fff; text-decoration: none; background: rgba(0,0,0,0.5); transition: .6s background; border-bottom: none; margin: 1rem auto; text-align: center; }
			@media (min-aspect-ratio: 16/9) {
			  .video-foreground { height: 300%; top: -100%; }
			}
			@media (max-aspect-ratio: 16/9) {
			  .video-foreground { width: 300%; left: -100%; }
			}
			@media all and (max-width: 600px) {
			.vid-info { width: 50%; padding: .5rem; }
			.vid-info h1 { margin-bottom: .2rem; }
			}
			@media all and (max-width: 500px) {
			.vid-info .acronym { display: none; }
			} 
		.space {
			height: 500px;
		
		}
  	</style> 
	</head>
	<body>
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
	      	<% String toHome = "homepage.jsp?username="+username+"&url="+profilePic; %>
	      	<a class="navbar-brand" href=<%= toHome %>>noted</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		      	<% String toNewGame = "newGame.jsp?username="+username+"&url="+profilePic; %>
		        <li><a href=<%= toNewGame %>>New Game</a></li>
		        <% String toAbout = "about.jsp?username="+username+"&url="+profilePic; %>
		        <li><a href=<%= toAbout %>>About</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right" id="right-nav">
		      	<% if (guest) { %>
		        		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		     	<% } else { %>
		     		<% String pass = "userProfile.jsp?username=" + username + "&url=" + profilePic; %>
					<div class="dropdown show">
					  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="profileButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <img src=<%= profilePic %> width="100%"/>
					  </a>
					  <div class="dropdown-menu" aria-labelledby="profileButton">
					    <a class="dropdown-item" href=<%=pass%>>My Profile</a><br>
					    <a class="dropdown-item" href="homepage.jsp">Log Out</a>
					  </div>
					</div>
		     	<% } %>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		
		  
		<div class="jumbotron" >
		  <div class="container text-center">
		    <h1>noted</h1>      
		    <p>Learn through friendly competition</p>
		    <p class="lead">
		    <% String toJoinGame = "joinGame.jsp?username="+username+"&url="+profilePic; %>
	    	<a class="btn btn-primary btn-lg"  id="submit-button" href=<%=toJoinGame%> role="button">Join a Game</a>
	    	<% if (!guest) { %>
		    	<a class="btn btn-primary btn-lg"  id="submit-button" href=<%=toNewGame%> role="button">Start a Game</a>
		  	<% } %>		  	
		  </div>
		</div>
		
		<!-- <div class="video-background">
			    <div class="video-foreground">
			      <iframe src="https://www.youtube.com/embed/W0LHTWG-UmQ?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&playlist=W0LHTWG-UmQ" frameborder="0" allowfullscreen></iframe> 
			   	  <iframe src="https://www.youtube.com/embed/amVHBIhWwCo?controls=0&start=64&showinfo=0&rel=0&autoplay=1&loop=1&playlist=amVHBIhWwCo" frameborder="0" allowfullscreen></iframe>
				 
				  <iframe src="https://www.youtube.com/embed/GfRf43JTqY4?controls=0&start=64&end=98&showinfo=0&rel=0&autoplay=1&loop=1&playlist=GfRf43JTqY4" frameborder="0" allowfullscreen></iframe>
				     
			    </div>
		  </div> 
		<div class="space"></div> -->
		  
		<div class="container-fluid bg-3 text-center">    
		  <h3>Featured Notes</h3><br>
		  <a class="btn btn-primary btn-lg"  id="submit-button" href="notePage.jsp" role="button">Explore</a>
		  <div class="row">
		    <div class="col-sm-3">
		      <p>Note #1</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #2</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #3</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3">
		      <p>Note #4</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		  </div>
		</div><br>
		
		<div class="container-fluid bg-3 text-center">    
		  <div class="row">
		    <div class="col-sm-3">
		      <p>Note #5</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #6</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #7</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3">
		      <p>Note #8</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		  </div>
		</div><br><br>
		
		<footer class="container-fluid text-center">
		  <p>&#0169; 2018 Noted All Rights Reserved.</p>
		</footer>
	</body>
</html>