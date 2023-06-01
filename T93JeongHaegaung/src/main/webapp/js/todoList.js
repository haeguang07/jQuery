/**
 * 
 * todoList.js
 */

$(function() {
	//리스트 불러오기
	$.ajax({
		url: 'todoList.json',
		method: 'get',
		success: function(result) {
			for (let todo of result.data) {
				$('#myUL').append(makeLi(todo));
			}
		},
		error: function(xhr) {
			console.log(xhr.responseText);
		}
	});

	//상태 변경 (라이브 이벤트)
	$('#myUL').on('click', 'li', function() {
		let no = $(this).find('input').eq(0).val()
		let stutas = "";
		if ($(this).attr('class') == 'checked') {
			$(this).removeAttr('class');
			stutas = "N";
		} else {
			$(this).attr('class', 'checked');
			stutas = "Y";
		}
		$.ajax({
			url: 'modifyTodo.json',
			method: 'get',
			data: {no: no ,stutas: stutas},
			success: function(result) {
				console.log(result);
			},
			error: function(xhr) {
				console.log(xhr.responseText);
			}
		});
	})

	//li만들기
	function makeLi(todo) {
		let li = $('<li/>').text(todo.todoTitle);
		li.append($('<span/>').text('\u00D7').attr("class", "close").on('click', delLi));
		if (todo.todoStatus == 'Y') {
			li.attr('class', 'checked');
		}
		li.append($('<input/>').attr({ class: 'no', value: todo.todoNo }))
		return li;
	}
	// 목록추가
	$('.addBtn').on('click', newElement);
	function newElement() {
		let todo = {};
		var no = 0;
		var inputValue = $("#myInput").val();
		if (inputValue == '') {
			alert("You must write something!");
			return;
		}
		todo.todoTitle = inputValue;
		//동기방식 DB추가 후 화면에 그리기 
		$.ajax({
			url: 'addTodo.json',
			method: 'get',
			data: 'title=' + inputValue,
			async: false,
			success: function(result) {
				console.log(result);
				result = JSON.parse(result);
				no = result.no;
			},
			error: function(xhr) { console.log(xhr.responseText); }
		});
		console.log(no);
		todo.todoNo = no;
		todo.todoStatus = "N";
		$("#myInput").val('');
		$('#myUL').append(makeLi(todo));
	}
	
	//삭제
	function delLi(e) {
		let no = $(e.target).next().val();
		$.ajax({
			url: 'removeTodo.json',
			method: 'get',
			data: 'no=' + no,
			async: false,
			success: function(result) { console.log(result); },
			error: function(xhr) { console.log(xhr.responseText); }
		});
		$(e.target).parent().remove();
	}

})
