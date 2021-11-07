<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>낙성대학교 - 온라인강의</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/bootstrap/docs/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/bootstrap/docs/css/styles.css" rel="stylesheet" />

</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="lecMove.me">낙성대학교</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page content-->
	<div class="container">
		<button type="button" class="btn btn-default btn-lg" onclick="location.href='lecMove.me?id=${id}'">
  <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span> 뒤로
</button>
		<div class="text-center mt-5">
			<h1>Network security practice.</h1>
			<p class="lead"></p>
			<p>학습중인 과정</p>
		</div>
	</div>


	<div class="container">

	
			<button class="btn btn-outline-info" type="button"
				onclick="location.href='lecpl.me?no=${no}'">추가
			</button>

	

		<br> <br>
		<c:forEach items="${ list }" var="l">
			<table class="table table-hover table-bordered" id="sampleTable">
				<thead>
					<tr>
						<th>${l.listWeek}주차</th>
					</tr>
				</thead>
				<tbody>
					<tr onclick="location.href='lecMovess.me?no=${l.listNo}&id=${id}'">
						<td width="20%">${l.listDate}</td>
						<td width="40%">${l.listContent}<${l.listWeek}강></td>
						<td width="40%"><progress value="${l.time }"
								max="${l.totalTime }" id="jb"></progress></td>






					</tr>

				</tbody>
			</table>
		</c:forEach>



	</div>



</body>
</html>
