<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
   <title>이의신청 팝업 페이지</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background: #E5E5E5">
<div style="padding-left: 20px; padding-right: 20px">
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>이의 신청
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div class="col-md-12">
            <div class="tile-body">
              <form class="form-horizontal">
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
                    <textarea class="form-control" rows="4" placeholder=""></textarea>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-8 col-md-offset-3">
                  </div>
                </div>
              </form>
            </div>
            <div class="tile-footer">
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                <a class="btn btn-secondary" href="#" onclick="history.go(-1)"><i class="fa fa-fw fa-lg fa-times-circle"></i>뒤로가기</a>&nbsp;&nbsp;&nbsp;
                  <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>저장하기</button>&nbsp;&nbsp;&nbsp;
                </div>
              </div>
            </div>
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