<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<script type="text/javascript" src = "./js/jquery.js"></script>

<title>HealthJava 문의내역</title>
<link rel="stylesheet" type="text/css" 	href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>

<style type="text/css">
	/* 폰트 CSS */
	@font-face {
		font-family: 'KIMM_Bold';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2')
			format('woff2'); /* CDN 절대링크  */
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
		height: 100%;
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
		min-height: 200px;
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
	
	li {
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
	
	h3.page-title {
		font-size: 25px;
		color: black;
		font-weight: 400;
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
		text-align: center;
		padding: 10px 0 10px;
	}
	
	.board-table tbody th p {
		display: none;
	}
	
	.th-list {
		text-align: center;
		margin-top: 20px;
		margin-bottom: 20px;
		padding: 10px;
		background-color: #F4A460;
		border-bottom-color: white;
		border-bottom-width: 0.2px;
		border-bottom-style: solid;
	}
	
	.td-inputInfo {
		text-align: left;
		padding-left: 20px;
		padding-top: 20px;
	}
	
	.td-infoPs {
		text-align: left;
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
	
	div.submitBtn {
		float: left;
		margin-left: 100px;
	}
	
	#updateBtn {
		padding: 20px 80px;
		background-color: #FC5400;
		border: 1px solid white;
		color: white;
		font-size: 20px;
		font-weight: bold
	}
	
	#resetBtn {
		padding: 20px 120px;
		background-color: white;
		border: 1px solid lightgray;
		font-size: 20px;
		font-weight: bold;
	}
	
	#withdrawalBtn {
		padding: 20px 100px;
		background-color: #FC5400;
		border: 1px solid white;
		color: white;
		font-size: 20px;
		font-weight: bold
	}
	
	#changePwdBtn {
		padding: 20px 120px;
		background-color: #FC5400;
		border: 1px solid white;
		color: white;
		font-size: 20px;
		font-weight: bold
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
	
	a:hover.liList {
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
	
	table a:hover.orderList {
		text-decoration: underline;
		color: #FC5400;
		cursor: pointer;
	}
	
	table a:active.orderList {
		text-decoration: none;
		color: #FC5400;
	}
	/* 페이징 처리 */
	/* 페이징 전체 틀 */
	.pagination-container {
		margin: 10px auto;
		display: flex;
		justify-content: center;
	}
	
	.pagination {
		position: relative;
	}
	/* 'PREV' 전체 틀 */
	#pagination a {
		position: relative;
		display: inline-block;
		color: #B21948; /* 글자색상 */
		text-decoration: none;
		font-size: 1.2rem;
		padding: 8px 16px 10px;
	}
	/* 'PREV' 부분 */
	#pagination a:before {
		z-index: -1;
		position: absolute;
		height: 100%;
		width: 100%;
		content: "";
		top: 0;
		left: 0;
		background-color: #B21948;
		border-radius: 24px;
		-webkit-transform: scale(0);
		transform: scale(0);
		transition: all 0.2s;
	}
	
	#pagination a:hover, #pagination a #pagination-active {
		color: #fff;
	}
	
	#pagination a:hover:before, #pagination a #pagination-active:before {
		-webkit-transform: scale(1);
		transform: scale(1);
	}
	
	#pagination #pagination-active {
		color: #fff;
	}
	
	#pagination #pagination-active:before {
		-webkit-transform: scale(1);
		transform: scale(1);
	}
	/*'NEXT' 전체 틀 */
	#pagination-newer {
		margin-right: 50px;
	}
	
	#pagination-older {
		margin-left: 50px;
	}
	
	.productList tr {
		border-bottom: 1px solid #B21948;
	}
	
	.meau {
		padding-top: 30px;
		padding-left: 800px;
		font-family: 'KIMM_Bold';
	}
	
	.meau a {
		color: white;
		text-decoration: none;
	}
	
	select {
		padding: 5px 5px;
	}
	/* 문의하기 버튼 */
	#updateBtn {
		padding: 20px 80px;
		background-color: #B21948;
		border: 1px solid white;
		color: white;
		font-size: 20px;
		font-weight: bold;
	}
	.nonList{
		font-size: 15px;
		border-top: 1px solid #e7e7e7;
		text-align: center;
	    padding: 140px 0 36px;
		background: url(../images/bg_no_list.png) no-repeat 50% 40px;
	}
	#btn{
		background-color: #B21948; 
		color: white;
		border: 1px solid white; 
		padding: 3px;
	}
</style>
</head>
<body>
<%-- 전체영역 --%>
<div class="wrap">
	<%-- hearder --%>
	<header>
		<jsp:include page="../include/header.jsp" />
	</header>
	
	<%-- 메뉴 --%>
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
					<li style="margin-bottom: 30px;"><a href="myPage_inquiry" class="liList" style="color: #B21948;">1:1 문의 </a></li>

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
		
		<%-- 본문영역 --%>
		<div class="innerWrap">
		<section class="notice">
			
			<div class="page-title">
				<b style="text-align: left; font-size: 20px;">문의 내역</b><br>
			</div>
			
			<div id="board-list">
				<div class="container">
					<form action="inquiry_write" method="post">
						<table class="board-table">
							<tr>
								<th scope="col" class="th-date1">NO</th>
								<th scope="col" class="th-title">제목</th>
								<th scope="col" class="th-date">문의 유형</th>
								<th scope="col" class="th-date">작성일</th>
								<th scope="col" class="th-date">처리 현황</th>
								<th scope="col" class="th-date">비고</th>
							</tr>
						<c:if test="${!empty clientlist }">
						<c:forEach var="cs" items="${clientlist }">
							<tr>
								<td>${cs.client_no }</td>
								<td onclick="toggleAnswer(${cs.client_no});">${cs.client_title }
									<div id="answer_${cs.client_no}" style="display: none; color: #B21948;">
										<!-- 문의 내용을 여기에 표시  -->
										${cs.client_cont }
			                        </div></td>
								<td>${cs.client_category }</td>
								<td>${cs.client_date.substring(0,10) }</td>
								<c:if test="${c.client_cont_reply == ' ' }">
									<td>답변완료</td>
									</c:if>
									<c:if test="${c.client_cont_reply != ' '}">
									<td>대기</td>
									</c:if>
								<td>
									<input type="button" id="btn" value="수정" onclick="location=''" />
									<input type="button" id="btn" value="삭제" onclick="#" />
								</td>								
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty clientlist }">
								<tr>
									<th colspan="5" class="nonList">현재 문의한 내역이 없습니다.</th>
								</tr>
						</c:if>
						</table>
						<br>
						<div>
							<input type="submit" id="updateBtn" value="문의하기" />
						</div>					
					</form>
					
					<script>
					    function toggleAnswer(clientNo) {
					        var answerDiv = document.getElementById("answer_" + clientNo);
					        if (answerDiv.style.display === "none") {
					            answerDiv.style.display = "block";
					        } else {
					            answerDiv.style.display = "none";
					        }
					    }
					</script>
				</div>
			</div><!-- end board-list -->
			<%-- 페이징 시작 --%>
		<div id="pagination" style="width: 1000px;">
		    <c:if test="${page <= 1}">
		        PREV&nbsp;
		    </c:if>
		    <c:if test="${page > 1}">
		        <a href="myPage_inquiry?page=${page-1}">PREV</a>&nbsp;
		    </c:if>
		    
		    <c:forEach var="a" begin="${startrow}" end="${endrow}" step="1">
		        <c:if test="${a == page}">
		            [&nbsp;${a}&nbsp;]
		        </c:if>
		        <c:if test="${a != page}">
		            <a href="myPage_inquiry?page=${a}">[&nbsp;${a}&nbsp;]</a>&nbsp;
		        </c:if>
		    </c:forEach>
		    
		    <c:if test="${page >= maxpage}">
		        &nbsp;NEXT
		    </c:if>
		    <c:if test="${page < maxpage}">
		        <a href="myPage_inquiry?page=${page+1}">NEXT</a>
		    </c:if>
		</div>
		<%-- 페이징 끝 --%>
		</section>
		</div> <!-- end innerWrap -->
		
		</div> <!-- end main -->
	<%-- top 버튼 --%>
	<div id="topBtn">
		<span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
	</div>
	</section>
	
	<div class="clear"></div>
	
	<%-- footer --%>
	<footer>
		<jsp:include page="../include/footer.jsp" />
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

</script>
</body>
</html>