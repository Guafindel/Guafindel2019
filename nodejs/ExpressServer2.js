//express 서버
var express = require('express');
var app = express();

//미들웨어를 통한 사용자 요청 맵핑
//1.미들웨어 사용
//2.라우터 분기 : app.get(), app.post(), app.put(), app.delete()
//3.라우터 함수 이용 : app.route('경로'), get(경로), func) post(경로), func) put(경로), func) delete(경로)
//4.라우터 코드 분리 : 모듈로 구성

//2번 사용
app.get('/test', function(request, response){
    response.send('user app.get');
});

//3번 사용
app.route('/book').get(function(request, response){
    response.send('user app.route().get()');
}).post(function(request, response){
    response.send('user app.route().post()');
}).put(function(request, response){
    response.send('user app.route().put()');
}).delete(function(request, response){
    response.send('user app.route().delete()');
});

app.use('/v1/hi', require('./router.js'));
// http://localhost:3000/v1/hi/hello
// http://localhost:3000/v1/hi/howareyou/cool

app.listen(3000);