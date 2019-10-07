var fs = require('fs');
var path = 'textData.txt';

fs.renameSync(path, function(err){
    if(err) {
        console.log('renameSync 실패 : ', err);
    }
});