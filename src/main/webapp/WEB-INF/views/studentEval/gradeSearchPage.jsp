<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적조회페이지</title>
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/> 
	<main class="app-content">
		<div class="app-title">
			<div class="div">
			</div>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>성적 조회
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length">
								<label>년도 : &nbsp;&nbsp;&nbsp;<select name="condition1"
									aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px" id="condition1">
										<option value="0">전체</option>
										<option value="2021">2021</option>
										<option value="2021">2020</option>
								</select>
								</label> <label style="margin-left: 10px">학기 : &nbsp;&nbsp;&nbsp;<select
									name="condition2" aria-controls="sampleTable"
									class="form-control form-control-sm" id="condition2">
										<option value="0">전체</option>
										<option value="1">1 학기</option>
										<option value="2">2 학기</option>
								</select>
								</label>
								<button class="btn btn-primary btn-sm" type="button"
									style="margin-left: 15px; padding-left: 15px; padding-right: 15px">조 &nbsp;&nbsp;회</button>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
						</div>

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable">
									<thead>
										<tr style="background: #222d32; color: white;">
											<th>년도학기</th>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>등급</th>
											<th>이의신청</th>
											<th>강의평가</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td rowspan="5"><a
												href="lectRegisterEdit.reg">FA831</a></td>
											<td>FA831</td>
											<td>응용수학</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;" id="gradeObjPop"
													data-toggle="modal" data-target="#gradeObjModal">신청하기</button></td>
											<td style="padding: 0px; padding-top: 5px" id="evaluation"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청하기</button></td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-danger" type="button"
													style="margin-left: 10px;" id="gradeObj">확인하기</button></td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청하기</button></td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청하기</button></td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청하기</button></td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청하기</button></td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-secondary" type="button"
													style="margin-left: 10px; width: 84px" disabled>완&nbsp;&nbsp;&nbsp;료</button></td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청하기</button></td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-secondary" type="button"
													style="margin-left: 10px; width: 84px" disabled>완&nbsp;&nbsp;&nbsp;료</button></td>
										</tr>
										<tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="col-sm-12" style="margin-top: 10px;">
							<div class="table-responsive" >
								<table class="table table-bordered" id="sampleTable"  style="text-align: center;">
									<thead>
										<tr>
											<th style="background: #222d32; color: white; width: 16%">취득 학점</th>
											<td >19</td>
											<th style="background: #222d32; color: white; width: 16%">평균 학점</th>
											<td >3.01</td>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<div class="modal fade" id="gradeObjModal">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>이의 신청
					</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="gradeObjNewPop.obj" method="post">
					<!-- Modal Body -->
					<div class="modal-body">
						<div class="form-group row">
							<label class="control-label col-md-2">교과목명</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="text" disabled>
							</div>
							<label class="control-label col-md-2">강의코드</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="text" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">교수명</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="text" disabled>
							</div>
							<label class="control-label col-md-2">등급</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="text" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">이의 제목</label>
							<div class="col-md-10">
								<input class="form-control col-md-12" type="text">
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">상세 내용</label>
							<div class="col-md-10">
								<textarea class="form-control" rows="6" placeholder=""></textarea>
							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">제출하기</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#evaluation").click(function() {
			location.href="evaluation.ev";
		});
		$("#gradeObj").click(function() {
			location.href="gradeObject.obj";
		});
	</script>
</body>
</html>