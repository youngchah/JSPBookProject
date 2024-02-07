<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.dao.BoardRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #dddddd;
	padding: 8px;
	text-align: left;
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
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH11</li>
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
						1. 게시글 상세보기를 출력해주세요.
							> JSTL을 활용해주세요. 
						
						[출력 예]
						
						게시판 상세보기
						──────────────────────────────────────────────
						제목 : 
						작성자 작성일 조회수
						──────────────────────────────────────────────
						내용
						──────────────────────────────────────────────
						
						[ 수정  ] [ 삭제  ] [ 목록  ]
						
						2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
						3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
						4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
					 -->

						 <%
                            request.setCharacterEncoding("utf-8");
                            int no = Integer.parseInt(request.getParameter("no"));

                            BoardRepository dao = BoardRepository.getInstance();
                            ArrayList<BoardVO> list = dao.selectBoardList();
                            BoardVO bv = dao.getBoardById(no);
                        %>

                        <h2>게시판 상세보기</h2>
                        <hr />
                        <table border="1">
                            <tr>
                                <th colspan="2">제목 </th>
                                <td colspan="3"><c:out value="<%=bv.getTitle() %>"/></td>
                            </tr>
                            <tr>
                                <th colspan="2">작성자  <c:out value="<%=bv.getWriter() %>"/></th>
                                <th colspan="2">작성일  <c:out value="<%=bv.getRegDate() %>"/></th>
                                <th colspan="1">조회수 <c:out value="<%=bv.getHit() %>"/></th>
                            </tr>
                            <tr>
                                <th colspan="5"><c:out value="<%=bv.getContent() %>"/></th>
                            </tr>
                            <tr>
                                <th>첨부파일 </th>
                                <td colspan="4"><a href="${pageContext.request.contextPath}/resources/<%=bv.getFileVO().getFileName() %>" download><%=bv.getFileVO().getFileName()%></a></td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <input type="button" value="수정" onclick="goUpdate(<%=no%>)">
                                    <input type="button" value="삭제" onclick="goDelete(<%=no%>)">
                                    <input type="button" value="목록" onclick="goList()">
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
		function goUpdate(no){
			location.href = "./boardUpdateForm.jsp?no="+no;
		}
		function goDelete(no){
			console.log(no)
		 	var result = confirm('정말로 삭제하시겠습니까?');

	        if(result) {
	        	//삭제할래요
	        	location.href = "./boardRemove.jsp?no="+no;
	        } else {
	        	//안할래요
	        }
		}
		function goList(){
			location.href = "./boardList.jsp";
		}
	</script>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>