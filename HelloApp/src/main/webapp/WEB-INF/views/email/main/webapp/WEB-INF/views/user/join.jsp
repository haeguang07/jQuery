<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    #joinForm {
      width: 700px;
      margin: 0 auto;
    }

    .joinLable {
      color: #333333;
      font-size: 12px;
    }

    .textjoin1 {
      width: 200px;
      vertical-align: middle;
      border-width: 1px;
      border-color: rgb(153, 153, 153) rgb(223, 223, 223) rgb(223, 223, 223) rgb(153, 153, 153);
      background-color: rgb(235, 235, 235);
      color: rgb(51, 51, 51);
      height: 30px;
      padding: 0px 7px;
    }

    .explanText {
      color: #787878;
      font-size: 12px;
      padding: 0 0 0 14px;
    }
    img{
    width: 20%;
    
    }
    .inline-blcok{
    display: inline-block;
    }
    .inline-blcok h3{
    	
    }
  </style>
</head>

<body>
  <div id="joinForm" >
    <img src="image/logo.png" class="inline-blcok">
    <div class="inline-blcok">
      <h3>회원가입</h3>
      <p>회원이 되어 다양한 해택을 경험해 보세요</p>
    </div>
    <form action="join.do" method="post">
      <table>
        <!-- 아이디-->
        <tr>
          <td>아이디</td>
          <td> <input type="text" class="textjoin1" name="joinId" id="joinId" value=""></td>
          <td><button class="joinButton" id="idCheck">중복체크</button> </td>
        </tr>
        <tr>
          <td></td>
          <td colspan="2" class="explanText">(4자~12자리의 영문자, 숫자 / @,#$등 특수문자는 제외)</td>
        </tr>
        <tr>
          <!-- 비밀번호-->
          <td>비밀번호</td>
          <td> <input type="password" class="textjoin1" name="joinPw" id="joinPw"></td>
          <td class="explanText">영문, 숫자, 특수문자 중 2가지 조합하여 8자~20자리
          </td>
        </tr>
        <!-- 비밀번호 확인-->
        <tr>
          <td>비밀번호 확인</td>
          <td> <input type="password" class="textjoin1" name="pwCheck" id="pwCheck"></td>
          <td class="explanText">비밀번호를 다시 한번 입력해주세요</td>
        </tr>
        <!-- 주소-->
        <tr>
          <td>주소</td>
          <td> <input type="text" class="textjoin1" name="joinPost" id="joinPost" style="width: 90px;"
              placeholder="우편번호">
            <button class="joinButton" id="post">우편번호 찾기</button></td>
        </tr>
        <tr>
          <td></td>
          <td colspan="2"> <input type="text" class="textjoin1" name="joinAdr" id="joinAdr" style="width: 400px;"
              placeholder="주소"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="text" class="textjoin1" name="joinAdr2" id="joinAdr2" placeholder="상세주소">
          </td>
        </tr>
        <!-- 이메일-->
        <tr>
          <td>이메일</td>
          <td> <input type="email" class="textjoin1" name="joinEmail" id="joinEmail"></td>
          <td><button class="joinButton" id="sendcertify"> 인증번호 보내기</button></td>
        </tr>
        <!-- 인증하기-->
        <tr>
          <td></td>
          <td> <input type="email" class="textjoin1" name="certify" id="certify">
        
          <td><button class="joinButton" id="certify"> 인증하기</button></td>
        </tr>
        <!-- 전화번호-->
        <tr>
          <td>닉네임</td>
          <td> <input type="text" class="textjoin1" name="nickname" id="nickname"></td>
          <td><button class="joinButton" id="nickcheck"> 중복체크</button></td>
        </tr>
        <!-- 생년월일-->
        <tr>
          <td>생년월일</td>
          <td> <input type="text" class="textjoin1" name="birth" id="birth" placeholder="YYYY-MM-DD"></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td><button type="submit">다음단계</button></td>
        </tr>
      </table>


    </form>

  </div>
</body>

</html>