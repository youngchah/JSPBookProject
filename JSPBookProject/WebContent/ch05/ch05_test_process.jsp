<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <li>CH05</li>
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
						<!--  
							ch05_test.jsp에서 전송받은
							아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 taglib를 이용하여
							출력해주세요.
							
							[출력 예시]
							아이디 : a001
							비밀번호 : 1234
							이름 : 홍길동
							성별 : 남자
							핸드폰번호 : 010-1234-1234
							주소 : 대전시 서구 오류동 123
							
							출력이 완료되었으면 5초 뒤에 www.naver.com 홈페이지로
							이동시켜주세요!
							
							** 출력 후 이동은 어떤 방법을 채택해서 만들어도 상관없음!
						-->
						<% 
							request.setCharacterEncoding("UTF-8");
							
							String userId = request.getParameter("id");
							String userPw = request.getParameter("pw");
							String userName = request.getParameter("name");
							String userGender = request.getParameter("gender");
							String userPhone = request.getParameter("phone");
							String userAddr = request.getParameter("addr");
							
							if(userGender.equals("G")){
								userGender = "여자";
							}else{
								userGender = "남자";
							}
						%>
							<br/>
							<h5>결과</h5>
							<p>아이디 :<c:out value="<%=userId %>"/> </p> <br/>
							<p>비밀번호 : <c:out value="<%=userPw %>"/></p> <br/>
							<p>이름 : <c:out value="<%=userName %>"/></p> <br/>
							
							<p>성별 : <c:out value="<%=userGender %>"/></p> <br/>
							
							<p>핸드폰번호 : <c:out value="<%=userPhone %>"/></p> <br/>
							<p>주소 : <c:out value="<%=userAddr %>"/></p> <br/>
							<%
								response.setHeader("Refresh", "5;URL=http://www.naver.com");
								
								out.println("<br/>5초후 네이버로 이동합니다!!");
							%>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@ include file="/pageModule/footer.jsp"%>

<%@ include file="/pageModule/footerPart.jsp"%>
</body>
</html>