<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>낙성대학교</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		// 입력값 확인
		function createValidate() {
			var start = $("#createForm select[name=subStartTime]").val();
			var end = $("#createForm select[name=subEndTime]").val();
			var flag = null;
			
			if(start > end) {
				$.notify({
					title: "주의 : ",
					message: " 강의종료시간이 강의시작시간보다 빠를 수 없습니다.",
					icon: 'fa fa-exclamation'
				});
				$("#createForm input[name=subEndTime]").focus();
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
				url: "createDuplCheck.pr",
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
							message: " 이미 개설 신청한 과목입니다.<br>&emsp;&emsp;&emsp;&nbsp;관리자 승인을 기다려주세요.",
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
				<li class="breadcrumb-item"><a href="profLectInfoLoad.pr">강의개설 신청</a></li>
			</ul> -->
		</div>
		
		<div class="container-fluid">
	          <div class="tile">
	            <h3 class="tile-title">강의개설 신청</h3>
	            <div class="row ml-1">
	            	<p>※관리자 승인 후 강의가 개설됩니다.</p>
	            </div>
	            <br>
	            <div class="tile-body">
	              <form id="createForm" method="post" action="profCreateLecture.pr" enctype="multipart/form-data" onsubmit="return createValidate();">
	              	<div class="row">
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label">학과명&emsp;&emsp;</label>
		                  <input class="form-control" type="text" value="${ prof.profDeptTitle }" readonly>
		                </div>
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label">교수명&emsp;&emsp;&emsp;&emsp;</label>
		                  <input class="form-control" type="text" value="${ prof.profName }" readonly>
		                  <input type="hidden" name="profId" value="${ prof.profId }">
		                </div>
		                <div class="form-group form-inline col-md-3">
		                  <label class="control-label" for="subTitle">교과목명&emsp;&emsp;&emsp;</label>
		                  <input class="form-control" type="text" id="subTitle" name="subTitle" placeholder="교과목명 입력" name="subTitle" required>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group form-inline col-md-3">
							<div class="form-group">
							  <label class="control-label" for="subDivs">이수구분&emsp;</label>
							  <select class="form-control" id="subDivs" name="subDivs" required>
							  	<option value="" hidden>=== 선택 ===</option>
							    <option value="1">전공</option>
							    <option value="2">교양</option>
							  </select>
							</div>
						</div>
		                <div class="form-group form-inline col-md-3">
							<div class="form-group">
							  <label class="control-label" for="subCredit">학점&emsp;&emsp;&emsp;&emsp;&emsp;</label>
							  <select class="form-control" id="subCredit" name="subCredit" required>
							  	<option value="" hidden>=== 선택 ===</option>
							    <option>3</option>
							    <option>2</option>
							  </select>
							</div>
		                </div>
		                <div class="form-group form-inline col-md-3">
							<div class="form-group">
							  <label class="control-label" for="subType">강의형태&emsp;&emsp;&emsp;</label>
							  <select class="form-control" id="subType" name="subType" required>
							  	<option value="" hidden>=== 선택 ===</option>
							    <option value="1">집체</option>
							    <option value="2">온라인</option>
							  </select>
							</div>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group form-inline col-md-3">
		                  	<div class="form-group">
							  <label class="control-label" for="subDay">강의요일&emsp;</label>
							  <select class="form-control" id="subDay" name="subDay" required>
							  	<option value="" hidden>=== 선택 ===</option>
							    <option>월</option>
							    <option>화</option>
							    <option>수</option>
							    <option>목</option>
							    <option>금</option>
							  </select>
						    </div>
					    </div>
						<div class="form-group form-inline col-md-3">
		                  	<div class="form-group">
							  <label class="control-label" for="subStartTime">강의시작시간&emsp;</label>
							  <select class="form-control" id="subStartTime" name="subStartTime" required>
							  	<option value="" hidden>=== 선택 ===</option>
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
						<div class="form-group form-inline col-md-3">
		                  	<div class="form-group">
							  <label class="control-label" for="subEndTime">강의종료시간&emsp;</label>
							  <select class="form-control" id="subEndTime" name="subEndTime" required>
							  	<option value="" hidden>=== 선택 ===</option>
							    <option>1</option>
							    <option>2</option>
							    <option>3</option>
							    <option>4</option>
							    <option>5</option>
							    <option>6</option>
							    <option>7</option>
							    <option>8</option>
							  </select>
							  <!-- -----------------------------------
							  	강의시작시작 시간 이전 강의종료시간 안뜨게 하기 
							  	--------------------------------------->
							</div>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group col-md-3">
		                  <label class="control-label">강의계획서</label>
		                  <input class="form-control-file" id="createLectFile" type="file" name="createLectFile" aria-describedby="fileHelp">
		                </div>
		            </div>
		            <div class="tile-footer">
		                <div class="form-group col-md-4 align-self-end">
		                  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>개설 신청</button>
		                </div>
	                </div>
	              </form>
	            </div>
	          </div>
		</div>
	
	</main>

</body>
</html>