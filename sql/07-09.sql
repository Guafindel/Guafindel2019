--2019.07.09 
--스스로 테이블 만들어보고 JAVA와 연동해보기

--MemberInfo 테이블 만들기
--대리키 : idx                     -   기본키
--아이디 : 6~12 자리 문자열         - not null, unique
--비밀번호 : 8~16자리 문자열         - not null
--이름 : 10자리 문자열              - not null
--사진경로(파일이름) : 30자리 문자열  - 
--가입날짜 : 날짜타입               - default sysdate

--CREATE TABLE : 테이블 생성 (데이터 저장 규칙을 정의)
--컬럼 이름, 저장 데이터의 타입, 저장 데이터 사이즈, 제약조건

--무결성 제약 조건들
--null 유무
--중복 여부(unique)
--기본값
--체크
--기본키 
--외래키

Create table GuafindelTable (
    idx number(4),
    gid varchar2(12),
    gpw varchar2(16),
    gname varchar2(20),
    gphoto varchar2(40),
    regdate Date
);


--INSERT INTO 테이블이름 (컬럼리스트) VALUES(값, 값, 값...)


