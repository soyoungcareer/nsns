<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 강의정보 수정</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		// 입력값 확인
		function editValidate() {
			var start = $("#editForm select[name=subStartTime]").val();
			var end = $("#editForm select[name=subEndTime]").val();
			var flag = null;
			
			if(start > end) {
				$.notify({
					title: "주의 : ",
					message: " 강의종료시간이 강의시작시간보다 빠를 수 없습니다.",
					icon: 'fa fa-exclamation'
				});
				$("#editForm input[name=subEndTime]").focus();
				flag =  false;
			} else {
				if (duplCheck()) {
					flag = true;
				} else {
					flag = false;
				}
			}
			return flag;
		}
	
 		// 신청 중복 체크
		function duplCheck() {
			var subTitle = $("#subTitle").val();
			var flag = null;
			
			console.log(subTitle);
			
			$.ajax({
				url: "editDuplCheck.pr",
				type: "post",
				data:{
					subTitle:subTitle
				},
				dataType:"json",
				async : false,
				success: function(result) {
					if (result > 0) {
						$.notify({
							title: "주의 : ",
							message: " 이미 수정 신청한 과목입니다.<br>&emsp;&emsp;&emsp;&nbsp;관리자 승인을 기다려주세요.",
							icon: 'fa fa-exclamation'
						});
						flag = false;
					} else {
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
					<i class="fa fa-briefcase"></i> 강의 관리
				</h1>
			</div>
			<!-- <ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">강의 관리</li>
				<li class="breadcrumb-item"><a href="lectEditInfoLoad.pr">강의정보 수정</a></li>
			</ul> -->
		</div>
		
		<div class="container-fluid">
	          <div class="tile">
	            <h3 class="tile-title">강의정보 수정</h3>
	            <div class="row ml-1">
	            	<p>※관리자 승인 후 강의정보가 수정됩니다.</p>
	            </div>
	            <br>
	            <div class="tile-body">
	              <form id="editForm" method="post" action="profEditLec.pr" enctype="multipart/form-data" onsubmit="return editValidate();">
	              	<div class="row">
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label mr-2" for="deptTitle">학과명&emsp;&emsp;&emsp;</label>
		                  <input class="form-control" id="deptTitle" type="text" value="${ prof.profDeptTitle }" readonly>
		                </div>
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label mr-2" for="profName">교수명&emsp;</label>
		                  <input class="form-control" id="profName" type="text" value="${ prof.profName }" readonly>
		                  <input type="hidden" name="profId" value="${ prof.profId }">
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label mr-2" for="subTitle">교과목명&emsp;&emsp;</label>
		                  <input class="form-control" type="text" id="subTitle" name="subTitle" value="${ sub.subTitle }" required>
		                  <input type="hidden" name="subCode" value="${ sub.subCode }">
		                </div>
		            	<div class="form-group form-inline col-md-2">
							<div class="form-group">
							  <label class="control-label mr-2" for="subDivs">이수구분</label>
							  <select class="form-control" id="subDivs" name="subDivs" required>
							  	<c:if test="${ sub.subDivs eq 1 }"><option value="${ sub.subDivs }" selected hidden>전공</option></c:if>
							  	<c:if test="${ sub.subDivs eq 2 }"><option value="${ sub.subDivs }" selected hidden>교양</option></c:if>
							    <option value="1">전공</option>
							    <option value="2">교양</option>
							  </select>
							</div>
						</div>
		                <div class="form-group form-inline col-md-2">
							<div class="form-group">
							  <label class="control-label mr-2" for="credit">학점&emsp;&emsp;&emsp;&emsp;</label>
							  <select class="form-control" id="credit" name="subCredit" required>
							  	<option value="${ sub.subCredit }" selected hidden>${ sub.subCredit }</option>
							    <option>3</option>
							    <option>2</option>
							  </select>
							</div>
		                </div>
		                <div class="form-group form-inline col-md-2">
							<div class="form-group">
							  <label class="control-label mr-2" for="subType">강의형태&emsp;&emsp;</label>
							  <select class="form-control" id="subType" name="subType" required>
							  	<c:if test="${ sub.subType eq 1 }"><option value="${ sub.subType }" selected hidden>집체</option></c:if>
							  	<c:if test="${ sub.subType eq 2 }"><option value="${ sub.subType }" selected hidden>온라인</option></c:if>
							    <option value="1">집체</option>
							    <option value="2">온라인</option>
							  </select>
							</div>
		                </div>
		            </div>
		            <div class="row">
		            	<div class="form-group form-inline col-md-3">
		            		<label class="control-label mr-2" for="subTime">기존강의시간</label>
		                  	<input class="form-control" type="text" id="subTime" name="subTime" value="${ sub.subTime }" readonly>
		            	</div>
		                <div class="form-group form-inline col-md-2">
						  <label class="control-label mr-2" for="subDay">강의요일</label>
						  <select class="form-control" id="subDay" name="subDay" required>
						  	<option value="${fn:substring(sub.subTime,0,1)}" selected hidden>${fn:substring(sub.subTime,0,1)}</option>
						    <option>월</option>
						    <option>화</option>
						    <option>수</option>
						    <option>목</option>
						    <option>금</option>
						  </select>
						</div>
						<div class="form-group form-inline col-md-2">
						  <label class="control-label mr-2" for="subStartTime">강의시작시간</label>
						  <select class="form-control" id="subStartTime" name="subStartTime" required>
						  	<option value="${fn:substring(sub.subTime,1,2)}" selected hidden>${fn:substring(sub.subTime,1,2)}</option>
						    <option>1</option>
						    <option>2</option>
						    <option>3</option>
						    <option>4</option>
						    <option>5</option>
						    <option>6</option>
						    <option>7</option>
						    <option>8</option>
						  </select>
						</div>
						<div class="form-group form-inline col-md-2">
						  <label class="control-label mr-2" for="subEndTime">강의종료시간</label>
						  <select class="form-control" id="subEndTime" name="subEndTime" required>
						  	<option value="${fn:substring(sub.subTime,sub.subTime.length()-1,sub.subTime.length())}" selected hidden>${fn:substring(sub.subTime,sub.subTime.length()-1,sub.subTime.length())}</option>
						    <option>1</option>
						    <option>2</option>
						    <option>3</option>
						    <option>4</option>
						    <option>5</option>
						    <option>6</option>
						    <option>7</option>
						    <option>8</option>
						  </select>
						</div>
		            </div>
	                <div class="row">
		                <div class="form-group col-md-3">
		                  <label class="control-label" for="attach">강의계획서</label>
		                  	<c:if test="${ empty sub.originName }">
							</c:if>
							<c:if test="${ !empty sub.originName }">
								<input type="hidden" id="attach" name="changeName" value="${ sub.changeName }">
	                            <input type="hidden" id="attach" name="originName" value="${ sub.originName }">
								<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${ sub.changeName }" 
									download="${ sub.originName }">
									<button class="btn badge badge-pill badge-warning" type="button">${ sub.originName }</button>
								</a>
							</c:if>
							<input class="form-control-file" id="file" type="file" name="file" aria-describedby="fileHelp">
		                </div>
		            </div>
		            <div class="tile-footer">
		                <div class="form-group col-md-4 align-self-end">
		                  <button id="editBtn" class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>수정 신청</button>
		                </div>
	                </div>
	              </form>
	            </div>
	          </div>
		</div>
	
	</main>

</body>
</html>