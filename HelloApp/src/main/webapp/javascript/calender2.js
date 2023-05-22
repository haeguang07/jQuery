const obj = {
  days: ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'],
  makeThead: function () {
    let thead = document.createElement('thead');
    let tr = document.createElement('tr')
    for (let day of this.days) {
      let th = document.createElement('th');
      th.innerText = day;
      tr.append(th);
      if (day == 'Sun') th.className = "red";
      if (day == 'Sat') th.className = "blue";
    }
    thead.append(tr);
    return thead;
  },
  makeTbody(month) {
    let tbody = document.createElement('tbody');
    let tr = document.createElement('tr');
    for (let i = 0; i < this.getFirstDay(month); i++) {
      let td = document.createElement('td');
      tr.append(td);
    }
    for (let i = 1; i < this.getLastDate(month); i++) {
      let td = document.createElement('td');
      td.innerText = i;
      tr.append(td);
      if ((i + this.getFirstDay(month)) % 7 == 0) {
        td.className = "blue";
        tbody.append(tr);
        tr = document.createElement('tr');
      }
      if ((i + this.getFirstDay(month)) % 7 == 1) td.className = "red";
    }
    
    console.log(7 - (tr.children.length));
    for (let i = 0; i < 7-(tr.children.length); i++) {
      td = document.createElement('td');
      tr.append(td);
      console.log(i);
    }
    tbody.append(tr);
    return tbody;
  },
  makeTable(month,element) {
    let table = document.createElement('table');
    table.append(this.makeCation(month));
    table.append(this.makeThead());
    table.append(this.makeTbody(month));
    element.append(table);
    ;
  },
  makeCation(month) {
    let caption = document.createElement('caption');
    caption.innerText = month + "월";
    return caption;
  },
  getFirstDay: function (month) {
    let start = new Date(2023, month - 1, 1);
    return start.getDay();
  },

  getLastDate: function (month) {
    let last = new Date(2023, month, 0);
    return last.getDate();
  }
}
function mackeCalendar(feild){
  document.querySelector('#show').innerHTML="";
  obj.makeTable(feild.value,show);
  feild.value='';
}
var show = document.querySelector('#show')
