<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<style>
#images,  {
	margin-left: 30px;
	
}
</style>
<jsp:include page="../../views/menubar.jsp" />


<main class="app-content">
	<div class="app-title">

		<div>
			<button class="btn btn-primary" type="button"
				onclick="location.href='facMove.me'">대여목록</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='facMovess.me?id=20193019'">MY대여</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='facMovesss.me'">관리자 확인</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='facMovessss.me'">관리 목록</button>

			<p></p>
		</div>

		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Tables</li>
			<li class="breadcrumb-item active"><a href="#">faility</a></li>
		</ul>
	</div>
	<div class="row">
		<form action="facMovecate2.me">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label> 카테고리 선택 <select
				name="cate1" aria-controls="
				sampleTable"
				class="form-control form-control-sm" style="width: 100px" id="cate1">
					<option value="선택">선택</option>
					<option value="전자">전자</option>
					<option value="사무">사무</option>
					<option value="현수막">현수막</option>
			</select>
			</label> <label> <select name="cate2" aria-controls="sampleTable"
				class="form-control form-control-sm" style="width: 100px" id="cate2">
					<option value="선택">선택</option>
					<option value="신청가능">신청가능</option>
					<option value="예약중">예약중</option>
					<option value="대여중">대여중</option>
			</select>
			</label> <input class="app-search__input" type="search" placeholder="Search"
				name="search" id="search">

			<button class="btn btn-primary btn-sm" type="submit"
				style="margin-left: 10px;">조 회</button>

		</form>

		<c:if test="${ !empty msg }">
			<a id="msg"> ${msg}</a>

			<c:remove var="msg" scope="session" />
		</c:if>


		<div class="col-md-12">
			<div class="tile">

				<div class="tile-body">
					<div class="table-responsive">
						<table id="example-table-1" width="100%"
							class="table table-bordered table-hover text-center">
							<thead>
								<tr>
									<th class="hidden">No</th>
									<th>이름</th>
									<th>상태</th>
									<td>날짜</td>
									<td>반납</td>

								</tr>

							</thead>
							<tbody>
								<c:forEach items="${ list }" var="f">
									<tr>
										<td class="hidden">${ f.facNo}</td>
										<td>${ f.facName }</td>
										<td>${ f.facStatus }</td>
										<td>${ f.facDate }</td>

										<c:choose>



											<c:when test="${f.facStatus eq '대여중'}">
												<td>
													<button class="btn btn-success" type="button"
														onclick="location.href='fachome.me?no=${f.facNo}'">반납확인</button>
												</td>
											</c:when>
											<c:otherwise>
												<td></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>

					<div id="pagingArea">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ pi.currentPage ne 1 }">
									<li class="page-item"><a class="page-link"
										href="facMove.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
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
											href="facMove.me?currentPage=${ p }">${ p }</a></li>
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
										href="facMove.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link"
										href="facMove.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>

						<button data-toggle="modal" class="btn btn-primary"
							data-target="#loginModal">추가</button>


					</div>

					<input id="chk" value="" type="hidden">

					<script>
						$('#example-table-1 tr')
								.click(
										function(e) {

											var str = ""
											var tdArr = new Array(); // 배열 선언

											// 현재 클릭된 Row(<tr>)
											var tr = $(this);
											var td = tr.children();

											// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
											console.log("클릭한 Row의 모든 데이터 : "
													+ tr.text());

											// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
											td.each(function(i) {
												tdArr.push(td.eq(i).text());
											});

											console.log("배열에 담긴 값 : " + tdArr);
											// td.eq(index)를 통해 값을 가져올 수도 있다.
											var no = td.eq(0).text();

											$('#hiddenNo').attr('value', no);

											console.log(no);
											$
													.ajax({
														url : "facMoves.me",
														type : "post",
														data : {
															no : no

														},
														success : function(data) {
															console.log(data
																	+ "@@@");

															var a = "resources/upload_files/"
																	+ data;
															console.log(a);
															$('#datatoin')
																	.attr(
																			'src',
																			a);
															$('div.modal:first')
																	.modal();

														},
														error : function(
																request,
																status, error) {
															if (request.status != '0') {
																alert("code : "
																		+ request.status
																		+ "\r\nmessage : "
																		+ request.reponseText
																		+ "\r\nerror : "
																		+ error);
															}
														}

													});

										});
					</script>

					<div class="modal fade" id="layerpop">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">상세 조회</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<form action="facdel.me" method="post">
									<!-- Modal Body -->
									<div class="modal-body">
										<label for="userId" class="mr-sm-2"> 신청사유 : </label> <input
											type="text" class="form-control mb-2 mr-sm-2"
											placeholder="Enter ID" id="userId" name="userId" width="300"
											height="300"> <br>
									</div>
									<div>
										<img src="..." width="700" height="370" class="img-responsive" id="datatoin" alt="Responsive image">
									</div>

									<input id="hiddenNo" type="hidden" display:none name="hiddenNO"
										enabled>

									<!-- Modal footer -->

									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">삭제</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">취소</button>
									</div>


								</form>
							</div>
						</div>
					</div>

					<div class="modal fade" id="loginModal">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">시설물 등록</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<form id="enrollForm" method="post" action="facpl.me"
									enctype="multipart/form-data">
									<br> <br>
									<div class="form-group row">
										<label class="control-label col-md-3">시설물 이름 : </label>
										<div class="col-md-8">
											<input class="form-control" type="text" placeholder=""
												name="facName" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="control-label col-md-3">Identity Proof</label>
										<div class="col-md-8">
											<input class="form-control" type="file" name="uploadFile">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label">카테고리</label>
										<div class="form-check">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="fac_cat"
												value="전자">전자
											</label>
										</div>
										<div class="form-check">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="fac_cat"
												value="사무">사무
											</label>
										</div>
										<div class="form-check">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="fac_cat"
												value="현수막">현수막
											</label>


										</div>
									</div>
									</table>
									<br>

									<div align="center">
										<button type="submit" class="btn btn-primary">등록하기</button>
										<button type="reset" class="btn btn-danger">취소하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<script>
						setTimeout(function() {
							$("#msg").hide();
						}, 3000);
					</script>

					</body>
					</html>