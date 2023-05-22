<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>회원가입 2단계</title>
  <style>
    #joinForm2 {
      width: 700px;
      margin: 0 auto;
    }
  </style>
</head>

<body>
  <div id="joinForm2">
    <img src="image/logo.png" class="inline-blcok">
    <div class="inline-blcok">
      <h3>회원가입</h3>
      <p>회원이 되어 다양한 해택을 경험해 보세요</p>
    </div>
    <form action="join.do" method="post">
      <table>
        <tr>
          <td colspan="2">
            <b>관심분야를 설정하세요(최대 5개)</b></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="check1" id="check1">
            <label for="check1"></label></td>
          <td><input type="checkbox" name="check2" id="check2">
            <label for="check1"></label></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="check3" id="check3">
            <label for="check1"></label></td>
          <td><input type="checkbox" name="check4" id="check4">
            <label for="check1"></label></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="check5" id="check5">
            <label for="check1"></label></td>
          <td><input type="checkbox" name="check6" id="check6">
            <label for="check1"></label></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="check7" id="check7">
            <label for="check1"></label></td>
          <td><input type="checkbox" name="check8" id="check8">
            <label for="check1"></label></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="check9" id="check9">
            <label for="check1"></label></td>
          <td><input type="checkbox" name="check10" id="check10">
            <label for="check1"></label></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="check11" id="check11">
            <label for="check1"></label></td>
          <td><input type="checkbox" name="check12" id="check12">
            <label for="check1"></label></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="check13" id="check13">
            <label for="check1"></label></td>
          <td><input type="checkbox" name="check14" id="check14">
            <label for="check1"></label></td>
        </tr>
      </table>


    </form>

  </div>
</body>

</html>