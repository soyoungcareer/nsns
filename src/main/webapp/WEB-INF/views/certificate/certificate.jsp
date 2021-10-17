<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>자격증</title>
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/>
	<main class="app-content">
		<div class="app-title">
			<div class="div">
				<h1></h1>
				<p></p>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class=""><a href="#" style="color: #222d32;"><i
						class="fa fa-headphones fa-3x" aria-hidden="true"></i>
					<div>강의페이지</div></a></li>
				<li class=""><a href="#" style="color: #222d32;"><i
						class="fa fa-pencil-square-o fa-3x" aria-hidden="true"></i>
					<div>수강신청</div></a></li>
				<li class=""><a href="#" style="color: #222d32;"><i
						class="fa fa-archive fa-3x" aria-hidden="true"></i>
					<div>시설문 대여</div></a></li>
				<li class=""><a href="#" style="color: #222d32;"><i
						class="fa fa-calendar-o fa-3x" aria-hidden="true"></i>
					<div>학사일정</div></a></li>
				<li class=""><a href="#" style="color: #222d32;"><i
						class="fa fa-calculator fa-3x" aria-hidden="true"></i>
					<div>학비관리</div></a></li>
			</ul>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>자격증
			</h2>
		</div>
		<div class="tile mb-4">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
							<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
											<button class="btn btn-secondary btn-sm" type="button"
											style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>추 가</button>
											<button class="btn btn-primary btn-sm" type="button"
											style="margin-left: 10px;"><i class="fa fa-fw fa-lg fa-check-circle"></i>저 장</button>
									</div>
								</div>

								<div class="col-sm-12" style="margin-top: 10px">
									<div class="table-responsive">
										<table class="table table-hover table-bordered"
											id="sampleTable">
											<thead>
												<tr>
													<th>자격증 구분</th>
													<th>자격증명</th>
													<th>시행처</th>
													<th style="width: 25%">취득일자</th>
													<th>비고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="padding: 0px;">
								                      <select class="form-control" id="exampleSelect1" style="border: none;">
									                      <option>자격증</option>
									                      <option>어학시험</option>
								                      </select>
							                    	</td>
													<td>토익</td>
													<td>YBM</td>
													<td  style="padding: 0px;"> <input class="form-control" id="demoDate" type="date" placeholder="Select Date" style="border: none;"></td>
													<td style="padding: 0px;"><button class="btn btn-danger" type="button"
												style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>수정하기</button></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
			<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>봉사활동
			</h2>
		</div>
		<div class="tile mb-4" >
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
							<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
											<button class="btn btn-secondary btn-sm" type="button"
											style="margin-left: 10px;"><i class="fa fa-plus-circle" ></i>추 가</button>
											<button class="btn btn-primary btn-sm" type="button"
											style="margin-left: 10px;"><i class="fa fa-fw fa-lg fa-check-circle"></i>저 장</button>
									</div>
								</div>
								<div class="col-sm-12" style="margin-top: 10px">
									<div class="table-responsive">
										<table class="table table-hover table-bordered"
											id="sampleTable">
											<thead>
												<tr>
													<th>강의코드</th>
													<th>교과목명</th>
													<th>계열</th>
													<th>학점</th>
													<th>이수구분</th>
													<th>강의시간</th>
													<th>교수명</th>
													<th>수강신청</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td><a href="lectRegisterEdit.reg">FA831</a></td>
													<td>응용수학</td>
													<td>기계공학</td>
													<td>3</td>
													<td>전공필수</td>
													<td>월123</td>
													<td>김교수</td>
													<td style="padding: 0px; padding-top: 5px"><button
															class="btn btn-primary" type="button"
															style="margin-left: 10px;">수강신청</button></td>
												</tr>
												<tr>
													<td>FD801</td>
													<td>프로그래밍의 응용</td>
													<td>기계공학</td>
													<td>3</td>
													<td>전공필수</td>
													<td>월123</td>
													<td>이교수</td>
													<td style="padding: 0px; padding-top: 5px"><button
															class="btn btn-primary" type="button"
															style="margin-left: 10px;">수강신청</button></td>
												</tr>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
	</main>
	
</body>
</html>