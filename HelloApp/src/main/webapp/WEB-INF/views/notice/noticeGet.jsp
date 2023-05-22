<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h3>상세 페이지(noticeGet.jsp)</h3>
<style>
	#content {
		padding: 15px auto;
	}
</style>
<form action="modifyNotice.do" method="get">
	<table class="table">

		<tr>
			<th>글번호</th>
			<td><input type="text" name="nid" value="${noticeInfo.noticeId}" readonly></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${noticeInfo.noticeTitle}" readonly></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="subject" rows="3" cols="25" readonly="readonly">${noticeInfo.noticeSubject}</textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" value="${noticeInfo.noticeWriter}" readonly></td>
		</tr>
		<tr style="display: 'none'">
			<th>첨부파일 ${fileType}</th>
			<td>
				<c:if test="${noticeInfo.attachFile !=null}">
					<c:choose>
						<c:when test="${fileType =='image'}">
							<img width="200px" height="200px" src="images/${noticeInfo.attachFile }">
						</c:when>
						<c:otherwise>
							<a href="images/${noticeInfo.attachFile}">${noticeInfo.attachFile}</a>
						</c:otherwise>
					</c:choose>

				</c:if>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${noticeInfo.noticeDate }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:choose>
					<c:when test="${memberInfo.name== noticeInfo.noticeWriter}">
						<button type="submit">수정</button>
					</c:when>
					<c:otherwise>
						<button disabled="disabled" type="submit">수정</button>
					</c:otherwise>
				</c:choose>
				<button type="button" onclick="location.href='noticeList.do?page=${pageNum}'">
					목록 ${pageNum}</button>
			</td>
		</tr>
	</table>

</form>
<!-- 댓글등록 -->
<div id="content">
	<span>${memberInfo.name}</span>
	<input type="text" id="reply">
	<button type="button" id="addBtn">등록</button>
</div>
<!-- 댓글 정보 -->
<table class="table">
	<thead>
		<tr>
			<th>댓글번호</th>
			<th>작성자</th>
			<th>글내용</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody id="tlist">

	</tbody>
</table>
<table style="display: none;">
	<tbody>
		<tr id="template">
			<td>글번호</td>
			<td>작성자</td>
			<td><input type="text" class="reply"></td>
			<td><button>수정</button></td>
		</tr>

	</tbody>
</table>

<script>
	let showFields = ['replyId', 'replyWriter', 'reply']
	let xhtp = new XMLHttpRequest();
	xhtp.open('get', 'replyList.do?nid=${noticeInfo.noticeId}');
	xhtp.send();
	xhtp.onload = function () {
		console.log(xhtp.response);
		//목록생성
		let tlist = document.querySelector('#tlist');
		let data = JSON.parse(xhtp.response); //json ->object
		for (let reply of data) {
			console.log(reply);
			let tr = makeTrFunc(reply);
			tlist.append(tr);
		}
	}
	//등록 이벤트
	document.querySelector('#addBtn').addEventListener('click', addReplyFnc);

	function addReplyFnc(e) {
		if ("${memberInfo.email}" == "") {
			alert('로그인후 등록가능');
			location.href = "loginForm.do";
			return;
		}
		//console.log('click',e);
		console.log('reply', document.querySelector('#reply').value)
		console.log('id', "${memberInfo.email}");
		let reply = document.querySelector('#reply').value;

		//Ajax 호출
		xhtp = new XMLHttpRequest();
		xhtp.open('post', 'addReply.do');
		xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhtp.send('id=${memberInfo.email }&reply=' + reply + "&noticeId=${noticeInfo.noticeId}");
		xhtp.onload = function () {
			console.log(xhtp.response);
			let result = JSON.parse(xhtp.response);
			if (result.retCode == 'Success') {
				//값을 이용해서 tr생성
				let tr = makeTrFunc(result.data);
				tlist.append(tr);
			} else if (result.retCode == 'Fail') {
				//alert('처리중 에러')
			}
		}

	}
	//tr생성해주는 함수
	function makeTrFunc(reply = {}) {
		let tr = document.createElement('tr');
		//tr에 속성추가: 댓글번호;
		tr.id = reply.replyId;
		//this 1) Object 안에서 사용되면 object자체를 가리킴 
		//				let obj ={name:"hong",age=20,showInfo:function(){this.age+this.name}};
		//		 2)function 선언안에서 this는 window 전역객체 
		//			 function add(){console.log(this)}->window가 나옴
		//		 3)event 안에서 사용되는 this는 이벤트 받는 대상
		//			 document.getElementById('tlist').addEventListener('click',function(e){console.log(this)})->id=tlist인 요소를 가져옴 
		//tr 더블클릭 이벤트
		tr.addEventListener('dblclick', function (e) {
			if("${memberInfo.email}"!=reply.replyWriter){
				alert('본인만 수정할 수 있습니다');
				return;
			}
			let template = document.querySelector('#template').cloneNode(true);
			console.log(template);
			// template.children[0].innerText=reply.replyId;
			// template.children[1].innerText=reply.replyWriter;
			// template.children[2].children[0].value=reply.reply;
			template.querySelector('td:nth-of-type(1)').innerText = reply.replyId;
			template.querySelector('td:nth-of-type(2)').innerText = reply.replyWriter;
			template.querySelector('td:nth-of-type(3)>input').value = reply.reply;
			template.querySelector('button').addEventListener('click', function (e) {
				//데이테을 서버에 반영후 보이는 곳도 변경
				//Ajax호출
				let replyId = reply.replyId;
				let replyCon = this.parentElement.parentElement.children[2].children[0].value;
				console.log(replyId, replyCon);
				let xhtp = new XMLHttpRequest();
				xhtp.open('post', 'modifyReply.do');
				xhtp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhtp.send('rid='+replyId +'&reply=' + replyCon);
				xhtp.onload = function () {
					let result = JSON.parse(xhtp.response);
					if (result.retCode == 'Success') {
						alert('변경를 성공을 했습니다');
						//화면 변경
						let newTr=makeTrFunc(result.data);
						let oldTr =document.querySelector('#template');
						document.querySelector('#tlist').replaceChild(newTr,oldTr );
					} else if (result.retCode == 'Fail') {
						alert('처리중 에러.');
					} else {
						alert('알수 없는 결과값입니다');
					}
				}

			})
			document.querySelector('#tlist').replaceChild(template, tr);

		})
		for (let prop of showFields) {
			let td = document.createElement('td');
			td.innerText = reply[prop];
			tr.append(td);
		}

		//삭제버튼
		let btn = document.createElement('button');
		btn.addEventListener('click', function (e) {
			let writer = btn.parentElement.previousElementSibling.previousElementSibling.innerText;
			console.log(writer, '${memberInfo.email}');
			if (writer != '${memberInfo.email}') {
				alert('권한이 없습니다')
				return;
			}
			//db에서 삭제 화면에서 삭제.
			let xhtp = new XMLHttpRequest();
			xhtp.open('post', 'removeReply.do');
			xhtp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			console.log(btn.parentElement.parentElement.id);
			//post방식이면 send에 parameter를 적음
			xhtp.send('rid=' + btn.parentElement.parentElement.children[0].innerText);
			xhtp.onload = function () {
				let result = JSON.parse(xhtp.response);
				console.log(result);
				if (result.retCode == 'Success') {
					alert('삭제를 성공을 했습니다');
					//화면에서 지우기.
					btn.parentElement.parentElement.remove();
				} else if (result.retCode == 'Fail') {
					alert('처리중 에러발생');
				} else {
					alert('알수 없는 결과값입니다');
				}
			}
		})
		btn.innerText = '삭제';
		let td = document.createElement('td');
		td.append(btn);
		tr.append(td)
		return tr; //생성한 tr을 반환
	}
</script>