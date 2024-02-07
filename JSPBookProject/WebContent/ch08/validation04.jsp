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
                        <li>CH01</li>
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
						 <!-- 자바스크립트 버전 활용 -->
                  <h3>Javascript 버전</h3>
                  <form action="validation02_process.jsp" method="post" name="loginForm">
                     	아이디 : <input type="text" name="id"/><br/>
                     	비밀번호 : <input type="text" name="pw"/><br/>
                     <input type="button" value="전송" onclick="CheckLogin()"/>
                  </form>
                  
                  <!-- jQuery 버전 활용 -->
                  <h3>jQuery 버전</h3>
                  <form action="validation02_process.jsp" method="post" id="loginForm2">
                     	아이디 : <input type="text" name="id2" id="id2"/><br/>
                     	비밀번호 : <input type="text" name="pw2" id="pw2"/><br/>
                     <input type="button" value="전송" id="loginBtn"/>
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
function CheckLogin(){
	var form = document.loginForm;
	
	for(var i = 0; i < form.id.value.length; i++){
		// 입력한 아이디를 하나하나씩 끊어줌
		var ch = form.id.value.charAt(i);
		
		// 0 52, 9 61, A 65, Z 90, a 97, z 122
		// 97 ~ 122 사이 범위에서만 가능함
		// if 조건은 모든 조건이 참 
		// || 연산 : true false 일때 true이다 (즉, 하나라도 true면 true이다)
		// && 연산 : true false 일때 false이다. (즉, 모두 true여야 true이다)
		if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') 
				&& (ch > '0' || ch < '9')){
			alert("아이디는 영문 소문자로만 입력 가능합니다!");
			form.id.select();
			return false;
			
		}
	}
	
	if(isNaN(form.pw.value)){
		alert("비밀번호는 숫자로만 입력 가능합니다!");
		form.pw.select();
		return false;
		
	}
	form.submit();
}

$(function(){
	var loginForm2 = $("#loginForm2");
	var loginBtn = $("#loginBtn");

	loginBtn.on("click", function(){
		var id = $("#id2").val();
		var pw = $("#pw2").val();
		
		for(var i = 0; i < id.length; i++){
			var ch = id.charAt(i);
			
			if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') 
					&& (ch > '0' || ch < '9')){
				
				
				alert("아이디는 영문 소문자로만 입력 가능합니다!");
				
				$("#id2").focus();
				return false;
			}
		}
		
		if(isNaN(pw)){
			alert("비밀번호는 숫자로만 입력 가능합니다!");
			$("#pw2").focus();
			return false;
				
		}
	});

});

</script>
</html>









