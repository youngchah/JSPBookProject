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
						<%
							// 세션은 클라이언트와 웹 서버 간의 상태를 지속적으로 유지하는 방법을 말함
							// 웹 서버에서만 접근이 가능하므로 보안 유지에 유리하며 데이터를 저장하는데
							// 한계가 없다.
							// 세션은 오직 웹 서버에 존재하는 객체로 웹 브라우저마다 하나씩 존재하므로
							// 웹 서버의 서비스를 제공하는 사용자를 구분하는 단위가 된다.
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							
							if(id.equals("admin") && pw.equals("1234")){
								session.setAttribute("userId", id);
								session.setAttribute("userPw", pw);
								
								out.println("세션 설정이 성공했습니다!");
								out.println(id + "님 환영합니다!");
							}else{
								out.println("세션 설정이 실패했습니다!");
							}
						
						%>
					
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>