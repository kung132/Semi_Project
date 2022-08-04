<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>

<% 
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" type="text/css" href="/html/views/common/css/mypage.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- 글자 폰트 관련 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comforter&family=Comforter+Brush&family=Dancing+Script&family=Oswald:wght@600&display=swap" rel="stylesheet">
    
    <!-- 경필님 꺼 -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="/html/views/common/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/html/views/common/css/animate.css">
    
    <link rel="stylesheet" href="/html/views/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/html/views/common/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/html/views/common/css/magnific-popup.css">

    <link rel="stylesheet" href="/html/views/common/css/aos.css">

    <link rel="stylesheet" href="/html/views/common/css/ionicons.min.css">

    <link rel="stylesheet" href="/html/views/common/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/html/views/common/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/html/views/common/css/flaticon.css">
    <link rel="stylesheet" href="/html/views/common/css/icomoon.css">
    <link rel="stylesheet" href="/html/views/common/css/style.css">

	<style>
		input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button { -webkit-appearance: none; margin: 0; }
	</style>
</head>

<body>
	<%@ include file="../common/topbar.jsp" %>

    <div class="wrap">
        <div id="header">
            <a href="#"></a>  
            <div class="header_area">
           
                <div class="login_area">
                    
                    <!-- 로그인 성공 후 화면 -->
                    
                    <div id="login-after">
                        <b style="font-size:15px;"><%= loginMember.getMemberName() %></b>님 환영합니다.
                    </div>
                    
                </div>
                
            </div>  
            
        </div> <!-- /header -->

        <div id="content">
            <div id="content_1">
                
                <div id="userclass">
                    <img src="resources/img/logo_2.PNG">
                    <span style="font-family:굴림" id="hotel_name"><b>여기서 쉬시조 회원</b></span>
                </div>
                <p id="MyPage">마이페이지</p>
                <div id="list" align="center">
                    <input id="check-btn1" type="checkbox" />
                    <label for="check-btn1" class="font_1">My 예약</label>
                    <ul class="menubars1">
                        <li><a href="#" onclick="selectBook();">예약 조회</a></li>
                        <li><a href="#" onclick="cancelBook();">예약 취소</a></li>
                    </ul><br>
                    <input id="check-btn2" type="checkbox" />
                    <label for="check-btn2" class="font_1">My 계정</label>
                    <ul class="menubars2">
                        <li><a href="#" onclick="myInfo();">내 정보</a></li>
                        <li><a href="#" onclick="updatePwd();">계정 및 비밀번호</a></li>
                        <li><a href="#" onclick="cardRegist();">카드조회</a></li>
                    </ul>
                </div> 
                
                <script>
                function selectBook() {
                    
                    var url = "<%= request.getContextPath() %>/myPageForm.me?currentPage=1"
                    var memberNo = <%= loginMember.getMemberNo() %>;

                    var form = document.createElement('form');
                    form.setAttribute('method', 'post');
                    form.setAttribute('action', url);
                    document.charset ="UTF-8";

                    var hiddenField = document.createElement('input');
                    hiddenField.setAttribute('type', 'hidden');
                    hiddenField.setAttribute('name', 'memberNo');
                    hiddenField.setAttribute('value', memberNo);
					form.appendChild(hiddenField);
					
					document.body.appendChild(form);
					
					form.submit();

                }
                
                function cancelBook() {
                	
                	var url = "<%= request.getContextPath() %>/bCancelForm.me"
                    var memberNo = <%= loginMember.getMemberNo() %>;

                    var form = document.createElement('form');
                    form.setAttribute('method', 'post');
                    form.setAttribute('action', url);
                    document.charset ="UTF-8";

                    var hiddenField = document.createElement('input');
                    hiddenField.setAttribute('type', 'hidden');
                    hiddenField.setAttribute('name', 'memberNo');
                    hiddenField.setAttribute('value', memberNo);
					form.appendChild(hiddenField);
					
					document.body.appendChild(form);
					
					form.submit();
                }
                
                
                function myInfo() {
                	
                	location.href = '<%= request.getContextPath() %>/updateMyInfoForm.me';
                	
                }
                
				function updatePwd() {
                	
                	location.href = '<%= request.getContextPath() %>/updatePwdForm.me';
                }
				
				function cardRegist() {
					location.href = '<%= request.getContextPath() %>/cardRegister.me';
				}
				
            </script>   
                
            </div> <!-- content_1 -->
               
            <div id="content_2">

                   <!-- 내 정보 page -->
                    
                    
                    <div id="myinfo_1">
                        <form action="#" method="post">
                            <tr>
                                <td><label>이름</label></td>&nbsp;&nbsp;
                                <td><%= loginMember.getMemberName() %><td>
                            </tr>
                            <br>
                            <tr>
                                <td><label>핸드폰번호</label></td>&nbsp;&nbsp;
                                <td><%= loginMember.getPhone() %></td>
                            </tr>
                            <br>
                            <tr>
                                <td><label>생년월일 - </label></td>&nbsp;&nbsp;
                                <td><%= loginMember.getBirth().substring(0,10) %> </td>
                            </tr>
                            <br>
                            <tr>
                                <td><label>성별 -</label></td>&nbsp;&nbsp;
                                <td><%= loginMember.getGender() %></td>
                            </tr>
                            <br>
                            <tr>
                                <td><label>이메일 주소</label></td>&nbsp;&nbsp;
                                <td><%= loginMember.getEmail() %></td>
                            </tr>
                            <br><br>
                            
                        </form> 
                    </div>
                    <br>
                    
                    <div id="myinfo_2">
                        <form action="<%= contextPath %>/updateMyInfo.me" method="post">
                            <tr>
                                <td><label>이름</label></td>&nbsp;&nbsp;
                                <td><input type="text" name="fullName" value="" required id="fullname"></td>
                            </tr>
                            <br>
                            <tr>
                                <td><label>핸드폰번호</label></td>&nbsp;&nbsp;
                                <td><input type="number" name="newPhone" required id="newPhone"></td>
                            </tr>
                            <br>
                            <tr>
                                <td><label>생년월일 - </label></td>&nbsp;&nbsp;
                                <td><input type="date" name="birthDate" size="20" required max=""  id="birthDate"></td>
                            </tr>
                            <br>
                            <tr>
                                <td><label>성별 -</label></td>&nbsp;&nbsp;
                                <td>
                                    <input type="radio" id="radioM" name="gender" value="M"> <label for="radioM">남자</label>
                                    <input type="radio" id="radioF" name="gender" value="F"> <label for="radioF">여자</label><br>
                                </td>
                            </tr>
                            <tr>
                                <td><label>이메일 주소</label></td>&nbsp;&nbsp;
                                <td>
                                	<input type="email" id="email" name="email" required>
                                	<input type="hidden" name="memberNo" value="<%= loginMember.getMemberNo() %>">
                                </td>
                            </tr>
                            <br><br>
                            <input type="submit" value="수정" class="fix">
                            <input type="reset" value="초기화" >
                        </form> 
                    </div>

                    <br>
                </div> <!-- content_2 -->
            
        </div><!-- #content -->

    </div> <!-- wrap -->
    
    
    <script>
 		// 내정보 업데이트 위한 유효성 검사 정규표현식
		var nameReg = /^[가-힣]{2,6}$/; // 한글 단어만 2글자 ~ 6글자
		var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; // 앞부분은 영문자, 영문자와 숫자만 6 ~ 15자 / 뒷부분은 14자까지 도메인 형식으로
		var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 숫자만
		var birthReg = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/; // yyyymmdd 형식으로 숫자만
    
    	
    
    	$(function() {
    		var date = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
    		
    		$("#birthDate").attr("max", date);
    	})
    	
    </script>    
    
  
    <script src="/html/views/common/js/jquery.min.js"></script>
    <script src="/html/views/common/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="/html/views/common/js/popper.min.js"></script>
    <script src="/html/views/common/js/bootstrap.min.js"></script>
    <script src="/html/views/common/js/jquery.easing.1.3.js"></script>
    <script src="/html/views/common/js/jquery.waypoints.min.js"></script>
    <script src="/html/views/common/js/jquery.stellar.min.js"></script>
    <script src="/html/views/common/js/owl.carousel.min.js"></script>
    <script src="/html/views/common/js/jquery.magnific-popup.min.js"></script>
    <script src="/html/views/common/js/aos.js"></script>
    <script src="/html/views/common/js/jquery.animateNumber.min.js"></script>
    <script src="/html/views/common/js/bootstrap-datepicker.js"></script>
    <script src="/html/views/common/js/jquery.timepicker.min.js"></script>
    <script src="/html/views/common/js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="/html/views/common/js/google-map.js"></script>
    <script src="/html/views/common/js/main.js"></script>     
   
	
    



</body>
</html>