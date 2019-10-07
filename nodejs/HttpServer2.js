//1.모듈을 로드
//http 모듈
var http = require('http');
//fs 모듈
var fs = require('fs');

//server 생성
var server = http.createServer(function (request, response) {

    var url = request.url;
    console.log(url);

    if (url == '/arin.gif') { //http://localhost:3000/arin.gif
        
        response.writeHeader(200, {'Content-Type': 'image/gif'});

        var path = __dirname + '/arin.gif';

        fs.access(path, fs.F_OK, function (err) {
            //파일 데이터를 로드해서 응답처리
            if (err) {
                response.statusCode = 404;
                response.statusMessage = 'file not found';
                response.end();
                return;
            }
            fs.readFile(path, function (err, data) {
                if (err) {
                    response.statusCode = 404;
                    response.statusMessage = 'file not found';
                    response.end();
                    return;
                }
                response.write(data);
                response.end();
            });
        });
    } else if (url == '/test') {

        response.writeHeader(200, {'Content-Type':'text/html; charset=UTF-8'});
        //http://localhost:3000/arin.gif
        //http://localhost:3000/test
        var htmlStr = __dirname + '/test.html';

        fs.access(htmlStr, fs.F_OK, function (err) {
            if (err) {
                response.statusCode = 404;
                response.statusMessage = 'file not found';
                response.end();
                return;
            }
            fs.readFile(htmlStr, function (err, data) {
                if (err) {
                    response.statusMessage = 404;
                    response.statusMessage = 'file not found';
                    response.end();
                    return;
                }
                //response.write(data);
                //response.end();
                fs.createReadStream(htmlStr).pipe(response);
            });
        });
    }



    //response.end('hi', 'utf-8');
});

//port 생성
server.listen(3000);