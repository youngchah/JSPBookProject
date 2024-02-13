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
						<div style="max-width: 600px; margin: 0 auto;">
							<h5 style="text-align: center;">영수증</h5>
							<br/>
							<br/>
							<table class="table" style="width: 100%;">
								<thead>
									<tr>
										<th style="width: 50%">메뉴명</th>
										<th style="width: 20%">수량</th>
										<th style="width: 30%">금액</th>
									</tr>
								</thead>
								<tbody>
									<% 
                                    request.setCharacterEncoding("UTF-8");

                                    String menu = request.getParameter("dataArr");
                                    String cnt = request.getParameter("countArr");
                                    String price = request.getParameter("priceArr");

                                    String [] menuArr = menu.split(",");
                                    String [] cntArr = cnt.split(",");
                                    String [] priceArr = price.split(",");

                                    int sum = 0;

                                    for(int i = 0; i < menuArr.length; i++){
                                %>
									<tr>
										<td><%=menuArr[i]%></td>
										<td><%=cntArr[i]%></td>
										<td><%=priceArr[i]%></td>
									</tr>
									<% 
                                        sum += Integer.parseInt(priceArr[i]);
                                    } 
                                %>
								</tbody>
							</table>
							<br/>
							<div style="text-align: right; margin-right: 120px;">
								<h5>총 금액: <%=sum %></h5>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>