<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
   
  </head>
  <body class="app sidebar-mini">
   <!-- 일반 학생 로그인시 보이는 메뉴바 -->
	<%--<jsp:include page="cSMenubar.jsp"/> --%> 
	
	<!-- 관리자 로그인시 보이는 메뉴바 -->
	<jsp:include page="cAMenubar.jsp"/>  
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-pencil-square-o"></i> 학사일정 관리</h1>
        </div>
         <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#" style="color: #222d32;"><i class="fa fa-sign-out fa-4x" aria-hidden="true"></i><div>나가기</div></a></li>
        </ul>
      </div>
      
      <div class="row">
        <div class="col-md-5">
          <div class="tile">
            <div class="tile-title-w-btn">
              <h5 class="title" style="margin-left:50px"> 학사일정 등록 </h5>
            </div>
            
            <div class="tile-body">
            <p>This plugin can be used to let the user Drag and Drop files for upload in a easy way.</p>
              <form class="form-horizontal">
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">일정명</label>
                  <div class="col-md-5">
                    <input class="form-control" type="text" id="title" name="title">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">시작일자</label>
                  <div class="col-md-5">
                    <input class="form-control" id="start" name="start" type="text">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">마지막일자</label>
                  <div class="col-md-5">
                    <input class="form-control" id="end" name="end" type="text">
                  </div>
                </div>
              
                 <div class="form-group row">
                   <label class="control-label col-md-5" style="margin-left:50px;">배경색</label>
                   <div class="col-md-5"> 
                    <select class="form-control" id="backgroundColor" name ="backgroundColor">
						<option value="#9775fa" style="color:#9775fa;">보라색</option>
						<option value="#ffa94d" style="color:#ffa94d;">주황색</option>
						<option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                    </select>
                  </div>
                  </div>
                  
            </form>
            </div>
            
            <div class="tile-footer">
              <div class="row">
              
              <div class="col-md-4 col-md-offset-3" style="margin-left:400px">
                  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
              </div>
              </div>
            </div>
        
           
            </div>
          </div>
        </div>
        
        <div class="row">
        <div class="col-md-5">
          <div class="tile">
            <div class="tile-title-w-btn">
              <h5 class="title" style="margin-left:50px"> 학사일정 등록 </h5>
            </div>
            
            <div class="tile-body">
            <p>This plugin can be used to let the user Drag and Drop files for upload in a easy way.</p>
              <form class="form-horizontal">
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">일정명</label>
                  <div class="col-md-5">
                    <input class="form-control" type="text" id="title" name="title">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">시작일자</label>
                  <div class="col-md-5">
                    <input class="form-control" id="start" name="start" type="text">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">마지막일자</label>
                  <div class="col-md-5">
                    <input class="form-control" id="end" name="end" type="text">
                  </div>
                </div>
              
                 <div class="form-group row">
                   <label class="control-label col-md-5" style="margin-left:50px;">배경색</label>
                   <div class="col-md-5"> 
                    <select class="form-control" id="backgroundColor" name ="backgroundColor">
						<option value="#9775fa" style="color:#9775fa;">보라색</option>
						<option value="#ffa94d" style="color:#ffa94d;">주황색</option>
						<option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                    </select>
                  </div>
                  </div>
                  
            </form>
            </div>
            
            <div class="tile-footer">
              <div class="row">
              
              <div class="col-md-4 col-md-offset-3" style="margin-left:400px">
                  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
              </div>
              </div>
            </div>
        
           
            </div>
          </div>
        </div>
        

    </main>
    
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/select2.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/dropzone.js"></script>
    <script type="text/javascript">
    
      
      $('#start').datepicker({
      	format: "yyyy-mm-dd",
      	autoclose: true,
      	todayHighlight: true
      });
      
      $('#end').datepicker({
        	format: "yyyy-mm-dd",
        	autoclose: true,
        	todayHighlight: true
        });
        
      
    
    </script>

  </body>
</html>