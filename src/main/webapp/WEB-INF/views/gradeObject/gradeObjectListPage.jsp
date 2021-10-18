<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/> 
	<main class="app-content">
		<div class="app-title">
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>이의 신청 현황
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-hover table-bordered" id="sampleTable">
									<thead>
										<tr>
											<th>년도 학기</th>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>등급</th>
											<th>이의신청</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td>2021년도 1학기</td>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>정보통신</td>
											<td>3</td>
											<td>D-</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청확인</button></td>
										</tr>
										<tr>
											<td>2020년도 2학기</td>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>정보통신</td>
											<td>3</td>
											<td>D-</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청확인</button></td>
										</tr>
										<tr>
											<td>2020년도 1학기</td>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>정보통신</td>
											<td>3</td>
											<td>D-</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청확인</button></td>
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