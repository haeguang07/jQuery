import {
    basket
} from './basket.js';

document.addEventListener('DOMContentLoaded', function () {

    // 선택상품 삭제.
    document.querySelector('.basketrowcmd a:first-child').addEventListener('click', function () {
        basket.delCheckedItem();
    })

    // 장바구니 비우기.
    document.querySelector('.basketrowcmd a:nth-child(2)').addEventListener('click', function () {
        basket.delAllItem();
    })

    // 장바구나 삭제 클릭.
    document.querySelectorAll('.basketcmd a').forEach(function (item) {
        item.addEventListener('click', function () {
            basket.delItem();
        })
    })

    // 수량변경 - 이벤트 종류 구분.
    document.querySelectorAll('.updown').forEach(function (item, idx) {
        item.querySelector('input').addEventListener('keyup', function () {
            basket.changePNum(idx + 1);
        })
        item.children[1].addEventListener('click', function () {
            basket.changePNum(idx + 1);
        })
        item.children[2].addEventListener('click', function () {
            basket.changePNum(idx + 1);
        })
    })

    // anchor : 스크롤 탑 차단.
    document.querySelectorAll('a[href="#"]').forEach(function (item) {
        item.setAttribute('href', 'javascript:void(0)');
    })
})