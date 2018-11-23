create table tblAddress(   
    seq number primary key,         --�ּҷ� ��ȣ
    name varchar2(30) not null,     --�̸�
    address varchar2(300) not null, --�ּ�
    age number(3) not null,         --����
    gender char(1) not null,        --����(m,f)
    tel varchar2(20) not null       --����ó
);
drop table tblAddress;
drop sequence address_seq;
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

------------------------------------------------------------------------------------------------------------
--인증 테이블

create table tblAuth(
    id varchar2(30) primary key,        --아이디  
    pw varchar2(30) not null,          --비밀번호
    name varchar2(30) not null,         --이름
    lv number(1) not null               --등급(1:일반 2:관리자)
);


insert into tblAuth values('test','1111','테스트',1);
insert into tblAuth values('hong','1111','홍길동',1);
insert into tblAuth values('lee',1111,'이순신',2);

commit;

select * from tblAuth;



select count(*) as cnt from tblAuth where id = 'test' and pw = '1111';


create table tblMember(
    id varchar2(30) primary key,
    pw varchar2(30) not null,
    name varchar2(30) not null,
    lv number(1) not null
);

create table tblCategory(
    seq number primary key,
    name varchar2(100) not null
);

create table tblCode(
    seq number primary key,         --게시물 번호
    subject varchar2(500) not null, --게시물 제목
    content varchar2(1000) not null,   --설명
    category number not null,           
    regdate date default sysdate not null,
    id varchar2(30) not null,
    filename varchar2(100) not null,
    constraint tblCode_id_FK foreign key(id) references tblMember(id),
    constraint tblCode_category_FK foreign key(category) references tblCategory(seq)
);

select * from tblCode;
select seq,subject,(select name from tblMember where id = c.id) as name,regdate,(select name from tblCategory where seq = c.category) as categoryName from tblCode c order by seq desc;
create sequence code_seq;

select c.*,
    (select name from tblMember where id = c.id) as name, 
        (select name from tblCategory where seq = c.category) as categoryName 
            from tblCode c where seq = ?
commit;
select m.*,(select count(*) from tblCode where id = m.id) as cnt from tblMember m;
select m.*,(select count(*) from tblCode where id = m.id) as cnt from tblMember m;
delete from tblCode where seq = 8;

--회원 정보
insert into tblMember values('hong','1111','홍길동',1);
insert into tblMember values('test','1111','테스트',1);
insert into tblMember values('lee','1111','이순신',2);

--카테고리
insert into tblCategory values(1,'Java');
insert into tblCategory values(2,'SQL');
insert into tblCategory values(3,'HTML');
insert into tblCategory values(4,'CSS');
insert into tblCategory values(5,'JavaScript');

commit;














































