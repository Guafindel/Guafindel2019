//모듈 로드
//Http.Server
var fs = require('fs');
var http = require('http');
var querystring = require('querystring');
var formidable = require('formidable');
var pathUtil = require('path');

//데이터
var movieList = [{
    title: '스타워즈',
    director: '조지루카스',
    image: '/images/999DC33C5D4E85B70E.gif'
}];

//images 경로
var imgDirPath = __dirname + '/images';

var server = http.createServer(function (request, response) {

    var url = request.url;
    var method = request.method.toLocaleLowerCase();

    if (url == '/' && method == 'get') {
        list(request, response);

    } else if (url.indexOf('/images/') == 0 && method == 'get') {
        var urlPath = __dirname + request.url; //__dirname + images/999DC33C5D4E85B70E.gif
        response.writeHead(200, {
            'Content-Type': 'image/gif'
        });
        fs.createReadStream(urlPath).pipe(response);
    } else if (url == '/' && method == 'post') {
        addNewMovie(request, response);
    }

    //GET, POST 구분
    // var method = request.method.toLocaleLowerCase();
    // console.log('request Method : ' + method);

    // if (method == 'post') {
    //     console.log('post 요청일 때 처리');
    //     //addMovie(request, response);
    //     //addNewMoview();
    // } else if (method == 'get') {
    //     console.log('get 요청일 때 처리');
    //     //list(request, response);
    // } else if (method == 'put') {
    //     console.log('put 요청일 때 처리');
    // } else if (method == 'delete') {
    //     console.log('delete 요청일 때 처리');
    // } else {
    //     console.log('그 외의 요청일 때 처리');
    // }

});
//포트설정
server.listen(3000);

function addNewMovie(request, response) {

    var form = formidable.IncomingForm();
    //form.uploadDir = imgDirPath;

    form.parse(request, function (err, fields, files) {

        var title = fields.title;
        var director = fields.director;
        var posterImg = files.poster;

        var date = new Date();

        var newFileName = 'poster_' + date.getHours() + date.getMinutes() + date.getSeconds();

        var ext = pathUtil.parse(posterImg.name).ext;

        var newPath = __dirname + pathUtil.sep + 'images' + pathUtil.sep + newFileName + ext;

        fs.renameSync(posterImg.path, newPath);

        var newPosterImgUrl = 'images/' + newFileName + ext;

        var mInfo = {
            title: title,
            director: director,
            image: newPosterImgUrl
        };
        movieList.push(mInfo);

        response.statusCode = 302;
        response.setHeader('Location', '.');
        response.end('success');

    });

}

function addMovie(request, response) {
    //response의 'data'/'end' 이벤트를 이용해서 body의 내용을 읽어 처리한다.
    //console.log('addMovie');
    var body = '';

    request.on('data', function (chunk) {
        body += chunk;
        console.log('body : ' + body);
    });
    request.on('end', function () {
        var parsedData = querystring.parse(body);
        console.log('parsed :', parsedData);
        movieList.push({
            title: parsedData.title,
            director: parsedData.director
        });

        // list(request, response);
        response.statusCode = 302;
        response.setHeader('Location', '.');
        response.end('success');

    });
}

function list(request, response) {
    //movieList 데이터를 출력해서 보여주는 html

    //해더 설정
    response.writeHeader(200, {
        'Content-Type': 'text/html; charset=UTF-8'
    });

    //바디 설정
    response.write('<html>');
    response.write('<head><meta charset=UTF-8></head>');
    response.write('<body>');
    response.write('<h3>Favorite Movie</h3>');
    response.write('<div><ul>');

    movieList.forEach(function (item) {
        response.write('<li><img src="' + item.image + '" height="200px">' + item.title + '(' + item.director + ')' + '</li>')
    });

    response.write('</ul></div>');
    response.write(
        '<form method="post" enctype="multipart/form-data"><h4>새 영화 입력</h4>' +
        '<div><input type="text" name="title" placeholder="영화제목"></div>' +
        '<div><input type="text" name="director" placeholder="감독"></div>' +
        '<div><input type="file" name="poster"></div>' +
        '<input type="submit" value="upload">' +
        '</form>'
    );
    response.write('</body>');
    response.write('</html>');

    //응답실행
    response.end();
}