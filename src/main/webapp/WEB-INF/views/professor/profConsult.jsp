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
		
		console.log(conNo);
		
		$.ajax({
			url: "profConsultDetail.pr",
			type: "GET",
			data: {
				conNo:conNo
			},
			dataType:"json",
			success:function(detailCon){
				$("#myModal").modal();
				
				
				var result ='<div class="form-group row"><label class="col-form-label" for="conDate">희망일자</label>'
                			+ '<input class="form-control" id="conDate" type="text" value="' + moment(detailCon.conDate).format("YYYY년MM월DD일") + '" readonly></div>'
              				+ '<div class="form-group row"><label class="col-form-label" for="conCategory">상담구분</label>'
                			+ '<input class="form-control" id="conCategory" type="text" value="' + detailCon.conCategory + '" readonly></div>'
              				+ '<div class="form-group row"><label class="col-form-label" for="stuName">학생이름</label>'
                			+ '<input class="form-control" id="stuName" type="text" value="' + detailCon.student.stuName + '" readonly></div>'
              				+ '<div class="form-group row"><label class="col-form-label" for="stuId">학번</label>'
                			+ '<input class="form-control" id="stuId" type="text" value="' + detailCon.stuId + '" readonly></div>'
              				+ '<div class="form-group row"><label class="col-form-label" for="conReason">내용</label>'
                			+ '<input class="form-control" id="conReason" type="text" value="' + detailCon.conReason + '" readonly></div>'
                			+ '<div class="form-group row"><input class="form-control" id="conNo" type="hidden" value="' + detailCon.conNo + '" readonly></div>'
              				+ '<div class="form-group row"><label class="control-label">승인/반려</label>'
              				+ '<div class="w-100"></div>'
                  			+ '<div class="form-check"><label class="form-check-label">'
                      		+ '<input class="form-check-input" type="radio" name="answer" id="approve" value="승인완료" checked>승인</label></div>'
                  			+ '<div class="form-check"><label class="form-check-label">'
                      		+ '<input class="form-check-input" type="radio" name="answer" id="reject" value="반려">반려</label></div></div>'
              				+ '<div class="form-group row"><label class="col-form-label" for="rejectReason">반려사유</label>'
                			+ '<input class="form-control" id="rejectReason" type="text" placeholder="반려사유 입력"></div>'
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
						alert("저장 성공");
					} else {
						alert("저장 실패");
					}
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
			<li class="breadcrumb-item"><a href="profConsult.pr">상담 관리</a></li>
		</ul>
	</div>
	
	<div class="container-fluid">
		<div class="tile">
			<h3 class="tile-title">상담 관리</h3>
			<div class="tile-body">
				<div class="tile">
            <div class="mailbox-controls">
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
            </div>
            <div class="table-responsive mailbox-messages">
              <table class="table table-hover" id="conTable">
              	<thead>
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
				                    <!-- <td>
				                      <div class="animated-checkbox">
				                        <label>
				                          <input type="checkbox"><span class="label-text"> </span>
				                        </label>
				                      </div>
				                    </td> -->
				                    <td>${ conList.conNo }</td>
				                    <td>${ conList.conCategory }</td>
				                    <td class="mail-subject"><b>${ conList.student.stuName }</b></td>
				                    <td><fmt:formatDate pattern="yyyy년MM월dd일" value="${ conList.conDate }"/></td>
				                    <td></td>
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
    </main>
</body>
</html>