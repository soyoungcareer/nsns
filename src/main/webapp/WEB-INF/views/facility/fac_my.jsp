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
<body>

	<jsp:include page="facMenuBar.jsp" />



<main class="app-content">
	   <div class="app-title">
        <div>
          <h1><i class="fa fa-archive"></i> 시설물대여</h1>
        </div>
       <ul class="app-breadcrumb breadcrumb">
       		<c:if test="${ !empty loginStu }">
           	<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }/stuinfo.st" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>
       		</c:if>
       		
       		<c:if test="${ !empty loginAdm }">
           	<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }/subModifyList.adm" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>
       		</c:if>
       		
       		<c:if test="${ !empty loginPrf }">
           	<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }/profMypage.pr" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>
       		</c:if>
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
										<th>시설물이름</th>
										<th>반납</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ list }" var="f">
										<c:choose>
											<c:when test="${f.facbancheck eq '반납'}">
												<tr bgcolor="red">
											</c:when>

											<c:otherwise>
												<tr>
											</c:otherwise>


										</c:choose>


										<td>${ f.facNo}</td>
										<td>${ f.facName }</td>
										<td>${ f.facban }일남음</td>




										</tr>
									</c:forEach>


								</tbody>
							</table>


						</div>

					</div>
				</div>
			</div>
		</div>
		<div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ pi.currentPage ne 1 }">
						<li class="page-item"><a class="page-link"
							href="facMove.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:choose>
						<c:when test="${ pi.currentPage ne p }">
							<li class="page-item"><a class="page-link"
								href="facMove.me?currentPage=${ p }">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
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



		</div>
		<br> <br> <br> <br> <br> <br>
		<div class="col-md-6">
			<div class="tile">
				<h3 class="title">알람</h3>
				<button class="btn btn-primary" type="button" id="delallam"
					onclick="tests()">내역삭제</button>

				<c:choose>
					<c:when test="${listt}.isEmpty()">
						<a>알람이 없습니다.</a>
					</c:when>

					<c:otherwise>
							
						<c:forEach items="${ listt }" var="f">
								<br>		<br>
							<input type="hidden" id="aaa" value="${f.stuId}">
							<br>
								<button class="btn btn-primary btn-lg btn-block" type="button"
									id="delbtn">${f.name}이${f.status}되었습니다.</button>
									<br>
						</c:forEach>

					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<script>
			function tests() {
				console.log("!@#!@#");
				var test = "123";
				console.log(test);
				$("#delbtn").attr("type", "hidden");
				$.ajax({
					url : "delallam.me",
					type : "post",
					data : {
						test : test

					},
					success : function(data) {
						alert("제거완료");
						console.log(data);
						$("#delbtn").remove();
						

					},
					error : function(request, status, error) {
					
					}

				});

			}
		</script>
</body>
</html>
