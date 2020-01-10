<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Inconsolata:400,700);

@import url(https://fonts.googleapis.com/css?family=PT+Mono);

body {
	background-color: #191919;
}

.container {
	height: 30vh;
	width: 65vw;
	margin: 0 auto;
	margin-top: 20vh;
}

.error {
	background: #55ffaa;
	background: linear-gradient(to right, #d585ff, #00ffee);
	-webkit-background-clip : text; background-clip : text;
	color: transparent;
	font-family: 'Inconsolata';
	font-size: 20vw;
	text-align: center;
}

.text {
	background: #55ffaa;
	background: linear-gradient(to right, #d585ff, #00ffee);
	-webkit-background-clip : text;
	background-clip : text;
	color: transparent;
	font-size: 3vw;
	font-family: 'PT Mono';
	text-align: center;
}

a, a:hover {
	text-decoration: none;
	color: inherit;
}
</style>
</head>
<body>
	<div class="container">
		<div class="error">ERROR</div>
		<div class="text">
			<a href="/bfMain.mr" target="_blank">>_ Click to Main.</a>
		</div>
	</div>
</body>
</html>