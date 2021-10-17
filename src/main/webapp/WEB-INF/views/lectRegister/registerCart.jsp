<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
 <jsp:include page="lectRegisterMenubar.jsp"/> 
 <!-- 추가 -->
	<main class="app-content">
		<div class="app-title">
			<div class="div">
				<h1></h1>
				<p></p>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="#" style="color: #222d32;"><i class="fa fa-sign-out fa-4x" aria-hidden="true"></i><div>나가기</div></a></li>
			</ul>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>장바구니
			</h2>
		</div>
		<div class="tile mb-4">
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length">
								<label>이수구분 : &nbsp;&nbsp;&nbsp;<select name="sampleTable_length"
									aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px">
										<option value="10">전공필수</option>
										<option value="20">교양필수</option>
								</select>
								</label> <label style="margin-left: 30px">학과 : &nbsp;&nbsp;&nbsp;<select
									name="sampleTable_length" aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 120px">
										<option value="10">시각디자인</option>
										<option value="20">정보통신</option>
								</select>
								</label>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="sampleTable_filter" class="dataTables_filter">
								<label>강의 명 : <input type="search"
									class="form-control form-control-sm"
									aria-controls="sampleTable">
								</label>
								<button class="btn btn-primary btn-sm" type="button"
									style="margin-left: 10px;">조 회</button>
							</div>
						</div>

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-hover table-bordered" id="sampleTable">
									<thead>
										<tr>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>이수구분</th>
											<th>강의시간</th>
											<th>교수명</th>
											<th>장바구니</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td>FA831</td>
											<td>응용수학</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
											<td>김교수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">수강담기</button></td>
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
													style="margin-left: 10px;">수강담기</button></td>
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
													style="margin-left: 10px;">수강담기</button></td>
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
													style="margin-left: 10px;">수강담기</button></td>
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
													style="margin-left: 10px;">수강담기</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="justify-content: center;">
								<div class="col-lg-6" style="justify-content: center;">
									<div>
										<ul class="pagination" style="justify-content: center;">
											<li class="page-item disabled"><a class="page-link"
												href="#">«</a></li>
											<li class="page-item active"><a class="page-link"
												href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">4</a></li>
											<li class="page-item"><a class="page-link" href="#">5</a></li>
											<li class="page-item"><a class="page-link" href="#">»</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>담긴 시간표
			</h2>
		</div>
		<div class="tile mb-4">
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length">
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="sampleTable_filter" class="dataTables_filter">
							</div>
						</div>

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-hover table-bordered" id="sampleTable">
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
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td>FA831</td>
											<td>응용수학</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
											<td>김교수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">수강신청</button>
											</td>
											<td style="padding: 0px; padding-top: 5px"><button 
													class="btn btn-danger" type="button"
													style="margin-left: 10px;">삭제</button></td>
													
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
											<td style="padding: 0px; padding-top: 5px"><button 
													class="btn btn-danger" type="button"
													style="margin-left: 10px;">삭제</button></td>		
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
											<td style="padding: 0px; padding-top: 5px"><button 
													class="btn btn-danger" type="button"
													style="margin-left: 10px;">삭제</button></td>		
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
											<td style="padding: 0px; padding-top: 5px"><button 
													class="btn btn-danger" type="button"
													style="margin-left: 10px;">삭제</button></td>		
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
											<td style="padding: 0px; padding-top: 5px"><button 
													class="btn btn-danger" type="button"
													style="margin-left: 10px;">삭제</button></td>		
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>