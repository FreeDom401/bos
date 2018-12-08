prompt PL/SQL Developer import file
prompt Created on 2018年12月8日 by fudingcheng
set feedback off
set define off
prompt Creating T_CUSTOMER...
create table T_CUSTOMER
(
  c_id            NUMBER(10) not null,
  c_address       VARCHAR2(255 CHAR),
  c_brithday      DATE,
  c_company       VARCHAR2(255 CHAR),
  c_department    VARCHAR2(255 CHAR),
  c_email         VARCHAR2(255 CHAR),
  c_fixed_area_id VARCHAR2(255 CHAR),
  c_mobilephone   VARCHAR2(255 CHAR),
  c_password      VARCHAR2(255 CHAR),
  c_position      VARCHAR2(255 CHAR),
  c_sex           NUMBER(10),
  c_telephone     VARCHAR2(255 CHAR),
  c_type          NUMBER(10),
  c_username      VARCHAR2(255 CHAR)
)
;
alter table T_CUSTOMER
  add primary key (C_ID);

prompt Loading T_CUSTOMER...
insert into T_CUSTOMER (c_id, c_address, c_brithday, c_company, c_department, c_email, c_fixed_area_id, c_mobilephone, c_password, c_position, c_sex, c_telephone, c_type, c_username)
values (1, '陕西省西安市未央区草滩六路汇锦园4楼', to_date('01-07-1998', 'dd-mm-yyyy'), 'A公司', 'A部门', 'aaa@163.com', 'dp001', '01012345671', '123456', '经理', 1, '13112345678', 1, '张三');
insert into T_CUSTOMER (c_id, c_address, c_brithday, c_company, c_department, c_email, c_fixed_area_id, c_mobilephone, c_password, c_position, c_sex, c_telephone, c_type, c_username)
values (2, '北京市海淀区建材城西路育新花园9号楼111', to_date('01-07-1998', 'dd-mm-yyyy'), 'B公司', 'B部门', 'bbb@163.com', 'dp003', '01012345672', '123456', '经理', 1, '13212345678', 1, '李四');
insert into T_CUSTOMER (c_id, c_address, c_brithday, c_company, c_department, c_email, c_fixed_area_id, c_mobilephone, c_password, c_position, c_sex, c_telephone, c_type, c_username)
values (3, '北京市海淀区中关村海龙大厦1111', to_date('01-07-1998', 'dd-mm-yyyy'), 'C公司', 'C部门', 'ccc@163.com', 'dp004', '01012345673', '123456', '经理', 1, '13312345678', 1, '王五');
insert into T_CUSTOMER (c_id, c_address, c_brithday, c_company, c_department, c_email, c_fixed_area_id, c_mobilephone, c_password, c_position, c_sex, c_telephone, c_type, c_username)
values (4, '北京市海淀区中关村软件园国际软件大厦112', to_date('01-07-1998', 'dd-mm-yyyy'), 'D公司', 'D部门', 'ddd@163.com', null, '01012345674', '123456', '经理', 1, '3412345678', 1, '赵六');
commit;
prompt 4 records loaded
set feedback on
set define on
prompt Done.
