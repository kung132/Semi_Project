<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					
					<b>카드조회</b>
                   <!-- 내 정보 page -->
                    <div id="myinfo_2">
                            <c:choose>
								<c:when test="${ card != null }">
									<div style="margin-top : 15px;">
										<div style="margin-bottom : 10px;">현재 등록된 카드정보</div>
										카드번호 <span>${ card.cardNo }</span>
										<br>
										유효기간 <span>${ card.cardValidate }</span>
									</div>
									<div>
										<!-- Button to Open the Modal -->
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin-left:0;">
										  	카드변경
										</button>
										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal2" style="margin-left:0;">
										  	카드삭제
										</button>
										
										<!-- The Modal1 -->
										<div class="modal" id="myModal">
										  <div class="modal-dialog">
										    <div class="modal-content">
										
										      <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">카드변경</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
											
											      <!-- Modal body -->
											      <div class="modal-body">
													 <form action="<%= request.getContextPath() %>/cardUpdate.me" method="post">
												      	<span style="margin-right:20px;">카드번호</span>
												        <input type="text" name="cardNo1" style="width:50px;" required> <input type="text" name="cardNo2" style="width:50px;" required> 
												        <input type="text" name="cardNo3" style="width:50px;" required> <input type="text" name="cardNo4" style="width:50px;" required><br>
												        
												        <span style="margin-right:20px;">유효기간</span>
												        <input type="text" name="cardValidate" style="width:60px;" placeholder="MM/YY" required> <br>
												        
												        <span style="margin-right:20px;">비밀번호</span>
												        <input type="text" name="cardPwd" style="width:110px;" placeholder="" required> <br>
												        
												        <span style="margin-right:45.8px;">CVC</span>
												        <input type="text" name="cvc" style="width:110px;" required placeholder="카드뒷면 3자리"> <br>
												      	<button type="submit" class="btn btn-primary">등록</button>
												        <button type="reset" class="btn btn-danger">취소</button>
												  	 </form>
											      </div>
											
											      <!-- Modal footer -->
											      <div class="modal-footer">
											      	<button type="reset" class="btn btn-danger" data-dismiss="modal">닫기</button>
											      </div>
										    </div>
										  </div>
										</div>
									</div>
									
									<!-- The Modal2-->
										<div class="modal" id="myModal2">
										  <div class="modal-dialog">
										    <div class="modal-content">
										
										      <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">카드삭제</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
											
											      <!-- Modal body -->
											      <div class="modal-body">
													 <form action="<%= request.getContextPath() %>/cardDelete.me" method="post">
												      	<div style="margin-bottom : 20px; font-weight:600; font-size:20px;">정말 삭제하시겠습니까?</div>
												      	<button type="submit" class="btn btn-primary" style="margin:0;">예</button>
												        <button type="reset" class="btn btn-danger">아니요</button>
												  	 </form>
											      </div>
											
											      <!-- Modal footer -->
											      <div class="modal-footer">
											      	<button type="reset" class="btn btn-danger" data-dismiss="modal">닫기</button>
											      </div>
										    </div>
										  </div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div>카드가 등록되어 있지않습니다</div>
									<div>
										<!-- Button to Open the Modal -->
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin-left:0;">
										  	카드등록
										</button>
										
										<!-- The Modal -->
										<div class="modal" id="myModal">
										  <div class="modal-dialog">
										    <div class="modal-content">
										
										      <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">카드등록</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
											
											      <!-- Modal body -->
											      <div class="modal-body">
													 <form action="<%= request.getContextPath() %>/cardInsert.me" method="post">
												      	<span style="margin-right:20px;">카드번호</span>
												        <input type="text" name="cardNo1" style="width:50px;" required> <input type="text" name="cardNo2" style="width:50px;" required> 
												        <input type="text" name="cardNo3" style="width:50px;" required> <input type="text" name="cardNo4" style="width:50px;" required><br>
												        
												        <span style="margin-right:20px;">유효기간</span>
												        <input type="text" name="cardValidate" style="width:60px;" placeholder="MM/YY" required> <br>
												        
												        <span style="margin-right:20px;">비밀번호</span>
												        <input type="text" name="cardPwd" style="width:110px;" placeholder="" required> <br>
												        
												        <span style="margin-right:45.8px;">CVC</span>
												        <input type="text" name="cvc" style="width:110px;" required placeholder="카드뒷면 3자리"> <br>
												      	<button type="submit" class="btn btn-primary">등록</button>
												        <button type="reset" class="btn btn-danger">취소</button>
												  	 </form>
											      </div>
											
											      <!-- Modal footer -->
											      <div class="modal-footer">
											      	<button type="reset" class="btn btn-danger" data-dismiss="modal">닫기</button>
											      </div>
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>

                    <br>
                </div> <!-- content_2 -->
            
        </div><!-- #content -->

    </div> <!-- wrap -->
    
    
    <script>
 		
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