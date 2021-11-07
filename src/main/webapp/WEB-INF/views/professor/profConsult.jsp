<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 상담관리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
	/* 상담신청 상세내역 조회 */
	$(document).on("click", "#conTable>tbody>tr", function(){
		var tr = $(this);
		var td = tr.children();
		var conNo = td.eq(0).text();
		var conProcess = td.eq(4).text();
		var button = $('#saveConCheck');
		
		console.log(conNo);
		console.log(conProcess);
		
		$.ajax({
			url: "profConsultDetail.pr",
			type: "POST",
			data: {
				conNo:conNo
			},
			dataType:"json",
			success:function(detailCon){
				$("#myModal").modal();
				
				
				var result ='<div class="mt-2 ml-4 mr-4"><div class="form-group form-inline row"><label class="col-form-label mr-4" for="conDate">희망일자</label>'
                			+ '<input class="form-control" id="conDate" type="text" value="' + moment(detailCon.conDate).format("YYYY년MM월DD일") + '" readonly></div>'
              				+ '<div class="form-group form-inline row"><label class="col-form-label mr-4" for="conCategory">상담구분</label>'
                			+ '<input class="form-control" id="conCategory" type="text" value="' + detailCon.conCategory + '" readonly></div>'
              				+ '<div class="form-group form-inline row"><label class="col-form-label mr-4" for="stuName">학생이름</label>'
                			+ '<input class="form-control" id="stuName" type="text" value="' + detailCon.student.stuName + '" readonly></div>'
              				+ '<div class="form-group form-inline row"><label class="col-form-label mr-4" for="stuId">학번&emsp;&emsp;</label>'
                			+ '<input class="form-control" id="stuId" type="text" value="' + detailCon.stuId + '" readonly></div>'
              				+ '<div class="form-group form-inline row"><label class="col-form-label mr-4" for="conReason">내용&emsp;&emsp;</label>'
                			+ '<input class="form-control" id="conReason" type="text" value="' + detailCon.conReason + '" readonly></div>'
                			+ '<div class="form-group row"><input class="form-control" id="conNo" type="hidden" value="' + detailCon.conNo + '" readonly></div><hr><br>';
              				
                			if (conProcess =="교수승인대기중"){
                				button.prop("hidden", false);
	                			result += '<div class="form-group form-inline row"><label class="control-label mr-4">승인/반려</label>'
		                  			+ '<div class="form-check"><label class="form-check-label mr-4" for="approve">'
		                      		+ '<input class="form-check-input" type="radio" name="answer" id="approve" value="승인완료" checked>승인</label></div>'
		                  			+ '<div class="form-check"><label class="form-check-label" for="reject">'
		                      		+ '<input class="form-check-input" type="radio" name="answer" id="reject" value="반려">반려</label></div></div>'
		              				+ '<div class="form-group row"><label class="col-form-label" for="rejectReason">반려사유</label>'
		                			+ '<input class="form-control" id="rejectReason" type="text" placeholder="반려사유 입력"></div></div>';
	                				
                			} else {
                				button.prop("hidden", true);
                				result += '<div class="form-group row"><label class="col-form-label" for="status">처리상태&emsp;&emsp;&emsp;</label>'
                					+ '<input class="form-control" id="status" type="text" value="' + conProcess + '" readonly></div>';
                				if (conProcess == "승인완료") {
                					result += "";
                				} else {
	              					result += '<div class="form-group row"><label class="col-form-label" for="reason">반려사유</label>';
	              					if (detailCon.rejectReason == undefined) {
	              						result += '<input class="form-control" id="reason" name="reason" type="text" value="미입력" readonly></div></div>';
	              					} else {
	              						result += '<input class="form-control" id="reason" name="reason" type="text" value="' + detailCon.rejectReason + '" readonly></div></div>';
	              					}
              					}
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
		/* 상담신청 승인/반려 체크 후 저장 */
		$(document).on("click", "#saveConCheck", function(){
			var status = $('input[name="answer"]:checked').val();
			var rejectReason = $("#rejectReason").val();
			var conNo = $("#conNo").val();
			
			console.log("status : " + status);
			console.log("rejectReason : " + rejectReason);
			console.log("conNo : " + conNo)
			
			$.ajax({
				url: "profConCheck.pr",
				type: "POST",
				data:{
					status:status,
					rejectReason:rejectReason,
					conNo:conNo
				},
				dataType:"json",
				success:function(checkCon) {
					
					if (checkCon > 0) {
						swal({
				      		title: "저장 성공",
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
		<!-- <ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">학생 관리</li>
			<li class="breadcrumb-item"><a href="profConsult.pr">상담 관리</a></li>
		</ul> -->
	</div>
	
	<div class="container-fluid">
		<div class="tile">
			<h3 class="tile-title">상담 관리</h3><br>
			<div class="tile-body">
				<div class="tile">
            <!-- <div class="mailbox-controls">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox"><span class="label-text"></span>
                </label>
              </div>
              <div class="btn-group">
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-trash-o"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-reply"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-share"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-refresh"></i></button>
              </div>
            </div> -->
            <div class="table-responsive mailbox-messages">
              <table class="table table-hover" id="conTable">
              	<thead class="tableInfo">
              		<tr>
	              		<th>상담번호</th>
	              		<th>구분</th>
	              		<th>학생이름</th>
	              		<th>희망일자</th>
	              		<th>승인상태</th>
              		</tr>
              	</thead>
                <tbody>
                	<c:choose>
						<c:when test="${empty conList}">
							<tr><td colspan="5">상담신청 내역이 없습니다.</td></tr>
						</c:when>
						<c:when test="${!empty conList}">
							<c:forEach var="conList" items="${conList}">
								<tr>
				                    <td>${ conList.conNo }</td>
				                    <td>${ conList.conCategory }</td>
				                    <td class="mail-subject"><b>${ conList.student.stuName }</b></td>
				                    <td><fmt:formatDate pattern="yyyy년MM월dd일" value="${ conList.conDate }"/></td>
				                    <td>${ conList.consultStatus.conProcess }</td>
			                	</tr>
							</c:forEach>
						</c:when>
					</c:choose>
                </tbody>
              </table>
            </div>
            
            
          <!-- The Modal -->
		  <div class="modal fade" id="myModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">상담신청 상세조회</h4>
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body" id="modalBody">
		        	
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button class="btn btn-primary" type="submit" id="saveConCheck">저장</button>
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
                			<li class="page-item"><a class="page-link" href="profConsult.pr?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="profConsult.pr?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="profConsult.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="profConsult.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
          </div>
			
			</div>
		</div>
    </div>
    </main>
</body>
</html>