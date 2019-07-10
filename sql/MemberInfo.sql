--MemberInfo ���̺�� ���� �ۼ�

desc memberinfo;

--MemberInfo ���̺� �����
--�븮Ű : idx                     -   �⺻Ű
--���̵� : 6~12 �ڸ� ���ڿ�         - not null, unique
--��й�ȣ : 8~16�ڸ� ���ڿ�         - not null
--�̸� : 10�ڸ� ���ڿ�              - not null
--�������(�����̸�) : 30�ڸ� ���ڿ�  - 
--���Գ�¥ : ��¥Ÿ��               - default sysdate

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

--ȸ�� ���Խ� �����ϴ� idx ���� ���� sequence ����
create sequence MemberInfo_idx_sequence;
drop sequence MemberInfo_idx_sequence;
select MemberInfo_idx_sequence.nextval from dual;
select MemberInfo_idx_sequence.currval from dual;
--MemberInfo�� ������ �����ϱ�
insert into MemberInfo (idx, mId, mPx, mName, mPhoto, regDate)
values(MemberInfo_idx_sequence.nextval, 'Guafindel', '9999', '������', 'jjong.jpg', TO_DATE('2017-10-26','yyyy-mm-dd'));
            
insert into MemberInfo (idx, mId, mPx, mName, mPhoto, regDate)
values(MemberInfo_idx_sequence.nextval, 'Arin', '7942', '�ֿ���', 'arin.jpg', TO_DATE('2019-07-03','yyyy-mm-dd'));

insert into MemberInfo (idx, mId, mPx, mName, mPhoto, regDate)
values(MemberInfo_idx_sequence.nextval, 'kim', '4949', '���', '', TO_DATE('2017-03-04','yyyy-mm-dd'));

insert into MemberInfo
values(MemberInfo_idx_sequence.nextval, 'cute', '3434', '�Ӽ���', 'lim.jpg', TO_DATE('2012-10-26','yyyy-mm-dd'));

insert into MemberInfo
values(MemberInfo_idx_sequence.nextval, 'tiger', '1212', 'ȣ����', 'tiger.jpg', TO_DATE('2015-06-24','yyyy-mm-dd'));

COMMIT;

drop table memberinfo;
            
select * from memberinfo; 

desc memberinfo;

--�⺻Ű�� ���� �����ϱ�
update memberinfo
set mPhoto = 'Kim.jpg'
where idx = 3
;

update memberinfo
set mpx = '2222'
where idx = 2
;

--Ư�� ���� �����ϱ�
delete 
from memberinfo
where idx = 5
;

delete 
from memberinfo
where idx = 3
;

--��ü ���� �����ϱ�
delete 
from memberinfo
;

COMMIT;

Rollback;

--�߸��� ���� �����ϱ�(pk) ���� ������
insert into memberinfo
values(3,'won','7474','����','won.jpg',to_date('2019-02-13','yyyy-mm-dd'));

--�߸��� ���� �����ϱ�(NN) ���� ������
insert into memberinfo
values(5, null, '6974', '���', 'tix.png', sysdate);

delete 
from memberinfo
;

select * from memberinfo;
select * from memberinfo oder by idx;
commit;

rollback;

--create���̺��� �ϸ� rollback�� �ص� ������ �����ߴ� commit�� ���� �ʴ´�.
--�̷��� DDL��(create, alter, drop, rename, truncate)���� �ڵ� commit�Ӽ��� �ֱ� �����̴�. 
create table mem
as
select *
from dept
;

drop table memberinfo;
