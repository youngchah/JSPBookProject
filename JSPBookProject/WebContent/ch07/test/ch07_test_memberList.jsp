<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.dao.MemberDAO"%>
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
<style type="text/css">
table {
    border-collapse: collapse; 
}
table td, table th {
    border: 1px solid #ccc; 
    padding: 30px; 
}
</style>
</head>
<body>
   <%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
                    <!-- 
                       1. 회원 목록 페이지를 작성해주세요.
                       
                       [ 등록 ]
                       ______________________________
                       	이미지        회원정보         버튼
                       ______________________________
                       [ 이   ]     아이디 : a001      [상세]
                       [ 미 ]     비번 : 1234
                       [ 지 ]     이름 : 홍길동
                       [ 란 ]     성별 : 남자
                       ______________________________
                       [ 이   ]     아이디 : a002      [상세]
                       [ 미 ]     비번 : 1234
                       [ 지 ]     이름 : 홍길순
                       [ 란 ]     성별 : 여자
                       ______________________________
                       ... 
                     -->
                     <%
                        String id = request.getParameter("id");
                        MemberDAO dao = MemberDAO.getInstance();
                        ArrayList<MemberVO> memberList = dao.getMemberList();
                        
                        if(id !=null){
                           %>
                           <c:set value="<%=id %>" var="mem_id"/>
                           <% 
                        }
                     %>
                     <c:set value="<%=memberList %>" var="list"/>
                     <h3>회원목록</h3>   
                     <hr/>
                <br/>
                <a href="ch07_test_signup.jsp" class="btn btn-primary">회원등록</a>
                <br/><br/>
                <table border="1">
                   <tr>
                      <th>이미지</th>
                      <th>회원정보</th>
                      <th>버튼</th>
                   </tr>
                   <c:choose>
                   
                      <c:when test="${empty list}">
                         <tr>
                            <td colspan="3">조회하실 회원정보가 존재하지 않습니다. </td>
                         </tr>
                      </c:when>
                      
                      <c:otherwise>
                         <c:forEach items="${list }" var="member" varStatus="stat">
                            <tr>
                               <td width="500px">
                                  <img src="${pageContext.request.contextPath}/resources/images/${member.filename }" style="width:200px;" alt="프로필사진"/>
                               </td>
                               <td width="500px">
                                  <p>아이디 : ${member.mem_id }</p>
                                  <p>비밀번호 : ${member.mem_pw }</p>
                                  <p>이름 : ${member.mem_name }</p>
                                  <p>성별 : ${member.mem_sex }</p>
                               </td>
                               <td width="250px">
                                  <a href="#" class="btn btn-primary">상세정보</a>
                               </td>
                            </tr>
                            
                         </c:forEach>
                      </c:otherwise>
                   </c:choose>
                </table>
                
                    </div>
                </div>
            </div>
        </div>
    </section>
   <script type="text/javascript">
      var idd = "${mem_id}";
      console.log(idd);

      if (idd != null || idd != "") {
         alert(idd + "님! 환영합니다!");
      }
   </script>
   <%@ include file="/pageModule/footer.jsp" %>

   <%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>