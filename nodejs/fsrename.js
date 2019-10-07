var fs = require('fs');
var path = 'textData.txt';
var path2 = 'textData2.txt';

fs.rename(path, path2, function(err){
    if(err) {
        console.log('파일 이름 변경 실패 : ', err);
    }
});