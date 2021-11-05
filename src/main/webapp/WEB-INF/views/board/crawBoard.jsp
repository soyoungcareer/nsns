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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
									<li><a class="nav-link scrollto" href="chat.do">익명채팅</a></li>
					<li><a class="nav-link scrollto" href="crawMain.cer">취업지원</a></li>
					
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->




		</div>
	</header>
	<!-- End Header -->

	<main id="main" data-aos="fade-up">
		<!-- DataTales Example -->
		<div class="card shadow mb-4" >
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">낙성대 취업지원</h6>
			</div>
				<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px; max-width:1140px; margin-left: 100px; ">
			<h2 class="" id="buttons">
							일간 채용 TOP
			</h2>
		</div>
		<div class="tile mb-4" style="margin-left: 100px; margin-right: 100px">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length">
								<label>카테고리 : &nbsp;&nbsp;&nbsp;
								<select id="categoryTable" name="sampleTable_length" aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px; display: inline-block;">
										<option value="0" <c:if test="${ categoryTable eq 0 }">selected</c:if>>전체</option>
										<option value="1" <c:if test="${ categoryTable eq 1 }">selected</c:if>>${depart.deptName}</option>
								</select>
								</label>
							</div>
						</div>
								<div class="col-sm-12" style="margin-top: 10px">
									<div class="table-responsive">
										<table class="table table-hover table-bordered"
											id="volTable" >
											<thead>
												<tr style="background: #222d32; color: white;">
													<th style="width: 55px">번호</th>
													<th>기업명</th>
													<th>제목</th>
													<th>조건</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${ top }" var="top" varStatus="num">
												<tr>
													<td>${ num.index+1 } </td>
													<td><a href="https://www.jobkorea.co.kr/${ top.chref }">${ top.company }</a></td>
													<td><a href="https://www.jobkorea.co.kr/${ top.href }">${ top.title }</a></td>
													<td>${ top.opt1 } | ${ top.opt2 }  | ${ top.opt3 }  | ${ top.opt4 }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>

		<!-- /.container-fluid -->


	</main>
	<script type="text/javascript">
	$("#categoryTable").change(function() {
		if($(this).val()==0){
			location.href="crawMain.cer"
		}else{
			location.href="crawSearch.cer"
		}
	})
	</script>

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