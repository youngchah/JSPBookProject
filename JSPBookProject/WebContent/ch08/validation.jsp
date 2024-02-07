<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH08</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<!-- 자바스크립트 onsubmit 이벤트  -->
						<form action="process.jsp" method="post" name="loginForm" id="loginForm"
							onsubmit="return submitEvent()">
							아이디 : <input type="text" name="id"/><br/>
							비밀번호 :  <input type="text" name="pw"/><br/>
							 <input type="submit" value="전송"/>
						</form>
						<!-- JQuery form을 이용한 submit 이벤트 -->
						<form action="process.jsp" method="post" id="loginForm2">
							아이디 : <input type="text" name="id" id="id"/><br/>
							비밀번호 :  <input type="text" name="pw" id="pw"/><br/>
							 <input type="submit" value="전송"/>
						</form>
						<!-- jQuery click 이벤트 -->
						<form action="process.jsp" method="post" id="loginForm3">
							아이디 : <input type="text" name="id" id="id2"/><br/>
							비밀번호 :  <input type="text" name="pw" id="pw2"/><br/>
							 <input type="button" value="전송" id="sendBtn"/>
						</form>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type="text/javascript">
// 자바스크립트 onsubmit 이벤트
function submitEvent(){
	console.log("Submit Event....!");
	alert("Submit Event....!");
	
	var id = document.loginForm.id.value;	// 아이디 값
	var pw = document.loginForm.pw.value;	// 비밀번호 값 
	
	if(id == ""){
		alert("아이디가 누락되었습니다!");
		return false;
	}
	
	if(pw == ""){
		alert("비밀번호가 누락되었습니다.");
		return false;
	}
	
	
}

$(function(){
	var loginForm2 = $("#loginForm2");
	var loginForm3 = $("#loginForm3");
	var sendBtn = $("#sendBtn");
	
	loginForm2.submit(function(){
		event.preventDefault(); // 서브밋 이벤트 block
		var id = $("#id").val();
		var pw = $("#pw").val();
		
		if(id == ""){
			alert("아이디가 누락되었습니다!");
			return false;
		}
		if(pw == ""){
			alert("비밀번호가 누락되었습니다!");
			return false;
		
		}
		
		$(this).submit();
	
	});
	
	sendBtn.on("click", function(){
		var id = $("#id2").val();
		var pw = $("#pw2").val();
		
		if(id == ""){
			alert("아이디가 누락되었습니다!");
			return false;
		}
		
		if(pw == ""){
			alert("비밀번호가 누락되었습니다!");
			return false;
		}
		loginForm3.submit();
		
	});
	
});

</script>
</html>