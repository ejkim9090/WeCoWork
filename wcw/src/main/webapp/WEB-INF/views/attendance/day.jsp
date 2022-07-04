<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance/attendance.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style type="text/css">
.attendance_main_box_first_container {
	flex-grow: 1;
}

#insert_attendance_box_top{
	width: 240px;
	height: 36px;
	border: 2px solid rgb(224, 224, 224);
	background-color: rgb(244, 244, 244);
	text-align: center;
	line-height: 36px;
	
}
#insert_attendance_box_bottom{
	width: 240px;
	height: 64px;
	border-left: 2px solid rgb(224, 224, 224);
	border-right: 2px solid rgb(224, 224, 224);
	border-bottom: 2px solid rgb(224, 224, 224);
	border-top: 0px;
	text-align: center;
	display: flex;
	align-items: center;
}
#insert_box_bottom_buttons{
	margin: auto;
}


.first_box_text{
	margin-bottom: 13px;
}

#search_date_range{
	display: flex;
	gap: 30px;
}

#att_appr_clock_in, #att_appr_clock_out{
	border: 1px solid rgb(224, 224, 224);
	width: 138px; height:25px;
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);	
}
#att_modify_reason_text{
	border: 1px solid rgb(224, 224, 224);
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

/* grid box~! */
#attendance_modify_grid_container{
	display: grid;
	grid-template-columns: 1fr 1.5fr 1fr 1.5fr 1fr 1.5fr;
	grid-template-rows: 1fr 3fr 1fr;
	row-gap: 30px;
	
}
#att_modify_reason_text{
	
	grid-column: 2 / 7;
	grid-row: 2 / 3;

}
.attendance_modify_grid_first_row{
	align-self: center;
}

#attendance_modify_submit_btn{
	grid-column: 6 / 7;
	grid-row: 3 / 4;
	justify-self: end;
	
}

/* 같은 폰트 적용 */
.font_title{
	font-size: 13px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
}
.font_content{
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

#clock{
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">일일 근태</div>
			
			
		</div>
		
		<div id="attendance_main_container">
			<div id="attendance_main_box_first">
				<div class="attendance_main_box_first_container">
					<div id="insert_attendance_box_top" class="font_title">일일근태등록</div>
					<div id="insert_attendance_box_bottom">
						<div id="insert_box_bottom_buttons">
						<button type="button" id="btn_clock_in" class="btn_format_mini">출근</button>
						<button type="button" id="btn_clock_out" class="btn_format_mini">퇴근</button>
						</div>
					</div>
				</div>
				<div class="attendance_main_box_first_container">
					<div class="font_title first_box_text">출근 시간 : </div>
					<div class="font_title first_box_text">퇴근 시간 : </div>
					<div class="font_title first_box_text">출근 IP : </div>
					<div class="font_title first_box_text">퇴근 IP : </div>
				</div>
				<div class="attendance_main_box_first_container">
					<div class="font_title first_box_text">현시각</div>
					<div id="clock">00:00</div>
				</div>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">근태정보조회</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div id="search_date_range">
							<div class="font_title">근무일자</div>
							<input type="date" id="att_date_start" name="att_date_start">
							<div class="font_content">~</div>
							<input type="date" id="att_date_end" name="att_date_end">
							<button type="submit" class="btn_format_mini_gray" id="att_date_search_btn">조회</button>
						</div>
					</div>
					<div class="attendance_main_box_content">
						<table class="attendance_main_box_content_table" id="att_date_search_table">
							<tr>
								<td style="width: 14%">근무일자</td>
								<td style="width: 10%">사번</td>
								<td style="width: 10%">성명</td>
								<td style="width: 19%">출근시간</td>
								<td style="width: 19%">퇴근시간</td>
								<td style="width: 14%">출근IP</td>
								<td style="width: 14%">퇴근IP</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">근태조정요청</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div id="attendance_modify_grid_container">
							<div class="font_title attendance_modify_grid_first_row">조정 근무 일자</div>
							<input type="date" id="att_date_start" name="att_modify_date" class="attendance_modify_grid_first_row">
							<div class="font_title attendance_modify_grid_first_row">조정 출근 시간</div>
							<input type="time" id="att_appr_clock_in" name="att_appr_clock_in" class="attendance_modify_grid_first_row">
							<div class="font_title attendance_modify_grid_first_row">조정 퇴근 시간</div>
							<input type="time" id="att_appr_clock_out" name="att_appr_clock_out" class="attendance_modify_grid_first_row">
							<div class="font_title">조정 사유</div>
							<input type="text" id="att_modify_reason_text">
							<button type="submit" class="btn_format_mini" id="attendance_modify_submit_btn">요청</button>
						</div>
					</div>
					
				</div>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">근태조정 신청내역</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div id="search_date_range">
							<div class="font_title">근무일자</div>
							<input type="date" id="att_date_start" name="att_date_start">
							<div class="font_content">~</div>
							<input type="date" id="att_date_end" name="att_date_end">
							<button type="button" class="btn_format_mini_gray">조회</button>
						</div>
					</div>
					<div class="attendance_main_box_content">
						<table class="attendance_main_box_content_table">
							<tr>
								<td>근무일</td>
								<td>사번</td>
								<td>성명</td>
								<td>출근시간</td>
								<td>퇴근시간</td>
								<td>수정요청 출근시간</td>
								<td>수정요청 퇴근시간</td>
								<td>결재 상태</td>
								<td>승인 여부</td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>

/* 출퇴근~! */
	$("#btn_clock_in").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/insert",
			type: "post",
			success: function(result){
				alert(result)
			},
			error: function(error){
				alert(result) 
			}
		});
	});
	
	$("#btn_clock_out").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/update",
			type: "post",
			success: function(result){
				alert(result)
			},
			error: function(error){
				alert(result) 
			}
		});
	});
	
	$("#att_date_search_btn").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/read",
			type: "post",
			data: {att_date_start:$('#att_date_start').val()
				, att_date_end:$('#att_date_end').val()} ,
			dataType:"json",
			success: function(result){
				console.log("test1111");
				console.log(result);
				console.log("test1111");
				var html = "";
				for(var i = 0; i < result.length; i++){
					var vo = result[i];
					html += '<tr class="table_content_white">';
                    html += '<td >'+vo.att_date.substr(0,10)+'</td>';
                    html += '<td >'+vo.emp_no+'</td>';
                    html += '<td >'+'${loginSSInfo.name}'+'</td>';
                    html += '<td >'+vo.att_clock_in+'</td>';
                    html += '<td >'+vo.att_clock_out+'</td>';
                    html += '<td >'+vo.ip_clock_in+'</td>';
                    html += '<td >'+vo.ip_clock_out+'</td>';
                    html += '</tr>';
                    $('#att_date_search_table').append(html);
				}
			},
			error: function(error){
				alert(result) 
			}
		});
	});
	
	function dateFormatExclude(date) {
		
	}
	

/* 시계~! */
var clockTarget = document.getElementById("clock");

function clock() {
    var date = new Date();
    // date Object를 받아오고 
    var year = date.getFullYear();
    var month = date.getMonth();
    month = ((month+1) < 10) ? '0'+(month+1) : (month+1);
    // 달을 받아옵니다 
    var clockDate = date.getDate();
    clockDate = (clockDate < 10) ? '0'+clockDate : clockDate;
    // 몇일인지 받아옵니다  
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    // 요일은 숫자형태로 리턴되기때문에 미리 배열을 만듭니다. 
    var hours = date.getHours();
    hours = (hours < 10) ? '0'+hours : hours;
    // 시간을 받아오고 
    var minutes = date.getMinutes();
    minutes = (minutes < 10) ? '0'+minutes : minutes;
    // 분도 받아옵니다.
    var seconds = date.getSeconds();
    seconds = (seconds < 10) ? '0'+seconds : seconds;
    // 초까지 받아온후 
    console.log(year);
    $("#clock").text(year+'-'+month+'-'+ clockDate + ' / '  + hours + ':' + minutes+':'+seconds);
    //':${minutes < 10 ? '0${minutes }'  : minutes }:${seconds < 10 ? '0${seconds }'  : seconds }'
    //clockTarget.innerText = '${month+1}월 ${clockDate}일 ${week[day]}요일' +
    //'${hours < 10 ? '0${hours}' : hours}:${minutes < 10 ? '0${minutes }'  : minutes }:${seconds < 10 ? '0${seconds }'  : seconds }';
    // 월은 0부터 1월이기때문에 +1일을 해주고 
    // 시간 분 초는 한자리수이면 시계가 어색해보일까봐 10보다 작으면 앞에0을 붙혀주는 작업을 3항연산으로 했습니다. 
}

function init() {
	clock();
	// 최초에 함수를 한번 실행시켜주고 
	setInterval(clock, 1000);
	// setInterval이라는 함수로 매초마다 실행을 해줍니다.
	// setInterval은 첫번째 파라메터는 함수이고 두번째는 시간인데 밀리초단위로 받습니다. 1000 = 1초 
}

init();


</script>
</body>
</html>