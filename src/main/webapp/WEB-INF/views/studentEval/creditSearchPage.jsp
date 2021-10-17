<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이수학점조회</title>
</head>
<body>
	<jsp:include page="../lectRegister/lectRegisterMenubar.jsp"/>
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
								style="margin-right: 10px;"></img>이수학점 조회
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
								<label>년도 : &nbsp;&nbsp;&nbsp;<select name="sampleTable_length"
									aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px">
										<option value="all">전체</option>
										<option value="2021">2021</option>
										<option value="2021">2020</option>
								</select>
								</label> <label style="margin-left: 10px">학기 : &nbsp;&nbsp;&nbsp;<select
									name="sampleTable_length" aria-controls="sampleTable"
									class="form-control form-control-sm">
										<option value="all">전체</option>
										<option value="1">1</option>
										<option value="2">2</option>
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
											<th>수강신청</th>
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
											<td>월123</td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
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
											<th style="background: #222d32; color: white; width: 16%">전공 필수</th>
											<td style=" width: 16%">48 / 50</td>
											<th style="background: #222d32; color: white; width: 16%">교양 필수</th>
											<td style=" width: 16%">21 / 20</td>
											<th style="background: #222d32; color: white; width: 16%">그외</th>
											<td style="width: 16%">17</td>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						
						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable" style="text-align: center;">
									<thead>
										<tr>
											<th style="background: #222d32; color: white; width: 16%">취득 학점</th>
											<td style=" width: 16%">92</td>
											<th style="background: #222d32; color: white; width: 16%">평균 학점</th>
											<td style=" width: 16%">3.02</td>
											<th style="background: #222d32; color: white; width: 16%">졸업가능여부</th>
											<td style=" width: 16%">졸업 불가</td>
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
</body>
</html>