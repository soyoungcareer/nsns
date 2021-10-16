<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
</head>
<body>
	<jsp:include page="lectRegisterMenubar.jsp" />
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
								style="margin-right: 10px;"></img>시간표
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
								<label>이수구분 : &nbsp;&nbsp;&nbsp;<select
									name="sampleTable_length" aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px">
										<option value="1">수강신청</option>
										<option value="2">장바구니</option>
								</select>
								</label>
							</div>
						</div>
						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable">
									<thead>
										<tr style="width: 19%; text-align: center;">
											<th style="width: 10%"></th>
											<th style="width: 18%">월</th>
											<th style="width: 18%">화</th>
											<th style="width: 18%">수</th>
											<th style="width: 18%">목</th>
											<th style="width: 18%">금</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th><h3>1</h3><div>9-10</div></th>
											<td></td>
											<td rowspan="2" style="background-color: #ecc369">Practical
												English A2</td>
											<td rowspan="2" style="background-color: #f08676">해부생리학2</td>
											<td rowspan="2" style="background-color: #70a5e9">Practical
												English A4</td>
											<td rowspan="2" style="background-color: #75ca87">다문화가족건강</td>
										</tr>
										<tr>
											<th><h3>2</h3><div>10-11</div></th>
											<td></td>
										</tr>
										<tr>
											<th><h3>3</h3><div>11-12</div></th>
											<td style="background-color: #f08676">해부생리학2</td>
											<td></td>
											<td></td>
											<td></td>
											<td rowspan="2" style="background-color: #d397ed">창조와 몰입</td>
										</tr>
										<tr>
											<th><h3>4</h3><div>12-01</div></th>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th><h3>5</h3><div>01-02</div></th>
											<td></td>
											<td rowspan="2" style="background-color: #a6c96f">삶과 철학</td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th><h3>6</h3><div>02-03</div></th>
											<td></td>
											<td rowspan="2" style="background-color: #7ad1c0">인간행동과심리</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th><h3>7</h3><div>03-04</div></th>
											<td></td>
											<td></td>
											<td rowspan="2" style="background-color: #fbaa69">문학의이해</td>
											<td></td>
										</tr>
										<tr>
											<th><h3>8</h3><div>04-05</div></th>
											<td></td>
											<td></td>
											<td></td>
											<td style="background-color: #9d86e0">의료보건글쓰기</td>
										</tr>
										
									</tbody>
								</table>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>