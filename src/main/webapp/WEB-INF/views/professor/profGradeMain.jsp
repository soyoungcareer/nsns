<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.spring.major.vo.Subject, com.kh.spring.studentEval.vo.Grade"%>
<%
	ArrayList<Subject> subList = (ArrayList<Subject>)request.getAttribute("subList");
	ArrayList<Grade> gradeList = (ArrayList<Grade>)request.getAttribute("gradeList");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙성대학교(교수) - 성적 관리</title>
</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
 
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 성적 관리
				</h1>
				<!-- <p>Sample forms</p> -->
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">성적 관리</li>
				<li class="breadcrumb-item"><a href="profGradeMain.pr">성적 등록/조회/수정</a></li>
			</ul>
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">

							<div class="row">
								<h3 class="tile-title">성적 등록/조회/수정</h3>
							</div>
							<div class="row">
								<div class="form-group col-md-5">
									<!-- <div class="form-group col-md-5">
									  <label class="control-label" for="evalType">평가방법</label>
									  <select class="form-control" id="evalType">
									    <option>상대평가</option>
									    <option>절대평가</option>
									  </select>
									</div> -->
									<div class="form-group col-md-5">
									  <label class="control-label" for="subYear">학년도</label>
									  <select class="form-control" id="subYear">
									    <option>2021</option>
									    <option>2020</option>
									  </select>
									</div>
									<div class="form-group col-md-5">
									  <label class="control-label" for="subSeme">학기</label>
									  <select class="form-control" id="subSeme">
									    <option>1</option>
									    <option>2</option>
									  </select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="sampleTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead>
											<tr role="row">
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 57.475px;">강의코드</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">학과(전공)</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">이수구분</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">교과목명</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학점</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">교수명</th>
											</tr>
										</thead>
										<tbody>
										<% if(subList.isEmpty()) { %>
											<tr>
												<td colspan="5">개설된 강의가 없습니다.</td>
											</tr>
										<% } else { %>
											<% for(Subject a : subList) { %>
												<tr role="row">
													<td class="sorting_1"><%= a.getSubCode() %></td>
													<td><%-- <%= a.getDeptName() %> --%></td>
													<td><%= a.getSubDivs() %></td>
													<td><%= a.getSubTitle() %></td>
													<td><%= a.getSubCredit() %></td>
												</tr>
											<% } %>
										<% } %>
											
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-5">
									<button class="btn btn-primary btn-sm" type="button">저장</button>
								</div>
							</div>


							<div class="row">
								<div class="col-sm-12">
								
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="sampleTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead>
											<tr role="row">
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">학과(전공)</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">학번</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학년</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">성명</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">수강구분</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">학적상태</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">출석</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">과제</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">중간</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">기말</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">점수</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">등급</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">평점</th>
											</tr>
										</thead>
										<tbody>
										<% if(gradeList.isEmpty()) { %>
											<tr>
												<td colspan="4">수강중인 학생이 없습니다.</td>
											</tr>
										<% } else { %>
											<% for(Grade a : gradeList) { %>
												<tr role="row">
													<td class="sorting_1"><%= a.getDeptName() %></td>
													<td><%= a.getStudentId() %></td>
													<td><%= a.getStudentName() %></td>
													<td><%= a.getStudentStatus() %></td>
													<td><%= a.getAttendance() %></td>
													<td><%= a.getAssignment() %></td>
													<td><%= a.getMidExam() %></td>
													<td><%= a.getFinExam() %></td>
													<td><%= a.getTotal() %></td>
													<td><%= a.getGradeResult() %></td>
													<td><%= a.getGradeCredit() %></td>
												</tr>
											<% } %>
										<% } %>
										</tbody>
									</table>
								</div>
							</div>
							
							<!-- -----------------------------------
								페이징 처리하기
							------------------------------------ -->
							
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="sampleTable_info"
										role="status" aria-live="polite">Showing 1 to 10 of 57
										entries</div>
								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="sampleTable_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="sampleTable_previous"><a href="#"
												aria-controls="sampleTable" data-dt-idx="0" tabindex="0"
												class="page-link">Previous</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="sampleTable" data-dt-idx="1" tabindex="0"
												class="page-link">1</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="sampleTable" data-dt-idx="2" tabindex="0"
												class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="sampleTable" data-dt-idx="3" tabindex="0"
												class="page-link">3</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="sampleTable" data-dt-idx="4" tabindex="0"
												class="page-link">4</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="sampleTable" data-dt-idx="5" tabindex="0"
												class="page-link">5</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="sampleTable" data-dt-idx="6" tabindex="0"
												class="page-link">6</a></li>
											<li class="paginate_button page-item next"
												id="sampleTable_next"><a href="#"
												aria-controls="sampleTable" data-dt-idx="7" tabindex="0"
												class="page-link">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
</body>
</html>