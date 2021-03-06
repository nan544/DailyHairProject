<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술등록</title>
<style type="text/css">
span {
	color: red;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
//숫자만 입력하게하는 정규식.
function numberChk(input) {
	if($(input).val()!=""){
		var num_regExp = new RegExp("[0-9]$","i");	//only number
		var match = num_regExp.exec($(input).val());
		//alert(match);
		if(match==null){
			alert("숫자를 입력해주세요");
			$(input).val("");
		}else{
			return true;
		}
	}
} 

//자식팝업창이 닫히는지 1초마다검사하고 닫힐시 콜백함수 실행하는 메소드
var openDialog = function(uri, name, options, closeCallback) {
    var win = window.open(uri, name, options);
    var interval = window.setInterval(function() {
        try {
            if (win == null || win.closed) {
                window.clearInterval(interval);
                closeCallback(win);
            }
        }
        catch (e) {
        }
    }, 1000);
    return win;
};



	$(function() {
		
		//닫기 버튼 클릭시 닫기
		$("#closeBtn").click(function(){
			window.close();	
		});
		
		//등록버튼 클릭시 실행
		$("#insertBtn").click(function() {

			var des_num = $(".num").val();
			var styling_option = $("#styling_option").val();
			var styling_name = $("#styling_name").val();
			var styling_price = $("#styling_price").val();

			if (!chkSubmit($("#styling_name"), "시술명을")) {
				return;
			}else if($(".num").val()== '#'){ 
				alert("디자이너를 선택하세요");
				return;
			}else if (!chkSubmit($("#styling_price"), "시술가격을")) {
				return;
			} else if (!numberChk($("#styling_price"))) {
				return;
			} else {
				if (confirm("등록하시겠습니까?")) {
					$.ajax({
						url : "/admin/style/insertStyling.do",
						type : "post",
						data : {
							"des_num" : des_num,
							"styling_option" : styling_option,
							"styling_name" : styling_name,
							"styling_price" : styling_price
						},
						success : function(data) {
							if (data == 1) {
								alert("시술 등록에 성공하였습니다.");
								$("#styling_name").val("");
								$("#styling_price").val("");
							
							//성공시 적용된 화면을 보여주기위해 비동기로 적용된 리스트 출력하기
							$.ajax({
							url : "/admin/style/styleAjax.do",
							type : "post",
							data : {
								"des_num" : des_num
							},
							
							success : function(data){
							$(".ajax").html("");
							let html = "";
							if(data.length == 0){
								html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
							}else{
							for(let i =0; i<data.length; i++){
								html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
								+'<td>' + '* 시술 구분'+ '</td>'
								+'<td> <input type='+'"text"'+'name="styling_option" value='+data[i].styling_option+' readonly size="10">'+'</td>'
								+'<td>' + '* 시술명' + '</td>'
								+'<td> <input type='+'"text"'+'name="styling_name" id="styling_name1" value='+  data[i].styling_name +' readonly>'+'</td>'
								+'<td>' + '* 시술가격' + '</td>'
								+'<td> <input type='+'"text"'+'name="styling_price" id="styling_price1" value='+  data[i].styling_price +' readonly>'+'</td>'
								+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn">'+'</td>'
								+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn">'+'</td>'
								+'</tr>'
								} 
							}
							$(".ajax").append(html);
							}
						}); //ajax 끝
							} else {
								alert("시술 등록에 실패하였습니다.");
							}
						}
					});// ajax종료												
				}
			}
		});
		
		//디자이너 선택시마다 선택된 디자이너의 시술목록을 불러옴
		$(".num").change(
				function() {
						var des_num = $(".num").val();
						
						$.ajax({
							url : "/admin/style/styleAjax.do",
							type : "post",
							data : {
								"des_num" : des_num
							},
							success : function(data){
							$(".ajax").html("");
							let html = "";
							if(data.length == 0){
								html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
							}else{
							for(let i =0; i<data.length; i++){
								html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
								+'<td>' + '* 시술 구분'+ '</td>'
								+'<td> <input type='+'"text"'+'name="styling_option" value='+data[i].styling_option+' readonly size="10">'+'</td>'
								+'<td>' + '* 시술명' + '</td>'
								+'<td> <input type='+'"text"'+'name="styling_name" id="styling_name1" value='+  data[i].styling_name +' readonly>'+'</td>'
								+'<td>' + '* 시술가격' + '</td>'
								+'<td> <input type='+'"text"'+'name="styling_price" id="styling_price1" value='+  data[i].styling_price +' readonly>'+'</td>'
								+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn">'+'</td>'
								+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn">'+'</td>'
								+'</tr>'
								} 
							}
							$(".ajax").append(html);
							}
						}); //ajax 끝
				});
		
		//수정버튼 클릭시 팝업창띄움
		$(document).on("click",".updateBtn",function(event){
			var styling_num = $(this).parents("tr").attr("data-num");
			alert(styling_num);
			
			//자식 팝업창이 닫히면 콜백함수실행됨
			openDialog("/admin/style/styleUpdateForm.do?styling_num="+styling_num, "pop1", "width=850, height=350, left=700, top=200",function(win){
				
				var des_num = $(".num").val();
				
				//동적으로  시술 리스트를 출력함
				$.ajax({
					url : "/admin/style/styleAjax.do",
					type : "post",
					data : {
						"des_num" : des_num
					},
					success : function(data){
					$(".ajax").html("");
					let html = "";
					if(data.length == 0){
						html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
					}else{
					for(let i =0; i<data.length; i++){
						html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
						+'<td>' + '* 시술 구분'+ '</td>'
						+'<td> <input type='+'"text"'+'name="styling_option" value='+data[i].styling_option+' readonly size="10">'+'</td>'
						+'<td>' + '* 시술명' + '</td>'
						+'<td> <input type='+'"text"'+'name="styling_name" id="styling_name1" value='+  data[i].styling_name +' readonly>'+'</td>'
						+'<td>' + '* 시술가격' + '</td>'
						+'<td> <input type='+'"text"'+'name="styling_price" id="styling_price1" value='+  data[i].styling_price +' readonly>'+'</td>'
						+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn">'+'</td>'
						+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn">'+'</td>'
						+'</tr>'
						} 
					}
					$(".ajax").append(html);
					}
				}); //ajax 끝
				
			});
			
		});
		
		//삭제 버튼 클릭시 실행 deleteBtn
			$(document).on("click",".deleteBtn",function(event){
			var styling_num = $(this).parents("tr").attr("data-num");
			var des_num = $(".num").val();
			alert(styling_num);
			
			$.ajax({
				url : "/admin/style/deleteStyling.do",
				type : "post",
				data : {
					"styling_num" : styling_num
				},
				success : function(data){
					if (data == 1) {
						if(confirm("삭제하시겠습니까?")){
							alert("시술 삭제에 성공하였습니다.");
							
							//성공시 적용된 화면을 보여주기위해 비동기로 적용된 리스트 출력하기
							$.ajax({
								url : "/admin/style/styleAjax.do",
								type : "post",
								data : {
									"des_num" : des_num
								},
								success : function(data){
								$(".ajax").html("");
								let html = "";
								if(data.length == 0){
									html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
								}else{
								for(let i =0; i<data.length; i++){
									html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
									+'<td>' + '* 시술 구분'+ '</td>'
									+'<td> <input type='+'"text"'+'name="styling_option" value='+data[i].styling_option+' readonly size="10">'+'</td>'
									+'<td>' + '* 시술명' + '</td>'
									+'<td> <input type='+'"text"'+'name="styling_name" id="styling_name1" value='+  data[i].styling_name +' readonly>'+'</td>'
									+'<td>' + '* 시술가격' + '</td>'
									+'<td> <input type='+'"text"'+'name="styling_price" id="styling_price1" value='+  data[i].styling_price +' readonly>'+'</td>'
									+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn">'+'</td>'
									+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn">'+'</td>'
									+'</tr>'
									} 
								}
								$(".ajax").append(html);
								}
							}); //ajax 끝
						
						}
					} else {
						alert("시술 삭제에 실패하였습니다.");
					}
				}
			}); // ajax종료
		});
		
	});
</script>
</head>
<body>
	<h1 align="center">시술 관리</h1>
	<div class="insertContainer">
		<form id="insertStyle" name="insertStyle">
			<fieldset>
				<p align="center">시술 추가</p>
				<c:choose>
					<c:when test="${not empty desList}">
						<select id="des_num" name="des_num" class="num">
								<option value="#">디자이너선택</option>
							<c:forEach var="des" items="${desList}">
								<option value="${des.des_num}">${des.des_name}</option>
							</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						<p>등록된 디자이너가없습니다</p>
					</c:otherwise>
				</c:choose>


				<hr>
				<table>
					<tr>
						<td><span>&nbsp;*</span>시술 구분</td>
						<td><select id="styling_option" name="styling_option">
								<option value="기본시술">기본시술</option>
								<option value="펌시술">펌 시술</option>
								<option value="기타1시술">기타 1시술</option>
								<option value="기타2시술">기타 2시술</option>
						</select></td>
						<td><span>&nbsp;*</span>시술명</td>
						<td><input type="text" name="styling_name" id="styling_name" /></td>
						<td><span>&nbsp;*</span>시술가격</td>
						<td><input type="text" name="styling_price"
							id="styling_price" /></td>
						<td><input type="button" name="insertBtn" id="insertBtn"
							value="등록" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<br>
	<br>
	<div class="updateContainer">
		<form id="updateStyle" name="updateStyle">
			<fieldset>
				<p align="center">시술 목록</p>
				<hr>
				<table>
					<tbody class="ajax">
						<tr>
							<td>디자이너를 선택하세요</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</form>
	</div>
	<div class="btnContainer">
		<input type="button" name="closeBtn" id="closeBtn" value="닫기"/>
	</div>
</body>
</html>