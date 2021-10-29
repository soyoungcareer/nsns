<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<!-- Twitter meta-->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:site" content="@pratikborsadiya">
<meta property="twitter:creator" content="@pratikborsadiya">
<!-- Open Graph Meta-->
<meta property="og:type" content="website">
<meta property="og:site_name" content="Vali Admin">
<meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
<meta property="og:url"
	content="http://pratikborsadiya.in/blog/vali-admin">
<meta property="og:image"
	content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
<meta property="og:description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<title>Vali Admin - Free Bootstrap 4 Admin Template</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/docs/css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="app sidebar-mini">
	<!-- Navbar-->
	<header class="app-header">
		<a class="app-header__logo" href="">Vali</a>
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">
			<!-- 로그인 -->
			<li class="loginTest"><a href="login.mem" style="color: white;">로그인</a>
			</li>
			<!-- 관리자 -->
			<li class="adminTest"><a href="prfEnrollForm.adm"
				style="color: white;">관리자</a></li>

			<!-- -----------------------------------
      		소영 교수페이지 확인용 임시 생성 메뉴 		시작 
      	------------------------------------- -->
			<li><a href="profMenu.pr" style="color: white;">교수메뉴 </a></li>
			<!-- -----------------------------------
      		소영 교수페이지 확인용 임시 생성 메뉴 		끝
      	------------------------------------- -->


			<li class="calendar"><a class="calendar-link" href="calendar.ca"
				style="color: white;">학사일정</a>
			<li class="calendar"><a data-toggle="modal" data-target="#loginModal">온라인강의</a>
				
				
				
			<li class="calendar"><a class="calendar-link" href="facMove.me"
				style="color: white;">시설물대여</a> <!-- 수강신청 페이지 확인용 -->
			<li class="register"><a class="register-link"
				href="register.reg" style="color: white;">수강신청</a></li>
			<li class="app-search"><input class="app-search__input"
				type="search" placeholder="Search">
				<button class="app-search__button">
					<i class="fa fa-search"></i>
				</button></li>
			<!--Notification Menu-->
			<li class="dropdown"><a class="app-nav__item" href=""
				data-toggle="dropdown" aria-label="Show notifications"><i
					class="fa fa-bell-o fa-lg"></i></a>
				<ul class="app-notification dropdown-menu dropdown-menu-right">
					<li class="app-notification__title">You have 4 new
						notifications.</li>
					<div class="app-notification__content">
						<li><a class="app-notification__item" href=""><span
								class="app-notification__icon"><span
									class="fa-stack fa-lg"><i
										class="fa fa-circle fa-stack-2x text-primary"></i><i
										class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
								<div>
									<p class="app-notification__message">Lisa sent you a mail</p>
									<p class="app-notification__meta">2 min ago</p>
								</div></a></li>
						<li><a class="app-notification__item" href=""><span
								class="app-notification__icon"><span
									class="fa-stack fa-lg"><i
										class="fa fa-circle fa-stack-2x text-danger"></i><i
										class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
								<div>
									<p class="app-notification__message">Mail server not
										working</p>
									<p class="app-notification__meta">5 min ago</p>
								</div></a></li>
						<li><a class="app-notification__item" href=""><span
								class="app-notification__icon"><span
									class="fa-stack fa-lg"><i
										class="fa fa-circle fa-stack-2x text-success"></i><i
										class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
								<div>
									<p class="app-notification__message">Transaction complete</p>
									<p class="app-notification__meta">2 days ago</p>
								</div></a></li>
						<div class="app-notification__content">
							<li><a class="app-notification__item" href=""><span
									class="app-notification__icon"><span
										class="fa-stack fa-lg"><i
											class="fa fa-circle fa-stack-2x text-primary"></i><i
											class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
									<div>
										<p class="app-notification__message">Lisa sent you a mail</p>
										<p class="app-notification__meta">2 min ago</p>
									</div></a></li>
							<li><a class="app-notification__item" href=""><span
									class="app-notification__icon"><span
										class="fa-stack fa-lg"><i
											class="fa fa-circle fa-stack-2x text-danger"></i><i
											class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
									<div>
										<p class="app-notification__message">Mail server not
											working</p>
										<p class="app-notification__meta">5 min ago</p>
									</div></a></li>
							<li><a class="app-notification__item" href=""><span
									class="app-notification__icon"><span
										class="fa-stack fa-lg"><i
											class="fa fa-circle fa-stack-2x text-success"></i><i
											class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
									<div>
										<p class="app-notification__message">Transaction complete</p>
										<p class="app-notification__meta">2 days ago</p>
									</div></a></li>
						</div>
					</div>
					<li class="app-notification__footer"><a href="#">See all
							notifications.</a></li>
				</ul></li>
			<!-- User Menu-->
			<li class="dropdown"><a class="app-nav__item" href="#"
				data-toggle="dropdown" aria-label="Open Profile Menu"><i
					class="fa fa-user fa-lg"></i></a>
				<ul class="dropdown-menu settings-menu dropdown-menu-right">
					<li><a class="dropdown-item" href=""><i
							class="fa fa-cog fa-lg"></i> Settings</a></li>
					<li><a class="dropdown-item" href=""><i
							class="fa fa-user fa-lg"></i>Profile</a></li>
					<li><a class="dropdown-item" href=""><i
							class="fa fa-sign-out fa-lg"></i> Logout</a></li>
				</ul></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<img class="app-sidebar__user-avatar"
				src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg"
				alt="User Image">
			<div>
				<p class="app-sidebar__user-name">John Doe</p>
				<p class="app-sidebar__user-designation">Frontend Developer</p>
			</div>
		</div>
		<ul class="app-menu">
			<li><a class="app-menu__item active" href=""><i
					class="app-menu__icon fa fa-dashboard"></i><span
					class="app-menu__label">Dashboard</span></a></li>
			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span
					class="app-menu__label">UI Elements</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Bootstrap Elements</a></li>
					<li><a class="treeview-item" href="" target="_blank"
						rel="noopener"><i class="icon fa fa-circle-o"></i> Font Icons</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Cards</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Widgets</a></li>
				</ul></li>
			<li><a class="app-menu__item" href=""><i
					class="app-menu__icon fa fa-pie-chart"></i><span
					class="app-menu__label">Charts</span></a></li>
			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span
					class="app-menu__label">Forms</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Form Components</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Custom Components</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Form Samples</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Form Notifications</a></li>
				</ul></li>
			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span
					class="app-menu__label">Tables</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Basic Tables</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Data Tables</a></li>
				</ul></li>
			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span
					class="app-menu__label">Pages</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Blank Page</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Login Page</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Lockscreen Page</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> User Page</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Invoice Page</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Calendar Page</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Mailbox</a></li>
					<li><a class="treeview-item" href=""><i
							class="icon fa fa-circle-o"></i> Error Page</a></li>
				</ul></li>
			<li><a class="app-menu__item" href=""><i
					class="app-menu__icon fa fa-file-code-o"></i><span
					class="app-menu__label">Docs</span></a></li>
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
	<script type="text/javascript"
		src="resources/bootstrap/docs/js/plugins/chart.js"></script>
	<script type="text/javascript">
		var data = {
			labels : [ "January", "February", "March", "April", "May" ],
			datasets : [ {
				label : "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [ 65, 59, 80, 81, 56 ]
			}, {
				label : "My Second dataset",
				fillColor : "rgba(151,187,205,0.2)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(151,187,205,1)",
				data : [ 28, 48, 40, 19, 86 ]
			} ]
		};
		var pdata = [ {
			value : 300,
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "Complete"
		}, {
			value : 50,
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "In-Progress"
		} ]

		var ctxl = $("#lineChartDemo").get(0).getContext("2d");
		var lineChart = new Chart(ctxl).Line(data);

		var ctxp = $("#pieChartDemo").get(0).getContext("2d");
		var pieChart = new Chart(ctxp).Pie(pdata);
	</script>
	<!-- Google analytics script-->
	<script type="text/javascript">
		if (document.location.hostname == 'pratikborsadiya.in') {
			(function(i, s, o, g, r, a, m) {
				i['GoogleAnalyticsObject'] = r;
				i[r] = i[r] || function() {
					(i[r].q = i[r].q || []).push(arguments)
				}, i[r].l = 1 * new Date();
				a = s.createElement(o), m = s.getElementsByTagName(o)[0];
				a.async = 1;
				a.src = g;
				m.parentNode.insertBefore(a, m)
			})(window, document, 'script',
					'//www.google-analytics.com/analytics.js', 'ga');
			ga('create', 'UA-72504830-1', 'auto');
			ga('send', 'pageview');
		}
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
						<input type="hidden" id="id" name="id" value="20193019"/>
				 
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