<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 학적변동 승인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
		$(document).on("click", "#offTable>tbody>tr", function(){
			var tr = $(this);
			var td = tr.children();
			var applicationNo = td.eq(0).text();
			
			console.log(applicationNo);
			
			$.ajax({
				url:"detailOff.pr",
				type:"POST",
				data:{
					applicationNo:applicationNo
				},
				dataType:"json",
				success:function(detailOff){
					$("#myModal").modal();
					
					var result = '<div class="form-group row"><label class="col-form-label" for="stuId">학번</label>'
            			+ '<input class="form-control" id="stuId" type="text" value="' + detailOff.stuId + '" readonly></div>'
          				+ '<div class="form-group row"><label class="col-form-label" for="stuName">학생이름</label>'
            			+ '<input class="form-control" id="stuName" type="text" value="' + detailOff.student.stuName + '" readonly></div>'
          				+ '<div class="form-group row"><label class="col-form-label" for="stuStatus">학적상태</label>'
            			+ '<input class="form-control" id="stuStatus" type="text" value="' + detailOff.student.stuStatus + '" readonly></div>'
            			+ '<div class="form-group row"><label class="col-form-label" for="offDate">휴학신청일자</label>'
            			+ '<input class="form-control" id="offDate" type="text" value="' + moment(detailOff.offDate).format("YYYY년MM월DD일") + '" readonly></div>'
          				+ '<div class="form-group row"><label class="col-form-label" for="offCate">휴학구분</label>'
            			+ '<input class="form-control" id="offCate" type="text" value="' + detailOff.offCategory + '" readonly></div>'
            			+ '<div class="form-group row"><label class="col-form-label" for="offSemCnt">휴학학기수</label>'
            			+ '<input class="form-control" id="offSemCnt" type="text" value="' + detailOff.offSemCnt + '" readonly></div>'
            			+ '<div class="form-group row"><label class="col-form-label" for="offSem">휴학학기</label>'
            			+ '<input class="form-control" id="offSem" type="text" value="' + detailOff.offSem + '" readonly></div>'
            			+ '<div class="form-group row"><label class="col-form-label" for="offReason">휴학사유</label>'
            			+ '<input class="form-control" id="offReason" type="text" value="' + detailOff.offReason + '" readonly></div>'
            			+ '<div class="form-group row"><input class="form-control" id="applicationNo" type="hidden" value="' + applicationNo + '" readonly></div>'
          				+ '<div class="form-group row"><label class="control-label">승인/반려</label>'
          				+ '<div class="w-100"></div>'
              			+ '<div class="form-check"><label class="form-check-label">'
                  		+ '<input class="form-check-input" type="radio" name="answer" id="approve" value="승인" checked>승인</label></div>'
              			+ '<div class="form-check"><label class="form-check-label">'
                  		+ '<input class="form-check-input" type="radio" name="answer" id="reject" value="반려">반려</label></div></div>';
					$("#modalBody").html(result);
				},
				error:function() {
					alert("ajax 로딩 실패");
				}
			});
		});
	</script>
	<script>
		/* 승인/반려 체크 후 저장 */
		$(document).on("click", "#saveOffCheck", function(){
			var status = $('input[name="answer"]:checked').val();
			var reason = $("#reason").val();
			var applicationNo = $("#applicationNo").val();
			
			console.log(applicationNo);
			
			$.ajax({
				url: "profOffCheck.pr",
				type: "POST",
				data:{
					status:status,
					reason:reason,
					applicationNo:applicationNo
				},
				dataType:"json",
				success:function(checkOff) {
					alert("저장 성공");
				},
				error:function() {
					alert("ajax 로딩 실패");
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
				<li class="breadcrumb-item"><a href="profStudentOff.pr">학적변동 승인</a></li>
			</ul>
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
								<h3 class="tile-title">휴학신청 목록</h3>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="offTable" role="grid"
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
													style="width: 57.475px;">학생이름</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">신청일자</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">학적상태</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">휴학구분</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">휴학학기수</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">휴학학기</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">휴학사유</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">승인상태</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty offList}">
													<tr><td colspan="9">휴학신청 내역이 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty offList}">
													<c:forEach var="offList" items="${offList}">
														<tr role="row">
															<td class="sorting_1">${offList.applicationNo}</td>
															<td><c:out value="${offList.student.stuName}"/></td>
															<td><fmt:formatDate pattern="yyyy년MM월dd일 " value="${offList.offDate}"/></td>
															<td><c:out value="${offList.student.stuStatus}"/></td>
															<td><c:out value="${offList.offCategory}"/></td>
															<td><c:out value="${offList.offSemCnt}"/></td>
															<td><c:out value="${offList.offSem}"/></td>
															<td><c:out value="${offList.offReason}"/></td>
															<td><c:out value="${offList.studentStatus.stsProcess}"/></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							
							
							<!-- The Modal -->
							  <div class="modal fade" id="myModal">
							    <div class="modal-dialog">
							      <div class="modal-content">
							        <!-- Modal Header -->
							        <div class="modal-header">
							          <h4 class="modal-title">휴학신청 상세조회</h4>
							          <button type="button" class="close" data-dismiss="modal">×</button>
							        </div>
							        
							        <!-- Modal body -->
							        <div class="modal-body" id="modalBody">
							        	
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button class="btn btn-primary" type="submit" id="saveOffCheck">저장</button>
							          <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
							        </div>
							      </div>
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
							
							
<!-- 							<div class="row">
								<label class="control-label col-md-3">
					              <input type="checkbox"><span class="label-text">승인</span>
					            </label>
					            <label class="control-label col-md-3">
					              <input type="checkbox"><span class="label-text">반려</span>
					            </label>
								<div class="form-group row">
				                  <label class="control-label col-md-3">반려사유</label>
				                  <div class="col-md-8">
				                    <input class="form-control" type="text" placeholder="반려사유 입력">
				                  </div>
				                </div>
				                <div class="form-group col-md-4 align-self-end">
				                  <input type="button" class="btn btn-primary" type="button" onclick="" value="저장"/>
				                </div>
			                </div> -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
</body>
</html>