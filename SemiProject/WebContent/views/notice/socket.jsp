<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<% 
	Member loginMember = (Member)session.getAttribute("loginMember");
%>

<!DOCTYPE html>
<html>
<head>

	<style>
		body {
			width : 100%;
			height : 300px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 채팅 영역 -->
	<form>
		<!-- 텍스트 박스에 채팅의 내용을 작성한다. -->
		<input id="textMessage" type="text" onkeydown="return enter()">
		<!-- 서버로 메시지를 전송하는 버튼 -->
		<input onclick="sendMessage()" value="작성" type="button" style="background-color: #ffeb33; margin:0px;">
	</form>
	<br>
	<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
	<div id="messageTextArea" style="background-color:#a9bcde; width:80%; height:90%; overflow-y : scroll;"></div>
	<script type="text/javascript">
		// 서버의 broadsocket의 서블릿으로 웹 소켓을 한다.
		var webSocket = new WebSocket("ws://localhost:8888/html/broadsocket");
		// 콘솔 텍스트 영역
		var messageTextArea = document.getElementById("messageTextArea");
		// 접속이 완료되면
		webSocket.onopen = function(message) {
		// 콘솔에 메시지를 남긴다.
		messageTextArea.innerText += "Server connect...\n";
		};
		// 접속이 끝기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.
		webSocket.onclose = function(message) { };
		// 에러가 발생하면
		webSocket.onerror = function(message) {
		// 콘솔에 메시지를 남긴다.
		messageTextArea.innerText += "error...\n";
		};
		// 서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다.
		webSocket.onmessage = function(message) {
		messageTextArea.innerHTML += "<div style='text-align:left; margin-left:15px;'>(관리자) : " + message.data + "</div>";
		};
		// 서버로 메시지를 발송하는 함수
		// Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행
		function sendMessage() {
		// 텍스트 박스의 객체를 가져옴
		let message = document.getElementById("textMessage");
		// 콘솔에 메세지를 남긴다.
		messageTextArea.innerHTML += "<div style='text-align:right; margin-right:15px; color:#ffeb33;'>(<%= loginMember.getMemberName() %>) : "+ message.value + "</div>";
		// 소켓으로 보낸다.
		webSocket.send(message.value);
		// 텍스트 박스 추기화
		message.value = "";
		}
		// 텍스트 박스에서 엔터를 누르면
		function enter() {
		// keyCode 13은 엔터이다.
		if(event.keyCode === 13) {
		// 서버로 메시지 전송
		sendMessage();
		// form에 의해 자동 submit을 막는다.
		return false;
		}
		return true;
		}
	</script>

	
</body>
</html>