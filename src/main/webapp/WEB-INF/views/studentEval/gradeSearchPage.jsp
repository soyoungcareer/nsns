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
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="#" style="color: #222d32;"><i class="fa fa-sign-out fa-4x" aria-hidden="true"></i><div>나가기</div></a></li>
			</ul>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>성적조회
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
											<th>수강신청</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td><a
												href="lectRegisterEdit.reg">FA831</a></td>
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
										<tr>
										<!-- 테스트 연결 서버 -->
											<td> 테스트 연결 서버 </td>
											<!-- 우선 LectRegisterController로 연결 -->
											<td><a
												href="lectRegisterEdit.reg">성적조회 페이지</a></td>
											<td><a
												href="lectRegisterEdit.reg">강의평가 페이지</a></td>
											<td><a
												href="lectRegisterEdit.reg">이의신청 페이지</a></td>
											<td><a
												href="lectRegisterEdit.reg">학점조회 페이지</a></td>
												<!--CertificateController로 연결 -->
											<td><a
												href="graduation.cer">졸업증명서 페이지</a></td>
											<td><a
												href="certificate.cer">자격증/봉사활동</a></td>
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
		</div>
	</main>
</body>
</html>