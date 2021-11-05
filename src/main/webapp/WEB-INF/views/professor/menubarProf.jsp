<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.spring.member.vo.Professor"%>
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

    <title>낙성대학교 - 교수메뉴</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- style -->
	<!-- <style>
	.app-header__logo {
		font-size: large;
	}	
	</style> -->
  </head>

  <body class="app sidebar-mini">
   
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="${ pageContext.servletContext.contextPath }">낙성대학교</a>
      <!-- Sidebar toggle button-->
      <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
<!--         <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li> -->
       	<li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-bullhorn fa-lg" aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="register.reg"> <i class="fa fa-bullhorn fa-lg" aria-hidden="true"></i>공지사항</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-headphones fa-lg" aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" data-toggle="modal" data-target="#loginModal"> <i class="fa fa-headphones fa-lg" aria-hidden="true"></i>온라인 강의실</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-archive fa-lg"  aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="facMove.me"> <i class="fa fa-archive fa-lg" aria-hidden="true"></i>시설물대여</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-calendar-o fa-lg"  aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="calendar.ca"> <i class="fa fa-calendar-o fa-lg" aria-hidden="true"></i>학사일정</a></li>
          </ul>
        </li>
        
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <!-- <li><a class="dropdown-item" href=""><i class="fa fa-cog fa-lg"></i> Settings</a></li> -->
            <li><a class="dropdown-item" href="profMypage.pr"><i class="fa fa-user fa-lg"></i>개인정보관리</a></li>
            <li><a class="dropdown-item" href="logout.prf"><i class="fa fa-sign-out fa-lg"></i>로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </header>
    
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><!-- <img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image"> -->
        <div>
          <p class="app-sidebar__user-name ml-3"><span>${ loginPrf.profName }교수</span></p>
          <p class="app-sidebar__user-designation ml-3">${ loginPrf.profDeptTitle }과</p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="profMenu.pr"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">메인</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">강의관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="profLectureDetail.pr"><i class="icon fa fa-circle-o"></i> 강의목록 조회</a></li>
            <li><a class="treeview-item" href="profLectInfoLoad.pr"><i class="icon fa fa-circle-o"></i> 강의개설 신청</a></li>
            <li><a class="treeview-item" href="profLectureReq.pr"><i class="icon fa fa-circle-o"></i> 강의개설/수정/삭제 신청내역</a></li>
<!--             <li><a class="treeview-item" href="profLectureDetail.pr" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> 강의목록 조회</a></li> -->
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">성적관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="profGradeMain.pr"><i class="icon fa fa-circle-o"></i> 성적 등록/조회/수정</a></li>
            <li><a class="treeview-item" href="profGradeObj.pr"><i class="icon fa fa-circle-o"></i> 이의신청 확인</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">학생관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="profStudentDetail.pr"><i class="icon fa fa-circle-o"></i> 학생목록 조회</a></li>
            <!-- <li><a class="treeview-item" href="profAttend.pr"><i class="icon fa fa-circle-o"></i> 출결 관리</a></li> -->
            <li><a class="treeview-item" href="profEvaluation.pr"><i class="icon fa fa-circle-o"></i> 강의평가 조회</a></li>
            <li><a class="treeview-item" href="profConsult.pr"><i class="icon fa fa-circle-o"></i> 상담 관리</a></li>
            <li><a class="treeview-item" href="profStudentOff.pr"><i class="icon fa fa-circle-o"></i> 학적변동 - 휴학 승인</a></li>
            <li><a class="treeview-item" href="profStudentDo.pr"><i class="icon fa fa-circle-o"></i> 학적변동 - 자퇴 승인</a></li>
          </ul>
        </li>
      </ul>
    </aside>
      
    <!-- Essential javascripts for application to work-->
    <script src="resources/bootstrap/docs/js/jquery-3.3.1.min.js"></script>
    <script src="resources/bootstrap/docs/js/popper.min.js"></script>
    <script src="resources/bootstrap/docs/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap/docs/js/main.js"></script>
    
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/chart.js"></script>
    <script type="text/javascript">
    </script>
    
    <!-- 로그인 클릭 시 뜨는 모달  -->
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">강의 인증</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
					
						<a id="aa" name="aa"> 보낼사람</a> <input type="text" name="from" id="from" />
						<input type="button" onclick="sendSMS()" value="전송하기" id="check" name="check"/> 
						<input type="hidden" id="ch" name="ch">
						  
						 <input type="hidden" name="fromm" id="fromm" /></li>
						<input type="hidden" id="checkk" name="checkk" onclick="sendSMSCheck()"/> 
						<form method="post" id="smsForm" action="lecMove.me">
						<input type="hidden" id="id" name="id" value="123"/>
				 
						  </form>
						
			</div>
		</div>
	</div>

	<script>
		function sendSMS() {
			var from = $("#from").val();
			console.log(from);
			$.ajax({
				url:"sendSms.me",
				type:"post",
				data:{from : from},
				success:function(result){
					$("#ch").val(result);
					console.log(result);
					$("#check").attr("type","hidden");
					$("#from").attr("type","hidden");
					$("aa").html("확인");
					
					$("#checkk").attr("type","button");
					$("#fromm").attr("type","text");
					
					
					
					
				},error:function(){
					console.log("통신 실패");
				}
			});
			
	
		}
		
		function sendSMSCheck() {
			var from = $("#fromm").val();
			var test = from;
			console.log(from);
			console.log("지금");
			var check = $("#ch").val();
	
			var dd = check.indexOf(from);


			console.log(dd);
			
			console.log(check);
			if(dd == 1){
			
					$("#smsForm").submit();
				
			}else{
				alert("일치하지 않습니다");
			}
			
	
		}
	</script>



    
  </body>
</html>