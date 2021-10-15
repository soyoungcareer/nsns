<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙성대학교(교수) - 마이페이지</title>
</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
	
	<div class="content-body">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 개인정보관리
				</h1>
				<!-- <p>Sample forms</p> -->
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">마이페이지</li>
				<li class="breadcrumb-item"><a href="profMypage.pr">개인정보관리</a></li>
			</ul>
		</div>


		<div class="container-fluid">
			<div class="tile">
				<h3 class="tile-title">개인정보관리</h3>
				<div class="tile-body">
					<form>
						<div class="form-group">
							<label class="control-label">교수번호</label> 
							<input class="form-control" type="text" value="<%-- <%= loginUser.getProfId() %> --%>" readonly>
						</div>
						<div class="form-group">
							<label class="control-label">비밀번호</label> 
							<input class="form-control" type="password" placeholder="비밀번호 입력">
						</div>
						<div class="form-group">
							<label class="control-label">교수명</label> 
							<input class="form-control" type="text" value="<%-- <%= loginUser.getProfName() %> --%>" readonly>
						</div>
						<div class="form-group">
							<label class="control-label">담당학과</label> 
							<input class="form-control" type="text" value="<%-- <%= loginUser.getProfDept() %> --%>" readonly>
						</div>
						<div class="form-group">
							<label class="control-label">이메일</label> 
							<input class="form-control" type="email" value="<%-- <%= loginUser.getProfEmail() %> --%>">
						</div>
						<div class="form-group">
							<label class="control-label">전화번호</label> 
							<input class="form-control" type="tel" value="<%-- <%= loginUser.getProfPhone() %> --%>"
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
						</div>
						<!-- -------------------------------------------------------------------------- -->
						<!-- 주소 API 시도해보기 -->
						<!-- -------------------------------------------------------------------------- -->
						<div class="form-group">
							<label class="control-label">주소</label>
							<textarea class="form-control" rows="4" value="<%-- <%= loginUser.getProfAddress() %> --%>"></textarea>
						</div>
						
						<div class="tile-footer">
							<button class="btn btn-primary" type="button">
								<i class="fa fa-fw fa-lg fa-check-circle"></i>정보수정
							</button>
		<!-- 					&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i
								class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a> -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>