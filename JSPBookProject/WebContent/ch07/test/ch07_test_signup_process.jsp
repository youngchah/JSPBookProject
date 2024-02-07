<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.dao.MemberDAO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
							1. 회원가입 처리를 진행해주세요.
								- 회원가입 시, 등록에 필요한 항목 모두를 이용해 가입을 진행해주세요.
								- 가입 기능을 작성할 때, Repository와 VO를 활용하세요.
								- 프로필 이미지가 있기 때문에 파일 처리도 함께 해주세요.
								- 가입 완료 후, 로그인 페이지로 이동해주세요.
						-->
						<%
							request.setCharacterEncoding("UTF-8");
							
							String realFolder = request.getServletContext().getRealPath("/resources/images");
							
							out.println(realFolder);
							
							String encType= "utf-8";
							int maxSize = 5 * 1024 * 1024;
							
							File file = new File(realFolder);
							if(!file.exists()){
								file.mkdirs();
							}
							DiskFileUpload upload = new DiskFileUpload();
							upload.setSizeMax(1000000);
							upload.setSizeThreshold(maxSize);
							upload.setRepositoryPath(realFolder);
							List items = upload.parseRequest(request);
							Iterator params = items.iterator();
							
							Map<String, Object> map = new HashMap<String,Object>();
							
							String mem_id = "";
							String mem_pw = "";
							String mem_name = "";
							String mem_sex = "";
							String fileName = "";
							
							while(params.hasNext()){
								FileItem item = (FileItem) params.next();
								
								if(item.isFormField()){
									String fieldName = item.getFieldName();
									
									String value = item.getString("UTF-8");
								
									
// 									if(fieldName.equals("mem_id"))
// 										mem_id = item.getString(encType);
// 									else if(fieldName.equals("mem_pw"))
// 										mem_pw = item.getString(encType);
// 									else if(fieldName.equals("mem_name"))
// 										mem_name = item.getString(encType);
// 									else if(fieldName.equals("mem_sex"))
// 										mem_sex = item.getString(encType);
									map.put(fieldName,value);
									
								}else{
									String fileFieldName = item.getFieldName();
									fileName = item.getName();
									
									if(!fileName.equals("")){
										String contentType = item.getContentType();
										fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
										long fileSize = item.getSize();
										File saveFile = new File(realFolder + "/" + fileName);
										item.write(saveFile);
										
										map.put(fileFieldName, fileName); 
									}
									
									
								}
							}
							
							MemberDAO dao = MemberDAO.getInstance();
							
							MemberVO newMember = new MemberVO();
							newMember.setMem_id(map.get("mem_id").toString());
							newMember.setMem_pw(map.get("mem_pw").toString());
							newMember.setMem_name(map.get("mem_name").toString());
							newMember.setMem_sex(map.get("mem_sex").toString());
							newMember.setFilename(map.get("filename").toString());
							
							dao.insertMember(newMember);
							
							response.sendRedirect("ch07_test_signin.jsp");
							
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