<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙성대학교(교수) - 강의삭제</title>
</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
	
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 강의관리
				</h1>
				<!-- <p>Sample forms</p> -->
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">강의 관리</li>
				<li class="breadcrumb-item"><a href="profEditLec.pr">강의 삭제</a></li>
			</ul>
		</div>
        <!-- ------------------------------------
      		선택된 강의의 값으로 value 넣기 
      	-------------------------------------->
		<div class="container-fluid">
	          <div class="tile">
	            <h3 class="tile-title">강의 삭제</h3>
	            <div class="tile-body">
	              <form>
	              	<div class="row">
		                <div class="form-group col-md-3">
		                  <label class="control-label">학과명</label>
		                  <input class="form-control" type="text" value="" readonly>
		                </div>
						<div class="form-group col-md-3">
						  <label class="control-label">이수구분</label>
						  <input class="form-control" type="text" value="" readonly>
						</div>
						<div class="form-group col-md-3">
						  <label class="control-label">강의형태</label>
						  <input class="form-control" type="text" value="" readonly>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group col-md-3">
		                  <label class="control-label">교과목명</label>
						  <input class="form-control" type="text" value="" readonly>
		                </div>
		                <div class="form-group col-md-3">
		                  <label class="control-label">교수명</label>
		                  <input class="form-control" type="text" value="" readonly>
		                </div>
		                <div class="form-group col-md-3">
		                  <label class="control-label">학점</label>
		                  <input class="form-control" type="text" value="" readonly>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group col-md-3">
		                  <label class="control-label">강의시간</label>
		                  <input class="form-control" type="text" value="" readonly>
		                  <!-- -------------------------------------
		                  	강의요일, 시간 한번에 끌어오기
		                  --------------------------------------- -->
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group col-md-4 align-self-end">
		                  <button class="btn btn-danger" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>삭제 신청</button>
		                </div>
	                </div>
	              </form>
	            </div>
	          </div>
		</div>
	
	</main>

</body>
</html>