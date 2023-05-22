//
async function loadData(){
  let promise= await fetch('noticeListJson.do');
  let promise1 = await promise.json();
  let fidlds =['noticeId','noticeTitle','noticeWriter','attachFile'];
  promise1.forEach(item => {

    console.log(item);
    let tr = document.createElement('tr');
    for(let prop of fidlds){
      let td = document.createElement('td');
      td.innerText=item[prop];
      tr.append(td);
    }
    document.getElementById('noticeList').append(tr);
  });
}




document.addEventListener('DOMContentLoaded',function(){
  loadData();
})