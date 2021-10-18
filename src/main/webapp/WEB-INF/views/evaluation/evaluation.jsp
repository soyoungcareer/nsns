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
								style="margin-right: 10px;"></img>강의평가
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row col-sm-12 col-md-12">
					<h1 style="text-align: center; color: #222d32;">강의 평가서</h1>
				</div>
				<div class="row col-sm-12 col-md-12">
					<h2 style="text-align: center;">(  2021  학년도 제  1  학기 ) </h2>
				</div>
				<div class="card mb-3 text-black bg-light">
	                <div class="card-body">
	                  <blockquote class="card-blockquote">
	                    <p>이 강의 평가서는 앞으로 좀 더 나은 강의를 위해 필요한 정보를 얻기 위한 것 입니다. 여러분이 평가한 결과는 다른 목적으로는 쓰이지 않을 것이니 각각의 질문에 대하여 솔직하고 진지하게 답하여 주시기 바랍니다.  
						</p>
	                    <footer>답변은 <b>( 1 ) 매우 그렇지 않다, ( 2 ) 그렇지 않다, ( 3 ) 그저 그렇다, ( 4 ) 그렇다, ( 5 ) 매우 그렇다.</b> 중 하나를 선택하여 주십시오.
	                    </footer>
	                  </blockquote>
	                </div>
               </div>
				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						
						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable">
									<thead>
										<tr style="background: #222d32; color: white;">
											<th>번호</th>
											<th style="width: 70%">질문항목</th>
											<th>1</th>
											<th>2</th>
											<th>3</th>
											<th>4</th>
											<th>5</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td>1</td>
											<td>이 강좌는 관련 지식을 습득하는데 도움이 된다고 생각한다.</td>
											<td><input type="radio" value="1" name="grade1" id="grade11">
												<label for="grade11">1점</label> </td>
											<td><input type="radio" value="2" name="grade1" id="grade12">
												<label for="grade12">2점</label></td>
											<td><input type="radio" value="2" name="grade1" id="grade13">
												<label for="grade13">3점</label></td>
											<td><input type="radio" value="4" name="grade1" id="grade14">
												<label for="grade14">4점</label></td>
											<td><input type="radio" value="5" name="grade1" id="grade15">
												<label for="grade15">5점</label></td>
										</tr>
										<tr>
											<td>2</td>
											<td>이 강좌는 관련 지식을 습득하는데 도움이 된다고 생각한다.</td>
											<td><input type="radio" value="1" name="grade2" id="grade21">
												<label for="grade21">1 점</label> </td>
											<td><input type="radio" value="2" name="grade2" id="grade22">
												<label for="grade22">2 점</label></td>
											<td><input type="radio" value="2" name="grade2" id="grade23">
												<label for="grade23">3 점</label></td>
											<td><input type="radio" value="4" name="grade2" id="grade24">
												<label for="grade24">4 점</label></td>
											<td><input type="radio" value="5" name="grade2" id="grade25">
												<label for="grade25">5 점</label></td>
										</tr>
										<tr>
											<td>3</td>
											<td>이 강좌는 관련 지식을 습득하는데 도움이 된다고 생각한다.</td>
											<td><input type="radio" value="1" name="grade3" id="grade31">
												<label for="grade31">1 점</label> </td>
											<td><input type="radio" value="2" name="grade3" id="grade32">
												<label for="grade32">2 점</label></td>
											<td><input type="radio" value="2" name="grade3" id="grade33">
												<label for="grade33">3 점</label></td>
											<td><input type="radio" value="4" name="grade3" id="grade34">
												<label for="grade34">4 점</label></td>
											<td><input type="radio" value="5" name="grade3" id="grade35">
												<label for="grade35">5 점</label></td>
										</tr>
										<tr>
											<td>4</td>
											<td>이 강좌는 관련 지식을 습득하는데 도움이 된다고 생각한다.</td>
											<td><input type="radio" value="1" name="grade4" id="grade41">
												<label for="grade41">1 점</label> </td>
											<td><input type="radio" value="2" name="grade4" id="grade42">
												<label for="grade42">2 점</label></td>
											<td><input type="radio" value="2" name="grade4" id="grade43">
												<label for="grade43">3 점</label></td>
											<td><input type="radio" value="4" name="grade4" id="grade44">
												<label for="grade44">4 점</label></td>
											<td><input type="radio" value="5" name="grade4" id="grade45">
												<label for="grade45">5 점</label></td>
										</tr>
										<tr>
											<td>5</td>
											<td>이 강좌는 관련 지식을 습득하는데 도움이 된다고 생각한다.</td>
											<td><input type="radio" value="1" name="grade5" id="grade51">
												<label for="grade51">1 점</label> </td>
											<td><input type="radio" value="2" name="grade5" id="grade52">
												<label for="grade52">2 점</label></td>
											<td><input type="radio" value="2" name="grade5" id="grade53">
												<label for="grade53">3 점</label></td>
											<td><input type="radio" value="4" name="grade5" id="grade54">
												<label for="grade54">4 점</label></td>
											<td><input type="radio" value="5" name="grade5" id="grade55">
												<label for="grade55">5 점</label></td>
										</tr>
										<tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div >
		                <div class="col-md-12">
		                <a class="btn btn-secondary" href="#" onclick="history.go(-1)"><i class="fa fa-fw fa-lg fa-times-circle"></i>뒤로가기</a>&nbsp;&nbsp;&nbsp;
		                  <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>저장하기</button>&nbsp;&nbsp;&nbsp;
		                </div>
		            </div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>