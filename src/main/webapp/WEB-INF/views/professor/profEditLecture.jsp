<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙성대학교(교수) - 강의정보 수정</title>
</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
	
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 강의 관리
				</h1>
				<!-- <p>Sample forms</p> -->
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">강의 관리</li>
				<li class="breadcrumb-item"><a href="lectEditInfoLoad.pr">강의정보 수정</a></li>
			</ul>
		</div>
		
		<div class="container-fluid">
	          <div class="tile">
	            <h3 class="tile-title">강의정보 수정</h3>
	            <div class="tile-body">
	              <form id="createForm" method="get" action="profEditLec.pr" enctype="multipart/form-data">
	              	<div class="row">
		                <div class="form-group col-md-3">
		                  <label class="control-label">학과명</label>
		                  <input class="form-control" type="text" value="${ prof.profDeptTitle }" readonly>
		                  <!-- ------------------------------------
		                  		로그인한 교수 학과명으로 value 넣기 
		                  		-------------------------------------->
		                </div>
						<div class="form-group col-md-3">
							<div class="form-group">
							  <label class="control-label" for="subDivs">이수구분</label>
							  <select class="form-control" id="subDivs" name="subDivs" required>
							  	<c:if test="${ sub.subDivs eq 1 }"><option value="${ sub.subDivs }" selected hidden>전공</option></c:if>
							  	<c:if test="${ sub.subDivs eq 2 }"><option value="${ sub.subDivs }" selected hidden>교양</option></c:if>
							    <option value="1">전공</option>
							    <option value="2">교양</option>
							  </select>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-group">
							  <label class="control-label" for="subType">강의형태</label>
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
		                <div class="form-group col-md-3">
		                  <label class="control-label">교과목명</label>
		                  <input class="form-control" type="text" name="subTitle" value="${ sub.subTitle }" required>
		                </div>
		                <div class="form-group col-md-3">
		                  <label class="control-label">교수명</label>
		                  <input class="form-control" type="text" value="${ prof.profName }" readonly>
		                  <input type="hidden" name="profId" value="${ prof.profId }">
		                  <!-- ------------------------------------
		                  		로그인한 교수명으로 value 넣기 
		                  		-------------------------------------->
		                </div>
		                <div class="form-group col-md-3">
							<div class="form-group">
							  <label class="control-label" for="credit">학점</label>
							  <select class="form-control" id="credit" name="subCredit" required>
							  	<option value="${ sub.subCredit }" selected hidden>${ sub.subCredit }</option>
							    <option>3</option>
							    <option>2</option>
							  </select>
							</div>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group col-md-3">
		                  	<div class="form-group">
							  <label class="control-label" for="subDay">강의요일</label>
							  <select class="form-control" id="subDay" name="subDay" required>
							  	<option value="${ sub.subTime }" selected hidden>${ sub.subTime }</option>
							    <option>월</option>
							    <option>화</option>
							    <option>수</option>
							    <option>목</option>
							    <option>금</option>
							  </select>
							  <label class="control-label" for="subStartTime">강의시작시간</label>
							  <select class="form-control" id="subStartTime" name="subStartTime" required>
							    <option>1</option>
							    <option>2</option>
							    <option>3</option>
							    <option>4</option>
							    <option>5</option>
							    <option>6</option>
							    <option>7</option>
							    <option>8</option>
							  </select>
							  <label class="control-label" for="subEndTime">강의종료시간</label>
							  <select class="form-control" id="subEndTime" name="subEndTime" required>
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
		                <div class="form-group col-md-3">
		                  <label class="control-label">강의계획서</label>
		                  <input class="form-control" type="text" value="">
		                  <!-- -----------------------------
		                  	파일 첨부 후 value에 첨부파일명 들어가도록
		                  ------------------------------- -->
		                  <button class="btn btn-primary" type="button">파일첨부</button>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group col-md-4 align-self-end">
		                  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>수정 신청</button>
		                </div>
	                </div>
	              </form>
	            </div>
	          </div>
		</div>
	
	</main>

</body>
</html>