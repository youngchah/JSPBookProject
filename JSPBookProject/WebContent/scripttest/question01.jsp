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
<style>
#newInput{
	width : 100%;
}
button{
	padding : 8px;
	border-radius: 4px;
	border:none;
}

</style>
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
							<table class="table table-bordered table-hover" width="100%" id="table_id">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<tr>
									<td>10</td>
									<td>네이버웍스 비정기 업데이트 소식</td>
									<td>관리자</td>
									<td>2022-11-16</td>
									<td>1455</td>
								</tr>
								<tr>
									<td>9</td>
									<td>네이버웍스 일부 기능의 사양 변경 및 종료 안내</td>
									<td>관리자</td>
									<td>2022-11-15</td>
									<td>234</td>
								</tr>
								<tr>
									<td>8</td>
									<td>[프로모션 공지] 네이버웍스 X 워크플레이스 결합 서비스 신규 가입 20%추가 할인(~12.31)</td>
									<td>관리자</td>
									<td>2022-11-14</td>
									<td>23444</td>
								</tr>
								<tr>
									<td>7</td>
									<td>[중요] 네이버웍스 V3.5 정기 업데이트 소식</td>
									<td>관리자</td>
									<td>2022-11-13</td>
									<td>12466</td>
								</tr>
								<tr>
									<td>6</td>
									<td>[프로모션 사전 공지] 네이버웍스 X 워크플레이스 결합 서비스 20% 추가 할인</td>
									<td>관리자</td>
									<td>2022-11-12</td>
									<td>111</td>
								</tr>
								<tr>
									<td>5</td>
									<td>드라이브 서비스 DB 업그레이드 작업 사전 안내</td>
									<td>관리자</td>
									<td>2022-11-11</td>
									<td>2233</td>
								</tr>
							</table>
						</div>
						<hr/><br/>
						<div class="col-md-12 stretch-card grid-margin">
							<div class="card">
								<div class="card-body">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" id="chk" value="Y"> 
										<label class="form-check-label" for=""chk"">append 여부</label>
									</div>
										<h6>선택한 td안에 있는 글자를 아래 P태그에 출력해주세요!</h6>
									<p id="output" class="text-info">출력란</p>
									<br/>
									<div id="btndiv"></div>
								</div>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
    var lastTitle = ""; // 마지막으로 클릭한 제목 저장
    
    $('#table_id tr').on('click', function() {
        var trIndex = $(this).index();
        var trItem = $(this).text();
        console.log(trIndex + "|" + trItem);
        
    });
    
    //tr안에 있는 요소를 클릭했을때의 적용되는 함수
    $('#table_id').on("click","tr", function(){
    	
    	//td에 인덱스 1번 (제목)을 변수로 선언 
    	var titletd = $(this).find("td:eq(1)");
    	var title = $(this).find("td:eq(1)").text();
    	
    	lastTitle = title;
    	//append 여부 체크
    	var checked = $('#chk').is(':checked');
    	var temp = "";
    	
        if(checked){
        	temp = temp + $('#output').append("<br/>"+title);
        	$('#btndiv').empty();
        }else{
	    	$('#output').html(title);
	    	btnCreate();
        }
        
        
	    $(document).ready(function(){
	    	$(document).on('click', '#modbtn', function() {
				console.log("수정버튼 눌립니다~~");
				var newInput = $('<input type="text" id="newInput" value="' + title + '">');
				$('#output').html(newInput);
				//버튼 바꿔줌 
				$('#btndiv').empty();
				btnCreate2();
				
	    	});
	    	$(document).on('click', '#confirmBtn', function() {
	    	    // 새로 입력된 제목
	    	    var newTitle = $('#newInput').val();
	
	    	    $('#table_id tr:contains("'+ lastTitle +'") td:eq(1)').text(newTitle);
	    	    $('#output').html(newTitle);
	    	    $('#btndiv').empty();
	    	    btnCreate();
	    	   
	    	});
	    	
	    	$(document).on('click', '#delbtn', function() {
	    		console.log("삭제버튼 눌립니다~~");
	    		
				// 현재 클릭된 행을 찾아서 지운다
		        $('#table_id tr:contains("'+ lastTitle +'") td:eq(1)').empty();
       			// 출력란도 비워줌 
				$('#output').empty();
				
		            
			});
	    });
    });
	// 버튼 추가
    function btnCreate(){
		var button1 = "<button id='modbtn' class='btn-warning'>수정</button>";
       	var button2 = "<button id='delbtn' class='btn-danger'>삭제</button>";
       	var btns = button1+button2;
       	$("#btndiv").html(btns);
   		
 		
    }
	//수정 버튼 눌렀을때 만들어줄 확인,삭제 버튼
    function btnCreate2(){
		var button1 = "<button id='confirmBtn' class='btn-warning'>확인</button>";
       	var button2 = "<button id='delbtn' class='btn-danger'>삭제</button>";
        var btns = button1+button2;
       	
       	$("#btndiv").html(btns);
	}
	
    
    
    </script>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>