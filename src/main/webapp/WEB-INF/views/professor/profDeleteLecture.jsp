<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>낙성대학교</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script> 
		// 신청 중복 체크
		function duplCheck() {
			var subCode = $("#subCode").val();
			var flag = null;
			
			console.log(subCode);
			
			$.ajax({
				url: "delDuplCheck.pr",
				type: "post",
				data:{
					subCode:subCode
				},
				dataType:"json",
				async : false,
				success: function(result) {
					if (result > 0) {
						$.notify({
							title: "주의 : ",
							message: " 이미 삭제 신청한 과목입니다.<br>&emsp;&emsp;&emsp;&nbsp;관리자 승인을 기다려주세요.",
							icon: 'fa fa-exclamation'
						});
						flag = false;
					} else {
						/* 수정할 강의코드 넘기기 */
						$(document).on("click", "#delBtn", function(){
							var subCode = $(this).parent().parent().children().eq(1).text();
							location.href="profDeleteLec.pr?subCode="+subCode;
						});
						flag = true;
					}
				},
				error : function() {
					console.log("ajax 통신 실패");
				}
			});
			console.log(flag);
			
			return flag;
		}
	</script>
</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
	
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-briefcase"></i> 강의관리
				</h1>
			</div>
			<!-- <ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">강의 관리</li>
				<li class="breadcrumb-item"><a href="profEditLec.pr">강의 삭제</a></li>
			</ul> -->
		</div>
		<div class="container-fluid">
	          <div class="tile">
	            <h3 class="tile-title">강의 삭제</h3>
	            <div class="row ml-1">
	            	<p>※관리자 승인 후 강의가 삭제됩니다.</p>
	            </div>
	            <br>
	            <div class="tile-body">
	              <form id="delLectForm" action="profDeleteLec.pr" onsubmit="return duplCheck();">
	              	<div class="row">
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label" for="deptTitle">학과명&emsp;&emsp;</label>
		                  <input class="form-control" id="deptTitle" type="text" value="${ prof.profDeptTitle }" readonly>
		                  <input class="form-control" id="deptCode" type="hidden" value="${ sub.deptCode }" readonly>
		                </div>
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label" for="profName">교수명&emsp;&emsp;</label>
		                  <input class="form-control" id="profName" type="text" value="${ prof.profName }" readonly>
		                </div>
	                </div>
	                <div class="row">
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label" for="subTitle">교과목명&emsp;</label>
						  <input class="form-control" type="text" id="subTitle" name="subTitle" value="${ sub.subTitle }" readonly>
						  <input type="hidden" id="subCode" name="subCode" value="${ sub.subCode }">
		                </div>
						<div class="form-group form-inline col-md-3">
						  <label class="control-label" for="subDivs">이수구분&emsp;</label>
						  <c:if test="${ sub.subDivs eq 1 }"><input class="form-control" id="subDivs" type="text" value="전공" readonly></c:if>
						  <c:if test="${ sub.subDivs eq 2 }"><input class="form-control" id="subDivs" type="text" value="교양" readonly></c:if>
						</div>
		            </div>
		            <div class="row">
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label" for="subCredit">학점&emsp;&emsp;&emsp;</label>
		                  <input class="form-control" type="text" id="subCredit" value="${ sub.subCredit }" readonly>
		                </div>
						<div class="form-group form-inline col-md-3">
						  <label class="control-label" for="subType">강의형태&emsp;</label>
						  <c:if test="${ sub.subType eq 1 }"><input class="form-control" id="subType" type="text" value="집체" readonly></c:if>
						  <c:if test="${ sub.subType eq 2 }"><input class="form-control" id="subType" type="text" value="온라인" readonly></c:if>
		                </div>
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label" for="subTime">강의시간&emsp;</label>
		                  <input class="form-control" type="text" id="subTime" value="${ sub.subTime }" readonly>
		                </div>
		            </div>
		            <div class="tile-footer">
		                <div class="form-group col-md-4 align-self-end">
		                  <button class="btn btn-danger" id="delBtn" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>삭제 신청</button>
		                </div>
	                </div>
	              </form>
	            </div>
	          </div>
		</div>
	
	</main>

</body>
</html>