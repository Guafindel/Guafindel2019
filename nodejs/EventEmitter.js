var Person = function(){};
//상속처리를 위한 util 모듈 로드 
var util = require('util');
//이벤트 등록을 위한 EventEmitter 생성
var EventEmitter = require('events').EventEmitter;
//Person에 EventEmitter 상속
util.inherits(Person, EventEmitter);
//person 객체 생성
var person = new Person();
//이벤트 등록
person.on('어때?', function() {
    console.log('끝내주네!');
});
//이벤트 발생
person.emit('어때?');


//자바스크립트 객체 생성
var obj ={};
obj.name = 'Johsua';
obj.hello = function(){
    console.log(this.name);
};
obj.hello();


var Human = function() {
}
//공용 메소드 정의
Human.prototype.sayHello = function(){
    console.log('안녕안녕반가워');
};

class Member {
}

var human = new Human();
var member = new Member();

//console.log(human, member);
human.sayHello();

