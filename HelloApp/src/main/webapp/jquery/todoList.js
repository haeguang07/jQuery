/**
 * 
 * todoList.js
 */

$(function() {
	$.ajax({
		url: 'data.json',
		method: 'get',
		success: function(result) {
			let data = result.data;
			console.log(data);
			for (let d of data) {
				$('#myUL').append(makeLi(d.content));
			}
		},
		error: function(xhr) {
			console.log(xhr.responseText);
		}
	});
	$('#myUL').on('click', 'li', function() {
		if ($(this).attr('class') == 'checked') {
			$(this).removeAttr('class');
		} else {
			$(this).attr('class', 'checked');
		}
	})

	function makeLi(text) {
		let li = $('<li/>').text(text);
		let span = $('<span/>').text('\u00D7');
		span.attr("class", "close").on('click', delLi);
		li.append(span);
		return li;
	}
	// Create a new list item when clicking on the "Add" button
	$('.addBtn').on('click', newElement);
	function newElement() {
		var inputValue = $("#myInput").val();
		if (inputValue == '') {
			alert("You must write something!");
			return;
		}
		let li = makeLi(inputValue);
		$("#myInput").val('');
		$('#myUL').append(li);
	}
	function delLi(e) {
		$(e.target).parent().remove();
	}
	
})
