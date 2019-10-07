// 모듈 로드
var http = require('http');
// http.server 객체 생성
var server = http.createServer();
// server event set : request
server.on('request', function (request, response) {
});
// server event set : connection
server.on('connection', function (socket) {
console.log('connection event');
});
// server event set : close
server.on('close', function () {
console.log('close');
});
// port set
server.listen(3000);