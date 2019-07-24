--2019.07.16

select * from adver;

CREATE TABLE adver (
    adver_ID number(6) constraint adver_adver_ID_pk PRIMARY KEY,
    company_ID varchar2(50) constraint adver_company_ID_fk FOREIGN KEY,
    adver_Title varchar2(255) not null,
    adver_Content long not null,
    adver_Date date default sysdate,
    adver_Photo varchar2(150)
);

INSERT INTO adver (adver_ID, company_ID, adver_Title, adver_Content, adver_Photo)
VALUES (adver_adver_ID_SEQ.nextval, ?, ?, ?, ?);


select * from adver order by adver_id;

select * from company;


drop table adver;

CREATE SEQUENCE ad_aid_seq;

drop sequence ad_aid_seq;

insert into adver (adver_ID, company_ID, adver_Title, adver_Content, adver_Date, adver_Photo)
values (ad_aid_seq.nextval, ?, ?, ?, ?, ?);

insert into adver (adver_ID, company_ID, adver_Title, adver_Content, adver_Date, adver_Photo)
values (ad_aid_seq.nextval, 'com123', '날씨 좋네요', '좋은 하루들 보내시길 바랍니다.', sysdate, '555312.jpg');

commit;

INSERT INTO COMPANY
VALUES ('COM', '1234', '소종원', 'Guafindel@gmail.com', '123-12-12345');
