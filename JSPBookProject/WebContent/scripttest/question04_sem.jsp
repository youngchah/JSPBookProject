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
									<span class="sr-only">60% Complete</span>
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
//학생 랜덤 추첨기 만들어보기
//var i = 0;
var myArray = [ "최현흠", "백지은", "서어진", "선민수", "이수진", "임민혁", "홍진영", "최소희",
		"최현명", "권예은", "안희재", "최윤서", "김태원", "김현태", "송현지", "김다애", "김영상",
		"김나혜", "이영주", "신하림", "조재훈", "이명문", "성이수", "민경선" ];

var cnt = 0;		// myArray에서 이름을 꺼낼때 사용하는 index
var seat = 0;		// show를 위한 index(td에 index를 배정할 때)
var elem;
var seatMove;
var width = 0;

function SeatMoveEvent() {
	elem = document.getElementById("myBar");
	seatMove = setInterval(move, 100);
}
function move() {
	$("td").css("background-color", "white");	// 처음에 선택된 자리를 흰색으로 초기화
	if (width >= 100) {	// 프로그레스바 100% 도달!
		cnt = Math.floor(Math.random() * 24);	// 0~26	학생 수
		// 학생 이름이 들어있는 배열 공간에서 결정된 index 값을 넣어 선택된 학생의 이름 꺼내기
		$("#txt").html(myArray[cnt]);	// 결과 출력
		
		var tds = document.getElementsByTagName("td");
		for(var j = 0; j < tds.length; j++){
			if(tds[j].innerText == myArray[cnt]){	// 테이블 td의 이름과 이름집합 배열의 이름이 같을때
				tds[j].style.backgroundColor = "yellow";	// 최종 선택된 학생의 이름에 노란색 보여
			}
		}
		
		clearInterval(seatMove);	// setInterval 이벤트 종료
		width = 0;
		elem = null;
		seatMove = null;
	} else {	// 프로그레스바가 100%를 달성하기까지의 show
		// Math.floor : 반올림하여 주어진 숫자보다 작거나 같은 가장 큰 정수
		seat = Math.floor(Math.random() * 36);	// 0~35 자리 수
		
		console.log(cnt + " : " + seat);
		$("td:eq("+seat+")").css("background-color", "yellow");
		
		width++;	// 프로그레스바 증가
		elem.style.width = width + "%";
		elem.innerHTML = width + "%";
		
		if(width == 10){
			$("#txt").html("학생을 선정중입니다!!!");
		}
		if(width == 20){
			$("#txt").html("조금만 기다려주세요!!!");
		}
	}
}
</script>
</html>