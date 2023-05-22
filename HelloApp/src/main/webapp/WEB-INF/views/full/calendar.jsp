<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8' />
  <script src='/fullcal/dist/index.global.js'></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');

      //allEvents초기화
      let allEvents = [];
      fetch('eventList.do')
        .then(resolve => resolve.json())
        .then(result => {
          result.forEach(event => {
            let newEvent = {
              title: event.title,
              start: event.StartDate,
              end: event.endDate
            }
            // event.start = event.StartDate;
            // event.end = event.endDate;
            // delete event.StartDate;
            // delete event.endDate;
            allEvents.push(newEvent);
          });
          //foreach 종료

          var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            initialDate: new Date(),
            navLinks: true, // can click day/week names to navigate views
            selectable: true,
            selectMirror: true,
            select: function (arg) { //이벤트 등록 부분
              var title = prompt('이벤트 등록:');
              //console.log(arg);//사용자가 등록하는 값 title,startStr,endStr....
              //Ajax호출
              fetch('addEvent.do', {
                  method: "POST",
                  headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                  },
                  body: 'title=' + title + '&start=' + arg.startStr + '&end=' + arg.endStr
                })
                .then(resolve => resolve.json())
                .then(result => {
                  if (result.retCode == 'Success') {
                    //화면에 추가되 이벤트 등록
                    if (title) {
                      calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay
                      })
                    }
                  } else {
                    alert('등록실패')
                  }
                })
                .catch(err => console.log(err));



              calendar.unselect()
            },
            eventClick: function (arg) { //이벤트 삭제부분
              if (confirm('이벤트를 삭제?')) {
                fetch('removeEven.do', {
                    method: "POST",
                    headers: {
                      'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'title=' + title
                  })
                  .then(resolve => resolve.json)
                  .then(result => {
                    if (result.retCode == 'Success') {
                      arg.event.remove();
                    } else if (result.retCode == 'Fail') {
                      alert('처리중 오류');
                    } else {
                      alert('알수없는 오류');
                    }
                  })
              }
            },
            editable: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: allEvents

          });

          calendar.render();
        })
        //.then(result) 종료
        .catch(error => console.log(error))
    });
    //document.addEventListener('DOMContentLoaded', function () {종료
  </script>
  <style>
    body {
      margin: 40px 10px;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1100px;
      margin: 0 auto;
    }
  </style>
</head>

<body>

  <div id='calendar'></div>

</body>

</html>