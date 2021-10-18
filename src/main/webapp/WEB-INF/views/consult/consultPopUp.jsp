<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
   <title>신청내역 상세조회</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
      <div style="padding-left: 20px; padding-right: 20px">
      
        <div class="col-md-6">
          <div class="tile" style="background: none; box-shadow: none;  margin-bottom: 0px; margin-top: 30px; border:1px solid black">
            <h3 class="tile-title">상담신청 상세 조회페이지</h3>
            
            <div class="tile-body">
              
                <div class="form-group row">
                  <label class="control-label col-md-3">상담구분</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" value="진로">
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="control-label col-md-3">희망날짜</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" value="2021/09/30">
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="control-label col-md-3">상담사유</label>
                  <div class="col-md-8">
                    <textarea class="form-control" rows="4">현재상태로 취업이 가능한지 궁금합니다.</textarea>
                  </div>
                </div>
                
             </div>    
                
            <div class="tile-footer">
            <table class="table" id="consultStatus" style="margin-top:10px;">
				<thead>
						<tr>
							<th>신청현황</th>
							<th>기타</th>
						</tr>
					</thead>
					
					<tbody>
						
						
						<tr>
							<td>반려</td>
							<td>교수님 바빠서 시간안된다.</td>
						</tr>
						
						<tr>
							<td>승인</td>
							<td></td>
						</tr>
						
						<tr>
							<td>교수 승인 대기중</td>
							<td><button class="btn btn-danger btn-sm" type="button">신청취소</button></td>
						</tr>
					</tbody>
			</table>
				
               
          </div>
       	</div>
       
       </div>
     </div>
    <!-- Essential javascripts for application to work-->
    <script src="resources/bootstrap/docs/js/jquery-3.3.1.min.js"></script>
    <script src="resources/bootstrap/docs/js/popper.min.js"></script>
    <script src="resources/bootstrap/docs/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap/docs/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/chart.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/select2.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-datepicker.min.js"></script>
</body>
</html>