<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Portfolio Details - Knight Bootstrap Template</title>
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



		<div class="container">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">게시글 작성</h6>
				</div>
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">게시글을 작성해주세요!</h1>
								</div>
								<form class="user" action="boardplus.me">
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="title" name="title" placeholder="제목">
										</div>

									</div>
									<br>
									<div class="form-group">
										<textarea id="story" class="form-control form-control-user"
											name="content" id="content" rows="7" cols="33"></textarea>
									</div>
									<br>

									<div class="form-group row"></div>
									
									<input type="submit"  class="btn btn-info" value="등록하기">
									<hr>
									<a href="index.html" class="btn btn-google btn-user btn-block">
										<i class="fab fa-google fa-fw"></i>
									</a> <a href="index.html"
										class="btn btn-facebook btn-user btn-block"> <i
										class="fab fa-facebook-f fa-fw"></i>
									</a>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" href="forgot-password.html"> 낙성대학교 커뮤니티</a>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		</div>





	</main>



	<!-- ======= Footer ======= -->
	<footer id="footer">

		<div class="footer-top" height="100px">

			<div class="container">

				<div class="row justify-content-center">
					<div class="col-lg-6">
						<a href="#header" class="scrollto footer-logo"><img
							src="assets/img/hero-logo.png" alt=""></a>
						<h3>Knight</h3>
						<p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis
							magni eligendi fuga maxime saepe commodi placeat.</p>
					</div>
				</div>

				<div class="row footer-newsletter justify-content-center">
					<div class="col-lg-6">
						<form action="" method="post">
							<input type="email" name="email" placeholder="Enter your Email"><input
								type="submit" value="Subscribe">
						</form>
					</div>
				</div>

				<div class="social-links">
					<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
						href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
						href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
						href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
						href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
				</div>

			</div>
		</div>

		<div class="container footer-bottom clearfix">
			<div class="copyright">
				&copy; Copyright <strong><span>Knight</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/knight-free-bootstrap-theme/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

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