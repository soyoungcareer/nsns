<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<title>낙성대 - 커뮤니티</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/bootstrap/docs/images/favicon.png" rel="icon">
<link href="resources/bootstrap/docs/images/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/bootstrap/docs/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/bootstrap/docs/css/style.css" rel="stylesheet">


<!-- =======================================================
  * Template Name: Knight - v4.6.0
  * Template URL: https://bootstrapmade.com/knight-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

		<!-- ======= Header ======= -->
	 <header id="header" class="d-flex align-items-center">
         <div
         class="container d-flex align-items-center justify-content-between" style="height: 80px">

         <div class="logo">
            <a href="boardMoves.me"><img
               src="resources/bootstrap/docs/images/nakseongLogo.png" alt="" style=" width:60px"
               class="img-fluid">
               </a>
         </div>

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto " href="#hero"></a></li>
					<li><a class="nav-link scrollto" href="boardMovesss.me">게시글</a></li>
					<li><a class="nav-link scrollto" href="boardMovess.me">MY게시글</a></li>
					<li><a class="nav-link scrollto" href="crawMain.cer">취업지원</a></li>
					<li><a class="nav-link scrollto" href="chat.do">채팅</a></li>
					<li><a class="nav-link scrollto" href="#pricing"></a></li>
					
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->
	

	<main id="main" data-aos="fade-up">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
					<h2>게시글 랭킹</h2>
					<ol>
						<li><a href="index.html">Home</a></li>
						<li>Portfoio Details</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Details Section ======= -->
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">

				<div class="row gy-4">

					<div class="col-lg-8">

						<div class="portfolio-info">
							<h3>조회수</h3>
							<table class="table table-bordered" id="boardList" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th width="15%">학번</th>
										<th width="30%">제목</th>
										<th width="10%">조회수</th>

									</tr>
								</thead>

								<tbody>


									<c:forEach items="${ likeranking }" var="b" begin="0" end="5">
										<tr>
											<td>${ b.stuId }</td>
											<td>${ b.title }</td>
											<td>${ b.isee }</td>

										</tr>
									</c:forEach>


								</tbody>

							</table>
						</div>

						<div class="portfolio-info">
							<h3>좋아요</h3>
							<table class="table table-bordered" id="boardList" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th width="15%">학번</th>
										<th width="30%">제목</th>
										<th width="10%">조회수</th>

									</tr>
								</thead>

								<tbody>


									<c:forEach items="${ iseeranking }" var="b" begin="0" end="5">
										<tr>
											<td>${ b.stuId }</td>
											<td>${ b.title }</td>
											<td>${ b.like }</td>

										</tr>
									</c:forEach>


								</tbody>

							</table>
						</div>



					</div>

					<div class="col-lg-4">
						<div class="portfolio-info">
							<h3>낙성대학교</h3>
							<ul>
								<li><strong>Establishment</strong>: 1940.04.28</li>
								<li><strong>President</strong>: KKJ</li>
								<li><strong>President's birthday. </strong>: 02.04</li>
								<li><strong>Project URL</strong>: <a href="#">www.naver.com</a></li>
							</ul>
						</div>
						<div class="portfolio-description">
							<h2>Nakseong University community greeting.</h2>
							<p>Welcome to the Nakseong University community. Everything
								that happens in this community is not legally responsible, and I
								hope we can communicate with each other to understand and get to
								know each other. Have a good day, everyone.</p>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Portfolio Details Section -->

	</main>
	<!-- End #main -->

	

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>


	<!-- Vendor JS Files -->
	<script src="resources/bootstrap/docs/assets/vendor/aos/aos.js"></script>
	<script
		src="resources/bootstrap/docs/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="resources/bootstrap/docs/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="resources/bootstrap/docs/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="resources/bootstrap/docs/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="resources/bootstrap/docs/assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/bootstrap/docs/js/mainn.js"></script>


</body>

</html>