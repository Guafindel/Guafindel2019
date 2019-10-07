//1. 모듈 등록
var http = require('http'); // 웹 서버 생성 모듈


http.createServer(function(request, response){ //콜백 함수
    response.writeHead(200, {'Content-Type' : 'text/html'});
    response.end('<h1>Hello NodeJS!</h1>'); //html 정의
}).listen(3000); //포스트 정의

//NodeJS 흐름
//1.모듈 호출(등록)
//2.객체 생성
//3.객체, 메소드, 변수, 이벤트