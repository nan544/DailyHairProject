<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style type="text/css">
span {
	color: red;
}
#search{
width : 130px;
float: left;
margin-right: 5px;
}
#keyword{
width : 200px;
float: left;
margin-right: 5px;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
	
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.3.min.js" type="application/javascript"></script>

<script type="text/javascript">

	$(function() {
		$("#hidden").hide();
		
		//아이디 클릭시 상세보기 팝업창을 띄운다
		$(".detail").click(
				function() {
					var m_id = $(this).parents("tr").attr("data-num");
					alert(m_id);
					window.open("/admin/member/memberDetailForm.do?m_id="
							+ m_id, "memberpop",
							"width=800, height=700, left=600, top=100");
				});
		
		
	 	//검색 후 검색 대상과 검색 단어를 출력한다
		var word = "<c:out value='${data.keyword}'/>";
		var value="";
		if(word!=""){
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
			
			if($("#search").val() =='m_name'){
				value = "#list tr td.name";
			}else if($("#search").val() == 'm_phone'){
				value = "#list tr td.phone";
			}
			
			$(value+":contains('"+word+"')").each(function(){
				var regex = new RegExp(word,'gi');
				$(this).html($(this).text().replace(regex,"<span class='required'>"+word+"</span>"));
			});
		} 	
		 
		//검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function(){
			if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		//검색 버튼 클릭 시 처리 이벤트
		$("#searchData").click(function(){
			
			if($("#search").val()!="all"){
				if(!chkSubmit($("#keyword"),"검색어를")) return;				
			}
			goPage(1);
		});
		
		//클릭할떄마다 정렬
		$(".order").click(function(){
			var order_by = $(this).attr("data-value");
			$("#order_by").val(order_by);
			
			if($("#order_sc").val()=="DESC"){
				$("#order_sc").val("ASC");
			}else{
				$("#order_sc").val("DESC");
			}
			goPage(1);
			
		});
		
		
		//결제API 사용 << 추후에추가
		$(".a").click(function(){
			BootPay.request({
				price: '5000', //실제 결제되는 가격
				application_id: "",
				name: '블링블링 마스카라', //결제창에서 보여질 이름
				pg: 'kakao',
				method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				items: [
					{
						item_name: '나는 아이템', //상품명
						qty: 1, //수량
						unique: '123', //해당 상품을 구분짓는 primary key
						price: 1000, //상품 단가
						cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
						cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
						cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
					}
				],
				user_info: {
					username: '사용자 이름',
					email: '사용자 이메일',
					addr: '사용자 주소',
					phone: '010-1234-4567'
				},
				order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
				account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra: {
				    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
			        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
			        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			}).error(function (data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function (data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function (data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			}).confirm(function (data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function (data) {
			    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
			    console.log(data);
			}).done(function (data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
			});
		});
		
		
	});
	
	//검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/member/memberList.do"
		});
		$("#f_search").submit();
	}
	
	function chkSubmit(item, msg) {
		if(item.val().replace(/\s/g,"")=="") {
			alert(msg+" 입력해 주세요.");
			item.val("");
			item.focus();
			return false;
		} else {
			return true;
		}
	}

</script>
</head>
<body>
	<h1>회원목록</h1>
	<form id="detailForm" name="detailForm">
		<input type="hidden" name="m_num" id="m_num" />
	</form>
	<p>
		<span>*</span>아이디를 클릭하면 상세보기
	</p>
	<div class="memberListContainer">
	<table class="table table-hover">
		<colgroup>
			<col width="15%">
			<col width="10%">
			<col width="10%">
			<col width="5%">
			<col width="15%">
			<col width="15%">
			<col width="20%">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<td align="center" data-value="m_num" class="order"><strong>회원번호</strong>
					<c:choose>
						<c:when test="${data.order_by == 'm_num' and data.order_sc == 'ASC'}">▲</c:when>
						<c:when test="${data.order_by == 'm_num' and data.order_sc == 'DESC'}">▼</c:when>
						<c:otherwise>▲</c:otherwise>
					</c:choose>
				</td>
				<td align="center"><strong>아이디</strong></td>
				<td align="center"><strong>이름</strong></td>
				<td align="center"><strong>성별</strong></td>
				<td align="center"><strong>이메일</strong>
				<td align="center"><strong>연락처</strong></td>
				<td align="center" data-value="m_date" class="order"><strong>등록일</strong>
						<c:choose>
						<c:when test="${data.order_by == 'm_date' and data.order_sc == 'ASC'}">▲</c:when>
						<c:when test="${data.order_by == 'm_date' and data.order_sc == 'DESC'}">▼</c:when>
						<c:otherwise>▲</c:otherwise>
					</c:choose></td>
				<td align="center"><strong>상태</strong></td>
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty memberList}">
					<hr>
					<c:forEach var="member" items="${memberList}">
						<tr data-num="${member.m_id}">
							<td align="center">${member.m_num}</td>
							<td align="center" class="detail">${member.m_id}</td>
							<td align="center" class="name">${member.m_name}</td>
							<td align="center">${member.m_gender}</td>
							<td align="center">${member.m_email}</td>
							<td align="center" class="phone">${member.m_phone}</td>
							<td align="center">${member.m_date}</td>
							<c:if test="${member.m_state == 1}">
								<td align="center">활성화</td>
							</c:if>
							<c:if test="${member.m_state == 0}">
								<td align="center">비활성화</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>등록된 회원이 없습니다</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
	<br>
	<form name="f_search" id="f_search">
	<div class="optionContainer" align="center">
			<input type="hidden" id="page" name="page" value="1"/>
			<input type="hidden" id="order_by" name="order_by" value="${data.order_by}"/>
			<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}"/>
				<table>
					<colgroup>
						<col width="70%">
						<col width="30%">
					</colgroup>
					<tr>
					<td><select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="m_name">이름</option>
							<option value="m_phone">전화번호</option>
						</select>
						<input type="text" id="hidden">
						<input type="text" name="keyword" id="keyword" class="form-control"/>
						<input type="button" id="searchData" value="검색" class="btn"/>
						</td>
					</tr>	
				</table>
				</div>
		</form>
		<div id="boardPage">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
		</div>
		<!-- 결제API사용시 씁니당 추후 사용예정 -->
		<input type="button" class="a"/>
</body>
</html>