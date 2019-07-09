-- 이름: demo_madang.sql
-- 설명
-- madang 스키마를 생성하고 MADANG 서점 실습테이블과 데이터를 입력한다.

CREATE TABLE Book (
  bookid      NUMBER(2) PRIMARY KEY,
  bookname    VARCHAR2(40),
  publisher   VARCHAR2(40),
  price       NUMBER(8) 
);

CREATE TABLE  Customer (
  custid      NUMBER(2) PRIMARY KEY,  
  name        VARCHAR2(40),
  address     VARCHAR2(50),
  phone       VARCHAR2(20)
);


CREATE TABLE Orders (
  orderid NUMBER(2) PRIMARY KEY,
  custid  NUMBER(2) REFERENCES Customer(custid),
  bookid  NUMBER(2) REFERENCES Book(bookid),
  saleprice NUMBER(8) ,
  orderdate DATE
);
-- Book, Customer, Orders 데이터 생성
INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

-- 주문(Orders) 테이블의 책값은 할인 판매를 가정함
INSERT INTO Orders VALUES (1, 1, 1, 6000, TO_DATE('2014-07-01','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, TO_DATE('2014-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, TO_DATE('2014-07-03','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, TO_DATE('2014-07-04','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, TO_DATE('2014-07-05','yyyy-mm-dd'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, TO_DATE('2014-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, TO_DATE( '2014-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, TO_DATE('2014-07-08','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, TO_DATE('2014-07-09','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, TO_DATE('2014-07-10','yyyy-mm-dd'));

COMMIT;

--1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.

--(1) 도서번호가1인도서의이름
select 1
from book
where bookid = 1
;

--도서를 이름으로 찾을 때 
select *
from book
where bookname like '%축구%'
;

--(2) 가격이20,000원이상인도서의이름
select bookname, price
from book
where price >= 20000
;

--(3) 박지성의총구매액(박지성의고객번호는1번으로놓고작성)
select saleprice 
from orders
where custid = 1
;

select sum(saleprice) as "총 구매액", count(*) as "총 구매횟수"
from orders, customer
where orders.custid = customer.custid and name='박지성'
 
;

select sum(saleprice) as "총 구매액", count(*) as "구매횟수"
from orders
where custid = 1
;

--(4) 박지성이구매한도서의수(박지성의고객번호는1번으로놓고작성)
select count(*) as "구매 도서 수"
from orders
where custid = 1
;

--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.

--(1) 마당서점도서의총개수
select bookid
from book
;

select count(*) as "도서 총 개수"
from book
;

--(2) 마당서점에도서를출고하는출판사의총개수
select distinct publisher
from book
;

select count(distinct publisher) as "출판사 총 개수"
from book
;

--(3) 모든고객의이름, 주소
select name, address, nvl(phone,'X')
from customer
;

--(4) 2014년7월4일~7월7일사이에주문받은도서의주문번호
select orderid
from orders
where orderdate between '2014-07-04' and '2014-07-07'
;

--(5) 2014년7월4일~7월7일사이에주문받은도서를제외한도서의주문번호
select orderid
from orders
where not orderdate between '2014-07-04' and '2014-07-07'
;

--(6) 성이‘김’씨인고객의이름과주소
select name,address
from customer
where name like '김__' 
;

select name,address
from customer
where name like '김%'
;

--(7) 성이‘김’씨이고이름이‘아’로끝나는고객의이름과주소
select name, address
from customer
where name like '김_아'
;

select name, address
from customer
where name like '김%아'
;

--1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
--(5) 박지성이구매한도서의출판사수
SELECT COUNT(DISTINCT PUBLISHER)
FROM BOOK B, (SELECT NAME,CUSTID FROM CUSTOMER WHERE NAME = '박지성') C, ORDERS O
WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID
;

--(6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
SELECT BOOKNAME, PRICE, PRICE-SALEPRICE
FROM BOOK B, (SELECT * FROM CUSTOMER WHERE NAME = '박지성') C, ORDERS O
WHERE O.CUSTID = C.CUSTID AND O.BOOKID = B.BOOKID
;

--(7) 박지성이구매하지않은도서의이름
SELECT BOOKNAME
FROM BOOK B, (SELECT * FROM CUSOMER WHERE NAME = '박지성') C, ORDERS O
WHERE O.CUSTID = C.CUSTID  AND O.BOOKID = B.BOOKID
;

--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
--(8) 주문하지않은고객의이름(부속질의사용)
SELECT NAME
FROM CUSTOMER C
WHERE C.CUSTID NOT IN (SELECT CUSTID FROM ORDERS)
;

--(9) 주문금액의총액과주문의평균금액
SELECT SUM(SALEPRICE), AVG(SALEPRICE)
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID
;

--(10) 고객의이름과고객별구매액
SELECT NAME, SUM(SALEPRICE)
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID(+) = C.CUSTID
GROUP BY NAME
;

SELECT NAME, SUM(SALEPRICE)
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID=ORDERS.CUSTID(+)
GROUP BY NAME;
--(11) 고객의이름과고객이구매한도서목록

--(12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문

--(13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름

--3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름

--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름

--4 다음질의에대해DML 문을작성하시오.
--(1) 새로운도서(‘스포츠세계’, ‘대한미디어’, 10000원)이마당서점에입고되었다.
    --삽입이안될경우필요한데이터가더있는지찾아보자.
    
--(2) ‘삼성당’에서출판한도서를삭제해야한다.

--(3) ‘이상미디어’에서출판한도서를삭제해야한다. 삭제가안될경우원인을생각해보자.

--(4) 출판사‘대한미디어’가‘대한출판사’로이름을바꾸었다.

