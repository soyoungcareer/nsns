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

<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/docs/css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


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
					<h6 class="m-0 font-weight-bold text-primary">게시글 수정</h6>
				</div>
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">게시글을 수정할수있어요!</h1>
								</div>
								<form class="user" action="boardupdate.me">
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="title" name="title" value="${b.title }">
										</div>
											<input type="hidden" class="form-control form-control-user"
												id="no" name="no" value="${b.no }">

									</div>
									<br>
									<div class="form-group">
										<textarea id="story" class="form-control form-control-user"
											name="content" id="content" rows="7" cols="33">${b.content }</textarea>
									</div>
									<br>

									<div class="form-group row">
										<input type="submit" class="btn btn-info" value="수정하기">
										<br><br>
										<input type="button" class="btn btn-info" value="삭제하기" onclick="location.href='boarddel.me?no=${b.no}'">

									</div>
									<hr>

									<input class="btn btn-warning" type="button" value="1"
										id="likecontroller"> <input class="btn btn-warning"
										type="button" value="조회수 : ${b.isee }">
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

	<script>
		selectLike();

		$('#likecontroller').click(
				function(e) {
					var no = "${b.no}";
					console.log(no);
					$.ajax({
						url : "boardlike.me",
						type : "post",
						data : {
							no : no

						},
						dataType : "json",
						success : function(data) {

							alert(data);
							selectLike();

						},
						error : function(request, status, error) {
							if (request.status != '0') {
								alert("code : " + request.status
										+ "\r\nmessage : "
										+ request.reponseText + "\r\nerror : "
										+ error);
							}
						}

					});

				});

		function selectLike() {
			var no = "${b.no}";
			console.log(no);
			console.log("@@@");
			$.ajax({
				url : "boardLikeCount.me",
				type : "post",
				data : {
					no : no
				},

				success : function(data) {
					console.log("data 123123: " + data);
					var dataplus = "좋아요 : " + data;
					$("#likecontroller").val(dataplus);

				},
				error : function() {
					console.log("댓글 리스트조회용 ajax 통신 실패");
				}
			});
		}
	</script>


	<script>
		
	</script>


</body>




</html>