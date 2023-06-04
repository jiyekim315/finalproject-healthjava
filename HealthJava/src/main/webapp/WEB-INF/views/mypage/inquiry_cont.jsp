<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/updateInfo.js"></script>
<script src="./js/addr_edit.js"></script>
<script src="./js/post2.js"></script>

<title>HealthJava 문의글</title>

<style type="text/css">
		/* 폰트 CSS */
	@font-face {
		font-family: 'KIMM_Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2'); /* CDN 절대링크  */
		font-weight: 700;
		font-style: normal;
	}
	/* 되도록 안건드리는 영역 */
	* {
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		font-family: 'KIMM_Bold', sans-serif;
	}
	
	html {
		height: 100%;
	}
	
	body {
		margin: 0px;
		min-height: 100%;
		padding: 0px;
	}
	
	header {
		width: 100%;
		position: fixed;
		z-index: 2;
	}
	
	footer {
		bottom: 0;
		z-index: 5;
		position: relative;
	}
	
	.wrap {
		margin-top: -110px;
		min-height: 100%;
		position: relative;
	}
	
	.main {
		width: 1600px;
		height: auto;
		position: relative;
		top: 105px;
		left: 50%;
		transform: translateX(-50%);
	}
	
	/* 클리어 */
	.clear {
		clear: both;
	}
	/* 밑의 영역부터 css시작 */
	.container {
		width: 100%;
	}

	/*MyPage CSS*/
	table {
		border-collapse: collapse;
		border-spacing: 0;
	}
	section.notice {
		width: 1000px;
		min-height: 900px;
	}
	
	.aside_left {
		margin-top: 45px;
		margin-left: 60px;
		width: 180px;
		min-height: 700px;
		float: left;
		text-align: left;
	}
	
	.aside_left nav {
		min-height: 600px;
		margin-bottom: 50px;
	}
	
	.aside_left li {
		padding-top: 8.2px;
		padding-bottom: 2px;
		list-style: none;
	}
	
	li{
		padding-top: 10px;
	}
	nav {
		min-height: 600px;
		margin-bottom: 50px;
	}
	
	#subspan {
		color: #808080;
	}
	
	div.page-title {
		width: 1000px;
		min-height: 10px;
		padding: 0px 10px;
		text-align: left;
	}
	
	.memBasicInfo {
		height: 120px;
		padding: 20px;
		float: left;
	}
	
	#board-search .search-window {
		width: 1000px;
		min-height: 80px;
		padding: 15px 0;
		text-align: left;
	}
	.board-table {
		font-size: 13px;
		width: 100%;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	
	.board-table th {
		text-align: center;
		border-top-style: solid;
		border-top-color: black;
		border-top-width: 2px;
	}
	
	.board-table .th-num {
		width: 100px;
		text-align: center;
	}
	
	table th.th-title {
		font-size: 15px;
		width: 200px;
	}
	
	table td.td-title {
		font-size: 13px;
	}
	
	table th.th-date {
		font-size: 15px;
		width: 80px;
	}
	
	table th.th-date1 {
		font-size: 15px;
		width: 50px;
	}
	
	table th.th-date2 {
		font-size: 15px;
		width: 150px;
	}

	.board-table th, .board-table td {
		padding-top: 14px;
		padding-bottom: 14px;
	}
	
	.board-table tbody td {
		border-top: 1px solid #e7e7e7;
		text-align: center;
		font-size: 15px;
	}
	
	.board-table tbody th {
		font-size: 15px;
		border-top: 1px solid #e7e7e7;
		text-align: center;
	}
	
	.board-table thead th {
		text-align: center;
	}
	
	.board-table tbody th p {
		display: none;
	}
	
	.th-list{
		text-align: center;
	    margin-top: 20px;
	    margin-bottom: 20px;
	    padding: 10px;
	    background-color: #B21948;
	    border-bottom-color: white;
	    border-bottom-width: 0.2px;
	    border-bottom-style: solid;
	    color: white;
		border-top-color: black; 
		border-top-style: solid; 
		border-top-width: 3px; 
		border-bottom-color: black; 
		border-bottom-width: 3px;
	}
	
	.td-inputInfo{
		text-align:left;
		padding-left: 20px;
		padding-top: 20px;
	}
	
	.td-infoPs{
		text-align : left;
		padding-left: 20px;
		padding-top: 5px;
		padding-bottom: 15px;
		border-bottom-color: gray;
		border-bottom-width: 0.2px;
		border-bottom-style: solid;
		font-size: 12px; 
		font-weight: bold;
		color: red;
	}
	div.submitBtn{
		float: left;
		margin-left: 100px;
	}
	
	/* 확인 버튼 */
	#updateBtn{
	    padding: 20px 120px;
	    background-color: #B21948;
	    border: 1px solid white;
	    color: white;
	    font-size: 20px;
	    font-weight: bold;
	}	
	/* 취소 버튼 */
	#resetBtn{
	    padding: 20px 120px;
	    background-color: white;
	    border: 2px solid #B21948;
	    font-size: 20px;
	    font-weight: bold;
	    color: #B21948;
	}
	
	/* reset */
	* {
		list-style: none;
		text-decoration: none;
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	} 
	
	.clearfix:after {
		content: '';
		display: block;
		clear: both;
	}
	
	div.myPageTitle {
		width: 1100px;
		margin: 0 auto;
		border: 1px solid red;
	}
	
	div.container {
		width: 1000px;
		margin: 20px 0px;
	}
	
	.innerWrap {
		width: 1000px;
		min-height: 700px;
		padding: 20px;
		float: left;
		margin-top: 50px;
		margin-left: 100px;
	}
	
	.blind {
		position: absolute;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		margin: -1px;
		width: 1px;
		height: 1px;
	}
	
	.clear {
		clear: both; /*float 속성을 제거함으로써 잘못 된 ui 적용을 막아줌 */
	}
	
	/* a 링크 : 메뉴바 */	
	a:link.liList {
		text-decoration: none;
		color: #a399a2;
	}
	
	a:visited.liList {
		text-decoration: none;
		color: #a399a2;
	}
	
	a:hover.liList{
		text-decoration: underline;
		color: #B21948;
	}
	
	a:active.liList {
		text-decoration: none;
		color: #B21948;
	}
	
	table a:link.orderList {
		text-decoration: none; 
		color: black;
	}
	
	table a:visited.orderList {
		text-decoration: none;
		color: black;
	}
	
	table a:hover.orderList{
		text-decoration: underline;
		color: #FC5400;
		cursor: pointer;
	}
	
	table a:active.orderList {
		text-decoration: none;
		color: #FC5400;
	}
	input.btn{
	    padding: 20px 80px;
	    background-color: #B21948;
	    border: 1px solid white;
	    color: white;
	    font-size: 20px;
	    font-weight: bold;
	}
</style>
</head>
<body>
<div class="wrap">
      <%-- 헤더 영역 --%>
      <header>
         <%-- header include --%>
         <jsp:include page="../include/header.jsp"/>
      </header>
      <%-- 메뉴바 --%>
		<section>
			<div class="main">
				<aside class="aside_left">
					<nav>
						<ul>
							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"><a href="myPage_Main" style="text-decoration: none; color: black;">나의 쇼핑</a></li>
							<li><a href="myPage_order" class="liList">주문ㆍ배송</a></li>
							<li><a href="myPage_orderDetails" class="liList">교환/반품/환불</a></li>
							<li><a href="myPage_like" class="liList">찜 목록</a></li>
							<li><a href="myPage_cart" class="liList">장바구니</a></li>
	
							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"> 회원 정보</li>
							<li><a href="myPage_updateInfo" class="liList">회원정보 변경</a></li>
							<li><a href="myPage_changePwd" class="liList">비밀번호 변경</a></li>
							<li><a href="myPage_user_Withdrawal" class="liList">회원탈퇴</a></li>
							<li style="margin-bottom: 30px;"><a href="myPage_updateAddress" class="liList">배송지 관리</a></li>
							
							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"> 나의 상품후기</li>
							<li><a href="myPage_review" class="liList">나의 상품후기</a></li>
						</ul>
					</nav>
				</aside>
	<div class="innerWrap">
		<section class="notice">
	<!-- 문의글 보기  --> 
	<div id="addAddressPopup" class="popup">
		<div class="popup-content">
			<h2 align="center" style="font-family: 'KIMM_Bold';">문의글</h2>
			<form action="inquiry_write_ok" method="post">
			<input type="hidden" name="user_id" value="${id }" />
			<br>
			<div class="page-title" style="margin-left: 50px;">
				<table>
					<!-- 이름 : user_id-->
					<tr>
						<th rowspan="2" class="th-list" width="170px">이름</th>
						<td class="td-inputInfo" style="border-top-color: black; border-top-style: solid; border-top-width: 3px;">
							<input type="text" name="user_id" id="user_id" value="${id }" size="70" style="background-color: #ECECEC;" readonly>
						</td>
					</tr>

					<tr>
						<td class="td-infoPs"></td>
					</tr>

					<!-- 문의 유형  client_category : 회원정보, 상품확인, 주문/결제, 배송, 교환/취소/반품, 서비스 -->
					<tr>
						<th rowspan="2" class="th-list" >*문의유형</th>
						<td class="td-inputInfo">
								<label name="inquiry">카테고리 선택:</label>
									<input type="radio" name="client_category" value="">회원정보
									<input type="radio" name="client_category" value="상품확인">상품확인
									<input type="radio" name="client_category" value="주문/결제">주문/결제
									<input type="radio" name="client_category" value="배송">배송
									<input type="radio" name="client_category" value="교환/취소/반품">교환/취소/반품
									<input type="radio" name="client_category" value="서비스">서비스
									<input type="radio" name="client_category" value="기타">기타
							</td>
					
					<tr>
						<td class="td-infoPs"></td>
					</tr>
					
					<!--제목 : client_title-->
					<tr>
						<th rowspan="2" class="th-list">제목</th>
						<td class="td-inputInfo">
								<input type="text" name="client_title" id="client_title" size="70" placeholder="최대 20자 이내">
						</td>
					</tr>
					
					<tr>
						<td class="td-infoPs"></td>
					</tr>
					
					<!-- 내용 : client_cont -->
					<tr>
						<th rowspan="2" class="th-list">제목</th>
						<td class="td-inputInfo">
								<textarea name="client_cont" id="client_cont" style="width:100%; height: 200px;" placeholder="상담내용 본문에는 개인정보를 입력하지 말아주세요. 
고객정보보호를 위해 마스킹 처리될 수 있습니다.
(예 : 성명, 연락처, 이메일주소, 계좌번호 등)"></textarea>
						</td>
					</tr>
					<tr>
						<td class="td-infoPs"></td>
					</tr>
					
				</table>
				<div style="padding: 10px 0px 0px 10px;">
					<span style="color: red;">*이메일, 휴대전화번호 정보 수정을 원하시는 경우 회원정보 수정을 통해 변경해주시기 바랍니다.</span>
				</div>
			<br><br>
			
				<div class="submitBtn" style="margin-left: 200px;">
					<input type="submit" id="updateBtn" value="작성완료">
					<input type="reset" id="resetBtn" value="취소" onclick="location='myPage_inquiry'">
				</div>
				</form>
			</div>
			</div>
			</section>
			</div>
					
        <%-- top버튼 삭제 X --%>
         <div id="topBtn">
            <span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
         </div>
		</section>
		<div class="clear"></div>
		<%-- 푸터 영역 --%>
		<footer>
			<!-- footer -->
			<jsp:include page="../include/footer.jsp"/>
			<!-- footer 끝 -->
		</footer>
	</div>
	<script type="text/javascript">
	
		<%-- top버튼 부분 --%>
		// 클릭 이벤트 핸들러
		$("#topBtn").click(function(e) {
			e.stopPropagation();
			$("html, body").animate({
				scrollTop : 0
			}, 'fast', 'easeOutCubic');
		});

		// 스크롤 이벤트 핸들러
		$(window).scroll(function() {
			if ($(window).scrollTop() == 0) {
				$("#topBtn").css("opacity", 0); // TOP 버튼 숨기기
			} else {
				$("#topBtn").css("opacity", 1); // TOP 버튼 나타내기
			}
		});

		/*수정 버튼 클릭*/
		function edit_check() {
			var answer = confirm("수정하시겠습니까?");
			if (answer == true) {
				alert("수정 완료되었습니다.");
				document.getElementById("editForm").submit();
				console.log()
				window.close();
				return true;
			} else {
				return false;
			}
		}
		function closePopup() {
			reloadFlag = true; // 새로고침 플래그를 true로 설정하여 팝업 창이 닫힐 때 새로고침되지 않도록 함
			window.opener.location.reload(); // 팝업 창이 닫힌 후에 myPage_updateAddreess.jsp를 새로고침
			window.close();
			return true;
		}
	</script>
		</div>
	</div>
</body>
</html>