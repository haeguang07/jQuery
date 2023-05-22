<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		body {
			font-family: Arial, Helvetica, sans-serif;
		}

		#loginForm {
			width: 600px;
			margin: 0 auto;
		}

		form {
			border: 3px solid #f1f1f1;
		}

		#logininput {
			list-style: none;
			text-align: center;
		}

		#logininput li label {
			float: left;
			display: inline-block;
			width: 100px;
			padding: auto;

		}

		input[type=text],
		input[type=password] {
			width: 60%;
			padding: 12px 20px;
			margin: 8px 0;
			display: block;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}
		#login_button{
			text-align: center;

		}
		button {
			background-color: rgb(81, 186, 213);
			color: white;
			padding: 14px 20px;
			margin: 8px 0 0 0;
			border: none;
			cursor: pointer;
			width: 30%;
		}

		button:hover {
			opacity: 0.8;
		}

		.cancelbtn {
			width: auto;
			padding: 10px 18px;
			background-color: #f44336;
		}

		.imgcontainer {
			text-align: center;
			margin: 24px 0 12px 0;
		}

		img.avatar {
			width: 30%;

		}

		#simple_login {
			text-align: center;
		}

		.simple_login_logo {
			margin: 3%;
			width: 8%;
		}

		.container {
			padding: 16px;
		}

		span.psw {
			float: right;
			padding-top: 16px;
			padding-right: 70px;
			
		}

		/* Change styles for span and cancel button on extra small screens */
		@media screen and (max-width: 300px) {
			span.psw {
				display: block;
				float: none;
			}

			.cancelbtn {
				width: 100%;
			}
		}
	</style>
</head>

<body>
	<div id="loginForm">
		<form action="login.do" method="post">
			<div class="imgcontainer">
				<img src="image/logo.png" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<ul id="logininput">
					<li><label for="uname"><b>아이디</b></label> <input type="text" placeholder="아이디를 입력하세요" name="id" required></li>
					<li><label for="psw"><b>비밀번호</b></label> <input type="password" placeholder="패스워드를 입력하세요" name="pw" required>
					</li>
				</ul>
				<div id="login_button">
					<button type="submit">로그인</button>
					<button type="button">회원가입</button>
				</div>
				<span class="psw"><a href="#">아이디/비밀번호찾기</a></span>
			</div>
			<div id="simple_login">
				<br>
				<p>SNS아이디로 간편하게 로그인</p>
				<a><img src="image/logo_google.png" class="simple_login_logo"></a>
				<a><img src="image/logo_naver.png" class="simple_login_logo"></a>
				<img src="image/logo_kakao.png" class="simple_login_logo">
			</div>
		</form>
	</div>
</body>

</html>