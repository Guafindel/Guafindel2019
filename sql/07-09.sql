--2019.07.09 
--������ ���̺� ������ JAVA�� �����غ���

--MemberInfo ���̺� �����
--�븮Ű : idx                     -   �⺻Ű
--���̵� : 6~12 �ڸ� ���ڿ�         - not null, unique
--��й�ȣ : 8~16�ڸ� ���ڿ�         - not null
--�̸� : 10�ڸ� ���ڿ�              - not null
--�������(�����̸�) : 30�ڸ� ���ڿ�  - 
--���Գ�¥ : ��¥Ÿ��               - default sysdate

--CREATE TABLE : ���̺� ���� (������ ���� ��Ģ�� ����)
--�÷� �̸�, ���� �������� Ÿ��, ���� ������ ������, ��������

--���Ἲ ���� ���ǵ�
--null ����
--�ߺ� ����(unique)
--�⺻��
--üũ
--�⺻Ű 
--�ܷ�Ű

Create table GuafindelTable (
    idx number(4),
    gid varchar2(12),
    gpw varchar2(16),
    gname varchar2(20),
    gphoto varchar2(40),
    regdate Date
);


--INSERT INTO ���̺��̸� (�÷�����Ʈ) VALUES(��, ��, ��...)


