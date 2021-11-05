<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 강의평가 조회</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).on("click", "#subTable>tbody>tr", function(){
			var tr = $(this);
			var td = tr.children();
			var subCode = td.eq(2).text();
			var year = td.eq(0).text();
			var semester = td.eq(1).text();
			var subTitle = td.eq(5).text();
			
			console.log(subCode);
			console.log(year);
			console.log(semester);
			
			$.ajax({
				url: "filteredEval.pr",
				type:"POST",
				data:{
					subCode:subCode, 
					year:year, 
					semester:semester
				},
				dataType:"json",
				success:function(evalList){
					var title = '<h3 class="tile-title">'
						  + year + '학년도 '
						  + semester + '학기 '
						  + subTitle + '</h3>';
					$('#divTitle').html(title);
					
					
					var result = "<tr role='row'>"
							   	+ "<td>"; 
							   	if (evalList == null) {
							   		result += "제출된 강의평가가 없습니다</td></tr>";
							   	} else {
							   		result += evalList.dscore + "점</td></tr>"
							   	}
							   	
							   	
					$('#evalTable tbody').html(result);
					
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
			<!-- <ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">학생 관리</li>
				<li class="breadcrumb-item"><a href="profEvaluation.pr">강의평가 조회</a></li>
			</ul> -->
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">

							<div class="row">
								<h3 class="tile-title">강의평가 조회</h3>
							</div>
							
							<form action="evalSubLoad.pr">
							<div class="row">
								<div class="form-group col-md-3">
									  <label class="control-label" for="con1">학년도 
										  <select class="form-control" id="con1" name="con1">
										  	<option value="0">전체</option>
										  	<option value="2021" <c:if test="${ con1 == '2021' }">selected</c:if>>2021</option>
										    <option value="2020" <c:if test="${ con1 == '2020' }">selected</c:if>>2020</option>
										    <option value="2019" <c:if test="${ con1 == '2019' }">selected</c:if>>2019</option>
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
										id="subTable" role="grid">
										<thead>
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">학년도</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">학기</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의코드</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">학과(전공)</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">이수구분</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">교과목명</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">학점</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의형태</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">교수명</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty subList}">
													<tr><td colspan="10">개설된 강의가 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty subList}">
													<c:forEach var="subList" items="${subList}">
														<tr role="row">
															<td class="sorting_1"><c:out value="${subList.subYear}"/></td>
															<td><c:out value="${subList.subSmst}"/></td>
															<td>
																<input type="hidden" name="subCode" id="subCode" value="${subList.subCode}">
																<c:out value="${subList.subCode}"/>
															</td>
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
								<h3 class="tile-title">강의를 클릭하세요</h3>
							</div>


							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="evalTable" role="grid"
										aria-describedby="sampleTable_info" id="evalTable">
										<thead>
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1" style="width: 52.9125px;">강의평가점수 평균 (5점 만점)</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
							
							<!-- 페이징 처리 -->
							<div id="pagingArea">
				                <ul class="pagination">
				                	<c:choose>
				                		<c:when test="${ pi.currentPage ne 1 }">
				                			<li class="page-item"><a class="page-link" href="filteredEval.pr?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="filteredEval.pr?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="profEvaluation.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="filteredEval.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
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