<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
</head>
	<!-- Navigation-->
		<!-- Section-->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
					<div class="col mb-5">
						<ul>
							<li><label><input type='checkbox' name='animal' value='selectall' onclick='selectAll(this)'/>Select All</label></li>
							<li><input type='checkbox' name='animal' value='dog'/>asd</li>
							
							<li><input type='checkbox'  name='animal' value='cat' /> 고양이</li>
							<li><input type='checkbox' name='animal' value='rabbit' /> 토끼</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<div id="MOVE_TOP_BTN">
			<a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
					<p style="font-size: 12px; position: absolute; top: 15px; left: 15px;">top</p></div></a>
			<a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
					<p style="font-size: 12px; position: absolute; top: 15px; left: 5px;">로그인</p></div></a> 
			<a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
					<p style="font-size: 10px; position: absolute; top: 15px; left: 5px;">회원가입</p></div></a>
		</div>
		<!-- Footer-->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script>
		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 100) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
			});

			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>