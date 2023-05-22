<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="box">
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="background-color: rgb(108, 213, 234) !important;">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">CheckCheck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"></li>
					<li class="nav-item"></li>
					<li class="nav-item dropdown"></li>
				</ul>
				<form class="d-flex">
					<div class="btn btn-outline-dark">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</div>
					<button class="btn btn-outline-dark" type="submit">마이페이지</button>
					<button class="btn btn-outline-dark" type="submit">로그인</button>
					<button class="btn btn-outline-dark" type="submit">회원가입</button>

				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5" style="position: relative;">
		<img src="image/logo.png"
			style="position: absolute; width: 150px; height: 150px; margin-left: 40px">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">
					<select style="width: 100px; height: 50px; font-size: 16px;"
						value="통합검색"><option>통합검색</option>
						<option>국내도서</option>
						<option>외국도서</option></select><input
						style="width: 500px; height: 50px; font-size: 16px;" type="text"
						name="search" value="검색"><input
						style="width: 100px; height: 50px; font-size: 16px;" type="button"
						value="검색">
					<p class="lead fw-normal text-white-50 mb-0">
					<ul id="nav123">
						<a href="#!"><li id="category">카테고리</li></a>
						<a href="#!"><li>베스트</li></a>
						<a href="#!"><li>신상</li></a>
						<a href="#!"><li>공지사항</li></a>
						<a href="#!"><li>문의사항</li></a>
					</ul>
					</p>
			</div>
		</div>
	</header>