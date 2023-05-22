<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {
      'packages': ['corechart']
    });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var result = [
        ['dept', 'cnt']
      ];

      let xhtp = new XMLHttpRequest(); //비동기식 호출 (Ajax호출)

      xhtp.open('get', 'chartData.do');
      xhtp.send();
      xhtp.onload = function () {
        let data = JSON.parse(xhtp.response);
        //data={Admin:3,Sales:6,Shipping:9....}
        for (let dept in data) {
          result.push([dept, data[dept]]);
        }

        data = google.visualization.arrayToDataTable(result);

        var options = {
          title: '부서별 인원 현황'
        };
        var chart = new google.visualization.PieChart(document
          .getElementById('piechart'));

        chart.draw(data, options);
      }

    }
  </script>
</head>

<body>
  <p>views/chart/pieChart.jsp</p>
  <div id="piechart" style="width: 900px; height: 500px;"></div>
</body>

</html>