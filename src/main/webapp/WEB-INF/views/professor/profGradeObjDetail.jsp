<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.spring.major.vo.Subject"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- ---------------------------------
	AJAX로 처리하였음. 페이지 삭제할 것
---------------------------------- -->

	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 이의신청 상세</title>
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script> 
		/* 이의신청 승인/반려 체크 후 저장 */
		$(document).on("click", "#saveObjCheck", function(){
			var status = $('input[name="answer"]:checked').val();
			var reason = $("#reason").val();
			
			$.ajax({
				url: "profObjCheck.pr",
				type: "POST",
				data:{
					status:status,
					reason:reason
				},
				dataType:"json",
				success:function(checkObj) {
					alert("저장 성공");
				},
				error:function() {
					alert("ajax 로딩 실패");
				}
			});
		});
	</script>
<body>
	<jsp:include page="menubarProf.jsp"/>
 
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 성적 관리
				</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">성적 관리</li>
				<li class="breadcrumb-item"><a href="profGradeObj.pr">이의신청 확인</a></li>
				<li class="breadcrumb-item"><a href="profGradeObjDetail.pr">이의신청 상세</a></li>
			</ul>
		</div>

		<div class="container-fluid">
			<div class="tile">
				<h3 class="tile-title">이의신청 확인</h3>
				<div class="tile-body">
					<form>
						<div class="row">
							<div class="form-group col-md-3">
			                  <label class="control-label">이의신청일자</label>
			                  <input class="form-control" type="text" value="<fmt:formatDate pattern="yyyy년MM월dd일 HH:mm" value="${ objList.objDate }"/>" readonly>
			                </div>
		                </div>
		                <div class="row">
							<div class="form-group col-md-3">
			                  <label class="control-label">학생이름</label>
			                  <input class="form-control" type="text" value="${ objList.stuName }" readonly>
			                </div>
		                </div>
		                <div class="row">
							<div class="form-group col-md-3">
			                  <label class="control-label">제목</label>
			                  <input class="form-control" type="text" value="${ objList.title }" readonly>
			                </div>
		                </div>
		                
						<div class="row">
							<div class="form-group col-md-3">
	                    		<label for="detailTxtArea">내용</label>
	                    		<input class="form-control" type="text" value="${ objList.content }" readonly>
	                  		</div>
	                  	</div>
                  		
						<div class="row">
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
								<input type="button" class="btn btn-primary" type="button" id="saveObjCheck" value="저장"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</main>
</body>
</html>