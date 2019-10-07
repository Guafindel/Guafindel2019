var express = require('express');
var router = express.Router();

// /hello, /howareyou, /who
router.get('/hello', sayHello);
router.get('/howareyou/:who',sayhowareyou);

function sayHello(request, response) {
    response.send('Hello~~Router');
}

function sayhowareyou(request, response) {
    var who = request.params.who;
    response.send('Fine Thx ' +  who + ' WA$$UP')
}

module.exports = router;