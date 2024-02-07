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
<style>
form {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            width: 50%; /* 폼의 너비를 조정할 수 있습니다. */
            margin: 0 auto; /* 가운데 정렬합니다. */
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
        }
        input[type="radio"] {
            display: inline-block; 
            margin-right: 10px; 
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
                        <li>CH05</li>
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
						  	[문제]
						 	 아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 입력받을 폼을 구성
						 	 하고 입력된 값을 process페이지로 넘겨주세요.
						 	 > 성별의 데이터는 남자일때 M, 여자일때 G로 설정해주세요.
						 	 - ch05_test_process.jsp 경로로 입력받은 데이터를 전송해주세요.
						  -->
						<form action="ch05_test_process.jsp" method="post">
							<table>
								<tr>
									<td>아이디 :</td>
									<td><input type="text" name="id" /></td>
								</tr>
								<tr>
									<td>비밀번호 :</td>
									<td><input type="text" name="pw" /></td>
								</tr>
								<tr>
									<td>이름 :</td>
									<td><input type="text" name="name" /></td>
								</tr>
								<tr>
									<td>성별 :</td>
									<td><input type="radio" name="gender" value="M" />남자 <input
										type="radio" name="gender" value="G" />여자</td>
								</tr>
								<tr>
									<td>핸드폰번호 :</td>
									<td><input type="text" name="phone" /></td>
								</tr>
								<tr>
									<td>주소 :</td>
									<td><input type="text" name="addr" /></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><input
										type="submit" value="전송" /></td>
								</tr>
							</table>
						</form>




					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>