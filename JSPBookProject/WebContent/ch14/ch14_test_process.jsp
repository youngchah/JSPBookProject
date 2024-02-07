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
                        <li>CH14</li>
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
						request.setCharacterEncoding("utf-8");
						String id = request.getParameter("id");
						String idChk = request.getParameter("idChk");

						if (idChk != null) {
							Cookie cookie = new Cookie("id", id);
							Cookie cookie2 = new Cookie("idChk", idChk);
							
							cookie.setMaxAge(60 * 10);
							cookie2.setMaxAge(60 * 10);
							
							response.addCookie(cookie);
							response.addCookie(cookie2);
							response.sendRedirect("ch14_test.jsp");
						} else {
							Cookie[] cookies = request.getCookies();
							if (cookies != null) {
								for (Cookie cookie : cookies) {
							if (cookie.getName().equals("id") || cookie.getName().equals("idChk")) {
								cookie.setMaxAge(0); // 쿠키 삭제
								response.addCookie(cookie);
							}
								}
							}
							response.sendRedirect("ch14_test.jsp");
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