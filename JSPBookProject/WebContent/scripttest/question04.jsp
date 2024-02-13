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
							<table width="100%" border="1" style="text-align:center; font-size:24px;">
								<tr width="100%" height="80px">
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
							<hr/>
							<div class="progress" style="height: 40px;">
								<div class="progress-bar progress-bar-striped" id="myBar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 1px; height: 40px;">
									<span class="sr-only"><span id="progress-now">0</span>% Complete</span>
								</div>
							</div>
							<br/>
							<h4 id="txt"></h4>
							<button type="button" onclick="SeatMoveEvent()" style="padding:12px;border:none;cursor:pointer;">출력</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
	
</body>
<script type="text/javascript">
var progress = 0;  
var timer;  

function SeatMoveEvent(){
	timer = setInterval(() => {
		changeBg();
		$("#myBar").attr("aria-valuenow",progress);	//aria-valuenow 속성을 progress 변수의 값으로 설정
		$("#myBar").css("width",progress+"%");	//진행상황 바를 늘려준다 
		$("#progress-now").text(progress);
		if(progress == 100){	//100%가 되면 중지시킴
			endProgress(); 
		}
		progress += 1;	// 1 씩 더해줌  
		
		
	}, 100);	//0.1초(100ms)마다 setInterval(() => { } 함수를 반복한다 
}



function changeBg(){
	$("td").css("background-color","");	// 모든 td요소의 배경색을 지워준다.
	var tds = $("td");					// td 요소들을 모두 tds에 담아준다 
	var rnd = Math.random()*tds.length;	// tds의 length만큼 랜덤한 숫자를 생성한다. 선택할 <td> 요소의 인덱스를 결정하는 데 사용
	rnd = Math.floor(rnd)				// 랜덤한 숫자를 정수로 변환하여 인덱스로 사용	
	
	var td = $("td").eq(rnd)[0];
	var name = td.innerHTML; 
	td.style.setProperty("background-color","gold");
	
	if(name === ""){ //좌석 이름이 비어있는 경우 다시 선택하도록 재귀호출
		return changeBg();
	}
	
	$("#txt").text(name);	//마지막으로 선택된 이름을 #txt에 적용시켜준다.
}

function endProgress() {
	clearInterval(timer);
}


</script>
</html>