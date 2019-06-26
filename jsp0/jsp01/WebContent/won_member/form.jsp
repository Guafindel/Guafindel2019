<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 스크립트 삽입 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 제이쿼리 스크립트 삽입  -->

<link href="/jsp01/css/won.css" rel="stylesheet" type="text/css">

<!-- 스타일 시작 -->
<style>


</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<div id="wrap">
        <div id="header">
            <h1>
                <a href="http://www.naver.com" class="h_logo"></a>
            </h1>
        </div>

        <form id="login.jsp" method="post">
            <div id="content">
                <div class="content_row">
                    <div id="inrow1" class="h4_content">
                        <h3><label for="userId">아이디</label></h3>
                        <span class="inputBox">
                            <input type="text" id="userId" name="uId" class="input necessary" maxlength="20">
                            <span class="inText">
                                <label for="userId">@naver.com</label>
                            </span>
                        </span>
                        <h4></h4>
                    </div>
                    <div id="inrow2" class="h4_content">
                        <h3><label for="userPw">비밀번호</label></h3>
                        <span class="inputBox"><input type="password" id="userPw" name="uPw" class="input necessary" maxlength="20">
                            <label for="userPw">
                                <span class="inText pwimg">
                                    <p id="pwtext">안전</p>
                                </span>
                            </label>
                        </span>
                        <h4></h4>
                    </div>
                    <div id="inrow3" class="h4_content">
                        <h3><label for="userPw2">비밀번호 재확인</label></h3>
                        <span class="inputBox"><input type="password" id="userPw2" class="input necessary" maxlength="20">
                            <label for="userPw2">
                                <span class="inText pwimg2"></span>
                            </label>
                        </span>
                        <h4></h4>
                    </div>
                </div>

                <div class="content_row2">
                    <div id="inrow4" class="h4_content">
                        <h3><label for="name">이름</label></h3>
                        <span class="inputBox"><input type="text" id="name" name="uName" class="input necessary" maxlength="40"></span>
                        <h4></h4>
                    </div>
                    <div id="inrow5" class="h4_content">
                        <h3><label for="y">생년월일</label></h3>
                        <div id="birthBox">
                            <span class="inputBox bir">
                                <input type="text" id="y" name="uBirth" class="input" placeholder="년(4자)" aria-label="년(4자)" maxlength="4">
                            </span>
                            <span class="inputBox bir">
                                <select id="m" aria-label="월" class="input">
                                    <option value="">월</option>
                                </select>
                            </span>
                            <span class="inputBox bir">
                                <input type="text" id="d" name="d" class="input" placeholder="일" aria-label="일" maxlength="2">
                            </span>
                        </div>
                        <h4></h4>
                    </div>

                    <div id="inrow6" class="h4_content">
                        <h3><label for="gender">성별</label></h3>
                        <span class="inputBox">
                            <select id="gender" name="uGender" aria-label="성별" class="input necessary">
                                <option value="" selected>성별</option>
                                <option value="male">남자</option>
                                <option value="female">여자</option>
                            </select>
                        </span>
                        <h4></h4>
                    </div>
                    <div id="inrow7" class="h4_content">
                        <h3><label for="email">본인 확인 이메일<span class="sel">(선택)</span></label></h3>
                        <span class="inputBox"><input type="text" id="email" name="uEmail" class="input" placeholder="선택입력"></span>
                        <h4></h4>
                    </div>
                </div>

                <div class="content_row3 h4_content">
                    <h3><label for="telNum">휴대전화</label></h3>
                    <span class="inputBox">
                        <select id="country" name="country" class="input">
                            <option value="82" selected>대한민국 +82</option>
                        </select>
                    </span>

                    <div id="inputTel">
                        <span class="inputBox tel">
                            <input type="tel" id="telNum" name="uPnum" class="input necessary" placeholder="전화번호 입력">
                        </span>
                        <input type="button" value="인증번호 받기" class="btn_type" id="btn_type2">
                    </div>

                    <div id="inputTel2">
                        <span class="inputBox telNum2"><input type="text" id="in" name="in" class="input telNum2" placeholder="인증번호 입력하세요" disabled></span>

                    </div>
                    <h4></h4>

                </div>

                <input type="submit" value="가입하기" class="btn_type" id="btn_type">

            </div>

        </form>

        <div id="footer">
            <ul>
                <li class="righttbar"><a href="#">이용약관</a></li>
                <li class="righttbar"><strong><a href="#">개인정보처리방침</a></strong></li>
                <li class="righttbar"><a href="#">책임의 한계와 법적고지</a></li>
                <li><a href="#">단체 회원 가입</a></li>
            </ul>

            <adress>
                <p>
                    <a href="http://www.naver.com" class="logo_small"></a>
                </p>
                <p>
                    Copyright
                </p>
                <p>
                    <strong>NAVER Corp.</strong>
                </p>
                <p>
                    All Rights Reserved.
                </p>

            </adress>
        </div>

    </div>
    
    
    <script>
    
        $(document).ready(function() {

            //가입 조건 모두 1이어야 submit전송
            var restric = {
                userId: 0,
                userPw: 0,
                userPw2: 0,
                name: 0,
                y: 0,
                gender: 0,
                telNum: 0,
                email: 1
            };

            //1월부터 12월 option 생성
            for (var i = 1; i <= 12; i++) {
                $('#m').append('<option>' + i + '</option>')
            }

            //누르면 초록색 테두리 생기는거
            $('.input').focus(function() {
                $(this).closest('.inputBox').css('border-color', '#08a600');
            });
            $('.input').focusout(function() {
                $(this).closest('.inputBox').css('border-color', '#dadada');
            });

            //필수 정보입니다 표시해주는거
            $('.necessary').focusout(function() {
                if ($(this).val().length < 1) {
                    $(this).closest('.h4_content').find('h4').html('필수 정보입니다.').css('color', 'red');
                    restric[$(this).attr('id')] = 0;
                };
            });
            //아이디 유효성 검증
            $('#userId').focusout(function() {
                //5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
                var pattern = /[a-z0-9_-]{5,20}/;
                if ($(this).val().length > 0) {
                    if (pattern.test($(this).val()) && $(this).val().length < 21) {
                        $(this).closest('.h4_content').find('h4').html('멋진 아이디네요!').css('color', '#08A600');
                        restric[$(this).attr('id')] = 1;
                    } else {
                        $(this).closest('.h4_content').find('h4').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.').css('color', 'red');
                        restric[$(this).attr('id')] = 0;
                    };
                };
            });
            //비밀번호 유효성 검증
            $('#userPw').focusout(function() {
                //8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
                var pattern = /([^\s\w]|[A-z0-9]){8,16}/;
                if ($(this).val().length > 0) {
                    if (pattern.test($(this).val()) && $(this).val().length < 17) {
                        $(this).closest('.h4_content').find('h4').html('');
                        $('.pwimg').addClass('changed');
                        $('#pwtext').html('안전').css('display', 'block').css('color', '#08A600');
                        restric[$(this).attr('id')] = 1;
                    } else {
                        $(this).closest('.h4_content').find('h4').html('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.').css('color', 'red');
                        $('.pwimg').removeClass('changed').addClass('error');
                        $('#pwtext').html('사용불가').css('display', 'block').css('color', 'red');
                        restric[$(this).attr('id')] = 0;
                    };
                } else {
                    $('.pwimg').removeClass('changed').removeClass('error');
                    $('#pwtext').css('display', 'none');
                    restric[$(this).attr('id')] = 0;
                }
            });
            //비밀번호 재확인
            $('#userPw2').focusout(function() {
                if ($(this).val() == $('#userPw').val()) {
                    $('.pwimg2').addClass('changed2');
                    $(this).closest('.h4_content').find('h4').html('');
                    restric[$(this).attr('id')] = 1;
                } else {
                    $('.pwimg2').removeClass('changed2');
                    $(this).val('');
                    $(this).closest('.h4_content').find('h4').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
                    restric[$(this).attr('id')] = 0;
                }

            });
            //이름
            $('#name').focusout(function() {
                //한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)
                var pattern = /[^가-힣A-z]/g;
                if ($(this).val().length > 0) {
                    if (!pattern.test($(this).val())) {
                        $(this).closest('.h4_content').find('h4').html('').css('color', '#08A600');
                        restric[$(this).attr('id')] = 1;
                    } else {
                        $(this).closest('.h4_content').find('h4').html('한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)').css('color', 'red');
                        restric[$(this).attr('id')] = 0;
                    };
                };
            });
            //생년월일
            $('#y,#m,#d').focusout(function() {
                //한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)
                var patternY = /[^0-9]/g;
                if ($('#y').val().length == 4) {
                    if (!patternY.test($('#y').val())) {
                        if (!patternY.test($('#d').val()) && $('#d').val().length > 0) {
                            if ($('#m').val().length > 0) {
                                $(this).closest('.h4_content').find('h4').html('').css('color', '#08A600');
                                restric['y'] = 1;
                            } else {
                                $(this).closest('.h4_content').find('h4').html('생년월일을 다시 확인해주세요.').css('color', 'red');
                                restric['y'] = 0;
                            }
                        } else {
                            $(this).closest('.h4_content').find('h4').html('태어난 일(날짜) 2자리를 정확하게 입력하세요.').css('color', 'red');
                            restric['y'] = 0;
                        }

                    } else {
                        $(this).closest('.h4_content').find('h4').html('태어난 년도 4자리를 정확하게 입력하세요.').css('color', 'red');
                        restric['y'] = 0;
                    };
                } else {
                    $(this).closest('.h4_content').find('h4').html('태어난 년도 4자리를 정확하게 입력하세요.').css('color', 'red');
                    restric['y'] = 0;
                }
            });
            //성별
            $('#gender').focusout(function() {
                if ($(this).val().length > 0) {
                    $(this).closest('.h4_content').find('h4').html('').css('color', '#08A600');
                    restric[$(this).attr('id')] = 1;
                }
            });
            //이메일
            $('#email').focusout(function() {
                //이메일 정규식
                var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                if ($(this).val().length > 0) {
                    if (pattern.test($(this).val())) {
                        $(this).closest('.h4_content').find('h4').html('').css('color', '#08A600');
                        restric[$(this).attr('id')] = 1;
                    } else {
                        $(this).closest('.h4_content').find('h4').html('이메일 주소를 다시 확인해주세요.').css('color', 'red');
                        restric[$(this).attr('id')] = 0;
                    }
                } else {
                    $(this).closest('.h4_content').find('h4').html('').css('color', '#08A600');
                    restric[$(this).attr('id')] = 1;
                }
            });
            //전화번호
            $('#telNum').focusout(function() {
                if ($(this).val().length > 0) {
                    $(this).closest('.h4_content').find('h4').html('').css('color', '#08A600');
                    restric[$(this).attr('id')] = 1;
                }
            });
            //가입하기 버튼
            $('#join').submit(function() {
                var submit = 0;
                $.each(restric, function(index, item) {
                    submit += item;
                    if (item == 0) {
                        $('#' + index).closest('.h4_content').find('h4').html('필수 정보입니다.').css('color', 'red');
                    };
                });
                if (!(Object.keys(restric).length == submit)) {
                    return false;
                } else {
                    alert('가입 성공')
                }

            });

        });
    </script>
    
</body>
<!-- 바디 끝 -->

</html>