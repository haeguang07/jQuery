export let basket = {
	totalCount: 0,
	totalPrice: 0,
	delCheckedItem: function() {
		console.log('delCheckedItem');
		let checkbox = $(".check input[type='checkbox']:checked");
		checkbox.each((index,item) => {
			let div = $(item).parent().parent().parent();
			div.remove();
		})
		this.updateFeild();
		this.updateUI();

	},
	delAllItem: function() {
		console.log('delAllItem');
		$('.row.data').remove();
		this.reCalc();
		this.updateUI();
	},
	reCalc: function() {
		console.log('reCalc');
		this.totalCount = 0;
		this.totalPrice = 0;
	},
	updateUI: function() {
		console.log('updateUI');
		$('#sum_p_num').text('상품개수: ' + this.totalCount.formatNumber() + '개');
		$('#sum_p_price').text('합계금액: ' + this.totalPrice.formatNumber() + '원');
	},
	updateFeild: function() {
		let count = 0;
		let price = 0;
		let checkbox = $(".check input[type='checkbox']:checked");
		checkbox.each((index,item) => {
			let row = $(item).parent().parent().parent();
			count += row.find('.p_num').val() * 1;
			price += row.find('.p_price').val() * row.find('.p_num').val();

		})
		this.totalCount = count * 1;
		this.totalPrice = price * 1;
	},
	changePNum: function(pos) {
		console.log("changePNum");
		let row = document.querySelectorAll('.row.data')[pos];
		let price = row.querySelector('.p_price').value;
		let qty = row.querySelector('.p_num').value;
		row.querySelector('.sum').textContent = (price * qty).formatNumber() + "원"
		this.updateFeild();
		this.updateUI();
	},
	delItem: function() {
		console.log('delItem');
		let row = $(event.target).parent().parent().parent();
		row.remove();
		this.updateFeild();
		this.updateUI();

	},
	cartList: function() {
		let count = 0;
		let price = 0;
		cartItems.forEach((item, idx) => {
			let template = document.querySelector('#template>div.row.data').cloneNode(true);
			template.querySelector('.img>img').setAttribute('src', '../img/' + item.image)
			template.querySelector('.pname>span').textContent = item.productNm
			template.querySelector('.basketprice>input').value = item.price
			template.querySelector('.basketprice').childNodes[2].textContent = item.price.formatNumber() + "원"
			template.querySelector('.updown>input').value = item.qty
			template.querySelector('.updown>input').setAttribute('value', item.qty)
			template.querySelector('.updown>input').setAttribute('id', 'p_num' + (idx + 1));
			template.querySelector('.sum').textContent = (item.price * item.qty).formatNumber() + "원"
			document.querySelector('#basket').append(template)
			count += item.qty * 1;
			price += (item.price * item.qty);
		})
		$('.row.data').find('.check>input').eq(0).removeAttr('checked');
		this.updateFeild();
		this.updateUI()
	}
};

var cartItems = [{
	no: 1,
	productNm: '이것이 민트다.',
	qty: 2,
	price: 12000,
	image: 'item1.PNG'
},
{
	no: 2,
	productNm: '와 아이스크림.',
	qty: 1,
	price: 22000,
	image: 'item2.PNG'
},
{
	no: 3,
	productNm: '모나카 케익.',
	qty: 1,
	price: 13600,
	image: 'item3.PNG'
}
]

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function() {
	if (this == 0) return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	return nstr;
};