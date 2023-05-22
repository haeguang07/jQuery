/**
 * 
 */
	//ajax호출
	$(function() {
		$('form').on('submit', function(e) {
			e.preventDefault(); //전송차단
			$.ajax({
				url : 'noticeAdd.do', // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data : $(this).serialize(), // HTTP 요청과 함께 서버로 보낼 데이터
				method : "POST", // HTTP 요청 방식(GET, POST)
				dataType : "json", // 서버에서 보내줄 데이터의 타입
				error : function(jqXHR, textStatus, error) {//실패시 실행하는 함수
					console.log('error의 함수');
					console.log(jqXHR, textStatus, error);
				},
				success : function(data, textStatus, jqXHR) {//성공시 실행하는 함수
					let ul=$('<ul/>').append($('<li />').text("작성자: "+data.retVal.noticeWriter),
									  $('<li />').text("제목: "+data.retVal.noticeTitle),
									  $('<li />').text("내용: "+data.retVal.noticeSubject))
					$('form').after(ul);
			
					
				}
			})
			//.done(function(result) {
			//	console.log('done의 함수');
			//	console.log(result);
			//})
			//.fail(function(err) {
			//	console.log('fail의 함수');
			//	console.log(err);
			//})
			.always(function() {
				console.log('final.');
			})

		})

	})