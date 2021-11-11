<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>낙성대학교</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		// 비밀번호 확인
		function editValidate() {
			if($("#profInfoForm input[name=profPwd]").val() != $("#profInfoForm input[name=pwdCheck]").val()) {
				$.notify({
					title: "주의 : ",
					message: " 비밀번호가 일치하지 않습니다.",
					icon: 'fa fa-exclamation'
				});
				$("#profInfoForm input[name=profPwd]").focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body> 
	<jsp:include page="menubarProf.jsp"/>
	 
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-lock"></i> 개인정보관리
				</h1>
			</div>
		</div>


		<div class="container-fluid">
			<div class="tile">
				<h3 class="tile-title">개인정보관리</h3>
				<div class="tile-body">
					<form action="profEditMypage.pr" method="post" id="profInfoForm" onsubmit="return editValidate();">
					<div class="row">
						<div class="form-group form-inline col-md-3">
							<label class="control-label mr-4">교수번호&emsp;</label> 
							<input class="form-control" type="text" name="profId" value="${prof.profId}" readonly>
						</div>
						<div class="form-group form-inline col-md-3">
							<label class="control-label mr-4">교수명&emsp;&emsp;&emsp;</label> 
							<input class="form-control" type="text" name="profName" value="${prof.profName}" readonly>
						</div>
					</div>
					<div class="row">
						<div class="form-group form-inline col-md-3">
							<label class="control-label mr-4">생년월일&emsp;</label> 
							<input class="form-control" type="text" name="profName" 
							value="${fn:substring(prof.profRrn,0,2)}년 ${fn:substring(prof.profRrn,2,4)}월 ${fn:substring(prof.profRrn,4,6)}일" readonly>
						</div>
						<div class="form-group form-inline col-md-3">
							<label class="control-label mr-4">담당학과&emsp;&emsp;</label> 
							<input class="form-control" type="text" name="profDeptTitle" value="${prof.profDeptTitle}" readonly>
						</div>
					</div>
					<div class="row">
						<div class="form-group form-inline col-md-3">
							<label class="control-label mr-4" for="profPwd">비밀번호&emsp;</label> 
							<input class="form-control" type="password" id="profPwd" name="profPwd" placeholder="비밀번호 입력" required>
						</div>
						<div class="form-group form-inline col-md-3">
							<label class="control-label mr-4" for="pwdCheck">비밀번호 확인</label> 
							<input class="form-control" type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 재입력" required>
						</div>
						<div id="pwdCheckInfo" class="ml-2"></div>
					</div>
					<div class="row">
						<div class="form-group form-inline col-md-3">
							<label class="control-label mr-4" for="profEmail">이메일&emsp;&emsp;</label> 
							<input class="form-control" type="email" name="profEmail" value="${prof.profEmail}"
								placeholder="example@naksung.ac.kr" required>
						</div>
						<div class="form-group form-inline col-md-3">
							<label class="control-labe mr-4" for="profPhone">전화번호&emsp;&emsp;</label> 
							<input class="form-control" type="tel" name="profPhone" value="${prof.profPhone}"
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" placeholder="ex.010-0000-0000" required>
						</div>
					</div>
					<div class="row">
						<div class="form-group form-inline col-md-12">
							<label class="control-label mr-4" for="profAddress">기존주소&emsp;</label>
							<input class="form-control" type="text" name="profAddress" value="${prof.profAddress}" size="90" readonly>
						</div>
					</div>
					<div class="row">
						<div class="form-inline col-md-6">
							<label class="control-label mr-4" for="postNum">우편번호&emsp;</label>
							<input type="text" name="postNum" class="form-control mr-2 postcodify_postcode5" size="10" readonly>
							<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
							<label class="control-label" style="color:red;">&emsp;※상세주소 입력 전에 먼저 우편번호를 검색하세요.</label>
						</div>
					</div>
					<div class="row">
						<div class="form-inline col-md-12">
							<label class="control-label mr-4" for="address1">도로명주소</label>
							<input type="text" name="address1" class="form-control postcodify_address" size="90" readonly>
						</div>
					</div>
					<div class="row">
						<div class="form-inline col-md-12">
							<label class="control-label mr-4" for="address2">상세주소&emsp;</label>
							<input type="text" name="address2" class="form-control postcodify_extra_info" size="90">
						</div>
					</div>
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						// 주소 검색 API
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					<div class="tile-footer">
						<button class="btn btn-primary" type="submit" id="editBtn">
							<i class="fa fa-fw fa-lg fa-check-circle"></i>정보수정
						</button>
					</div>
					</form>
					
				</div>
			</div>
		</div>
	</main>

</body>
</html>