//url 모듈 로드
var url = require('url');

var urlStr = 'http://localhost:8080/nm/detail?m_idx=109';

var parsed = url.parse(urlStr);

console.log(parsed);