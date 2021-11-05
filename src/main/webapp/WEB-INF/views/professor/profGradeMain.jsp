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
		/* 과목 선택시 성적 목록 출력 */
		$(document).on("click", "#subTable>tbody>tr", function(){
			var tr = $(this);
			var td = tr.children();
			var subCode = td.eq(2).text();
			var gradeYear = td.eq(0).text();
			var gradeSemester = td.eq(1).text();
			var subTitle = td.eq(5).text();
			
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
					var title = '<h3 class="tile-title">'
							  + gradeYear + '학년도 '
							  + gradeSemester + '학기 '
							  + subTitle + '</h3>';
					$('#divTitle').html(title);
					
					
					var result = "<tr role='row'>";
					$.each(gList, function(index, item) {
						result += "<td>" + item.deptTitle + "</td>"
							   + "<td><input type='hidden' name='studentId' value='" + item.studentId + "'>" + item.studentId + "</td>"
							   + "<td>" + item.studentName + "</td>"
							   + "<td>" + item.studentStatus + "</td>"
							   + "<td><input name='attendance' type='number' min='0' max='25' step='5' value='" + item.attendance + "'></td>"
							   + "<td><input name='assignment' type='number' min='0' max='25' step='5' value='" + item.assignment + "'></td>"
							   + "<td><input name='midExam' type='number' min='0' max='25' step='5' value='" + item.midExam + "'></td>"
							   + "<td><input name='finExam' type='number' min='0' max='25' step='5' value='" + item.finExam + "'></td>";
							   
							   if (item.gradeResult == undefined) {
							   result += "<td>0</td>";
							   } else {
							   result += "<td>" + item.gradeResult + "</td>";
							   }
							   
							   if (item.gradeResult==100) {
								   result += "<td>A+</td>";
							   } else if (item.gradeResult>=98 && item.gradeResult<100) {
								   result += "<td>A</td>";	   
							   } else if (item.gradeResult>=95 && item.gradeResult<98) {
								   result += "<td>A-</td>";		
							   } else if (item.gradeResult>=93 && item.gradeResult<95) {
								   result += "<td>B+</td>";   
							   } else if (item.gradeResult>=90 && item.gradeResult<93) {
								   result += "<td>B</td>";  
							   } else if (item.gradeResult>=88 && item.gradeResult<90) {
								   result += "<td>B-</td>"; 
							   } else if (item.gradeResult>=85 && item.gradeResult<88) {
								   result += "<td>C+</td>";
							   } else if (item.gradeResult>=83 && item.gradeResult<85) {
								   result += "<td>C</td>";
							   } else if (item.gradeResult>=80 && item.gradeResult<83) {
								   result += "<td>C-</td>";
							   } else if (item.gradeResult>=78 && item.gradeResult<80) {
								   result += "<td>D+</td>";
							   } else if (item.gradeResult>=75 && item.gradeResult<78) {
								   result += "<td>D</td>";
							   } else if (item.gradeResult>=73 && item.gradeResult<75) {
								   result += "<td>D-</td>";
							   } else if (item.gradeResult == null) {
								   result += "<td>미정</td>";
							   } else {
								   result += "<td>F</td>";
							   }
							   
						result += "<td>" + item.gradeCredit + "</td>"
						       + "<td><input type='hidden' name='subCode' value='" + item.subCode + "'>"
							   + "<input type='hidden' name='gradeYear' value='" + item.gradeYear + "'>"
							   + "<input type='hidden' name='gradeSemester' value='" + item.gradeSemester + "'>"
							   + "<button class='btn btn-primary btn-sm' type='button'>저장</button></td></tr>"
					});
					$('#gradeTable tbody').html(result);
				},
				error:function() {
					alert("로딩 실패");
				}
			});
		});
	
		
		/* 성적 저장 */
 		$(document).on("click", "#gradeTable>tbody>tr>td>button", function(){
			var attendTr = $(this).parent().parent().children().eq(4);
			var attend = attendTr.children().val();
			
			var assignTr = $(this).parent().parent().children().eq(5);
			var assign = assignTr.children().val();
			
			var midTr = $(this).parent().parent().children().eq(6);
			var mid = midTr.children().val();
			
			var finTr = $(this).parent().parent().children().eq(7);
			var fin = finTr.children().val();
			
			var stuIdTr = $(this).parent().parent().children().eq(1);
			var stuId = stuIdTr.children().val();
			
			var subCodeTr = $(this).parent().parent().children().eq(11);
			var subCode = subCodeTr.children().eq(0).val();
			
			var gradeYearTr = $(this).parent().parent().children().eq(11);
			var gradeYear = gradeYearTr.children().eq(1).val();
			
			var gradeSemesterTr = $(this).parent().parent().children().eq(11);
			var gradeSemester = gradeSemesterTr.children().eq(2).val();
			
			
			console.log("attend : " + attend);
			console.log("assign : " + assign);
			console.log("mid : " + mid);
			console.log("fin : " + fin);
			console.log("stuId : " + stuId);
			console.log("subCode : " + subCode);
			console.log("gradeYear : " + gradeYear);
			console.log("gradeSemester : " + gradeSemester); 
			
			$.ajax({
				url: "updateGrade.pr",
				type:"POST",
				async:false,
				data:{
					attend:attend,
					assign:assign,
					mid:mid,
					fin:fin,
					stuId:stuId,
					subCode:subCode,
					gradeYear:gradeYear, 
					gradeSemester:gradeSemester
				},
				dataType:"json",
				success:function(result){
					
					console.log("result : " + result);
					
					if (result > 0) {
						alert("저장 성공");
					} else {
						alert("저장 실패");
					}
					
					//reloadData();
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
			<!-- <ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">성적 관리</li>
				<li class="breadcrumb-item"><a href="profGradeMain.pr">성적 등록/조회/수정</a></li>
			</ul> -->
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
							
							<form action="filteredSubject.pr">
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
									<table class="table table-hover table-bordered dataTable no-footer"
										id="subTable" role="grid">
										<thead>
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1" style="width: 20px;">학년도</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 20px;">학기</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">강의코드</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">학과(전공)</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 20px;">이수구분</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">교과목명</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 20px;">학점</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의형태</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">교수명</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty subList}">
													<tr><td colspan="9">개설된 강의가 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty subList}">
													<c:forEach var="subList" items="${subList}">
														<tr role="row">
															<td>${subList.subYear}</td>
															<td>${subList.subSmst}</td>
															<td>${subList.subCode}</td>
															<td>${subList.deptTitle}</td>
															<td>
																<c:if test="${subList.subDivs eq '1'}"><c:out value="전공"/></c:if>
																<c:if test="${subList.subDivs eq '2'}"><c:out value="교양"/></c:if>
															</td>
															<td>${subList.subTitle}</td>
															<td>${subList.subCredit}</td>
															<td>
																<c:if test="${subList.subType eq '1'}"><c:out value="집체"/></c:if>
																<c:if test="${subList.subType eq '2'}"><c:out value="온라인"/></c:if>
															</td>
															<td>${subList.profName}</td>
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
							</div>
							
							<form>
							<div class="row" id="gradeDiv">
								<div class="col-sm-12">
									<table class="table table-hover table-bordered dataTable no-footer"
										id="gradeTable" role="grid">
										<thead>
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">학과(전공)</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">학번</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">성명</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">학적상태</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">출석</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">과제</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">중간</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">기말</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">점수(100)</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">등급(A+~F)</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">평점(4.5)</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 60.375px;">저장</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
							</form>
							
							<!-- 페이징 처리 -->
							<div id="pagingArea">
				                <ul class="pagination">
				                	<c:choose>
				                		<c:when test="${ pi.currentPage ne 1 }">
				                			<li class="page-item"><a class="page-link" href="filteredGrade.pr?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="filteredGrade.pr?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="filteredGrade.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="filteredGrade.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
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