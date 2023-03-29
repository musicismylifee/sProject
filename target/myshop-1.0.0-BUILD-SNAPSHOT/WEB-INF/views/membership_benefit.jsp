<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 폰트적용 */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, sub, sup, tt, var, b, u, center,
	dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption,
	tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed,
	figure, figcaption, footer, header, hgroup, menu, nav, output, ruby,
	section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-family: 'Pretendard', 'SD Gothic Neo', 'Apple SD Gothic Neo',
		sans-serif;
	font-size: 12px;
	color: #666666;
	vertical-align: baseline;
	color: inherit;
}

.membership_benefit_content {
	width: 1080px;
	margin: auto;
	/* border: 1px solid black; */
	padding-bottom: 80px;
}

.membership_title {
	font-size: 36px;
	font-weight: 700;
	color: #222;
}

/* 상단 고객 등급알림 */
.grade_friends {
	display: flex;
	align-items: center;
	margin-top: 47px;
}

.grade_friends .icon {
	width: 80px;
	height: 80px;
	background:
		url(https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/grade-friends-80.png)
		no-repeat center;
	background-size: 80px;
}

.grade_friends .info {
	margin-left: 20px;
}

.grade_friends .user {
	font-size: 30px;
	color: #222;
}

.grade_friends .user .name {
	ont-weight: 700;
}

.grade_friends .user .level {
	font-weight: 700;
	color: #888;
}

.grade_friends .period {
	margin-top: 12px;
	font-size: 18px;
	line-height: 1.44;
	color: #222;
}

.grade_friends .period span {
	font-size: 18px;
	margin-left: 4px;
	color: #888;
}

/* 고객 맞춤 UI box */
.box {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	margin-top: 40px;
	height: 359px;
	padding-top: 11px;
	box-sizing: border-box;
	border-radius: 8px;
	box-shadow: 0 4px 8px 0 rgb(0 0 0/ 3%);
	border: 1px solid #f0f0f0;
	background-color: #fff;
}

.range_bar {
	position: relative;
	width: 640px;
	height: 8px;
	border-radius: 4px;
	background-color: #f5f5f5;
	display: block;
	flex-wrap: wrap;
}

.range_bar::before {
	content: "";
	position: absolute;
	width: 27px;
	height: 8px;
	border-radius: 4px;
	background: #888;
	transform-origin: left center;
	transition: width .35s;
}

.range_bar .end_point {
	position: absolute;
	left: 27px;
	top: 50%;
	width: 24px;
	height: 24px;
	/* transform 으로 x축 위치 변경가능 */
	transform: translate(-50%, -50%);
	transform-origin: center;
	box-sizing: border-box;
	border-radius: 100%;
	border: 1px solid #888;
	background: #fff url(data : image/ svg + xml, % 3Csvg xmlns =
		'http://www.w3.org/2000/svg' width = '6' height = '4' % 3E % 3Cpath d
		=
		'M5.564.11a.373.373 0 0 0-.53 0l-2.75 2.75L.96 1.537a.375.375 0 1 0-.53.53l1.59 1.59a.373.373 0 0 0 .53 0l3-3A.373.373 0 0 0 5.564.11z'
		fill = '%23888'/ % 3E % 3C/ svg % 3E) no-repeat center;
	background-size: 12px 8px;
	transition: all .35s;
}

.grade {
	position: relative;
	display: flex;
	flex-wrap: wrap;
	/* width:100%; */
	justify-content: space-between;
	margin-top: 14px;
	list-style: none;
}

.grade li {
	position: relative;
	font-size: 13px;
	line-height: 1.54;
	color: #aaa;
	text-align: left;
}

.next_level {
	margin-top: 40px;
}

.next_level .more_cost {
	font-size: 20px;
	line-height: 1.35;
	text-align: center;
	color: #222;
}

.next_level .more_cost .strong {
	font-weight: 700;
}

.next_level .cost_history {
	margin-top: 4px;
	font-size: 16px;
	line-height: 1.5;
	text-align: center;
	color: #888;
}

.next_level_info {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 40px;
	width: 220px;
	height: 48px;
	border-radius: 24px;
	background-color: #f5f5f5;
	border: 0;
	font-size: 16px;
	line-height: 1.5;
	color: #222;
}

.membership_benefit_content .box+.info_desc {
	margin-top: 26px;
}

.info_desc.gray2 {
	color: #222;
	font-size: 16px;
	line-height: 1.5;
}

.info_desc strong {
	font-weight: 600;
	color: #f52644;
}

.info_desc2 {
	margin-top: 12px;
	font-size: 13px;
	line-height: 1.54;
	color: #888;
}

.info_desc2 strong {
	font-weight: 400;
	color: #222;
}

/* 비 로그인 시 고객 맞춤 UI box */
.box.please_sign_in {
	justify-content: flex-start;
	margin-top: 48px;
	padding-top: 79px;
	height: 280px;
}

.box.please_sign_in p {
	font-size: 30px;
	text-align: center;
	color: #222;
}

.box.please_sign_in a {
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
	margin-top: 32px;
	width: 240px;
	height: 52px;
	border-radius: 4px;
	border: 1px solid #333;
	background-color: #fff;
	font-size: 16px;
	font-weight: 600;
	color: #222;
	text-decoration: none;
}

/* 등급별 혜택 테이블 */
.sub_tit {
	margin: 80px 0 32px;
	font-size: 26px !important;
	font-weight: 700;
	line-height: 1.35;
	color: #222;
}

.benefit_table {
	border-top: 1px solid #555;
}

.benefit_table table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
	border-spacing: 0;
}

.benefit_table tr {
	border-bottom: 1px solid #e6e6e6;
}

.benefit_table th {
	font-size: 16px;
	font-weight: 600;
	line-height: 1.5;
	color: #222;
	background: #fafafa;
	border-right: 1px solid #e6e6e6;
}

.benefit_table td {
	font-size: 16px;
	line-height: 1.5;
	color: #555;
}

.benefit_table th, .benefit_table td {
	padding: 20px 0;
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<!-- header  -->
	<jsp:include page="/header.do"></jsp:include>
	
	<div class="membership_benefit_content">
		<h1 class="membership_title">멤버십 혜택 안내</h1>
		<div class="grade_friends">
			<i class="icon"></i>
			<div class="info">
				<p class="user">
					<strong class="name">카카오회원</strong>님의 09월 등급은 <strong class="level">FRIENDS</strong>
					입니다.
				</p>
				<p class="period">
					현재 등급 산정기간 <span>2022.03.01 ~ 2022.08.31</span>
				</p>
			</div>
		</div>
		<!-- <div class="box please_sign_in">
			<p>로그인 후 멤버십 혜택을 만나보세요!</p>
			<a href="/member/login?redirect=%2Fmember%2Fmembership_benefit">나의
				멤버십 등급 확인하기</a>
		</div> -->


		<div class="box">
			<div class="range_grade_friends">
				<div class="range_bar">
					<i class="end_point"></i>
				</div>
				<ul class="grade">
					<li>FRIENDS</li>
					<li>MUST GREEN</li>
					<li>MUST BLUE</li>
					<li>MUST RED</li>
					<li>MUST BLACK</li>
				</ul>
			</div>
			<div class="next_level">
				<p class="more_cost">
					<strong>1건</strong>만 구매하셔도 다음 등급으로 상승할 수 있습니다.
				</p>
				<p class="cost_history">(최근 6개월간 구매완료 이력이 없습니다.)</p>
			</div>
			<button type="button" class="next_level_info"
				onclick="layer_mask('/layer/grade_next_month_ignore', 480, 360);">다음달
				예상 등급 안내</button>
		</div>
		<p class="info_desc gray2">- 기간 : 당월 직전 6개월간</p>
		<p class="info_desc gray2">
			- 대상 : 주문상태가 <strong>‘구매완료’인 주문 건</strong>의 실 결제금액(배송비, 오프라인 매장 구매
			제외)으로 계산
		</p>
		<p class="info_desc gray2">- 갱신 : 매월 1일</p>
		<p class="info_desc2">
			<strong>※ 구매완료란?</strong> 배송완료된 주문을 ‘구매결정’한 상태를 의미하며, 마이페이지 &gt; 주문내역
			조회에서 ‘구매완료’건 확인 가능
		</p>
		<h2 class="sub_tit">등급별 혜택</h2>


		<div class="benefit_table">
			<table>
				<colgroup>
					<col width="329">
					<col width="150">
					<col width="150">
					<col width="150">
					<col width="150">
					<col width="150">
				</colgroup>
				<tbody>
					<tr>
						<th>혜택</th>
						<td class="ptb_24"><i class="comp_grade_black_48 icon"></i>
							<p class="grade_name">MUST BLACK</p></td>
						<td class="ptb_24"><i class="comp_grade_red_48 icon"></i>
							<p class="grade_name">MUST RED</p></td>
						<td class="ptb_24"><i class="comp_grade_blue_48 icon"></i>
							<p class="grade_name">MUST BLUE</p></td>
						<td class="ptb_24"><i class="comp_grade_green_48 icon"></i>
							<p class="grade_name">MUST GREEN</p></td>
						<td class="ptb_24"><i class="comp_grade_friends_48 icon"></i>
							<p class="grade_name">FRIENDS</p></td>
					</tr>
					<tr>
						<th>등급 산정 기준</th>
						<td>최근 6개월<br>500만원 이상<br>구매회원
						</td>
						<td>최근 6개월<br>200만원 이상<br>구매회원
						</td>
						<td>최근 6개월<br>70만원 이상<br>구매회원
						</td>
						<td>최근 6개월<br>1건 이상의<br>구매회원
						</td>
						<td>머스트잇<br>회원가입 시
						</td>
					</tr>
					<tr>
						<th class="align_left">
							<div class="icon_box">
								<i class="comp_icon_cake_40"></i>
								<div class="info_container">
									<p class="name">생일 축하 쿠폰</p>
									<p class="info">발급 후 21일 이내 사용 가능</p>
									<p class="info">최소 100,000원 이상 결제 시 사용 가능</p>
									<p class="info">타 쿠폰 중복 사용 불가</p>
								</div>
							</div>
						</th>
						<td>○</td>
						<td>○</td>
						<td>○</td>
						<td>○</td>
						<td>○</td>
					</tr>
					<tr>
						<th class="align_left">
							<div class="icon_box align_center">
								<i class="comp_icon_repair_40"></i>
								<div class="info_container">
									<p class="name">횟수 제한없는 무상 A/S 서비스</p>
								</div>
							</div>
						</th>
						<td>12개월</td>
						<td>9개월</td>
						<td>9개월</td>
						<td>6개월</td>
						<td>6개월</td>
					</tr>
					<tr>
						<th class="align_left">
							<div class="icon_box">
								<i class="comp_icon_crown_40"></i>
								<div class="info_container">
									<p class="name">VIP만을 위한 전용 할인 혜택 제공</p>
									<p class="info">VIP만 입장 가능한 전용관 운영</p>
									<p class="info">전용관 오픈 시 사전 안내</p>
								</div>
							</div>
						</th>
						<td>○</td>
						<td>○</td>
						<td>○</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<th class="align_left">
							<div class="icon_box">
								<i class="comp_icon_dry_40"></i>
								<div class="info_container">
									<p class="name">런드리고 프리미엄 세탁 포인트 증정</p>
									<p class="info">30년 세탁 전문가들의 전담 케어</p>
									<p class="info">프리미엄 의류 전용 프로세스</p>
									<p class="info">업계 최고 보상률 (최대 100%)</p>
								</div>
							</div>
						</th>
						<td>20,000 포인트</td>
						<td>10,000 포인트</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<th class="align_left">
							<div class="icon_box align_center">
								<i class="comp_icon_cs_40"></i>
								<div class="info_container">
									<p class="name">통화대기 없는 VIP 전담 서비스</p>
								</div>
							</div>
						</th>
						<td>○</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<th class="align_left">
							<div class="icon_box align_center">
								<i class="comp_icon_box_40"></i>
								<div class="info_container">
									<p class="name">무료 반품 서비스</p>
								</div>
							</div>
						</th>
						<td>월 1회<br>(국내배송한정)
						</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<th class="align_left">
							<div class="icon_box align_center">
								<i class="comp_icon_vip_40"></i>
								<div class="info_container">
									<p class="name">VIP 오프라인 매장 행사 초청</p>
								</div>
							</div>
						</th>
						<td>○</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
				</tbody>
			</table>
		</div>
		<h2 class="sub_tit mb24">멤버십 등급 산정 기준 안내</h2>
		<p class="info_desc gray2">- 기간 : 당월 직전 6개월간</p>
		<p class="info_desc gray2">
			- 대상 : 주문상태가 <strong>‘구매완료’인 주문 건</strong>의 실 결제금액(배송비, 오프라인 매장 구매
			제외)으로 계산
		</p>
		<p class="info_desc gray2">- 갱신 : 매월 1일</p>
		<p class="info_desc2">
			<strong>※ 구매완료란?</strong> 배송완료된 주문을 ‘구매결정’한 상태를 의미하며, 마이페이지 &gt; 주문내역
			조회에서 ‘구매완료’건 확인 가능
		</p>
	</div>
</body>
</html>