let today =new Date();
let mon = today.getMonth()+1 ;

let days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'];
mackeCalendar(mon);

function mackeCalendar(month) {
  document.querySelector('#show').innerHTML="";
  let table = document.createElement('table');
  let caption= document.createElement('caption');
  caption.innerText=month+"월달력";
  table.append(caption);
  table.border = "2px solid black";
  table.style = "border-collapse:collapse;";

  let thead = document.createElement('thead');
  let tr = document.createElement('tr');

  for (let d of days) {
    let th = document.createElement('th');
    th.innerText = d;
    tr.append(th);
    if(d=='Sun') th.className="red";
    if(d=='Sat') th.className="blue";
  }
  thead.append(tr);
  table.append(thead);

  let tbody = document.createElement('tbody');
  tr = document.createElement('tr');
  
  for (let i = 0; i < getFirstDay(month); i++) {
    let td = document.createElement('td');
    tr.append(td);
  }

  for (let i = 1; i <= getLastDate(month); i++) {
    let td = document.createElement('td');
    td.innerText = i;
    tr.append(td);
    if ((i + getFirstDay(month)) % 7 == 0) {
      td.className="blue";
      tbody.append(tr);
      tr = document.createElement('tr');
      
    }
    if ((i + getFirstDay(month)) % 7 == 1) td.className="red";
  }

  for (let i = 0; i < 7 - tr.children.length; i++) {
    td = document.createElement('td');
    tr.append(td);
  }
  console.log(tr.children.length);
  tbody.append(tr);
  table.append(tbody);
  document.querySelector('#month').value='';
  document.querySelector('#show').append(table);
}



//월정보를 첫번째 날짜의 요일을 반환하는 함수
function getFirstDay(month) {
  let start = new Date(2023, month - 1, 1);
  return start.getDay();
}
//월의 마지막 날짜를 반환하는 함수
function getLastDate(month) {
  let last = new Date(2023, month, 0);
  return last.getDate();
}