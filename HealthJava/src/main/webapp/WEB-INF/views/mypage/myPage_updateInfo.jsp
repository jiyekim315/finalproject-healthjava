<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<script type="text/javascript" src = "./js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/updateInfo.js"></script>

<title>HealthJava 마이페이지</title>
<%-- <link rel="stylesheet" href="./shop/puppyhome/controller_mypage/css/mypage.css">--%>

<%-- 우편관련 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
</script>
<%-- 우편 끝--%>

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
		height: 1200px;
		position: relative;
		top: 105px;
		left: 50%;
		transform: translateX(-50%);
	}
	
	section {
		height: 1200px;
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
		padding: 20px 0;
		/*추가*/
		width: 1000px;
		min-height: 200px;
		margin: 2px;
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
	
	.board-table .th-inputInfo {
		
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
	    background-color: #b21949;
	    border-bottom-color: white;
	    border-bottom-width: 0.2px;
	    border-bottom-style: solid;
	    color: white;
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
	
	/* 수정 버튼 */
	#updateBtn{
	    padding: 20px;
	    background-color: #b21949;
	    border: 2px solid #b21949;
	    font-size: 20px;
	    font-weight: bold;
	    color: white;
	    width: 200px;
	    text-align: center;
	}	
	
	#resetBtn{
	    padding: 20px;
	    background-color: white;
	    border: 2px solid #b21949;
	    font-size: 20px;
	    font-weight: bold;
	    color: #b21949;
	    width: 200px;
	    text-align: center;
	}
	
	#withdrawalBtn{
		padding: 20px 100px; 
		background-color: #FC5400; 
		border: 1px solid white; 
		color: white; 
		font-size: 20px; 
		font-weight: bold
	}
	
	#changePwdBtn{
		padding: 20px 120px; 
		background-color: #FC5400; 
		border: 1px solid white; 
		color: white; 
		font-size: 20px; 
		font-weight: bold
	}
	
	/*ajax*/
	#emailCheck {
	padding-left: 25px;
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
		/*border: 1px solid red;*/
	}
	
	.innerWrap {
		width: 1000px;
		min-height: 700px;
		padding: 20px;
		float: left;
		margin-top: 10px;
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
	
	/* '기본정보' '*필수사항' 중간 여백  */
	.indent {
		margin-left: 749px;
	}
</style>

</head>
<body>
   <%-- 전체 영역 --%>
   <div class="wrap">
      <%-- 헤더 영역 --%>
      <header>
         <%-- header include --%>
         <jsp:include page="../include/header.jsp"/>
      </header>
      <%-- 메뉴바 --%>
		<section>
			<div class="main">
				<%-- main 화면 상단 캐러셀 (캐러셀 필요 없는 페이지는 삭제 바람!)--%>
				<aside class="aside_left">
					<nav>
						<ul>
							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"><a href="myPage_Main" style="text-decoration: none; color: #B21948;">나의 쇼핑</a></li>
							<li><a href="myPage_Main" class="liList">주문ㆍ배송</a></li>
							<li><a href="myPage_like" class="liList">찜 목록</a></li>
							<li><a href="myPage_cart" class="liList">장바구니</a></li>
							<li><a href="myPage_review" class="liList">나의 상품후기</a></li>

							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"> 회원 정보</li>
							<li><a href="myPage_updateInfo" class="liList" style="color: #B21948;">회원정보 변경</a></li>
							<li><a href="myPage_changePwd" class="liList">비밀번호 변경</a></li>
							<li><a href="myPage_user_Withdrawal" class="liList">회원탈퇴</a></li>
							<li style="margin-bottom: 30px;"><a href="myPage_updateAddress" class="liList">배송지 관리</a></li>
							
							</ul>
					</nav>
				</aside>
		<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>
		<div class="innerWrap">
		<section class="notice">
			<!-- board list area -->
			<div class="page-title">
			<b style="text-align: left; font-size: 20px; margin-left:50px;">기본정보</b>
				<b class="indent" style="font-size: 13px;">* 필수 입력사항</b>
			</div>
			<br>
			<div class="page-title" style="margin-left: 50px;">
			<form method="post" action="member_update_ok" onsubmit="return update_check();">
				<table>
					<!--아이디 -->
					<tr>
						<th rowspan="2" class="th-list" width="170px" style="border-top-color: black; border-top-style: solid; border-top-width: 3px;">
							아이디</th>
						<td class="td-inputInfo" style="border-top-color: black; border-top-style: solid; border-top-width: 3px;">
							<input type="text" name="user_id" id="user_id" value="${em.user_id}" size="70" style="background-color: #ECECEC;" readonly>
						</td>
					</tr>

					<tr>
						<td class="td-infoPs"></td>
					</tr>

					<!--이름-->
					<tr>
						<th rowspan="2" class="th-list">이름 *</th>
						<td class="td-inputInfo"><input type="text" name="user_name" id="user_name" value="${em.user_name}" size="70" placeholder="예)홍길동"></td>
					</tr>
										
					<tr>
						<td class="td-infoPs">* 한글로 2~4자내로 입력</td>
					</tr>

					
					<!--생년월일-->
					<tr>
						<th rowspan="2" class="th-list" >
						생년월일 *</th>
						<td class="td-inputInfo">
								<input type="text" name="user_birth" id="user_birth" value="${em.user_birth}" size="70" placeholder="예)1999년 1월 1일 -> 990101">
						</td>
					
					<tr>
						<td class="td-infoPs">* 1999년 1월 1일 -> 990101</td>
					</tr>
					
					<!--성별-->
					<tr>
						<th rowspan="2" class="th-list" >
						성별 *</th>
						<td class="td-inputInfo">
								<input type="text" name="user_gender" id="user_gender" value="${em.user_gender}" size="70" placeholder="예)male or female or 남자  or 여자">
						</td>
					
					<tr>
						<td class="td-infoPs">* male or female or 남자  or 여자 (대소문자 구분안함)</td>
					</tr>
					
					<!--주소-->
					<tr>
						<th rowspan="4" class="th-list">주소 *</th>
						<td class="td-inputInfo"><input type="text" name="postCode" id="postCode" value="${em.postCode}" size="20" placeholder="우편번호"/>&nbsp;&nbsp;
						<input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" style="font-weight: bold; padding: 2px; background: #b21949; border: 2px solid #b21949; color: white;"/>
						</td>
					</tr>

					<tr>
						<td class="td-inputInfo"><input type="text" name="roadAddr" id="roadAddr" value="${em.roadAddr}"	size="70" placeholder="주소"></td>
					</tr>

					<tr>
						<td class="td-inputInfo"><input type="text" name="detailAddr" id="detailAddr" value="${em.detailAddr}" size="70" placeholder="상세주소"></td>
					</tr>
					
					<tr>
						<td class="td-infoPs"><input type="hidden" id="sample6_extraAddress" placeholder="참고항목" value=" "></td>
					</tr>
					       
					<!--이메일-->
					<tr>
						<th class="th-list" rowspan="2" >이메일</th>
						<td class="td-inputInfo"><input type="email" name="user_email" id="user_email" value="${em.user_email}"size="70" placeholder="예) abcdefg11@naver.com" readonly/>&nbsp;&nbsp;
						<%-- <input type="button" value="이메일 중복 검색" onclick="findEmail()" style="font-weight: bold; padding: 2px; background: #b21949; border: 2px solid #b21949; color: white;"/>
						</td>
						--%>
					</tr>
					
					<tr>
						<td class="td-infoPs">* abcdefg11@naver.com</td>
					</tr>
					
					<!--휴대전화-->
					<tr>
						<th rowspan="2" class="th-list">휴대전화 *</th>
						<td class="td-inputInfo">
								<input type="text" name="user_phone" id="user_phone" size="70" value="${em.user_phone}" placeholder="예)010-1234-5678 -> 01012345678">
						</td>
					</tr>
					
					<tr>
						<td class="td-infoPs">* 010-1234-5678 -> 01012345678</td>
					</tr>
				</table>
				
			<br><br>
			
				<div class="submitBtn" style="margin-left: 200px;">
				<input id="updateBtn" type="submit" value="회원정보수정">
				<input id="resetBtn" type="reset" value="취소">
				</div>
				</form>

			</div>
			</section>		
			</div>
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
		
		<%-- 장바구니 부분 --%>
		/* Set values + misc */
		var promoCode;
		var promoPrice;
		var fadeTime = 300;

		/* Assign actions */
		$('.quantity input').change(function() {
			updateQuantity(this);
		});

		$('.remove button').click(function() {
			removeItem(this);
		});

		$(document).ready(function() {
			updateSumItems();
		});

		$('.promo-code-cta').click(function() {

			promoCode = $('#promo-code').val();

			if (promoCode == '10off' || promoCode == '10OFF') {
				//If promoPrice has no value, set it as 10 for the 10OFF promocode
				if (!promoPrice) {
					promoPrice = 10;
				} else if (promoCode) {
					promoPrice = promoPrice * 1;
				}
			} else if (promoCode != '') {
				alert("Invalid Promo Code");
				promoPrice = 0;
			}
			//If there is a promoPrice that has been set (it means there is a valid promoCode input) show promo
			if (promoPrice) {
				$('.summary-promo').removeClass('hide');
				$('.promo-value').text(promoPrice.toFixed(0) + "원");
				recalculateCart(true);
			}
		});

		/* Recalculate cart */
		function recalculateCart(onlyTotal) {
			var subtotal = 0;

			/* Sum up row totals */
			$('.basket-product').each(function() {
				subtotal += parseFloat($(this).children('.subtotal').text());
			});

			/* Calculate totals */
			var total = subtotal;

			//If there is a valid promoCode, and subtotal < 10 subtract from total
			var promoPrice = parseFloat($('.promo-value').text());
			if (promoPrice) {
				if (subtotal >= 10) {
					total -= promoPrice;
				} else {
					alert('Order must be more than £10 for Promo code to apply.');
					$('.summary-promo').addClass('hide');
				}
			}

			/*If switch for update only total, update only total display*/
			if (onlyTotal) {
				/* Update total display */
				$('.total-value').fadeOut(fadeTime, function() {
					$('#basket-total').html(total.toFixed(0) + "원");
					$('.total-value').fadeIn(fadeTime);
				});
			} else {
				/* Update summary display. */
				$('.final-value').fadeOut(fadeTime, function() {
					$('#basket-subtotal').html(subtotal.toFixed(0) + "원");
					$('#basket-total').html(total.toFixed(0) + "원");
					if (total == 0) {
						$('.checkout-cta').fadeOut(fadeTime);
					} else {
						$('.checkout-cta').fadeIn(fadeTime);
					}
					$('.final-value').fadeIn(fadeTime);
				});
			}
		}

		/* Update quantity */
		function updateQuantity(quantityInput) {
			/* Calculate line price */
			var productRow = $(quantityInput).parent().parent();
			var price = parseFloat(productRow.children('.price').text());
			var quantity = $(quantityInput).val();
			var linePrice = price * quantity;

			/* Update line price display and recalc cart totals */
			productRow.children('.subtotal').each(function() {
				$(this).fadeOut(fadeTime, function() {
					$(this).text(linePrice.toFixed(0) + "원");
					recalculateCart();
					$(this).fadeIn(fadeTime);
				});
			});

			productRow.find('.item-quantity').text(quantity);
			updateSumItems();
		}

		function updateSumItems() {
			var sumItems = 0;
			$('.quantity input').each(function() {
				sumItems += parseInt($(this).val());
			});
			$('.total-items').text(sumItems);
		}

		/* Remove item from cart */
		function removeItem(removeButton) {
			/* Remove row from DOM and recalc cart total */
			var productRow = $(removeButton).parent().parent();
			productRow.slideUp(fadeTime, function() {
				productRow.remove();
				recalculateCart();
				updateSumItems();
			});
		}
		
		<%-- 리뷰 작성 페이지 부분 --%>
		// 왼쪽 사이드바의 '나의 후기' 텍스트 클릭시 새창 열기
		function openPopup_review_write() {
	        var page_width = '490';
	        var page_height = '900';
	    
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var page_left = Math.ceil((window.screen.width - page_width)/2);
	        var page_top = Math.ceil((window.screen.height - page_height)/2);
	
	    window.open("http://localhost:8046/MVC/page/mypage2/review_write.jsp", "review_write",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
	    
	    }
		
	</script>
</body>
</html>