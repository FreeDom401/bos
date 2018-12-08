prompt PL/SQL Developer import file
prompt Created on 2018年12月8日 by fudingcheng
set feedback off
set define off
prompt Creating T_ARCHIVE...
create table T_ARCHIVE
(
  c_id                NUMBER(10) not null,
  c_archive_name      VARCHAR2(255 CHAR),
  c_archive_num       VARCHAR2(255 CHAR),
  c_haschild          NUMBER(10),
  c_operating_company VARCHAR2(255 CHAR),
  c_operating_time    TIMESTAMP(6),
  c_operator          VARCHAR2(255 CHAR),
  c_remark            VARCHAR2(255 CHAR)
)
;
alter table T_ARCHIVE
  add primary key (C_ID);
alter table T_ARCHIVE
  add constraint UK_FWO5QPCS200DHKA2EHN43MR5I unique (C_ARCHIVE_NUM);

prompt Creating T_AREA...
create table T_AREA
(
  c_id        VARCHAR2(255 CHAR) not null,
  c_city      VARCHAR2(255 CHAR),
  c_citycode  VARCHAR2(255 CHAR),
  c_district  VARCHAR2(255 CHAR),
  c_postcode  VARCHAR2(255 CHAR),
  c_province  VARCHAR2(255 CHAR),
  c_shortcode VARCHAR2(255 CHAR)
)
;
alter table T_AREA
  add primary key (C_ID);

prompt Creating T_STANDARD...
create table T_STANDARD
(
  c_id                NUMBER(10) not null,
  c_max_length        NUMBER(10),
  c_max_weight        NUMBER(10),
  c_min_length        NUMBER(10),
  c_min_weight        NUMBER(10),
  c_name              VARCHAR2(255 CHAR),
  c_operating_company VARCHAR2(255 CHAR),
  c_operating_time    TIMESTAMP(6),
  c_operator          VARCHAR2(255 CHAR)
)
;
alter table T_STANDARD
  add primary key (C_ID);

prompt Creating T_TAKE_TIME...
create table T_TAKE_TIME
(
  c_id                NUMBER(10) not null,
  c_company           VARCHAR2(255 CHAR),
  c_name              VARCHAR2(255 CHAR),
  c_normal_duty_time  VARCHAR2(255 CHAR),
  c_normal_work_time  VARCHAR2(255 CHAR),
  c_operating_company VARCHAR2(255 CHAR),
  c_operating_time    TIMESTAMP(6),
  c_operator          VARCHAR2(255 CHAR),
  c_sat_duty_time     VARCHAR2(255 CHAR),
  c_sat_work_time     VARCHAR2(255 CHAR),
  c_status            VARCHAR2(255 CHAR),
  c_sun_duty_time     VARCHAR2(255 CHAR),
  c_sun_work_time     VARCHAR2(255 CHAR)
)
;
alter table T_TAKE_TIME
  add primary key (C_ID);

prompt Creating T_COURIER...
create table T_COURIER
(
  c_id           NUMBER(10) not null,
  c_check_pwd    VARCHAR2(255 CHAR),
  c_company      VARCHAR2(255 CHAR),
  c_courier_num  VARCHAR2(255 CHAR),
  c_deltag       CHAR(1 CHAR),
  c_name         VARCHAR2(255 CHAR),
  c_pda          VARCHAR2(255 CHAR),
  c_telephone    VARCHAR2(255 CHAR),
  c_type         VARCHAR2(255 CHAR),
  c_vehicle_num  VARCHAR2(255 CHAR),
  c_vehicle_type VARCHAR2(255 CHAR),
  c_standard_id  NUMBER(10),
  c_taketime_id  NUMBER(10)
)
;
alter table T_COURIER
  add primary key (C_ID);
alter table T_COURIER
  add constraint UK_2STQY6YBJRA1BASVO3FTEJSXA unique (C_COURIER_NUM);
alter table T_COURIER
  add constraint FKD4E2P0HLRIYCHXAPEI07GO5KQ foreign key (C_TAKETIME_ID)
  references T_TAKE_TIME (C_ID);
alter table T_COURIER
  add constraint FKIY0RVS2X4XEHC75SWPHUOFJYK foreign key (C_STANDARD_ID)
  references T_STANDARD (C_ID);

prompt Creating T_DELIVERY_INFO...
create table T_DELIVERY_INFO
(
  c_id           NUMBER(10) not null,
  c_courier_name VARCHAR2(255 CHAR),
  c_courier_num  VARCHAR2(255 CHAR),
  c_description  VARCHAR2(255 CHAR)
)
;
alter table T_DELIVERY_INFO
  add primary key (C_ID);

prompt Creating T_FIXED_AREA...
create table T_FIXED_AREA
(
  c_id                VARCHAR2(255 CHAR) not null,
  c_company           VARCHAR2(255 CHAR),
  c_fixed_area_leader VARCHAR2(255 CHAR),
  c_fixed_area_name   VARCHAR2(255 CHAR),
  c_operating_company VARCHAR2(255 CHAR),
  c_operating_time    TIMESTAMP(6),
  c_operator          VARCHAR2(255 CHAR),
  c_telephone         VARCHAR2(255 CHAR),
  c_fixed_area_num    VARCHAR2(255 CHAR)
)
;
alter table T_FIXED_AREA
  add primary key (C_ID);
alter table T_FIXED_AREA
  add constraint UK_76CMUD2YSVHHDFA6VIAW08C36 unique (C_FIXED_AREA_NUM);
alter table T_FIXED_AREA
  add constraint UK_IU19JVWQ91YMOGDX7TN5198BQ unique (C_FIXED_AREA_LEADER);
alter table T_FIXED_AREA
  add constraint UK_LOSHLG2OCQ6WMDSR9JRCOY53W unique (C_FIXED_AREA_NAME);

prompt Creating T_FIXEDAREA_COURIER...
create table T_FIXEDAREA_COURIER
(
  c_fixed_area_id VARCHAR2(255 CHAR) not null,
  c_courier_id    NUMBER(10) not null
)
;
alter table T_FIXEDAREA_COURIER
  add primary key (C_FIXED_AREA_ID, C_COURIER_ID);
alter table T_FIXEDAREA_COURIER
  add constraint FKFXJVLWOXV2O8WROET7M2J0AT7 foreign key (C_FIXED_AREA_ID)
  references T_FIXED_AREA (C_ID);
alter table T_FIXEDAREA_COURIER
  add constraint FKGF7F6F196NFTJG1P26IRFY8LW foreign key (C_COURIER_ID)
  references T_COURIER (C_ID);

prompt Creating T_ORDER...
create table T_ORDER
(
  c_id              NUMBER(10) not null,
  c_customer_id     NUMBER(10),
  c_goods_type      VARCHAR2(255 CHAR),
  c_order_num       VARCHAR2(255 CHAR),
  c_order_time      TIMESTAMP(6),
  c_order_type      VARCHAR2(255 CHAR),
  c_pay_type_num    VARCHAR2(255 CHAR),
  c_rec_address     VARCHAR2(255 CHAR),
  c_rec_company     VARCHAR2(255 CHAR),
  c_rec_mobile      VARCHAR2(255 CHAR),
  c_rec_name        VARCHAR2(255 CHAR),
  c_remark          VARCHAR2(255 CHAR),
  c_send_address    VARCHAR2(255 CHAR),
  c_send_company    VARCHAR2(255 CHAR),
  c_send_mobile     VARCHAR2(255 CHAR),
  c_send_mobile_msg VARCHAR2(255 CHAR),
  c_send_name       VARCHAR2(255 CHAR),
  c_send_pro_num    VARCHAR2(255 CHAR),
  c_status          VARCHAR2(255 CHAR),
  c_telephone       VARCHAR2(255 CHAR),
  c_weight          FLOAT,
  c_courier_id      NUMBER(10),
  c_rec_area_id     VARCHAR2(255 CHAR),
  c_send_area_id    VARCHAR2(255 CHAR)
)
;
alter table T_ORDER
  add primary key (C_ID);
alter table T_ORDER
  add constraint FK46SYBXL43L6V79XIWC0NRSEFB foreign key (C_SEND_AREA_ID)
  references T_AREA (C_ID);
alter table T_ORDER
  add constraint FK9XARM51LATW23N5G8YF8OUVG6 foreign key (C_REC_AREA_ID)
  references T_AREA (C_ID);
alter table T_ORDER
  add constraint FKEWSODCYNDO47V40M08XRWHGK6 foreign key (C_COURIER_ID)
  references T_COURIER (C_ID);

prompt Creating T_WAY_BILL...
create table T_WAY_BILL
(
  c_id            NUMBER(10) not null,
  c_actlweit      FLOAT,
  c_arrive_city   VARCHAR2(255 CHAR),
  c_deltag        VARCHAR2(255 CHAR),
  c_feeitemnum    NUMBER(10),
  c_floadreqr     VARCHAR2(255 CHAR),
  c_goods_type    VARCHAR2(255 CHAR),
  c_num           NUMBER(10),
  c_pay_type_num  VARCHAR2(255 CHAR),
  c_rec_address   VARCHAR2(255 CHAR),
  c_rec_company   VARCHAR2(255 CHAR),
  c_rec_mobile    VARCHAR2(255 CHAR),
  c_rec_name      VARCHAR2(255 CHAR),
  c_remark        VARCHAR2(255 CHAR),
  c_send_address  VARCHAR2(255 CHAR),
  c_send_company  VARCHAR2(255 CHAR),
  c_send_mobile   VARCHAR2(255 CHAR),
  c_send_name     VARCHAR2(255 CHAR),
  c_send_pro_num  VARCHAR2(255 CHAR),
  c_sign_status   NUMBER(10),
  c_vol           VARCHAR2(255 CHAR),
  c_way_bill_num  VARCHAR2(255 CHAR),
  c_way_bill_type VARCHAR2(255 CHAR),
  c_weight        FLOAT,
  c_order_id      NUMBER(10),
  c_rec_area_id   VARCHAR2(255 CHAR),
  c_send_area_id  VARCHAR2(255 CHAR)
)
;
alter table T_WAY_BILL
  add primary key (C_ID);
alter table T_WAY_BILL
  add constraint UK_AKCICITCCVKBK7Y5OXIFUG830 unique (C_WAY_BILL_NUM);
alter table T_WAY_BILL
  add constraint FK6UYX90IPU075OFLV9JGLKK3DP foreign key (C_ORDER_ID)
  references T_ORDER (C_ID);
alter table T_WAY_BILL
  add constraint FKG49R3Y9PIRH2J77ADXX7MYPQ6 foreign key (C_REC_AREA_ID)
  references T_AREA (C_ID);
alter table T_WAY_BILL
  add constraint FKMM8N9W5RTI2F6GGRP8S02UY2N foreign key (C_SEND_AREA_ID)
  references T_AREA (C_ID);

prompt Creating T_SIGN_INFO...
create table T_SIGN_INFO
(
  c_id           NUMBER(10) not null,
  c_description  VARCHAR2(255 CHAR),
  c_error_remark VARCHAR2(255 CHAR),
  c_sign_name    VARCHAR2(255 CHAR),
  c_sign_time    TIMESTAMP(6),
  c_sign_type    VARCHAR2(255 CHAR)
)
;
alter table T_SIGN_INFO
  add primary key (C_ID);

prompt Creating T_TRANSIT_INFO...
create table T_TRANSIT_INFO
(
  c_id               NUMBER(10) not null,
  c_outlet_address   VARCHAR2(255 CHAR),
  c_status           VARCHAR2(255 CHAR),
  c_delivery_info_id NUMBER(10),
  c_sign_info_id     NUMBER(10),
  c_waybill_id       NUMBER(10)
)
;
alter table T_TRANSIT_INFO
  add primary key (C_ID);
alter table T_TRANSIT_INFO
  add constraint FK3ME48DD952CUCS77PHOXRK9JO foreign key (C_WAYBILL_ID)
  references T_WAY_BILL (C_ID);
alter table T_TRANSIT_INFO
  add constraint FK4GTOW97IGEH203EUV2CFFN64Y foreign key (C_SIGN_INFO_ID)
  references T_SIGN_INFO (C_ID);
alter table T_TRANSIT_INFO
  add constraint FKKO0MX686YD7R9157D02MOSL3Y foreign key (C_DELIVERY_INFO_ID)
  references T_DELIVERY_INFO (C_ID);

prompt Creating T_IN_OUT_STORAGE_INFO...
create table T_IN_OUT_STORAGE_INFO
(
  c_id              NUMBER(10) not null,
  c_address         VARCHAR2(255 CHAR),
  c_description     VARCHAR2(255 CHAR),
  c_operation       VARCHAR2(255 CHAR),
  c_transit_info_id NUMBER(10),
  c_in_out_index    NUMBER(10)
)
;
alter table T_IN_OUT_STORAGE_INFO
  add primary key (C_ID);
alter table T_IN_OUT_STORAGE_INFO
  add constraint FKMGL0HWLPEFNKX43YX1BCF261B foreign key (C_TRANSIT_INFO_ID)
  references T_TRANSIT_INFO (C_ID);

prompt Creating T_MENU...
create table T_MENU
(
  c_id          NUMBER(10) not null,
  c_description VARCHAR2(255 CHAR),
  c_name        VARCHAR2(255 CHAR),
  c_page        VARCHAR2(255 CHAR),
  c_priority    NUMBER(10),
  c_pid         NUMBER(10)
)
;
alter table T_MENU
  add primary key (C_ID);
alter table T_MENU
  add constraint FKS2GGRQEMELGIRB6WWETBJQMCT foreign key (C_PID)
  references T_MENU (C_ID);

prompt Creating T_PERMISSION...
create table T_PERMISSION
(
  c_id          NUMBER(10) not null,
  c_description VARCHAR2(255 CHAR),
  c_keyword     VARCHAR2(255 CHAR),
  c_name        VARCHAR2(255 CHAR)
)
;
alter table T_PERMISSION
  add primary key (C_ID);

prompt Creating T_PROMOTION...
create table T_PROMOTION
(
  c_id           NUMBER(10) not null,
  c_active_scope VARCHAR2(255 CHAR),
  c_description  VARCHAR2(255 CHAR),
  c_end_date     TIMESTAMP(6),
  c_start_date   TIMESTAMP(6),
  c_status       VARCHAR2(255 CHAR),
  c_title        VARCHAR2(255 CHAR),
  c_title_img    VARCHAR2(255 CHAR),
  c_update_time  TIMESTAMP(6),
  c_update_unit  VARCHAR2(255 CHAR),
  c_update_user  VARCHAR2(255 CHAR)
)
;
alter table T_PROMOTION
  add primary key (C_ID);

prompt Creating T_ROLE...
create table T_ROLE
(
  c_id          NUMBER(10) not null,
  c_description VARCHAR2(255 CHAR),
  c_keyword     VARCHAR2(255 CHAR),
  c_name        VARCHAR2(255 CHAR)
)
;
alter table T_ROLE
  add primary key (C_ID);

prompt Creating T_ROLE_MENU...
create table T_ROLE_MENU
(
  c_role_id NUMBER(10) not null,
  c_menu_id NUMBER(10) not null
)
;
alter table T_ROLE_MENU
  add primary key (C_ROLE_ID, C_MENU_ID);
alter table T_ROLE_MENU
  add constraint FK6W94MFB5V0K7WXCMD6ENTWL7V foreign key (C_ROLE_ID)
  references T_ROLE (C_ID);
alter table T_ROLE_MENU
  add constraint FKONMMFAGV5HX8W5YDXVQO73XHA foreign key (C_MENU_ID)
  references T_MENU (C_ID);

prompt Creating T_ROLE_PERMISSION...
create table T_ROLE_PERMISSION
(
  c_role_id       NUMBER(10) not null,
  c_permission_id NUMBER(10) not null
)
;
alter table T_ROLE_PERMISSION
  add primary key (C_ROLE_ID, C_PERMISSION_ID);
alter table T_ROLE_PERMISSION
  add constraint FKRBTWEDL099SMOUXUPMK5JB4NP foreign key (C_ROLE_ID)
  references T_ROLE (C_ID);
alter table T_ROLE_PERMISSION
  add constraint FKSOGNHTHYJUBE5XNBW15157OSF foreign key (C_PERMISSION_ID)
  references T_PERMISSION (C_ID);

prompt Creating T_SUB_ARCHIVE...
create table T_SUB_ARCHIVE
(
  c_id                NUMBER(10) not null,
  c_mnemonic_code     VARCHAR2(255 CHAR),
  c_mothballed        CHAR(1 CHAR),
  c_operating_company VARCHAR2(255 CHAR),
  c_operating_time    TIMESTAMP(6),
  c_operator          VARCHAR2(255 CHAR),
  c_remark            VARCHAR2(255 CHAR),
  c_sub_archive_name  VARCHAR2(255 CHAR),
  c_archive_id        NUMBER(10)
)
;
alter table T_SUB_ARCHIVE
  add primary key (C_ID);
alter table T_SUB_ARCHIVE
  add constraint FKJYPTLTN7R5BHQSHI3RLC6QPYA foreign key (C_ARCHIVE_ID)
  references T_ARCHIVE (C_ID);

prompt Creating T_SUB_AREA...
create table T_SUB_AREA
(
  c_id               VARCHAR2(255 CHAR) not null,
  c_assist_key_words VARCHAR2(255 CHAR),
  c_endnum           VARCHAR2(255 CHAR),
  c_key_words        VARCHAR2(255 CHAR),
  c_single           CHAR(1 CHAR),
  c_start_num        VARCHAR2(255 CHAR),
  c_area_id          VARCHAR2(255 CHAR),
  c_fixedarea_id     VARCHAR2(255 CHAR)
)
;
alter table T_SUB_AREA
  add primary key (C_ID);
alter table T_SUB_AREA
  add constraint FK96XB3D59SC1O1QUW68DS9ADIP foreign key (C_FIXEDAREA_ID)
  references T_FIXED_AREA (C_ID);
alter table T_SUB_AREA
  add constraint FKRCQBGM4699P3578L0XSW9IPJO foreign key (C_AREA_ID)
  references T_AREA (C_ID);

prompt Creating T_USER...
create table T_USER
(
  c_id        NUMBER(10) not null,
  c_birthday  TIMESTAMP(6),
  c_gender    VARCHAR2(255 CHAR),
  c_nickname  VARCHAR2(255 CHAR),
  c_password  VARCHAR2(255 CHAR),
  c_remark    VARCHAR2(255 CHAR),
  c_station   VARCHAR2(255 CHAR),
  c_telephone VARCHAR2(255 CHAR),
  c_username  VARCHAR2(255 CHAR)
)
;
alter table T_USER
  add primary key (C_ID);
alter table T_USER
  add constraint UK_IJNM8HYPLAVLJMEB0CU7NKF9B unique (C_USERNAME);

prompt Creating T_USER_ROLE...
create table T_USER_ROLE
(
  c_user_id NUMBER(10) not null,
  c_role_id NUMBER(10) not null
)
;
alter table T_USER_ROLE
  add primary key (C_USER_ID, C_ROLE_ID);
alter table T_USER_ROLE
  add constraint FK78E5QD0RIAEAT0WQUHUWCC3CQ foreign key (C_ROLE_ID)
  references T_ROLE (C_ID);
alter table T_USER_ROLE
  add constraint FK9948HCIPPKRDY7LLAF96FYQ81 foreign key (C_USER_ID)
  references T_USER (C_ID);

prompt Creating T_VEHICLE...
create table T_VEHICLE
(
  c_id           NUMBER(10) not null,
  c_driver       VARCHAR2(255 CHAR),
  c_remark       VARCHAR2(255 CHAR),
  c_route_name   VARCHAR2(255 CHAR),
  c_route_type   VARCHAR2(255 CHAR),
  c_snipper      VARCHAR2(255 CHAR),
  c_telephone    VARCHAR2(255 CHAR),
  c_ton          NUMBER(10),
  c_vehicle_num  VARCHAR2(255 CHAR),
  c_vehicle_type VARCHAR2(255 CHAR)
)
;
alter table T_VEHICLE
  add primary key (C_ID);

prompt Creating T_WORK_BILL...
create table T_WORK_BILL
(
  c_id              NUMBER(10) not null,
  c_attachbilltimes NUMBER(10),
  c_buildtime       TIMESTAMP(6),
  c_pickstate       VARCHAR2(255 CHAR),
  c_remark          VARCHAR2(255 CHAR),
  c_smsnumber       VARCHAR2(255 CHAR),
  c_type            VARCHAR2(255 CHAR),
  c_courier         NUMBER(10),
  c_order_id        NUMBER(10)
)
;
alter table T_WORK_BILL
  add primary key (C_ID);
alter table T_WORK_BILL
  add constraint FKJFMKWQNBRKSHCGEBBBVMJRJPG foreign key (C_ORDER_ID)
  references T_ORDER (C_ID);
alter table T_WORK_BILL
  add constraint FKKI91JSF412E16E3J7I6WTN1K foreign key (C_COURIER)
  references T_COURIER (C_ID);

prompt Loading T_ARCHIVE...
prompt Table is empty
prompt Loading T_AREA...
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY044', '天津市', 'tianjin', '河北区', '120105', '天津市', 'TJTJHB');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY045', '天津市', 'tianjin', '红桥区', '120106', '天津市', 'TJTJHQ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY046', '天津市', 'tianjin', '滨海新区', '120116', '天津市', 'TJTJBHX');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY047', '天津市', 'tianjin', '东丽区', '120110', '天津市', 'TJTJDL');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY048', '天津市', 'tianjin', '西青区', '120111', '天津市', 'TJTJXQ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY049', '天津市', 'tianjin', '津南区', '120112', '天津市', 'TJTJJN');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY050', '天津市', 'tianjin', '北辰区', '120113', '天津市', 'TJTJBC');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY051', '天津市', 'tianjin', '武清区', '120114', '天津市', 'TJTJWQ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY052', '天津市', 'tianjin', '宝坻区', '120115', '天津市', 'TJTJBC');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY053', '天津市', 'tianjin', '宁河县', '120221', '天津市', 'TJTJNH');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY054', '天津市', 'tianjin', '静海县', '120223', '天津市', 'TJTJJH');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY055', '天津市', 'tianjin', '蓟县', '120225', '天津市', 'TJTJJ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY056', '太原市', 'taiyuan', '小店区', '140105', '山西省', 'SXTYXD');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY057', '太原市', 'taiyuan', '迎泽区', '140106', '山西省', 'SXTYYZ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY058', '太原市', 'taiyuan', '杏花岭区', '140107', '山西省', 'SXTYXHL');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY059', '太原市', 'taiyuan', '尖草坪区', '140108', '山西省', 'SXTYJCP');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY060', '太原市', 'taiyuan', '万柏林区', '140109', '山西省', 'SXTYWBL');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY061', '太原市', 'taiyuan', '晋源区', '140110', '山西省', 'SXTYJY');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY062', '太原市', 'taiyuan', '清徐县', '140121', '山西省', 'SXTYQX');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY063', '太原市', 'taiyuan', '阳曲县', '140122', '山西省', 'SXTYYQ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY064', '太原市', 'taiyuan', '娄烦县', '140123', '山西省', 'SXTYLF');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY065', '太原市', 'taiyuan', '古交市', '140181', '山西省', 'SXTYGJ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY001', '北京市', 'beijing', '东城区', '110101', '北京市', 'BJBJDC');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY002', '北京市', 'beijing', '西城区', '110102', '北京市', 'BJBJXC');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY003', '北京市', 'beijing', '朝阳区', '110105', '北京市', 'BJBJCY');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY004', '北京市', 'beijing', '丰台区', '110106', '北京市', 'BJBJFT');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY005', '北京市', 'beijing', '石景山区', '110107', '北京市', 'BJBJSJS');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY006', '北京市', 'beijing', '海淀区', '110108', '北京市', 'BJBJHD');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY007', '北京市', 'beijing', '门头沟区', '110109', '北京市', 'BJBJMTG');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY008', '北京市', 'beijing', '房山区', '110111', '北京市', 'BJBJFS');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY009', '北京市', 'beijing', '通州区', '110112', '北京市', 'BJBJTZ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY010', '北京市', 'beijing', '顺义区', '110113', '北京市', 'BJBJSY');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY011', '北京市', 'beijing', '昌平区', '110114', '北京市', 'BJBJCP');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY012', '北京市', 'beijing', '大兴区', '110115', '北京市', 'BJBJDX');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY013', '北京市', 'beijing', '怀柔区', '110116', '北京市', 'BJBJHR');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY014', '北京市', 'beijing', '平谷区', '110117', '北京市', 'BJBJPG');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY015', '北京市', 'beijing', '密云县', '110228', '北京市', 'BJBJMY');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY016', '北京市', 'beijing', '延庆县', '110229', '北京市', 'BJBJYQ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY017', '石家庄市', 'shijiazhuang', '长安区', '130102', '河北省', 'HBSJZZA');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY018', '石家庄市', 'shijiazhuang', '桥东区', '130103', '河北省', 'HBSJZQD');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY019', '石家庄市', 'shijiazhuang', '桥西区', '130104', '河北省', 'HBSJZQX');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY020', '石家庄市', 'shijiazhuang', '新华区', '130105', '河北省', 'HBSJZXH');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY021', '石家庄市', 'shijiazhuang', '井陉矿区', '130107', '河北省', 'HBSJZJXK');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY022', '石家庄市', 'shijiazhuang', '裕华区', '130108', '河北省', 'HBSJZYH');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY023', '石家庄市', 'shijiazhuang', '井陉县', '130121', '河北省', 'HBSJZJX');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY024', '石家庄市', 'shijiazhuang', '正定县', '130123', '河北省', 'HBSJZZD');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY025', '石家庄市', 'shijiazhuang', '栾城县', '130124', '河北省', 'HBSJZLC');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY026', '石家庄市', 'shijiazhuang', '行唐县', '130125', '河北省', 'HBSJZXT');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY027', '石家庄市', 'shijiazhuang', '灵寿县', '130126', '河北省', 'HBSJZLS');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY028', '石家庄市', 'shijiazhuang', '高邑县', '130127', '河北省', 'HBSJZGY');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY029', '石家庄市', 'shijiazhuang', '深泽县', '130128', '河北省', 'HBSJZSZ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY030', '石家庄市', 'shijiazhuang', '赞皇县', '130129', '河北省', 'HBSJZZH');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY031', '石家庄市', 'shijiazhuang', '无极县', '130130', '河北省', 'HBSJZWJ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY032', '石家庄市', 'shijiazhuang', '平山县', '130131', '河北省', 'HBSJZPS');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY033', '石家庄市', 'shijiazhuang', '元氏县', '130132', '河北省', 'HBSJZYS');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY034', '石家庄市', 'shijiazhuang', '赵县', '130133', '河北省', 'HBSJZZ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY035', '石家庄市', 'shijiazhuang', '辛集市', '130181', '河北省', 'HBSJZXJ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY036', '石家庄市', 'shijiazhuang', '藁城市', '130182', '河北省', 'HBSJZGC');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY037', '石家庄市', 'shijiazhuang', '晋州市', '130183', '河北省', 'HBSJZJZ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY038', '石家庄市', 'shijiazhuang', '新乐市', '130184', '河北省', 'HBSJZXL');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY039', '石家庄市', 'shijiazhuang', '鹿泉市', '130185', '河北省', 'HBSJZLQ');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY040', '天津市', 'tianjin', '和平区', '120101', '天津市', 'TJTJHP');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY041', '天津市', 'tianjin', '河东区', '120102', '天津市', 'TJTJHD');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY042', '天津市', 'tianjin', '河西区', '120103', '天津市', 'TJTJHX');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY043', '天津市', 'tianjin', '南开区', '120104', '天津市', 'TJTJNK');
insert into T_AREA (c_id, c_city, c_citycode, c_district, c_postcode, c_province, c_shortcode)
values ('QY088', '西安市', 'xian', '未央区', '710000', '陕西省', 'SXXNWY');
commit;
prompt 66 records loaded
prompt Loading T_STANDARD...
insert into T_STANDARD (c_id, c_max_length, c_max_weight, c_min_length, c_min_weight, c_name, c_operating_company, c_operating_time, c_operator)
values (1, 123, 123, 15, 123, '666', null, null, null);
insert into T_STANDARD (c_id, c_max_length, c_max_weight, c_min_length, c_min_weight, c_name, c_operating_company, c_operating_time, c_operator)
values (21, 1, 1, 1, 1, '1', null, null, null);
insert into T_STANDARD (c_id, c_max_length, c_max_weight, c_min_length, c_min_weight, c_name, c_operating_company, c_operating_time, c_operator)
values (22, 1, 1, 1, 1, '2', null, null, null);
insert into T_STANDARD (c_id, c_max_length, c_max_weight, c_min_length, c_min_weight, c_name, c_operating_company, c_operating_time, c_operator)
values (61, 3, 3, 3, 3, '3', null, null, null);
insert into T_STANDARD (c_id, c_max_length, c_max_weight, c_min_length, c_min_weight, c_name, c_operating_company, c_operating_time, c_operator)
values (62, 3, 3, 3, 3, '4', null, null, null);
commit;
prompt 5 records loaded
prompt Loading T_TAKE_TIME...
insert into T_TAKE_TIME (c_id, c_company, c_name, c_normal_duty_time, c_normal_work_time, c_operating_company, c_operating_time, c_operator, c_sat_duty_time, c_sat_work_time, c_status, c_sun_duty_time, c_sun_work_time)
values (1, '菜鸟', '早班1', '早8点-晚6点', '早8点-晚6点', null, null, null, null, null, null, null, null);
insert into T_TAKE_TIME (c_id, c_company, c_name, c_normal_duty_time, c_normal_work_time, c_operating_company, c_operating_time, c_operator, c_sat_duty_time, c_sat_work_time, c_status, c_sun_duty_time, c_sun_work_time)
values (2, '菜鸟', '晚班1', '晚7点-早5点', '晚7点-早5点', null, null, null, null, null, null, null, null);
commit;
prompt 2 records loaded
prompt Loading T_COURIER...
insert into T_COURIER (c_id, c_check_pwd, c_company, c_courier_num, c_deltag, c_name, c_pda, c_telephone, c_type, c_vehicle_num, c_vehicle_type, c_standard_id, c_taketime_id)
values (41, '1', '菜鸟物流', '1', '1', '曹操', '1', '1', '1', '1', '1', 1, 1);
insert into T_COURIER (c_id, c_check_pwd, c_company, c_courier_num, c_deltag, c_name, c_pda, c_telephone, c_type, c_vehicle_num, c_vehicle_type, c_standard_id, c_taketime_id)
values (44, '1', '菜鸟物流', '2', '1', '快递员2', '1', '1', '1', '1', '1', 1, null);
commit;
prompt 2 records loaded
prompt Loading T_DELIVERY_INFO...
insert into T_DELIVERY_INFO (c_id, c_courier_name, c_courier_num, c_description)
values (229, '曹操', '41', '由曹操给刘备配送');
commit;
prompt 1 records loaded
prompt Loading T_FIXED_AREA...
insert into T_FIXED_AREA (c_id, c_company, c_fixed_area_leader, c_fixed_area_name, c_operating_company, c_operating_time, c_operator, c_telephone, c_fixed_area_num)
values ('dp001', '顺风快递', '张三', '未央区草滩六路', null, null, null, '18888888888', null);
commit;
prompt 1 records loaded
prompt Loading T_FIXEDAREA_COURIER...
insert into T_FIXEDAREA_COURIER (c_fixed_area_id, c_courier_id)
values ('dp001', 41);
commit;
prompt 1 records loaded
prompt Loading T_ORDER...
insert into T_ORDER (c_id, c_customer_id, c_goods_type, c_order_num, c_order_time, c_order_type, c_pay_type_num, c_rec_address, c_rec_company, c_rec_mobile, c_rec_name, c_remark, c_send_address, c_send_company, c_send_mobile, c_send_mobile_msg, c_send_name, c_send_pro_num, c_status, c_telephone, c_weight, c_courier_id, c_rec_area_id, c_send_area_id)
values (125, 1, '文件', '57a2b750-b00b-4ad9-9d32-4c0b3a8e015a', to_timestamp('03-09-2018 11:31:44.890000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', '寄付日结', '金燕龙大厦', '北京海淀区金燕龙大厦', '18888888888', '北京传智播客总部', null, '西安市未央区东晋桃园', '传智播客西安分公司', '12345678901', '快递小哥辛苦了', '13112345678', '速运当日', '1', null, null, 41, 'QY088', 'QY088');
insert into T_ORDER (c_id, c_customer_id, c_goods_type, c_order_num, c_order_time, c_order_type, c_pay_type_num, c_rec_address, c_rec_company, c_rec_mobile, c_rec_name, c_remark, c_send_address, c_send_company, c_send_mobile, c_send_mobile_msg, c_send_name, c_send_pro_num, c_status, c_telephone, c_weight, c_courier_id, c_rec_area_id, c_send_area_id)
values (127, 1, '文件', '231ed02c-8090-4c36-9f97-1dc7f4e55284', to_timestamp('03-09-2018 11:34:05.144000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2', '寄付日结', '金燕龙大厦', '北京海淀区金燕龙大厦', '18888888888', '北京传智播客总部', '重要文件', '北京市海淀区百度大厦', '传智播客西安分公司', '12345678901', '快递小哥辛苦了', '13112345678', '速运当日', '1', null, 1, null, 'QY006', 'QY006');
insert into T_ORDER (c_id, c_customer_id, c_goods_type, c_order_num, c_order_time, c_order_type, c_pay_type_num, c_rec_address, c_rec_company, c_rec_mobile, c_rec_name, c_remark, c_send_address, c_send_company, c_send_mobile, c_send_mobile_msg, c_send_name, c_send_pro_num, c_status, c_telephone, c_weight, c_courier_id, c_rec_area_id, c_send_area_id)
values (121, 1, '文件', '70093bb3-a85b-43a1-bfd1-57e3497dc0c4', to_timestamp('03-09-2018 11:25:37.375000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', '寄付日结', '金燕龙大厦', '北京海淀区金燕龙大厦', '18888888888', '北京传智播客总部', '重要文件', '陕西省西安市未央区草滩六路汇锦园4楼', '传智播客西安分公司', '12345678901', '快递小哥辛苦了', '13112345678', '速运当日', '1', null, 1, 41, 'QY088', 'QY088');
insert into T_ORDER (c_id, c_customer_id, c_goods_type, c_order_num, c_order_time, c_order_type, c_pay_type_num, c_rec_address, c_rec_company, c_rec_mobile, c_rec_name, c_remark, c_send_address, c_send_company, c_send_mobile, c_send_mobile_msg, c_send_name, c_send_pro_num, c_status, c_telephone, c_weight, c_courier_id, c_rec_area_id, c_send_area_id)
values (123, 1, '文件', '6c231ae1-098d-480d-b3ac-5e1f6eabf15b', to_timestamp('03-09-2018 11:31:43.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', '寄付日结', '金燕龙大厦', '北京海淀区金燕龙大厦', '18888888888', '北京传智播客总部', null, '西安市未央区东晋桃园', '传智播客西安分公司', '12345678901', '快递小哥辛苦了', '13112345678', '速运当日', '1', null, null, 41, 'QY088', 'QY088');
commit;
prompt 4 records loaded
prompt Loading T_WAY_BILL...
insert into T_WAY_BILL (c_id, c_actlweit, c_arrive_city, c_deltag, c_feeitemnum, c_floadreqr, c_goods_type, c_num, c_pay_type_num, c_rec_address, c_rec_company, c_rec_mobile, c_rec_name, c_remark, c_send_address, c_send_company, c_send_mobile, c_send_name, c_send_pro_num, c_sign_status, c_vol, c_way_bill_num, c_way_bill_type, c_weight, c_order_id, c_rec_area_id, c_send_area_id)
values (222, 0, '北京海淀区金燕龙办公楼', null, 0, '无', '笔记本', 1, null, '北京海淀区金燕龙办公楼', null, null, null, null, '西安市未央区东晋桃园', null, null, null, null, 2, null, 'yd001', null, 0, null, null, null);
commit;
prompt 1 records loaded
prompt Loading T_SIGN_INFO...
prompt Table is empty
prompt Loading T_TRANSIT_INFO...
insert into T_TRANSIT_INFO (c_id, c_outlet_address, c_status, c_delivery_info_id, c_sign_info_id, c_waybill_id)
values (223, '北京海淀区西三旗货物网点', '开始配送', 229, null, 222);
commit;
prompt 1 records loaded
prompt Loading T_IN_OUT_STORAGE_INFO...
insert into T_IN_OUT_STORAGE_INFO (c_id, c_address, c_description, c_operation, c_transit_info_id, c_in_out_index)
values (224, '郑州仓库入库', '郑州仓库入库', '入库', 223, 0);
insert into T_IN_OUT_STORAGE_INFO (c_id, c_address, c_description, c_operation, c_transit_info_id, c_in_out_index)
values (225, '郑州仓库出库', '郑州仓库出库', '出库', 223, 1);
insert into T_IN_OUT_STORAGE_INFO (c_id, c_address, c_description, c_operation, c_transit_info_id, c_in_out_index)
values (226, '石家庄仓库入库', '石家庄仓库入库', '入库', 223, 2);
insert into T_IN_OUT_STORAGE_INFO (c_id, c_address, c_description, c_operation, c_transit_info_id, c_in_out_index)
values (227, '石家庄仓库出库', '石家庄仓库入库', '出库', 223, 3);
insert into T_IN_OUT_STORAGE_INFO (c_id, c_address, c_description, c_operation, c_transit_info_id, c_in_out_index)
values (228, '北京海淀区西三旗货物网点', '北京海淀区西三旗货物网点', '到达网点', 223, 4);
commit;
prompt 5 records loaded
prompt Loading T_MENU...
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (150, null, '运输配送管理', 'pages/transit/transitinfo.html', 8, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (11, null, '基础档案', null, 1, null);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (111, null, '基础档案设置', 'pages/base/archives.html', 1, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (112, null, '收派标准', 'pages/base/standard.html', 2, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (113, null, '班车管理', 'pages/base/vehicle.html', 3, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (114, null, '快递员设置/替班', 'pages/base/courier.html', 4, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (115, null, '区域设置', 'pages/base/area.html', 5, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (116, null, '管理分区', 'pages/base/sub_area.html', 6, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (117, null, '管理定区/调度排班', 'pages/base/fixed_area.html', 7, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (118, null, '收派时间管理', 'pages/base/take_time.html', 8, 11);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (12, null, '受理', null, 2, null);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (121, null, '业务受理', 'pages/take_delivery/order.html', 1, 12);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (122, null, '运单快速录入', 'pages/take_delivery/waybill_quick.html', 2, 12);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (123, null, '运单录入', 'pages/take_delivery/waybill.html', 3, 12);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (124, null, '运单导入', 'pages/take_delivery/waybill_import.html', 4, 12);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (125, null, '运单管理', 'pages/take_delivery/waybill_manage.html', 5, 12);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (126, null, '异调运单', 'pages/take_delivery/different_waybill.html', 6, 12);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (127, null, '运单打印', 'pages/take_delivery/waybill_print.html', 7, 12);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (13, null, '调度', null, 3, null);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (131, null, '查台转单', 'pages/take_delivery/change_work_order.html', 1, 13);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (132, null, '人工调度', 'pages/take_delivery/dispatcher.html', 2, 13);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (133, null, '取派调度监控', 'pages/take_delivery/dispatcher_monitor.html', 3, 13);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (134, null, '签收录入', 'pages/take_delivery/sign_input.html', 4, 13);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (135, null, '取消签收申请', 'pages/take_delivery/sign_cancel.html', 5, 13);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (136, null, '宣传任务', 'pages/take_delivery/promotion.html', 6, 13);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (14, null, '分拣管理', null, 4, null);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (141, null, '入库', 'pages/transit/in_storage.html', 1, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (142, null, '出库', 'pages/transit/out_storage.html', 2, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (143, null, '盘库', 'pages/transit/make_storage.html', 3, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (144, null, '合包', 'pages/transit/compose_package.html', 4, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (145, null, '到达时间录入', 'pages/transit/arrive_time.html', 5, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (146, null, '出入库查询', 'pages/transit/in_out_search.html', 6, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (147, null, '库存查询', 'pages/transit/remain_search.html', 7, 14);
insert into T_MENU (c_id, c_description, c_name, c_page, c_priority, c_pid)
values (148, null, '合包查询', 'pages/transit/package_search.html', 8, 14);
commit;
prompt 34 records loaded
prompt Loading T_PERMISSION...
insert into T_PERMISSION (c_id, c_description, c_keyword, c_name)
values (1001, '添加快递员功能', 'courier:add', '添加快递员');
insert into T_PERMISSION (c_id, c_description, c_keyword, c_name)
values (1002, '快递员列表查询功能', 'courier:list', '查询快递员');
insert into T_PERMISSION (c_id, c_description, c_keyword, c_name)
values (1003, '区域列表查询功能', 'region:list', '区域列表查询');
insert into T_PERMISSION (c_id, c_description, c_keyword, c_name)
values (1004, '运单管理功能', 'waybill', '运单管理');
insert into T_PERMISSION (c_id, c_description, c_keyword, c_name)
values (1005, '根据运单号查询运单', 'waybill:findByWayBillNum', '运单管理');
insert into T_PERMISSION (c_id, c_description, c_keyword, c_name)
values (1006, '报表功能', 'report', '报表功能');
commit;
prompt 6 records loaded
prompt Loading T_PROMOTION...
insert into T_PROMOTION (c_id, c_active_scope, c_description, c_end_date, c_start_date, c_status, c_title, c_title_img, c_update_time, c_update_unit, c_update_user)
values (83, '体育', '今天是个重大的日子<img src="/bos_management/upload/652809e0-eb08-417e-a130-8db39318a1f6.png" alt="" />', to_timestamp('31-08-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('28-08-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2', '中国足球大胜巴西', '/bos_management/upload/5a78f054-3fe9-4e70-9be1-a7be00f8f49f.png', null, null, null);
commit;
prompt 1 records loaded
prompt Loading T_ROLE...
insert into T_ROLE (c_id, c_description, c_keyword, c_name)
values (1003, '负责报表功能', 'baobiao', '报表功能');
insert into T_ROLE (c_id, c_description, c_keyword, c_name)
values (182, '...', '系统管理员', '系统管理员');
insert into T_ROLE (c_id, c_description, c_keyword, c_name)
values (1001, '负责基础数据录入', 'base', '基础数据录入员');
insert into T_ROLE (c_id, c_description, c_keyword, c_name)
values (1002, '负责运单管理功能', 'qupai', '取派业务客服');
commit;
prompt 4 records loaded
prompt Loading T_ROLE_MENU...
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 11);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 12);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 13);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 14);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 111);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 112);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 113);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 114);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 115);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 116);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 117);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 118);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 121);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 122);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 123);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 124);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 125);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 126);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 127);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 131);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 132);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 133);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 134);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 135);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 136);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 141);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 142);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 143);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 144);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 145);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 146);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 147);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 148);
insert into T_ROLE_MENU (c_role_id, c_menu_id)
values (182, 150);
commit;
prompt 34 records loaded
prompt Loading T_ROLE_PERMISSION...
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (182, 1001);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (182, 1002);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (182, 1003);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (182, 1004);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (182, 1005);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (182, 1006);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (1001, 1001);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (1001, 1002);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (1001, 1003);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (1001, 1005);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (1002, 1004);
insert into T_ROLE_PERMISSION (c_role_id, c_permission_id)
values (1003, 1006);
commit;
prompt 12 records loaded
prompt Loading T_SUB_ARCHIVE...
prompt Table is empty
prompt Loading T_SUB_AREA...
insert into T_SUB_AREA (c_id, c_assist_key_words, c_endnum, c_key_words, c_single, c_start_num, c_area_id, c_fixedarea_id)
values ('1', '草滩六路', null, '未央区', null, null, 'QY088', 'dp001');
commit;
prompt 1 records loaded
prompt Loading T_USER...
insert into T_USER (c_id, c_birthday, c_gender, c_nickname, c_password, c_remark, c_station, c_telephone, c_username)
values (2004, null, null, null, '123', null, null, null, 'ww');
insert into T_USER (c_id, c_birthday, c_gender, c_nickname, c_password, c_remark, c_station, c_telephone, c_username)
values (183, to_timestamp('09-09-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '男', '网管', '123', null, '总公司', '18888888888', '网管');
insert into T_USER (c_id, c_birthday, c_gender, c_nickname, c_password, c_remark, c_station, c_telephone, c_username)
values (2001, null, null, null, '123', null, null, null, 'zhangsan');
insert into T_USER (c_id, c_birthday, c_gender, c_nickname, c_password, c_remark, c_station, c_telephone, c_username)
values (2002, null, null, null, '123', null, null, null, 'lisi');
insert into T_USER (c_id, c_birthday, c_gender, c_nickname, c_password, c_remark, c_station, c_telephone, c_username)
values (2003, null, null, null, '123', null, null, null, 'admin');
commit;
prompt 5 records loaded
prompt Loading T_USER_ROLE...
insert into T_USER_ROLE (c_user_id, c_role_id)
values (183, 182);
insert into T_USER_ROLE (c_user_id, c_role_id)
values (2001, 182);
insert into T_USER_ROLE (c_user_id, c_role_id)
values (2002, 182);
insert into T_USER_ROLE (c_user_id, c_role_id)
values (2004, 1003);
commit;
prompt 4 records loaded
prompt Loading T_VEHICLE...
prompt Table is empty
prompt Loading T_WORK_BILL...
insert into T_WORK_BILL (c_id, c_attachbilltimes, c_buildtime, c_pickstate, c_remark, c_smsnumber, c_type, c_courier, c_order_id)
values (126, null, to_timestamp('03-09-2018 11:32:57.450000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已通知', null, '4873', '新', 41, 125);
insert into T_WORK_BILL (c_id, c_attachbilltimes, c_buildtime, c_pickstate, c_remark, c_smsnumber, c_type, c_courier, c_order_id)
values (122, null, to_timestamp('03-09-2018 11:25:37.683000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已通知', '重要文件', '8883', '新', 41, 121);
insert into T_WORK_BILL (c_id, c_attachbilltimes, c_buildtime, c_pickstate, c_remark, c_smsnumber, c_type, c_courier, c_order_id)
values (124, null, to_timestamp('03-09-2018 11:32:54.835000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已通知', null, '0477', '新', 41, 123);
commit;
prompt 3 records loaded
set feedback on
set define on
prompt Done.
