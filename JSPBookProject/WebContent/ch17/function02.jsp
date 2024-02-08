<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
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
						<!--
							split 함수를 이용하여 해당 문자열을 ' '을 구분자로 각각 나눈다.
							변수 texts는 ' '로 나뉘어진 배열
						  -->
						<c:set value="${fn:split('Hello, Java Server Pages!', ' ') }"
							var="texts"/>
                    	<!--
                    		분리된 문자열 길이만큼 반복하여 분리된 문자열을 출력하도록 작성 
                    	  -->
                    	
                    	<c:forEach var="i" begin="0" end="${fn:length(texts)-1 }">
                    		<p>texts[${i }] = ${texts[i] }</p>
                    	</c:forEach>
                    	
                    	<br/>
                    	<hr/>
                    	
                    	<!-- 분리된 문자열과 '-'를 연결하도록 fn:join 태그를 작성 -->
                    	<p>
                    		<c:out value="${fn:join(texts, '-') }"/>
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