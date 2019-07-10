--MemberInfo 테이블과 쿼리 작성

desc memberinfo;

--MemberInfo 테이블 만들기
--대리키 : idx                     -   기본키
--아이디 : 6~12 자리 문자열         - not null, unique
--비밀번호 : 8~16자리 문자열         - not null
--이름 : 10자리 문자열              - not null
--사진경로(파일이름) : 30자리 문자열  - 
--가입날짜 : 날짜타입               - default sysdate

create table MemberInfo (
    idx number(4),  
    mId varchar2(12) constraint MemberInfo_mId_NN not null,
    mPx varchar2(16) constraint MemberInfo_mPw_NN not null,
    mName varchar(20) constraint MemberInfo_mName_NN not null,
    mPhoto varchar(30), 
    regDate Date default sysdate,
    constraint MemberInfo_idx_pk PRIMARY KEY (idx),
    constraint MemberInfo_mId_uk UNIQUE (mId)
);

--회원 가입시 증가하는 idx 값을 위한 sequence 생성
create sequence MemberInfo_idx_sequence;
drop sequence MemberInfo_idx_sequence;
select MemberInfo_idx_sequence.nextval from dual;
select MemberInfo_idx_sequence.currval from dual;
--MemberInfo의 데이터 삽입하기
insert into MemberInfo (idx, mId, mPx, mName, mPhoto, regDate)
values(MemberInfo_idx_sequence.nextval, 'Guafindel', '9999', '소종원', 'jjong.jpg', TO_DATE('2017-10-26','yyyy-mm-dd'));
            
insert into MemberInfo (idx, mId, mPx, mName, mPhoto, regDate)
values(MemberInfo_idx_sequence.nextval, 'Arin', '7942', '최예원', 'arin.jpg', TO_DATE('2019-07-03','yyyy-mm-dd'));

insert into MemberInfo (idx, mId, mPx, mName, mPhoto, regDate)
values(MemberInfo_idx_sequence.nextval, 'kim', '4949', '김민', '', TO_DATE('2017-03-04','yyyy-mm-dd'));

insert into MemberInfo
values(MemberInfo_idx_sequence.nextval, 'cute', '3434', '임선어', 'lim.jpg', TO_DATE('2012-10-26','yyyy-mm-dd'));

insert into MemberInfo
values(MemberInfo_idx_sequence.nextval, 'tiger', '1212', '호랑이', 'tiger.jpg', TO_DATE('2015-06-24','yyyy-mm-dd'));

COMMIT;

drop table memberinfo;
            
select * from memberinfo; 

desc memberinfo;

--기본키로 정보 수정하기
update memberinfo
set mPhoto = 'Kim.jpg'
where idx = 3
;

update memberinfo
set mpx = '2222'
where idx = 2
;

--특정 정보 삭제하기
delete 
from memberinfo
where idx = 5
;

delete 
from memberinfo
where idx = 3
;

--전체 정보 삭제하기
delete 
from memberinfo
;

COMMIT;

Rollback;

--잘못된 정보 삽입하기(pk) 예를 만들어보기
insert into memberinfo
values(3,'won','7474','종원','won.jpg',to_date('2019-02-13','yyyy-mm-dd'));

--잘못된 정보 삽입하기(NN) 예를 만들어보기
insert into memberinfo
values(5, null, '6974', '잼민', 'tix.png', sysdate);

delete 
from memberinfo
;

select * from memberinfo;
select * from memberinfo oder by idx;
commit;

rollback;

--create테이블을 하면 rollback을 해도 이전에 시행했던 commit로 가지 않는다.
--이러한 DDL문(create, alter, drop, rename, truncate)에는 자동 commit속성이 있기 때문이다. 
create table mem
as
select *
from dept
;

drop table memberinfo;
