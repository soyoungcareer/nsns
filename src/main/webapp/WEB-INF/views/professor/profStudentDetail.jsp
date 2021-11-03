<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.spring.major.vo.Subject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 학생목록 조회</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).on("click", "#subTable>tbody>tr", function(){
			var tr = $(this);
			var td = tr.children();
			var subCode = td.eq(0).text();
			var year = $("#con1 option:selected").val();
			var semester = $("#con2 option:selected").val();
			var subTitle = td.eq(3).text();
			
			console.log(subCode);
			console.log(year);
			console.log(semester);
			
			$.ajax({
				url: "filteredStudent.pr",
				type:"GET",
				data:{
					subCode:subCode, 
					year:year, 
					semester:semester
				},
				dataType:"json",
				success:function(stuList){
					var title = '<h3 class="tile-title">'
						  + year + '학년도 '
						  + semester + '학기 '
						  + subTitle + '</h3>';
					$('#divTitle').html(title);
					
					var result = "<tr role='row'>";
					
					$.each(stuList, function(index, item) {
						result += "<td class='sorting_1'>" + item.deptName + "</td>"
							   + "<td>" + item.stuId + "</td>"
							   + "<td>" + item.stuName + "</td>";
							   
							   if (item.email == undefined) {
						result += "<td>미입력</td>"  
							   } else {
						result += "<td>" + item.email + "</td>"
							   }
							   
							   if (item.phone == undefined) {
						result += "<td>미입력</td>"  		   
							   } else {
						result += "<td>" + item.phone + "</td>"
							   }
							   
						result += "<td>" + item.stuStatus + "</td></tr>"
					});
					$('#stuListTable tbody').html(result);
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
					<i class="fa fa-edit"></i> 학생 관리
				</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">학생 관리</li>
				<li class="breadcrumb-item"><a href="profStudentDetail.pr">학생목록 조회</a></li>
			</ul>
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">

							<div class="row">
								<h3 class="tile-title">학생목록 조회</h3>
							</div>
							
							<form action="filteredSub.pr">
							<div class="row">
								<!-- <div class="form-group col-md-5">
								  <label class="control-label" for="evalType">평가방법</label>
								  <select class="form-control" id="evalType">
								    <option>상대평가</option>
								    <option>절대평가</option>
								  </select>
								</div> -->
								<div class="form-group col-md-3">
								  <label class="control-label" for="con1">학년도 
									  <select class="form-control" id="con1" name="con1">
									  	<option value="0">전체</option>
									  	<option value="2021" <c:if test="${ con1 == '2021' }">selected</c:if>>2021</option>
									    <option value="2020" <c:if test="${ con1 == '2020' }">selected</c:if>>2020</option>
									  </select>
								  </label>
								</div>
								<div class="form-group col-md-3">
								  <label class="control-label" for="con2">학기 
								 	  <select class="form-control" id="con2" name="con2">
									  	<option value="0">전체</option>
									    <option value="1" <c:if test="${ con2 == '1' }">selected</c:if>>1</option>
									    <option value="2" <c:if test="${ con2 == '2' }">selected</c:if>>2</option>
									  </select>
								  </label>
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
															<td>
																<c:if test="${subList.subDivs eq '1'}"><c:out value="전공"/></c:if>
																<c:if test="${subList.subDivs eq '2'}"><c:out value="교양"/></c:if>
															</td>
															<td><c:out value="${subList.subTitle}"/></td>
															<td><c:out value="${subList.subCredit}"/></td>
															<td>
																<c:if test="${subList.subType eq '1'}"><c:out value="집체"/></c:if>
																<c:if test="${subList.subType eq '2'}"><c:out value="온라인"/></c:if>
															</td>
															<td><c:out value="${subList.profName}"/></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							
							
							<%-- <div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="sampleTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="sampleTable" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Name: activate to sort column descending"
													style="width: 80px;">NO</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 57.475px;">강의코드</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">교과목명</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">이수구분</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학점</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">강의실</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">강의시간</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">강의형태</th>
<!-- 												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">강의계획서</th> -->
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty subList}">
													<tr><td colspan="8">개설된 강의가 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty subList}">
													<c:forEach var="subList" items="${subList}">
														<tr role="row">
															<td class="sorting_1"><%=count++ %></td>
															<td><c:out value="${subList.subCode}"/></td>
															<td><c:out value="${subList.subTitle}"/></td>
															<td>
																<c:if test="${ subList.subDivs eq 1 }"><c:out value="전공"/></c:if>
																<c:if test="${ subList.subDivs eq 2 }"><c:out value="교양"/></c:if>
															</td>
															<td><c:out value="${subList.subCredit}"/></td>
															<td><c:out value="${subList.subClass}"/></td>
															<td><c:out value="${subList.subTime}"/></td>
															<td>
																<c:if test="${ subList.subType eq 1 }"><c:out value="집체"/></c:if>
																<c:if test="${ subList.subType eq 2 }"><c:out value="온라인"/></c:if>
															</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div> --%>
						</div>
					</div>
				</div>
			</div>



			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">

							<div class="row" id="divTitle">
							</div>
							
							<div class="row">
								<div class="col-sm-12">
								
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="stuListTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead>
											<tr role="row">
												<!-- <th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 57.475px;">NO</th> -->
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">학과(전공)</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">학번</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">성명</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">이메일</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">전화번호</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학적상태</th>
											</tr>
										</thead>
										<tbody>
											<%-- <c:choose>
												<c:when test="${empty stuList}">
													<tr><td colspan="8">수강중인 학생이 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty stuList}">
													<c:forEach var="stuList" items="${stuList}">
														<tr role="row">
															<td class="sorting_1"><%=count++ %></td>
															<td><c:out value="${stuList.subCode}"/></td>
															<td><c:out value="${stuList.subTitle}"/></td>
															<td><c:out value="${stuList.subDivs}"/></td>
															<td><c:out value="${stuList.subCredit}"/></td>
															<td><c:out value="${stuList.subClass}"/></td>
															<td><c:out value="${stuList.subTime}"/></td>
															<td><c:out value="${stuList.subType}"/></td>
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