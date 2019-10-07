var fs = require('fs');
var path = 'textData.txt';

fs.unlink(path, function(err){
    if(err){
        console.log('파일 삭제 실패 : ', err);
    }
    console.log('파일 삭제 성공');
});