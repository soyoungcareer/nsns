<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Calendar - Vali Admin</title>
   </head>
  <body class="app sidebar-mini">
	
	<!-- 일반 학생 로그인시 보이는 메뉴바 -->
	<%--<jsp:include page="cSMenubar.jsp"/> --%> 
	
	<!-- 관리자 로그인시 보이는 메뉴바 -->
	<jsp:include page="cAMenubar.jsp"/>  
	
	
    <main class="app-content">
    
       <div class="app-title">
        <div>
          <h1><i class="fa fa-calendar"></i> 학사일정</h1>
        </div>
       <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#" style="color: #222d32;"><i class="fa fa-sign-out fa-4x" aria-hidden="true"></i><div>나가기</div></a></li>
        </ul>
      </div>
      
      <div class="row">
       <a href="/stuinfo.st">학생페이지 확인용 링크</a>
         <div class="col-md-12">
          <div class="tile row">
            <div class="col-md-12">
           
              <div id="calendar"></div>
            </div>
            </div>
            </div>
       </div>
    </main>
    
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/moment.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.3/dist/fullcalendar.min.js"></script>
    
    <script type="text/javascript">
    
    $(document).ready(function() {
		fn_get_events();
	});
    
    function fn_set_calendar(events){
		$('#calendar').fullCalendar({
			  locale                    : 'ko',    
    		  timezone                  : "local", 
    		  events 					: events
		});
	}
    
    function fn_get_events(){
		$.ajax({
			url: '/calendar.do', 
			dataType: 'json', 
			success: function(list) {
				console.log(list);
				fn_set_calendar(list);
			}
		}); 
	}

    </script>

  </body>
</html>