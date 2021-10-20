<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/apple-icon-180x180.png">
  <link href="./assets/favicon.ico" rel="icon">
  <link href="../css/login.css" rel="stylesheet">
 
</head>
<body class="text-center">
<form class="form-signin" action="loginPro.jsp" method="post">
	<img class="mb-4" src="../assets/apple-icon-180x180.png" alt="" width="72" height="72">
  	<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  	<label for="id" class="sr-only">ID</label>
  	<input type="id" id="id" name="id" class="form-control" placeholder="ID" required autofocus>
  	<label for="inputPassword" class="sr-only">Password</label>
  	<input type="password" name="pw" id="inputPassword" class="form-control" placeholder="Password" required>
  	<div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
	<div class="btn-group">
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  		<button class="btn btn-lg btn-secondary btn-block" type="submit" onclick="location.href='joinForm.jsp'">join</button>
	</div>
</form>
<script type="text/javascript" src="../js/main.70a66962.js"></script>

</body>
</html>