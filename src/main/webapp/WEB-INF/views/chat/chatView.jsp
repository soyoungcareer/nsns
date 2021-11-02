<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>익명채팅방</title>
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
			},
			receiveMessage: function(str) {
				$('#divChatData').append('<div>' + str + '</div><br>');				
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
	   <section class="material-half-bg">
    <div class="cover"></div>
    </section>
    
    <section class="login-content">
      <div class="logo">
        <h1>NS 익명채팅방</h1>
       </div>
       <div class="row">
        <div>
          <div class="tile">
          
            <div class="tile-body">
            <div style="overflow:auto; width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
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
     <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/js/plugins/pace.min.js"></script>
</body>
</html>
