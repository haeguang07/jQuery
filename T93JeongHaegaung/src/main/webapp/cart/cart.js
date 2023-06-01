import {
	basket
} from './basket.js';

document.addEventListener('DOMContentLoaded', function() {
	basket.cartList();
	//체크박스 
	$(".check input[type='checkbox']").on('click', function() {
			basket.updateFeild();
			basket.updateUI();
		})
	
	// 선택상품 삭제.
	$('.basketrowcmd a:first-child').on('click', function() {
		basket.delCheckedItem();
	})

	// 장바구니 비우기.
	$('.basketrowcmd a:nth-child(2)').on('click', function() {
		basket.delAllItem();
	})

	// 장바구나 삭제 클릭.
	$('.basketcmd a').on('click', function() {
			basket.delItem(this);
		
	})

	// 수량변경 - 이벤트 종류 구분.
	$('.updown').each((function(index,item) {
		
		let count = $(item).find('input');
		$(item).find('input').on('keyup', function() {
			if (countZ(this.value)) {
				basket.changePNum(index);
				return;
			}
		})
		$(item).children().eq(1).on('click', function() {
			count.val(count.val()*1+1);
			basket.changePNum(index);
		})
		$(item).children().eq(2).on('click', function() {
			count.val(count.val()*1-1);
			if (countZ(count.val())) {
				basket.changePNum(index);
				return;
			}
			count.val(1);
		})

	}))

	// anchor : 스크롤 탑 차단.
	$('a[href="#"]').each(function(index,item) {
		$(item).attr('href', 'javascript:void(0)');
	})

})
function countZ(num) {
	if (num < 1) {
		alert('0이하로 입력할 수 없습니다');
		return false;
	}
	return true;
}
