<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                        <li>CH17</li>
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
							문제) 403호 반 학생들의 각 성씨에 따른 인원수는 각각 몇명인지 작성해주세요
							
							예시)------------------------
							'홍'씨 성을 가진 사람 : 00명
							'유'씨 성을 가진 사람 : 00명
							'정'씨 성을 가진 사람 : 00명
							...
							...
							
							*** 하드코딩 안됨
							*** JSTL을 이용하여 출력
							*** 403호 전원의 이름을 꼭 넣어서 작성
							*** 배열로 넣든, 문자열로 넣든, 리스트로 넣든 자유롭게!!
							*** 본인이 제일 자신있는 방식으로 고고!!
							
							[Hint]
							첫번째 방법, 각 성에 따른 카운트 변수를 생성한다.
							두번째 방법, 컬렉션을 이용한다.
						  -->
						  <%
						List<String> list = new ArrayList<String>();
						  list.add("권예은");
						  list.add("김나혜");
						  list.add("김영상");
						  list.add("김태원");
						  list.add("김현태");
						  list.add("민경선");
						  list.add("백지은");
						  list.add("서어진");
						  list.add("선민수");
						  list.add("성이수");
						  list.add("송현지");
						  list.add("신하림");
						  list.add("안희재");
						  list.add("이명문");
						  list.add("이수진");
						  list.add("이영주");
						  list.add("임민혁");
						  list.add("조재훈");
						  list.add("최소희");
						  list.add("최현명");
						  list.add("최현흠");
						  list.add("최윤서");
						  list.add("홍진영");
						  list.add("김다애");

							
						%>	
							<c:set var="list" value="<%=list %>" />
							<c:forEach var="i" begin="0" end="${fn:length(list)-1 }">
								${fn:substring(list[i],0,1) } 
							</c:forEach>
							<c:set var="sung" value="${fn:substring(list[i],0,1) } " />
						  <p> 
						  	<c:forEach var="j" begin="0" end="${fn:length(list)-1 }">
						  	<c:if test="${list[j] eq '홍'}">
						  		<c:out value="${sung }"/>
						  	</c:if>
						  	 
						  	
						  	</c:forEach>
						  </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>