//모듈 로드
//express
var express = require('express');

//서버 객체 생성
var app = express();

app.use(function(request, response, next){
    var now = new Date();
    console.log(now.toDateString() + ' : ' + request.method + ' : ' + request.url)
    //시간 : get /test
    //다음 미들웨어가 작동하도록 next 호출
    next();
});

app.use(function(request, response){
    response.send('hello express!');
});

// app.get('/v1/movies', movieList);
// app.post('/v1/movies', movieCreate);
// app.put('/v1/movies/1', movieEdit);

app.listen(3000);

function movieList(){
    console.log('movieList');
};
function movieCreate(){
    console.log('movieCreate');
};
function movieEdit(){
    console.log('movieEdit');
};