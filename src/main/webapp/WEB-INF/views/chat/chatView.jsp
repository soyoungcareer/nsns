<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>낙성대 커뮤니티</title>
	<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/bootstrap/docs/images/favicon.png" rel="icon">
<link href="resources/bootstrap/docs/images/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/bootstrap/docs/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="resources/bootstrap/docs/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/bootstrap/docs/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Knight - v4.6.0
  * Template URL: https://bootstrapmade.com/knight-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
	 <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script type="text/javascript">
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				this._sendMessage($('#message').val());
				$('#message').val('');
				
				$('#scrollDiv')
		        .stop()
		        .animate({ scrollTop: $('#scrollDiv')[0].scrollHeight }, 1000);
			},
			receiveMessage: function(str) {
				$('#divChatData').append('<div>' + str + '</div><br>');			
				$('#scrollDiv')
		        .stop()
		        .animate({ scrollTop: $('#scrollDiv')[0].scrollHeight }, 1000);
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(evt.data);
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(evt.data);
				}
			},
			_sendMessage: function(str) {
				this._socket.send(str);
			}
		};
	</script>	
	<script type="text/javascript">
		$(document).ready(function() {
			webSocket.init({ url: '<c:url value="/chat" />' });			
		});
		
		
	</script>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div
			class="container d-flex align-items-center justify-content-between">

			<div class="logo">
				<a href="boardMoves.me"><img
					src="resources/bootstrap/docs/images/logo.png" alt=""
					class="img-fluid"></a>
			</div>

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto " href="#hero"></a></li>
					<li><a class="nav-link scrollto" href="boardMovesss.me">게시글</a></li>
					<li><a class="nav-link scrollto" href="boardMovess.me">MY게시글</a></li>
					<li><a class="nav-link scrollto" href="crawMain.cer">취업지원</a></li>
					<li><a class="nav-link scrollto" href="chat.do">채팅</a></li>
					<li><a class="nav-link scrollto" href="#pricing"></a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->


		</div>
	</header>
	<!-- End Header -->
	<section class="material-half-bg">
    <div class="cover"></div>
    </section>
    
    <div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold" style="color:#0d6efd;">낙성대 공용 커뮤니티</h6>
			</div>
    
    <section class="login-content" style="background:gray;">
      <div class="logo">
        <h1>NS 실시간 채팅</h1>
       </div>
       <div class="row">
        <div>
          <div class="tile">
          
            <div class="tile-body">
            <div id="scrollDiv" style="overflow:auto; width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
				<div id="divChatData"></div>
			</div>
            </div>
            
            <div class="tile-footer">
              <div style="width: 100%; height: 10%; padding: 10px;">
				<input type="text" id="message" size="100" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
				<input type="button" id="btnSend" value="전송" onclick="webSocket.sendChat()" />
			  </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    </div>
     <script src="resources/bootstrap/docs/js/jquery-3.3.1.min.js"></script>
    <script src="resources/bootstrap/docs/js/popper.min.js"></script>
    <script src="resources/bootstrap/docs/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap/docs/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
</body>
</html>
