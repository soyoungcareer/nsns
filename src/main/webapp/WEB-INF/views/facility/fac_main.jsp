<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta name="description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<!-- Twitter meta-->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:site" content="@pratikborsadiya">
<meta property="twitter:creator" content="@pratikborsadiya">
<!-- Open Graph Meta-->
<meta property="og:type" content="website">
<meta property="og:site_name" content="Vali Admin">
<meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
<meta property="og:url"
	content="http://pratikborsadiya.in/blog/vali-admin">
<meta property="og:image"
	content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
<meta property="og:description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<title>낙성대학교 - 시설물대여</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<jsp:include page="../../views/menubar.jsp" />

<main class="app-content">
	<div class="app-title">

		<div>
			<button class="btn btn-primary" type="button"
				onclick="location.href='facMove.me'">대여목록</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='facMovess.me'">MY대여</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='facMovesss.me'">관리자 확인</button>

			<p></p>
		</div>

		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Tables</li>
			<li class="breadcrumb-item active"><a href="#">faility</a></li>
		</ul>
	</div>
	<div class="row">

		<div class="col-md-12">
			<div class="tile">

				<div class="tile-body">
					<div class="table-responsive">
						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th>No</th>
									<th>이름</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr class="sub">
									<td>1</td>
									<td>벽결이 TV</td>
									<td>대여중</td>
								</tr>
								<tr>
									<td>2</td>
									<td>대형 의자</td>
									<td>대여가능</td>
								</tr>
								<tr>
									<td>3</td>
									<td>대학교 현수막</td>
									<td>예약중</td>
								</tr>

							</tbody>
						</table>


						<script>
							$('.sub').click(function(e) {

								var aa = "기명준";
								console.log("aaa");
								$.ajax({
									url : "facMoves.me",
									type : "GET",
									data : aa,
									success : function(data) {

										$('div.modal').modal();

									},
									error : function(data) {
										alert("error");
									}
								});

							});
						</script>

						<div class="modal fade" id="layerpop">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">Login</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<form action="#" method="post">
										<!-- Modal Body -->
										<div class="modal-body">
											<label for="userId" class="mr-sm-2"> 신청사유 :</label> <input
												type="text" class="form-control mb-2 mr-sm-2"
												placeholder="Enter ID" id="userId" name="userId" width="300" height="300"> <br>
										</div>
										<div>
											<img src="resources/upload_files/tomcat.gif" width="300" height="300">
										</div>

										<!-- Modal footer -->

										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">예약 신청</button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">취소</button>
										</div>


									</form>
								</div>
							</div>
						</div>


						</body>
						</html>