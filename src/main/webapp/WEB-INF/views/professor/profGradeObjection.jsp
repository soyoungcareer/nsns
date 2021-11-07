<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	int count = 1;
 %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 성적관리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
		/* 이의신청 상세내역 조회 */
		$(document).on("click", "#objTable>tbody>tr", function(){
			var tr = $(this);
			var td = tr.children();
			var objNo = td.eq(0).text();
			var status = td.eq(4).text();
			var button = $('#saveObjCheck');
			
			console.log(objNo);
			console.log(status);
			
			$.ajax({
				url: "profGradeObjDetail.pr",
				type: "POST",
				data: {
					objNo:objNo
				},
				dataType:"json",
				success:function(detailObj){
					$("#myModal").modal();
					
					var result = '<div class="mt-2 ml-4 mr-4"><div class="form-group form-inline row"><label class="col-form-label" for="objDate">이의신청일자&emsp;</label>'
	                			+ '<input class="form-control col-md-6" id="objDate" type="text" value="' + moment(detailObj.objDate).format("YYYY년MM월DD일") + '" readonly></div>'
	              				+ '<div class="form-group form-inline row"><label class="col-form-label" for="stuId">학번&emsp;&emsp;&emsp;&emsp;&emsp;</label>'
	                			+ '<input class="form-control col-md-6" id="stuId" type="text" value="' + detailObj.stuId + '" readonly></div>'
	              				+ '<div class="form-group form-inline row"><label class="col-form-label" for="stuName">학생이름&emsp;&emsp;&emsp;</label>'
	                			+ '<input class="form-control col-md-6" id="stuName" type="text" value="' + detailObj.student.stuName + '" readonly></div>'
	                			+ '<div class="form-group form-inline row"><label class="col-form-label" for="grade">성적&emsp;&emsp;&emsp;&emsp;&emsp;</label>'
	                			+ '<input class="form-control col-md-6" id="grade" type="text" value="' + detailObj.grade.gradeCredit + ' / 4.5" readonly></div>'
	              				+ '<div class="form-group form-inline row"><label class="col-form-label" for="title">제목&emsp;&emsp;&emsp;&emsp;&emsp;</label>'
	                			+ '<input class="form-control col-md-6" id="title" type="text" value="' + detailObj.title + '" readonly></div>'
	              				+ '<div class="form-group form-inline row mb-4"><label class="col-form-label" for="content">내용&emsp;&emsp;&emsp;&emsp;&emsp;</label>'
	                			+ '<input class="form-control col-md-6" id="content" type="text" value="' + detailObj.content + '" readonly></div><hr>'
	                			+ '<div class="form-group row"><input class="form-control" id="objNo" type="hidden" value="' + detailObj.objNo + '" readonly></div>';
	              				
	              				if (status == "처리중") {
	              					button.prop("hidden", false);
		                  			result += '<div class="form-group form-inline row"><label class="control-label">승인/반려&emsp;&emsp;&emsp;</label>'
		                  				+ '<div class="form-check mr-3"><label class="form-check-label" for="approve">'
		                  				+ '<input class="form-check-input" type="radio" name="answer" id="approve" value="승인" checked>승인</label></div>'
			                  			+ '<div class="form-check"><label class="form-check-label" for="reject">'
			                      		+ '<input class="form-check-input" type="radio" name="answer" id="reject" value="반려">반려</label></div></div>'
			              				+ '<div class="form-group row"><label class="col-form-label" for="reason">반려사유</label>'
			                			+ '<input class="form-control" id="reason" name="reason" type="text" placeholder="반려사유 입력"></div></div>';
	              				} else {
	                				button.prop("hidden", true);
              						result += '<div class="form-group row"><label class="col-form-label" for="status">처리상태&emsp;&emsp;&emsp;</label>'
	                					+ '<input class="form-control" id="status" type="text" value="' + status + '" readonly></div>';
	                				if (status == "승인") {
	                					result += "";
	                				} else {
    	              					result += '<div class="form-group row"><label class="col-form-label" for="reason">반려사유</label>';
    	              					if (detailObj.reason == undefined) {
    	              						result += '<input class="form-control" id="reason" name="reason" type="text" value="미입력" readonly></div></div>';
    	              					} else {
    	              						result += '<input class="form-control" id="reason" name="reason" type="text" value="' + detailObj.reason + '" readonly></div></div>';
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
	<script type="text/javascript">
		/* 이의신청 승인/반려 체크 후 저장 */
		$(document).on("click", "#saveObjCheck", function(){
			var status = $('input[name="answer"]:checked').val();
			var reason = $("#reason").val();
			var objNo = $("#objNo").val();
			
			console.log("status : " + status);
			console.log("reason : " + reason);
			console.log("objNo : " + objNo)
			
			$.ajax({
				url: "profObjCheck.pr",
				type: "POST",
				async: false,
				data:{
					status:status,
					reason:reason,
					objNo:objNo
				},
				dataType:"json",
				success:function(checkObj) {
					if (checkObj > 0) {
						swal({
				      		title: "저장 성공",
				      		type: "success",
				      		showCancelButton: false,
				      		closeOnConfirm: true
				      	});
						//readOnly();
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
		
		
		/*
		<script type="text/javascript">
	      $('#demoNotify').click(function(){
	      	$.notify({
	      		title: "Update Complete : ",
	      		message: "Something cool is just updated!",
	      		icon: 'fa fa-check' 
	      	},{
	      		type: "info"
	      	});
	      });
	      $('#demoSwal').click(function(){
	      	swal({
	      		title: "Are you sure?",
	      		text: "You will not be able to recover this imaginary file!",
	      		type: "warning",
	      		showCancelButton: true,
	      		confirmButtonText: "Yes, delete it!",
	      		cancelButtonText: "No, cancel plx!",
	      		closeOnConfirm: false,
	      		closeOnCancel: false
	      	}, function(isConfirm) {
	      		if (isConfirm) {
	      			swal("Deleted!", "Your imaginary file has been deleted.", "success");
	      		} else {
	      			swal("Cancelled", "Your imaginary file is safe :)", "error");
	      		}
	      	});
	      }); 
		*/
		/*
		 function readOnly() {
			var radio = $('#modalBody input[name="answer"]');
			var reason = $('#modalBody input[name="reason"]');
			var button = $('#saveObjCheck');
			
			radio.prop("disabled", true);
			reason.prop("readonly", true);
			button.prop("hidden", true);
		} 
		*/ 
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
			<li class="breadcrumb-item"><a href="profGradeObj.pr">이의신청 확인</a></li>
		</ul> -->
	</div>
	
	<div class="container-fluid">
		<div class="tile">
			<h3 class="tile-title">이의신청 확인</h3><br>
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
              <table class="table table-hover" id="objTable">
              	<thead class="tableInfo">
              		<tr>
	              		<th>이의신청번호</th>
	              		<th>학생이름</th>
	              		<th>제목</th>
	              		<th>신청일자</th>
	              		<th>처리상태</th>
              		</tr>
              	</thead>
                <tbody>
                	<c:choose>
						<c:when test="${empty objList}">
							<tr><td colspan="5">이의신청 내역이 없습니다.</td></tr>
						</c:when>
						<c:when test="${!empty objList}">
							<c:forEach var="objList" items="${objList}">
								<tr>
				                    <td>${ objList.objNo }</td>
				                    <td>${ objList.student.stuName }</td>
				                    <td class="mail-subject"><b>${ objList.title }</b></td>
				                    <td><fmt:formatDate pattern="yyyy년MM월dd일" value="${ objList.objDate }"/></td>
				                    <td>${ objList.status }</td>
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
		          <h4 class="modal-title">이의신청 상세조회</h4>
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body" id="modalBody">
		        	
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button class="btn btn-primary" type="submit" id="saveObjCheck">저장</button>
		          <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  
			            
            
            <!-- <div class="text-right"><span class="text-muted mr-2">Showing 1-15 out of 60</span>
              <div class="btn-group">
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-chevron-left"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-chevron-right"></i></button>
              </div>
            </div> -->
            <!-- 페이징 처리 -->
			<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="profGradeObj.pr?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="profGradeObj.pr?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="profGradeObj.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="profGradeObj.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
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