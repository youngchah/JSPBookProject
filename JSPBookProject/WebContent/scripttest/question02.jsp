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
						<div class="table-responsive">
							<caption>앞(SEM PC 자리)</caption>
							<table class="table table-bordered" style="text-align:center; font-size:24px;">
								<tr height="80px">
									<td width="10%">민경선</td>
									<td width="10%">성이수</td>
									<td width="10%">이명문</td>
									<td width="10%">조재훈</td>
									<td width="20%"></td>
									<td width="10%">최윤서</td>
									<td width="10%">안희재</td>
									<td width="10%">권예은</td>
									<td width="10%"></td>
								</tr>
								<tr height="80px">
									<td>신하림</td>
									<td>이영주</td>
									<td>김나혜</td>
									<td>김영상</td>
									<td></td>
									<td>최현명</td>
									<td>최소희</td>
									<td>홍진영</td>
									<td>임민혁</td>
								</tr>
								<tr height="80px">
									<td>김다애</td>
									<td>송현지</td>
									<td>김현태</td>
									<td>김태원</td>
									<td></td>
									<td>이수진</td>
									<td>선민수</td>
									<td>서어진</td>
									<td></td>
								</tr>
								<tr height="80px">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>백지은</td>
									<td>최현흠</td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
						<p id="count"></p>
						<h4 id="process"></h4>
						<hr/><br/>
						
						<button type="button" class="btn btn-primary" id="clickBtn">출력</button>
						<div id="output"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type="text/javascript">
$(function(){
	// 학생의 자리를 서로 바꿔보자
	var nameBox = "";	// 이름을 담을 공간
	var elementBox;		// 선택된 Element를 담을 공간
	var flag = false;	// 스위칭으로 사용할 flag(첫번째 누름? 두번째 누름?)
	
	// 학생 자리 옮기기 위한 이벤트(td클릭시)
	$("td").on("click", function(){
		if(flag){
			flag = false;	// 두번째 클릭해서 바뀜!
			elementBox.html($(this).html());
			
			$("#process").html(nameBox + "님과 " + $(this).html() + "님을 변경합니다!");
			$(this).html(nameBox);
			
			
			nameBox = "";
			elementBox = null;
			$("td").css("background-color", "white");
		}else{
			flag = true;	// 먼저 클릭했음!
			nameBox = $(this).html();	// 첫번째 요소의 이름을 담는다.
			elementBox = $(this);		// 첫번째 요소의 Element를 담는다.
			$(this).css("background-color", "yellow");
			
			$("#process").html(nameBox + "님과 ");
		}
	});
	
	// 출력 버튼 클릭시(현재 앉은 자리 출력 위한 이벤트)
	$("#clickBtn").on("click", function(){
		$("#output").html("");
		var tds = document.getElementsByTagName("td");
		var html = "<table class='table table-bordered' style='text-align:center; font-size:24px;'><tr>";
		for(var i = 1; i <= tds.length; i++){
			if(tds[i-1].innerText == "이영주"){
				html += "<td width='10%'><marquee><font color='blue'>"+tds[i-1].innerText+"</font></marquee></td>";	
			}else{
				html += "<td width='10%'>" + tds[i-1].innerText + "</td>";
			}
			if(i % 9 == 0){
				html += "</tr>";
			}
		}
		html += "</table>";
		$("#output").html(html);
	});
});





</script>
</html>