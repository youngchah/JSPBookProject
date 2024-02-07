<%@page import="kr.or.ddit.vo.BoardFileVO"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.or.ddit.dao.BoardRepository"%>
<%@ page errorPage="exceptionBoard_error.jsp" %>
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
					<!-- 
						1. 게시글 등록을 처리해주세요.
							> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
							> 게시글 등록을 진행 중 해당 페이지에서 에러가 발생했을때, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
					 -->
					 
					<%
							
							BoardFileVO filevo = new BoardFileVO();

							request.setCharacterEncoding("UTF-8");
							response.setCharacterEncoding("UTF-8");

							String realFolder = request.getServletContext().getRealPath("resources");
							String encType = "UTF-8";

							int maxSize = 5 * 1024 * 1024;

							File folder = new File(realFolder);
							if (!folder.exists()) {
								folder.mkdirs();
							}
							
							DiskFileUpload upload = new DiskFileUpload();
							upload.setSizeMax(1000000);
							upload.setSizeThreshold(maxSize);
							upload.setRepositoryPath(realFolder);

							List items = upload.parseRequest(request);
							Iterator params = items.iterator();

							String title = "";
							String writer = "";
							String context = "";
							String boardImg = "";

							while (params.hasNext()) {
								FileItem item = (FileItem) params.next();

								if (item.isFormField()) {
									String itemNm = item.getFieldName();
		
									if (itemNm.equals("title")) {
										title = item.getString(encType);
									} else if (itemNm.equals("writer")) {
										writer = item.getString(encType);
									} else if (itemNm.equals("context")) {
										context = item.getString(encType);
									}

								} else {
									String fileFieldName = item.getFieldName();
									boardImg = item.getName();
									String contentType = item.getContentType();
									long filesize = item.getSize();
									File saveFile = new File(realFolder + "/" + boardImg);
									item.write(saveFile);
		
									filevo.setContentType(contentType);
									filevo.setFileSize(filesize);
									filevo.setFileName(boardImg);
								}
							}

							BoardRepository dao = BoardRepository.getInstance();

							BoardVO vo = new BoardVO();

							vo.setTitle(title);
							vo.setWriter(writer);
							vo.setContent(context);
							vo.setFileVO(filevo);

							dao.addBoard(vo);
							
							int no = vo.getNo();

							response.sendRedirect("boardView.jsp?no="+no);
							
						
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