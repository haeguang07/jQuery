/**
 * 
 * notice.js
 */

//multipart request
$(function() {
	$('form').on('submit', function(e) {
		e.preventDefault();
		var frm = $('form')[0];
		//$(frm).find('input[name="job"]').val('multi');
		var data = new FormData(frm); //multipart/form-data 처리하는 객체
		$.ajax({
			url: 'noticeAdd.do',
			method: 'post',
			data: data,
			//multipart 요청
			contentType: false,
			processData: false,
			error: function(jqxhr) {
				console.log(jqxhr.responseText);
			},
			success: function(data, status, xhr) {
				if (data.retCode == 'Success') {
					let val = data.retVal;
					tr = $('<tr/>').append($('<td/>').text(val.noticeId),
						$('<td/>').text(val.noticeTitle),
						$('<td/>').text(val.noticeWriter),
						$('<td/>').append($('<img/>').css('width', '30px').attr('src', 'images/' + val.attachFile)),
						$('<td/>').append($('<button>삭제</button>').on('click', deleteRow)))
					//location.reload();
					$('#noticeList').prepend(tr);
					$('form')[0].reset();
				} else if (data.retCode == 'Fail') {
					alert('처리 에러');
				} else {
					alert('알 수 없는 오류');
				}
			}

		})
			.always(function() {
				console.log('final.')
			})
	})


	//공지목록 출력
	$.ajax({
		url: 'noticeListJson.do',
		method: 'GET',
		dataType: 'json',
		error: function(xhr) {
			console.log(xhr.responseText);
		},
		success: function(data) {
			data.forEach(notice => {
				let tr = $('<tr/>');
				if (notice.attachFile == null) {
					tr = $('<tr/>').append($('<td/>').text(notice.noticeId),
						$('<td/>').text(notice.noticeTitle),
						$('<td/>').text(notice.noticeWriter),
						$('<td/>').text('이미지없음'),
						$('<td/>').append($('<button>삭제</button>').on('click', deleteRow))
					)
				} else {
					tr = $('<tr/>').append($('<td/>').text(notice.noticeId),
						$('<td/>').text(notice.noticeTitle),
						$('<td/>').text(notice.noticeWriter),
						$('<td/>').append($('<img/>').css('width', '30px').attr('src', 'images/' + notice.attachFile)),
						$('<td/>').append($('<button>삭제</button>').on('click', deleteRow)))

				}
				tr.attr('id', 'tr_' + notice.noticeId);
				$('#noticeList').append(tr)
			})
		}
	})

	function deleteRow(e) {
		let id = $(e.target).parent().parent().children().eq(0).text();

		$.ajax({
			url: 'delNoticeJson.do?nid=' + id,
			dataType: "text",
			error: function(xhr) {
				console.log(xhr);
			},
			success: function(data) {
				if (data == 'Success') {
					let tr = $(e.target).parentsUntil('tbody');
					tr.remove();
				} else if (data == 'Fail') {
					console.log('처리에러');
				} else {
					console.log('알수 없는 오류')
				}
			}
		})
			.always(function() {
				console.log('deleteRow final')
			})

	}
	// modal열기 /라이브 이벤트 
	$('#noticeList').on('dblclick', 'tr', function() {
		let id = $(this).children().eq(0).text();
		console.log(id);
		$.ajax({
			url: 'getNoticeJson.do?nid=' + id,
			dataType: 'json',
			error: function(xhr) {
				console.log(xhr.responseText);
			},
			success: function(data) {
				if (data.retCode == 'Success') {
					let notice = data.vo;
					$('.nid').text(notice.noticeId);
					$('.nTitle').val(notice.noticeTitle);
					$('.nWriter').text(notice.noticeWriter);
					$('.nSubject').val(notice.noticeSubject);
					$('.nAttach').css('width', '100px').attr('src', 'images/' + notice.attachFile);

				} else if (data.retCode == 'Fail') {
					alert('처리 에러');
				} else {
					alert('오류')
				}
			}
		})


		$('#myModal').fadeIn(100)//css('display','block');
	})
	// X누르면 닫힘
	$('span.close').on('click', function() {
		$('#myModal').fadeOut(100)//css('display','none');
	})
	$(window).on('click', function(e) {
		if (e.target == $('#myModal')[0]) {
			$('#myModal').css('display', 'none');
		}
	})
	//modal 창에 있는 이미지를 클릭
	$('img.nAttach').on('click', function() {
		$('#attachFile').click();
	})
	$('#attachFile').on('change', function(e) {
		let data = new FormData();
		data.append('nid', $('.nid').text());
		data.append('nfile', e.target.files[0]);
		$.ajax({
			url: 'modifyNoticeFile.do',
			method: "POST",
			data: data,
			contentType: false,
			processData: false,
			success: function(data) {
				console.log(data);
				$('img.nAttach').attr('src', 'images/' + data.vo.attachFile);
			},
			error: function(xhr) {
				console.log(xhr.responseText);
			}
		})
	})
	//modal창의 수정버튼 이벤트
	$('div.modal-body button').on('click', function() {
		let id = $('div.modal-body td.nid').text();
		let title = $('div.modal-body input.nTitle').val();
		let subject = $('div.modal-body textarea.nSubject').val();
		console.log(subject);
		$.ajax({
			url: "modifyNoticeJson.do",
			method: "POST",
			data: { id: id, title: title, subject: subject},
			error: function(xhr) {
				console.log(xhr.responseText);
			},
			success:function(data){
				if(data.retCode=="Success"){
					console.log(data.vo);
					let tr=$('#tr_'+data.vo.noticeId);
					tr.find('img').attr('src','images/'+data.vo.attachFile);
					tr.children().eq(1).text(data.vo.noticeTitle);
					$('#myModal').css('display', 'none');
				}else if(data.retCode=="Fail"){
					
				}
			}
		})



	})


})