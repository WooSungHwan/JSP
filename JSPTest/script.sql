create table tblAddress(   
    seq number primary key,         --�ּҷ� ��ȣ
    name varchar2(30) not null,     --�̸�
    address varchar2(300) not null, --�ּ�
    age number(3) not null,         --����
    gender char(1) not null,        --����(m,f)
    tel varchar2(20) not null       --����ó
);
drop table tblAddress;

create sequence address_seq;

--R
select * from tblAddress;

--C
insert into tblAddress values(address_seq.nextval,'홍길동','서울시 강남구 역삼동',20,'m','010-3719-5510');

--U
update tblAddress set
    name = '아무개', address='의정부시 의정부1동',age = 21,gender = 'f',tel = '010-5006-9533' where seq=1;
    
--D
delete from tblAddress where seq =1;