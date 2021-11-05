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



		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">낙성대 공용 커뮤니티</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="boardList" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th width="5%">번호</th>
								<th width="15%">학번</th>
								<th width="30%">제목</th>
								<th width="10%">좋아요</th>
								<th width="10%">조회수</th>
								<th width="20%">날짜</th>
							</tr>
						</thead>

						<tbody>


							<c:forEach items="${ list }" var="b">
								<tr onclick="location.href='boarddetail.me?no=${b.no }'">
									<td>${ b.no }</td>
									<td>${ b.stuId }</td>
									<td>${ b.title }</td>
									<td>${ b.like }</td>
									<td>${ b.isee }</td>
									<td>${ b.date }</td>

								</tr>
							</c:forEach>


						</tbody>
						
					</table>
				<br>
					<div id="pagingArea">
						<button class="btn btn-outline-info" type="button"
							onclick="location.href='boardplPage.me'">추가</button>
						<ul class="pagination">
							<c:choose>
								<c:when test="${ pi.currentPage ne 1 }">
									<li class="page-item"><a class="page-link"
										href="lecMove.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link"
										href="">Previous</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
								var="p">
								<c:choose>
									<c:when test="${ pi.currentPage ne p }">
										<li class="page-item"><a class="page-link"
											href="lecMove.me?currentPage=${ p }">${ p }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="">${ p }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>


							<c:choose>
								<c:when test="${ pi.currentPage ne pi.maxPage }">
									<li class="page-item"><a class="page-link"
										href="lecMove.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link"
										href="lecMove.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>

		</div>
		<!-- /.container-fluid -->


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

</body>

</html>