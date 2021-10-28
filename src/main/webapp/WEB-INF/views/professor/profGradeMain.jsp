<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 성적 관리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).on("click", "#subTable>tbody>tr", function(){
			var tr = $(this);
			var td = tr.children();
			var subCode = td.eq(0).text();
			var gradeYear = $("#con1 option:selected").val();
			var gradeSemester = $("#con2 option:selected").val();
			/* var gradeYear = $("#con1").val().prop("selected", true);
			var gradeSemester = $("#con2").val().prop("selected", true); */
			
			console.log(subCode);
			console.log(gradeYear);
			console.log(gradeSemester);
			
			$.ajax({
				url: "filteredGrade.pr",
				type:"GET",
				data:{
					subCode:subCode, 
					gradeYear:gradeYear, 
					gradeSemester:gradeSemester
				},
				dataType:"json",
				success:function(gList){
					var result = "<tr role='row'>";
					
					$.each(gList, function(index, item) {
						result += "<td class='sorting_1'>" + item.deptTitle + "</td>"
							   + "<td>" + item.studentId + "</td>"
							   + "<td>" + item.studentName + "</td>"
							   + "<td>" + item.studentStatus + "</td>"
							   + "<td>" + item.attendance + "</td>"
							   + "<td>" + item.assignment + "</td>"
							   + "<td>" + item.midExam + "</td>"
							   + "<td>" + item.finExam + "</td>"
							   + "<td>" + item.gradeTotal + "</td>"
							   + "<td>" + item.gradeResult + "</td>"
							   + "<td>" + item.gradeCredit + "</td></tr>"
					});
					$('#gradeTable tbody').html(result);
				},
				error:function() {
					alert("로딩 실패");
				}
			});
		});
	</script>

</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
 
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 성적 관리
				</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">성적 관리</li>
				<li class="breadcrumb-item"><a href="profGradeMain.pr">성적 등록/조회/수정</a></li>
			</ul>
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">

							<div class="row">
								<h3 class="tile-title">성적 등록/조회/수정</h3>
							</div>
							
							<form action="filteredSubject.pr" class="row">
							<div class="row">
								<div class="form-group col-md-5">
									<!-- <div class="form-group col-md-5">
									  <label class="control-label" for="evalType">평가방법</label>
									  <select class="form-control" id="evalType">
									    <option>상대평가</option>
									    <option>절대평가</option>
									  </select>
									</div> -->
									<div class="form-group col-md-5">
									  <label class="control-label" for="con1">학년도 </label>
									  <select class="form-control" id="con1" name="con1">
									  	<option value="0">전체</option>
									  	<option value="2021" <c:if test="${ con1 == '2021' }">selected</c:if>>2021</option>
									    <option value="2020" <c:if test="${ con1 == '2020' }">selected</c:if>>2020</option>
<%-- 									  	<c:forEach items="${ subList }" var="subList">
									  		<option value="${ subList.subYear }" <c:if test="${ subYear eq subList.subYear }">selected</c:if>>
									  			${ subList.subYear }
									  		</option>
									  	</c:forEach> --%>
									  </select>
									</div>
									<div class="form-group col-md-5">
									  <label class="control-label" for="con2">학기 </label>
									  <select class="form-control" id="con2" name="con2">
									  	<option value="0">전체</option>
									    <option value="1" <c:if test="${ con2 == '1' }">selected</c:if>>1</option>
									    <option value="2" <c:if test="${ con2 == '2' }">selected</c:if>>2</option>
									  </select>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div id="sampleTable_filter" class="dataTables_filter" style="padding-right: 15px">
									<label>강의명 
										<input type="search" class="form-control form-control-sm"
											aria-controls="sampleTable" name="keyword" value="${ keyword }">
									</label>
										<button class="btn btn-primary btn-sm" type="submit"
										style="margin-left: 10px;" id="readList">조 회</button>
								</div>
							</div>
							</form>
							
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="subTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead>
											<tr role="row">
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 57.475px;">강의코드</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">학과(전공)</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">이수구분</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">교과목명</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학점</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">강의형태</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">교수명</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty subList}">
													<tr><td colspan="7">개설된 강의가 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty subList}">
													<c:forEach var="subList" items="${subList}">
														<tr role="row">
															<td class="sorting_1" id="tdSubCode"><c:out value="${subList.subCode}"/></td>
															<td><c:out value="${subList.deptTitle}"/></td>
															<td><c:out value="${subList.subDivs}"/></td>
															<td><c:out value="${subList.subTitle}"/></td>
															<td><c:out value="${subList.subCredit}"/></td>
															<td><c:out value="${subList.subType}"/></td>
															<td><c:out value="${subList.profName}"/></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-5">
									<button class="btn btn-primary btn-sm" type="button">저장</button>
								</div>
							</div>


							<div class="row">
								<div class="col-sm-12">
								
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="gradeTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead>
											<tr role="row">
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">학과(전공)</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">학번</th>
												<!-- <th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학년</th> -->
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">성명</th>
												<!-- <th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">수강구분</th> -->
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학적상태</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">출석</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">과제</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">중간</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">기말</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">점수</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">등급</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">평점</th>
											</tr>
										</thead>
										<tbody>
											<%-- <c:choose>
												<c:when test="${empty gradeList}">
													<tr><td colspan="11">수강중인 학생이 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty gradeList}">
													<c:forEach var="list" items="${gradeList}">
														<tr role="row">
															<td class="sorting_1"><c:out value="${gradeList.deptTitle}"/></td>
															<td><c:out value="${gradeList.studentId}"/></td>
															<td><c:out value="${gradeList.studentName}"/></td>
															<td><c:out value="${gradeList.studentStatus}"/></td>
															<td><c:out value="${gradeList.attendance}"/></td>
															<td><c:out value="${gradeList.assignment}"/></td>
															<td><c:out value="${gradeList.midExam}"/></td>
															<td><c:out value="${gradeList.finExam}"/></td>
															<td><c:out value="${gradeList.gradeTotal}"/></td>
															<td><c:out value="${gradeList.gradeResult}"/></td>
															<td><c:out value="${gradeList.gradeCredit}"/></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose> --%>
										</tbody>
									</table>
								</div>
							</div>
							
							<!-- 페이징 처리 -->
							<div id="pagingArea">
				                <ul class="pagination">
				                	<c:choose>
				                		<c:when test="${ pi.currentPage ne 1 }">
				                			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </ul>
				            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>