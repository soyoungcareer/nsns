<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙성대학교(교수) - 상담관리 상세</title>
</head>
<!-- ----------------------------
	AJAX로 처리함. 페이지 삭제할 것!! 
	------------------------------->
<body> 
	<jsp:include page="menubarProf.jsp"/>
 
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 학생 관리
				</h1>
			</div>
			<!-- <ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">학생 관리</li>
				<li class="breadcrumb-item"><a href="profConsult.pr">상담 관리</a></li>
				<li class="breadcrumb-item"><a href="profConsultDetail.pr">상담관리 상세</a></li>
			</ul> -->
		</div>

		<div class="container-fluid">
			<div class="tile">
				<h3 class="tile-title">상담 관리</h3>
				<div class="tile-body">
					<form>
						<div class="row">
							<div class="form-group col-md-3">
			                  <label class="control-label">상담구분</label>
			                  <input class="form-control" type="text" value="" readonly>
			                </div>
		                </div>
		                <div class="row">
							<div class="form-group col-md-3">
			                  <label class="control-label">상담일자</label>
			                  <input class="form-control" type="text" value="" readonly>
			                </div>
		                </div>
		                <div class="row">
							<div class="form-group col-md-3">
			                  <label class="control-label">학생이름</label>
			                  <input class="form-control" type="text" value="" readonly>
			                </div>
		                </div>
		                <div class="row">
							<div class="form-group col-md-3">
			                  <label class="control-label">제목</label>
			                  <input class="form-control" type="text" value="" readonly>
			                </div>
		                </div>
		                
						<div class="row">
							<div class="form-group col-md-3">
	                    		<label for="detailTxtArea">내용</label>
	                    		<textarea class="form-control" type="text" value="" readonly></textarea>
	                  		</div>
	                  	</div>
                  		
						<div class="row">
							<label class="control-label col-md-3"> 
								<input type="checkbox"><span class="label-text">승인</span>
							</label> 
							<div class="form-group row">
								<label class="control-label col-md-3">전달사항</label>
								<div class="col-md-8">
									<input class="form-control" type="text" placeholder="전달사항 입력">
								</div>
							</div>
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
						</div>
					</form>
				</div>
			</div>
		</div>

	</main>
</body>
</html>