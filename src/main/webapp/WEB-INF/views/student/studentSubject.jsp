<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>User Profile - Vali Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini">
	<jsp:include page="studentMenubar.jsp"/>
	
    <main class="app-content">
    	<div class="app-title">
        	<div>
          		<h1><i class="fa fa-book" aria-hidden="true"></i> 수강과목</h1>
        	</div>
      	</div>
		
				<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
					<div class="col-sm-12 col-md-6">
	                	<div style="margin-top:50px">
	                   		<label>
	                   			<select name="sampleTable_length" aria-controls="sampleTable" class="form-control form-control-sm" style="width: 100px">
									<option value="2021">2021년</option>
								</select>
	                   		</label>
	                   		&nbsp; &nbsp; &nbsp;
	                   		<label>
	                    		<select name="sampleTable_length" aria-controls="sampleTable" class="form-control form-control-sm" style="width: 80px">
									<option value="2">1학기</option>
									<option value="3">2학기</option>
								</select>
							</label>
						</div>
					</div>
					
						<div class="col-sm-12 col-md-6">
							<div id="sampleTable_filter" class="dataTables_filter" style="margin-top:50px">
								<label>교과목명 : <input type="search" class="form-control form-control-sm" aria-controls="sampleTable"> </label>
								<button class="btn btn-primary btn-sm" type="button" style="margin-left: 10px;">조 회</button>
							</div>
						</div>

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable">
									<thead>
										<tr>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>이수구분</th>
											<th>강의시간</th>
											<th>교수명</th>
											
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
											
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
											<td>이교수</td>
											
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
											<td>이교수</td>
											
										</tr>
										<tr>
											<td>FD801</td>
											<td>프로그래밍의 응용</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
											<td>이교수</td>
											
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