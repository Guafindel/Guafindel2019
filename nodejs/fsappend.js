var fs = require('fs');
var path = 'textData.txt';

fs.appendFile(path, ' Additional data', function(err){
    if(err){
        console.log('파일 내용 추가 실패: ', err);
    }
    console.log('파일 내용 추가 성공');
});

