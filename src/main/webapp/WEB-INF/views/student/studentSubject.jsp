<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>User Profile - Vali Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini">
	<jsp:include page="studentMenubar.jsp"/>
	
    <main class="app-content">
    	<div class="app-title">
        	<div>
          		<h1><i class="fa fa-book" aria-hidden="true"></i> 수강과목</h1>
        	</div>
      	</div>

		<div class="row">
			<div class="col-md-8">
				<div class="tile">
					<div class="tile-body">
						<div class="table-responsive">
							<div id="sampleTable_wrapper"
								class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<div class="dataTables_length" id="sampleTable_length">
											<label> <select name="selectYear" id="selectYear"
												aria-controls="sampleTable"
												class="form-control form-control-sm">
													<option value="%">전체</option>
													<c:forEach items="${ yearList }" var="yearList">
														<option value="${yearList}">${yearList}</option>
													</c:forEach>
											</select> <select name="selectMonth" id="selectMonth"
												aria-controls="sampleTable"
												class="form-control form-control-sm">
													<option value="%">전체</option>
													<c:forEach items="${ semesterList }" var="semester">
														<option value="${semester}">${semester}학기</option>
													</c:forEach>
											</select>
											</label>
										</div>
									</div>
									<div class="col-sm-12 col-md-6">
										<div id="sampleTable_filter" class="dataTables_filter">
											<label>교과목명: <input type="search"
												class="form-control form-control-sm" name="search"
												id="search" aria-controls="sampleTable"></label>
											<button class="btn btn-primary btn-sm" type="button"
												id="searchBtn" style="margin-left: 10px; margin-right: 10px">검색</button>
											<button class="btn btn-info btn-sm" type="button"
												style="margin-right: 15px;" onclick="selectAll();">전체
												조회</button>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table
											class="table table-bordered dataTable no-footer"
											id="sampleTable" role="grid"
											aria-describedby="sampleTable_info">
											<thead>
												<tr class="table-info">
													<th>강의코드</th>
													<th>교과목명</th>
													<th>학과명</th>
													<th>강의시간</th>
													<th>이수구분</th>
													<th>학점</th>
													<th>교수명</th>
												</tr>
											</thead>

											<tbody>
												<c:if test="${ ! empty list }">
													<c:forEach items="${ list }" var="list">
														<tr>
															<td>${ list.subCode }</td>
															<td>${ list.subTitle }</td>
															<td>${ list.deptTitle }</td>
															<td>${ list.subTime }</td>
															<c:if test="${ list.subDivs eq 1 }">
																<td>전공필수</td>
															</c:if>
															<c:if test="${ list.subDivs eq 2 }">
																<td>교양필수</td>
															</c:if>
															<td>${ list.subCredit }</td>
															<td>${ list.profName }</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${ empty list }">
													<tr>
														<td colspan="7" style="text-align: center;">
															조회되는 수강과목이 없습니다.
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

									<div id="pagingArea"
										style="width: fit-content; margin: auto; margin-top: 10px">
										<ul class="pagination">
											<c:choose>
												<c:when test="${ pi.currentPage ne 1 }">
													<li class="page-item"><a class="page-link"
														href="subject.li?currentPage=${ pi.currentPage-1 }">«</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item disabled"><a class="page-link"
														href="">«</a></li>
												</c:otherwise>
											</c:choose>

											<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
												var="p">
												<c:choose>
													<c:when test="${ pi.currentPage ne p }">
														<li class="page-item"><a class="page-link"
															href="subject.li?currentPage=${ p }">${ p }</a></li>
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
														href="subject.li?currentPage=${ pi.currentPage+1 }">»</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item disabled"><a class="page-link"
														href="subject.li?currentPage=${ pi.currentPage+1 }">»</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="tile">
					<div class="tile-body">
						<h3 style="margin: 30px">학기별 성적과 수강학점</h3>
						<div class="table-responsive">
							<div id="sampleTable_wrapper"
								class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-bordered dataTable no-footer"
											id="gradeTable" role="grid"
											aria-describedby="sampleTable_info">
											<thead>
												<tr class="table-info">
													<th>연도</th>
													<th>학기</th>
													<th>평균성적</th>
													<th>학점</th>
												</tr>
											</thead>

											<tbody>
												<c:if test="${ ! empty gradeList }" >
													<c:forEach items="${ gradeList }" var="gradeList">
														<tr>
															<td>${ gradeList.year }</td>
															<td>${ gradeList.semester }</td>
															<td>${ gradeList.gradeCredit }</td>
															<td>${ gradeList.stuCredit }</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${ empty gradeList }">
													<tr>
														<td colspan="4" style="text-align: center;">
														입력된 성적이 없습니다.
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>
  </body>
  <script>
  $('#searchBtn').on('click',function(){
	  
		var sYear =   $("select[name=selectYear]").val();
		var sMonth =  $("select[name=selectMonth]").val();
		var search =  $('#search').val();
		var str1 = "";

			var str2 = "";

		
			$.ajax({
				url : 'searchList.su',
				type : 'GET',
				datatype : 'json',
				data : {
					sYear : sYear,
					sMonth : sMonth,
					search : search
				},
				success : function(result) {
					
					$('#sampleTable tbody').empty();
					$('#pagingArea').empty();

					if (result.list.length != 0) {

							for (var i = 0; i < result.list.length; i++) {
								str1 += '<tr>'
										+ '<td>'
										+ result.list[i].subCode
										+ '</td><td>'
										+ result.list[i].subTitle
										+ '</td><td>'
										+ result.list[i].deptTitle
										+ '</td><td>'
										+ result.list[i].subTime
										+ '</td>';
	
								if (result.list[i].subDivs == 1) {
									str1 += '<td>'
											+ "전공필수"
											+ '</td>';
								} else {
									str1 += '<td>'
											+ "교양필수"
											+ '</td>';
								}
	
								str1 += '<td>'
										+ result.list[i].subCredit
										+ '</td><td>'
										+ result.list[i].profName
										+ '</td></tr>';
	
							}
	
							str2 += '<ul class="pagination">'
	
							if (result.pi.currentPage != 1) {
								str2 += '<li class="page-item"><a class="page-link" href="subject.li?currentPage="'
										+ result.pi.currentPage
										- 1
										+ '">«</a></li>'
	
							} else {
								str2 += '<li class="page-item disabled"><a class="page-link" href="">«</a></li>'
							}
	
							for (var i = result.pi.startPage; i <= result.pi.endPage; i++) {
	
								if (result.pi.currentPage != i) {
									str2 += '<li class="page-item"><a class="page-link" href="subject.li?currentPage='
											+ i
											+ '">'
											+ i
											+ '</a></li>'
								} else {
									str2 += '<li class="page-item disabled"><a class="page-link" href="">'
											+ i
											+ '</a></li>'
								}
							}
	
							if (result.pi.currentPage != result.pi.maxPage) {
								str2 += '<li class="page-item"><a class="page-link" href="subject.li?currentPage="'
										+ result.pi.currentPage
										+ 1
										+ '">»</a></li>'
							} else {
								str2 += '<li class="page-item disabled"><a class="page-link" href="subject.li?currentPage="'
										+ result.pi.currentPage
										+ 1
										+ '">»</a></li>'
							}

					} else {
						
						str1 += '<tr><td colspan="7" style="text-align:center;"> 조회된 검색 결과가 없습니다. </tr>'
						console.log("Test");
					}

					$('#sampleTable tbody').append(str1);
					$('#pagingArea').append(str2);
				},
				error : function(e) {
					console.log("ajax 통신 실패")
				}

			});

});
									

			function selectAll() {
				location.href = "subject.li";
			}
		</script>
</html>