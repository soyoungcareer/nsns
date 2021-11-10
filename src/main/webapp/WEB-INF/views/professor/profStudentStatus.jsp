<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>낙성대학교</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
		$(document).on("click", "#offTable>tbody>tr", function(){
			var tr = $(this);
			var td = tr.children();
			var applicationNo = td.eq(0).text();
			var stsProcess = td.eq(8).text();
			var approveBtn = $('#saveApprove');
			var rejectBtn = $('#saveReject');
			
			$.ajax({
				url:"detailOff.pr",
				type:"POST",
				data:{
					applicationNo:applicationNo
				},
				dataType:"json",
				success:function(detailOff){
					$("#myModal").modal();
					
					var result = '<div class="mt-2 ml-4 mr-4"><div class="form-group form-inline row"><label class="col-form-label mr-2" for="stuId">학번&emsp;&emsp;&emsp;&emsp;</label>'
            			+ '<input class="form-control" id="stuId" type="text" value="' + detailOff.stuId + '" readonly></div>'
          				+ '<div class="form-group form-inline row"><label class="col-form-label mr-2" for="stuName">학생이름&emsp;&emsp;</label>'
            			+ '<input class="form-control" id="stuName" type="text" value="' + detailOff.student.stuName + '" readonly></div>'
          				+ '<div class="form-group form-inline row"><label class="col-form-label mr-2" for="stuStatus">학적상태&emsp;&emsp;</label>'
            			+ '<input class="form-control" id="stuStatus" type="text" value="' + detailOff.student.stuStatus + '" readonly></div>'
            			+ '<div class="form-group form-inline row"><label class="col-form-label mr-2" for="offDate">휴학신청일자</label>'
            			+ '<input class="form-control" id="offDate" type="text" value="' + moment(detailOff.offDate).format("YYYY년MM월DD일") + '" readonly></div>'
          				+ '<div class="form-group form-inline row"><label class="col-form-label mr-2" for="offCate">휴학구분&emsp;&emsp;</label>'
            			+ '<input class="form-control" id="offCate" type="text" value="' + detailOff.offCategory + '" readonly></div>'
            			+ '<div class="form-group form-inline row"><label class="col-form-label mr-2" for="offSemCnt">휴학학기수&emsp;</label>'
            			+ '<input class="form-control" id="offSemCnt" type="text" value="' + detailOff.offSemCnt + '" readonly></div>'
            			+ '<div class="form-group form-inline row"><label class="col-form-label mr-2" for="offSem">휴학학기&emsp;&emsp;</label>'
            			+ '<input class="form-control" id="offSem" type="text" value="' + detailOff.offSem + '" readonly></div>'
            			+ '<div class="form-group form-inline row"><label class="col-form-label mr-2" for="offReason">휴학사유&emsp;&emsp;</label>'
            			+ '<input class="form-control" id="offReason" type="text" value="' + detailOff.offReason + '" readonly></div>'
            			+ '<div class="form-group row mb-2"><input class="form-control" id="applicationNo" type="hidden" value="' + applicationNo + '" readonly></div>';
          				
            			if (stsProcess == "교수승인대기") {
            				approveBtn.prop("hidden", false);
            				rejectBtn.prop("hidden", false);
            			} else {
            				approveBtn.prop("hidden", true);
            				rejectBtn.prop("hidden", true);
      						result += '<div class="form-group row"><label class="col-form-label" for="status">처리상태&emsp;&emsp;&emsp;</label>'
            					+ '<input class="form-control" id="status" type="text" value="' + stsProcess + '" readonly></div>';
            			}
            			
					$("#modalBody").html(result);
				},
				error:function() {
					alert("ajax 로딩 실패");
				}
			});
		});
	</script>
	<script>
		/* 승인 체크 후 저장 */
		$(document).on("click", "#saveApprove", function(){
			var applicationNo = $("#applicationNo").val();
			var stsProcess = "관리자승인대기";
			var stsComplete = "처리중";
			
			$.ajax({
				url: "profOffCheck.pr",
				type: "POST",
				data:{
					applicationNo:applicationNo,
					stsProcess:stsProcess,
					stsComplete:stsComplete
				},
				dataType:"json",
				success:function(checkOff) {
					if (checkOff > 0) {
						swal({
				      		title: "승인 완료",
				      		type: "success",
				      		showCancelButton: false,
				      		closeOnConfirm: true
				      	});
					} else {
						swal({
				      		title: "저장 실패",
				      		type: "error",
				      		showCancelButton: false,
				      		closeOnConfirm: true
				      	});
					}
					
					setTimeout(function(){
						location.reload();
					}, 3000);
				},
				error:function() {
					alert("ajax 로딩 실패");
				}
			});
		});
		
		
		/* 반려 체크 후 저장 */
		$(document).on("click", "#saveReject", function(){
			var applicationNo = $("#applicationNo").val();
			var stsProcess = "반려";
			var stsComplete = "완료";
			
			$.ajax({
				url: "profOffCheck.pr",
				type: "POST",
				data:{
					applicationNo:applicationNo,
					stsProcess:stsProcess,
					stsComplete:stsComplete
				},
				dataType:"json",
				success:function(checkOff) {
					if (checkOff > 0) {
						swal({
				      		title: "반려하였습니다",
				      		type: "success",
				      		showCancelButton: false,
				      		closeOnConfirm: true
				      	});
					} else {
						swal({
				      		title: "저장 실패",
				      		type: "error",
				      		showCancelButton: false,
				      		closeOnConfirm: true
				      	});
					}
					
					setTimeout(function(){
						location.reload();
					}, 3000);
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
					<i class="fa fa-comments"></i> 학생 관리
				</h1>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row mb-3">
								<h3 class="tile-title">휴학신청 목록</h3>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="offTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead class="tableInfo">
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1" style="width: 20px;">신청번호</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">학생이름</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">신청일자</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">학적상태</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">휴학구분</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">휴학학기수</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">휴학학기</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 80px;">휴학사유</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">승인상태</th>
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
															<td>${offList.applicationNo}</td>
															<td>${offList.student.stuName}</td>
															<td><fmt:formatDate pattern="yyyy년MM월dd일 " value="${offList.offDate}"/></td>
															<td>${offList.student.stuStatus}</td>
															<td>${offList.offCategory}</td>
															<td>${offList.offSemCnt}</td>
															<td>${offList.offSem}</td>
															<td>${offList.offReason}</td>
															<td>${offList.studentStatus.stsProcess}</td>
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
							          <button class="btn btn-primary" type="submit" id="saveApprove">승인</button>
							          <button class="btn btn-danger" type="submit" id="saveReject">반려</button>
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
				                			<li class="page-item"><a class="page-link" href="profStudentOff.pr?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="profStudentOff.pr?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="profStudentOff.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="profStudentOff.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
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