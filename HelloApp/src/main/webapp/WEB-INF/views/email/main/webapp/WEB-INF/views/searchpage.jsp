<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <style>
            #hoverforeign:hover{

            }

        </style>
    </head>
<body>
 <!-- Navigation-->
        <div id="box">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: rgb(108, 213, 234) !important;">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">CheckCheck</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"></li>
                        <li class="nav-item"></li>
                        <li class="nav-item dropdown">
                        </li>
                    </ul>
                    <form class="d-flex">
                        <div class="btn btn-outline-dark" >
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </div>
                        <button class="btn btn-outline-dark" type="submit">
                            마이페이지
                        </button>
                        <button class="btn btn-outline-dark" type="submit">
                            로그인
                        </button>
                        <button class="btn btn-outline-dark" type="submit">
                            회원가입
                        </button>
                        
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5" style="position: relative;">
            <img src="image/logo.png" style="position: absolute;width:150px;height:150px;margin-left:40px">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder"><select style="width:100px;height:50px;font-size:16px;" value="통합검색"><option>통합검색</option><option>국내도서</option><option>외국도서</option></select><input style="width:500px;height:50px;font-size:16px;" type="text" name="search" value="검색"><input style="width:100px;height:50px;font-size:16px;" type="button" value="검색">
                    <p class="lead fw-normal text-white-50 mb-0"><ul id="nav123"><a href="#!"><li id="category">카테고리</li></a><a href="#!"><li>베스트</li></a><a href="#!"><li> 신상</li></a><a href="#!"><li> 공지사항</li></a><a href="#!"><li> 문의사항</li></a></ul></p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section style="display:flex">
            <div style="flex:1;border: 1px black solid;margin:5px;height: 500px;">
                <p id="hoverkorea" style="display: inline-block;margin: 0 20px">국내도서</p> <p id="hoverforeign" style="display: inline-block;">외국도서</p>
            <ul id="korea" style="list-style: none;">
            	<li><a href="#!">경제경영</a></li>
            	<li><a href="#!">건강취미</a></li>
            	<li><a href="#!">과학</a></li>
                <li><a href="#!">건강/취미</a></li>
                <li><a href="#!">경제경영</a></li>
                <li><a href="#!">공무원 수험서</a></li>
                <li><a href="#!">과학</a></li>
                <li><a href="#!">달력/기타</a></li>
                <li><a href="#!">대학교재</a></li>
                <li><a href="#!">만화</a></li>
                <li><a href="#!">사회과학</a></li>
                <li><a href="#!">소설/시/희곡</a></li>
                <li><a href="#!">수험서/자격증</a></li>
                <li><a href="#!">어린이</a></li>
                <li><a href="#!">에세이</a></li>
                <li><a href="#!">여행</a></li>
                <li><a href="#!">역사</a></li>
                <li><a href="#!">예술/대중문화</a></li>
            </ul>
            <ul id="foreign" style="display:none;list-style: none;">
            	<li><a href="#!">ELT/어학/사전</a></li>
            	<li><a href="#!">가정/원예/인테리어</a></li>
            	<li><a href="#!">건강/스포츠</a></li>
                <li><a href="#!">경제경영</a></li>
                <li><a href="#!">공예/취미/수집</a></li>
                <li><a href="#!">만화</a></li>
                <li><a href="#!">소설/시/희곡</a></li>
                <li><a href="#!">여행</a></li>
                <li><a href="#!">역사</a></li>
                <li><a href="#!">요리</a></li>
                <li><a href="#!">인문/사회</a></li>
                <li><a href="#!">종교/명상/점술</a></li>
                <li><a href="#!">청소년</a></li>
                <li><a href="#!">해외잡지</a></li>
            </ul>
            </div>
            <div style="flex:5;border: 1px black solid;margin:5px;padding:10px">
                <select style="float:right"><option>10개씩보기</option><option>20개씩보기</option></select>
                <p><a href="#!">국내도서</a></p>



                <!-- 책-->
                <div style="padding:10px;border-top: 1px black solid;clear: both;">
                    <form action="" method="post" style="position:relative">
                    <table>
                        <tr>
                            <td rowspan="5"><img src="image/logo.png"></td><td>이름</td><td>코스모스</td>
                        </tr>
                        <tr>
                            <td>저자</td><td>칼세이건</td>
                        </tr>
                        <tr>
                            <td>출판사</td><td>사이언스 북스</td>
                        </tr>
                        <tr>
                            <td>가격</td><td>17900</td>
                        </tr>
                        <tr>
                            <td>평점</td><td>5</td>
                        </tr>
                    </table>
                    <button style="float:right;position:absolute;right:0;bottom: 10%;">구매</button>
                    <button style="float:right;position:absolute;right:70px;bottom: 10%;">장바구니</button>
                </form>
                </div>
                <!-- 책-->






                <div style="padding:10px;border-top: 1px black solid;clear: both;">
                    <form action="" method="post" style="position:relative">
                    <table>
                        <tr>
                            <td rowspan="5"><img src="image/logo.png"></td><td>이름</td><td>코스모스</td>
                        </tr>
                        <tr>
                            <td>저자</td><td>칼세이건</td>
                        </tr>
                        <tr>
                            <td>출판사</td><td>사이언스 북스</td>
                        </tr>
                        <tr>
                            <td>가격</td><td>17900</td>
                        </tr>
                        <tr>
                            <td>평점</td><td>5</td>
                        </tr>
                    </table>
                    <button style="float:right;position:absolute;right:0;bottom: 10%;">구매</button>
                    <button style="float:right;position:absolute;right:70px;bottom: 10%;">장바구니</button>
                </form>
                </div>
                <div style="padding:10px;border-top: 1px black solid;clear: both;">
                    <form action="" method="post" style="position:relative">
                    <table>
                        <tr>
                            <td rowspan="5"><img src="image/logo.png"></td><td>이름</td><td>코스모스</td>
                        </tr>
                        <tr>
                            <td>저자</td><td>칼세이건</td>
                        </tr>
                        <tr>
                            <td>출판사</td><td>사이언스 북스</td>
                        </tr>
                        <tr>
                            <td>가격</td><td>17900</td>
                        </tr>
                        <tr>
                            <td>평점</td><td>5</td>
                        </tr>
                    </table>
                    <button style="float:right;position:absolute;right:0;bottom: 10%;">구매</button>
                    <button style="float:right;position:absolute;right:70px;bottom: 10%;">장바구니</button>
                </form>
                </div>
               

            </div>
        </section>
        <div id="MOVE_TOP_BTN">
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 12px;position: absolute;top: 15px;left:15px;">top</p></div></a>
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 12px;position: absolute;top: 15px;left:5px;">로그인</p></div></a>
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 10px;position: absolute;top: 15px;left:5px;">회원가입</p></div></a>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
    </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
            $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });

    document.querySelector('#hoverforeign').addEventListener('click',function(){
        this.style.color='blue';
        document.querySelector('#hoverkorea').style.color='black';
        let korea = document.querySelector('#korea');
        korea.style.display = 'none';
        let foreign = document.querySelector('#foreign');
        foreign.style.display = 'block';
    })
    document.querySelector('#hoverkorea').addEventListener('click',function(){
        this.style.color='blue';
        document.querySelector('#hoverforeign').style.color='black';
        let korea = document.querySelector('#korea');
        korea.style.display = 'block';
        let foreign = document.querySelector('#foreign');
        foreign.style.display = 'none';
    })
    </script>
</body>
</html>