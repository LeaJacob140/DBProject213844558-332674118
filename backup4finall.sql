prompt PL/SQL Developer import file
prompt Created on יום שישי 19 יולי 2024 by מוריה חדד
set feedback off
set define off
prompt Creating EVENT...
create table EVENT
(
  evename           VARCHAR2(255) not null,
  evedate           DATE not null,
  evelocation       VARCHAR2(255) not null,
  evresponsibillity VARCHAR2(255) not null,
  evedescribe       VARCHAR2(255) not null,
  evid              INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add primary key (EVID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLESP...
create table ROLESP
(
  roname     VARCHAR2(255) not null,
  roid       INTEGER not null,
  rodescribe VARCHAR2(255) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLESP
  add primary key (ROID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TEAMP...
create table TEAMP
(
  teid      INTEGER not null,
  teaddress VARCHAR2(255) not null,
  tephone   VARCHAR2(15) not null,
  tename    VARCHAR2(255) not null,
  teemail   VARCHAR2(255) not null,
  roid      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEAMP
  add primary key (TEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEAMP
  add foreign key (ROID)
  references ROLESP (ROID);

prompt Creating ACTIN...
create table ACTIN
(
  teid INTEGER not null,
  evid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIN
  add primary key (TEID, EVID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIN
  add foreign key (TEID)
  references TEAMP (TEID);
alter table ACTIN
  add foreign key (EVID)
  references EVENT (EVID);

prompt Creating CATEGORY...
create table CATEGORY
(
  categoryid     NUMBER(10) not null,
  name           VARCHAR2(100) not null,
  emergencylevel NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CATEGORY
  add primary key (CATEGORYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DONOR...
create table DONOR
(
  donorid     NUMBER(10) not null,
  name        VARCHAR2(100) not null,
  isactive    CHAR(1) not null,
  designation VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONOR
  add primary key (DONORID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DONATION...
create table DONATION
(
  donationid   NUMBER not null,
  donationdate DATE default (sysdate) not null,
  itemid       NUMBER not null,
  donorid      NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONATION
  add primary key (DONATIONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONATION
  add foreign key (DONORID)
  references DONOR (DONORID);

prompt Creating EMERGENBODIES...
create table EMERGENBODIES
(
  boname         VARCHAR2(255) not null,
  boid           INTEGER not null,
  bophone        VARCHAR2(15) not null,
  evid           INTEGER not null,
  readinesslevel VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMERGENBODIES
  add primary key (BOID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMERGENBODIES
  add foreign key (EVID)
  references EVENT (EVID);

prompt Creating DONERTO...
create table DONERTO
(
  donationdate DATE not null,
  donationid   INTEGER not null,
  donorid      NUMBER(10) not null,
  boid         INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONERTO
  add primary key (DONATIONID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONERTO
  add foreign key (DONORID)
  references DONOR (DONORID);
alter table DONERTO
  add foreign key (BOID)
  references EMERGENBODIES (BOID);

prompt Creating EMERGENCYDRILL...
create table EMERGENCYDRILL
(
  emdrdate              DATE not null,
  emdrid                INTEGER not null,
  emdrdurationminutes   INTEGER not null,
  emdremergencytype     VARCHAR2(255) not null,
  emdrlocation          VARCHAR2(255) not null,
  emdrparticipantscount INTEGER not null,
  emdraddress           VARCHAR2(255) not null,
  categoryid            NUMBER(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMERGENCYDRILL
  add primary key (EMDRID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMERGENCYDRILL
  add constraint FK_EMERGENCYDRILL_CATEGORY foreign key (CATEGORYID)
  references CATEGORY (CATEGORYID);

prompt Creating DRILLCATEGORYOF...
create table DRILLCATEGORYOF
(
  emdrid     INTEGER not null,
  categoryid NUMBER(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRILLCATEGORYOF
  add primary key (EMDRID, CATEGORYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRILLCATEGORYOF
  add foreign key (EMDRID)
  references EMERGENCYDRILL (EMDRID);
alter table DRILLCATEGORYOF
  add foreign key (CATEGORYID)
  references CATEGORY (CATEGORYID);

prompt Creating EVDEBRIEFING...
create table EVDEBRIEFING
(
  debid            INTEGER not null,
  deresponsibility VARCHAR2(255) not null,
  destatus         INTEGER not null,
  deconclusion     VARCHAR2(255) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVDEBRIEFING
  add primary key (DEBID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating LOCATION...
create table LOCATION
(
  phonenumber  NUMBER(10) not null,
  address      VARCHAR2(100) not null,
  instructions VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOCATION
  add primary key (PHONENUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ITEM...
create table ITEM
(
  itemid      NUMBER not null,
  name        VARCHAR2(100) not null,
  description VARCHAR2(100) not null,
  quantity    NUMBER not null,
  status      NUMBER not null,
  categoryid  NUMBER not null,
  phonenumber NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ITEM
  add primary key (ITEMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ITEM
  add foreign key (PHONENUMBER)
  references LOCATION (PHONENUMBER);
alter table ITEM
  add constraint CK_ITEM_QUANTITY
  check (Quantity >= 0);

prompt Creating MAINTENANCE...
create table MAINTENANCE
(
  maintenanceid   NUMBER not null,
  maintenancedate DATE not null,
  description     VARCHAR2(100) not null,
  itemid          NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENANCE
  add primary key (MAINTENANCEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENANCE
  add foreign key (ITEMID)
  references ITEM (ITEMID);

prompt Creating MAINTENAN...
create table MAINTENAN
(
  idmaintenance INTEGER not null,
  itemid        INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENAN
  add primary key (IDMAINTENANCE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENAN
  add foreign key (IDMAINTENANCE)
  references MAINTENANCE (MAINTENANCEID);
alter table MAINTENAN
  add foreign key (ITEMID)
  references ITEM (ITEMID);

prompt Creating OPERATION...
create table OPERATION
(
  itemid     NUMBER not null,
  operatorid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATION
  add primary key (ITEMID, OPERATORID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating OPERATOR...
create table OPERATOR
(
  teid         NUMBER(10) not null,
  tename       VARCHAR2(100) not null,
  idpromission NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATOR
  add primary key (TEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRACTICING...
create table PRACTICING
(
  emdrid INTEGER not null,
  teid   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRACTICING
  add primary key (EMDRID, TEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRACTICING
  add foreign key (EMDRID)
  references EMERGENCYDRILL (EMDRID);
alter table PRACTICING
  add foreign key (TEID)
  references TEAMP (TEID);

prompt Creating WORKER...
create table WORKER
(
  wosalary INTEGER not null,
  teid     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKER
  add primary key (TEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKER
  add foreign key (TEID)
  references TEAMP (TEID);

prompt Creating REOPRTEV...
create table REOPRTEV
(
  teid  INTEGER not null,
  debid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REOPRTEV
  add primary key (TEID, DEBID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REOPRTEV
  add foreign key (TEID)
  references WORKER (TEID);
alter table REOPRTEV
  add foreign key (DEBID)
  references EVDEBRIEFING (DEBID);

prompt Creating TAKINGPART...
create table TAKINGPART
(
  boid   INTEGER not null,
  emdrid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TAKINGPART
  add primary key (BOID, EMDRID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TAKINGPART
  add foreign key (EMDRID)
  references EMERGENCYDRILL (EMDRID);

prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for ROLESP...
alter table ROLESP disable all triggers;
prompt Disabling triggers for TEAMP...
alter table TEAMP disable all triggers;
prompt Disabling triggers for ACTIN...
alter table ACTIN disable all triggers;
prompt Disabling triggers for CATEGORY...
alter table CATEGORY disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for EMERGENBODIES...
alter table EMERGENBODIES disable all triggers;
prompt Disabling triggers for DONERTO...
alter table DONERTO disable all triggers;
prompt Disabling triggers for EMERGENCYDRILL...
alter table EMERGENCYDRILL disable all triggers;
prompt Disabling triggers for DRILLCATEGORYOF...
alter table DRILLCATEGORYOF disable all triggers;
prompt Disabling triggers for EVDEBRIEFING...
alter table EVDEBRIEFING disable all triggers;
prompt Disabling triggers for LOCATION...
alter table LOCATION disable all triggers;
prompt Disabling triggers for ITEM...
alter table ITEM disable all triggers;
prompt Disabling triggers for MAINTENANCE...
alter table MAINTENANCE disable all triggers;
prompt Disabling triggers for MAINTENAN...
alter table MAINTENAN disable all triggers;
prompt Disabling triggers for OPERATION...
alter table OPERATION disable all triggers;
prompt Disabling triggers for OPERATOR...
alter table OPERATOR disable all triggers;
prompt Disabling triggers for PRACTICING...
alter table PRACTICING disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for REOPRTEV...
alter table REOPRTEV disable all triggers;
prompt Disabling triggers for TAKINGPART...
alter table TAKINGPART disable all triggers;
prompt Disabling foreign key constraints for TEAMP...
alter table TEAMP disable constraint SYS_C009114;
prompt Disabling foreign key constraints for ACTIN...
alter table ACTIN disable constraint SYS_C009118;
alter table ACTIN disable constraint SYS_C009119;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C009060;
prompt Disabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES disable constraint SYS_C009125;
prompt Disabling foreign key constraints for DONERTO...
alter table DONERTO disable constraint SYS_C009168;
alter table DONERTO disable constraint SYS_C009169;
prompt Disabling foreign key constraints for EMERGENCYDRILL...
alter table EMERGENCYDRILL disable constraint FK_EMERGENCYDRILL_CATEGORY;
prompt Disabling foreign key constraints for DRILLCATEGORYOF...
alter table DRILLCATEGORYOF disable constraint SYS_C009173;
alter table DRILLCATEGORYOF disable constraint SYS_C009174;
prompt Disabling foreign key constraints for ITEM...
alter table ITEM disable constraint SYS_C009081;
prompt Disabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE disable constraint SYS_C009089;
prompt Disabling foreign key constraints for MAINTENAN...
alter table MAINTENAN disable constraint SYS_C009185;
alter table MAINTENAN disable constraint SYS_C009186;
prompt Disabling foreign key constraints for PRACTICING...
alter table PRACTICING disable constraint SYS_C009142;
alter table PRACTICING disable constraint SYS_C009143;
prompt Disabling foreign key constraints for WORKER...
alter table WORKER disable constraint SYS_C009147;
prompt Disabling foreign key constraints for REOPRTEV...
alter table REOPRTEV disable constraint SYS_C009151;
alter table REOPRTEV disable constraint SYS_C009152;
prompt Disabling foreign key constraints for TAKINGPART...
alter table TAKINGPART disable constraint SYS_C009156;
prompt Deleting TAKINGPART...
delete from TAKINGPART;
commit;
prompt Deleting REOPRTEV...
delete from REOPRTEV;
commit;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting PRACTICING...
delete from PRACTICING;
commit;
prompt Deleting OPERATOR...
delete from OPERATOR;
commit;
prompt Deleting OPERATION...
delete from OPERATION;
commit;
prompt Deleting MAINTENAN...
delete from MAINTENAN;
commit;
prompt Deleting MAINTENANCE...
delete from MAINTENANCE;
commit;
prompt Deleting ITEM...
delete from ITEM;
commit;
prompt Deleting LOCATION...
delete from LOCATION;
commit;
prompt Deleting EVDEBRIEFING...
delete from EVDEBRIEFING;
commit;
prompt Deleting DRILLCATEGORYOF...
delete from DRILLCATEGORYOF;
commit;
prompt Deleting EMERGENCYDRILL...
delete from EMERGENCYDRILL;
commit;
prompt Deleting DONERTO...
delete from DONERTO;
commit;
prompt Deleting EMERGENBODIES...
delete from EMERGENBODIES;
commit;
prompt Deleting DONATION...
delete from DONATION;
commit;
prompt Deleting DONOR...
delete from DONOR;
commit;
prompt Deleting CATEGORY...
delete from CATEGORY;
commit;
prompt Deleting ACTIN...
delete from ACTIN;
commit;
prompt Deleting TEAMP...
delete from TEAMP;
commit;
prompt Deleting ROLESP...
delete from ROLESP;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Loading EVENT...
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('24-01-2023', 'dd-mm-yyyy'), 'Netivot', 'Wrennie', 'Severe cyclone', 67);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('14-07-2021', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Fanya', 'Hazardous leak', 617);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('10-09-2020', 'dd-mm-yyyy'), 'Ramat Gan', 'Berne', 'Rotating storm', 941);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('13-09-2014', 'dd-mm-yyyy'), 'Beersheba', 'Fanya', 'Ground shaking', 469);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('22-08-2013', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Fanya', 'Hazardous leak', 435);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('03-11-2020', 'dd-mm-yyyy'), 'Afula', 'Berne', 'Rotating storm', 124);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('01-01-2014', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Berne', 'Hazardous leak', 519);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('15-02-2023', 'dd-mm-yyyy'), 'Beit Shean', 'Fanya', 'Armed assailant', 639);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('26-06-2022', 'dd-mm-yyyy'), 'Hod HaSharon', 'Fanya', 'Rotating storm', 787);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('24-06-2022', 'dd-mm-yyyy'), 'Kiryat Motzkin', 'Wrennie', 'Armed assailant', 109);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('30-08-2009', 'dd-mm-yyyy'), 'Nahariya', 'Berne', 'Water inundation', 95);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('29-12-2023', 'dd-mm-yyyy'), 'Baka al-Gharbiyye', 'Berne', 'Toxic emission', 319);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('15-12-2020', 'dd-mm-yyyy'), 'Holon', 'Fanya', 'Severe cyclone', 691);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('19-08-2018', 'dd-mm-yyyy'), 'Haifa', 'Fanya', 'Water inundation', 432);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('07-05-2012', 'dd-mm-yyyy'), 'Lod', 'Fanya', 'Toxic emission', 336);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('25-10-2011', 'dd-mm-yyyy'), 'Baka al-Gharbiyye', 'Berne', 'Electricity failure', 318);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('16-05-2016', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Wrennie', 'Electricity failure', 581);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('11-11-2021', 'dd-mm-yyyy'), 'Beit Shemesh', 'Fanya', 'Rotating storm', 402);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('06-08-2011', 'dd-mm-yyyy'), 'Sakhnin', 'Fanya', 'Rotating storm', 304);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('18-11-2009', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Fanya', 'Severe cyclone', 448);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('02-07-2002', 'dd-mm-yyyy'), 'Givatayim', 'Wrennie', 'Electricity failure', 41);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('28-07-2024', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Fanya', 'Hazardous leak', 933);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('26-09-2010', 'dd-mm-yyyy'), 'Shefa-Amr', 'Berne', 'Ground shaking', 221);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('11-11-2009', 'dd-mm-yyyy'), 'Beitar Illit', 'Wrennie', 'Water inundation', 217);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('14-01-2018', 'dd-mm-yyyy'), 'Giv''at Shmuel', 'Fanya', 'Water inundation', 462);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('17-07-2009', 'dd-mm-yyyy'), 'Ma''alot-Tarshiha', 'Wrennie', 'Water inundation', 546);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('31-03-2009', 'dd-mm-yyyy'), 'Elad', 'Wrennie', 'Electricity failure', 35);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('06-04-2005', 'dd-mm-yyyy'), 'Qalansawe', 'Berne', 'Building blaze', 759);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('08-07-2003', 'dd-mm-yyyy'), 'Holon', 'Fanya', 'Rotating storm', 596);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('03-03-2001', 'dd-mm-yyyy'), 'Ra''anana', 'Wrennie', 'Water inundation', 953);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('10-05-2016', 'dd-mm-yyyy'), 'Ramat Gan', 'Berne', 'Electricity failure', 936);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('08-06-2005', 'dd-mm-yyyy'), 'Ashkelon', 'Berne', 'Toxic emission', 155);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('07-11-2000', 'dd-mm-yyyy'), 'Netanya', 'Wrennie', 'Water inundation', 445);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('20-09-2012', 'dd-mm-yyyy'), 'Tamra', 'Fanya', 'Health crisis', 68);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('20-04-2009', 'dd-mm-yyyy'), 'Kiryat Yam', 'Berne', 'Electricity failure', 358);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('06-07-2018', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Wrennie', 'Hazardous leak', 576);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('31-12-2024', 'dd-mm-yyyy'), 'Jerusalem', 'Berne', 'Severe cyclone', 607);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('02-02-2020', 'dd-mm-yyyy'), 'Tamra', 'Berne', 'Health crisis', 623);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('25-06-2024', 'dd-mm-yyyy'), 'Yokneam Illit', 'Wrennie', 'Hazardous leak', 116);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('25-05-2013', 'dd-mm-yyyy'), 'Kiryat Motzkin', 'Wrennie', 'Electricity failure', 83);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('21-02-2009', 'dd-mm-yyyy'), 'Tiberias', 'Fanya', 'Severe cyclone', 957);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('13-06-2019', 'dd-mm-yyyy'), 'Shefa-Amr', 'Wrennie', 'Rotating storm', 605);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('04-08-2000', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Fanya', 'Building blaze', 670);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('04-06-2010', 'dd-mm-yyyy'), 'Bat Yam', 'Berne', 'Armed assailant', 134);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('04-12-2000', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Fanya', 'Armed assailant', 732);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('21-12-2006', 'dd-mm-yyyy'), 'Kafr Qasim', 'Berne', 'Water inundation', 380);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('01-09-2018', 'dd-mm-yyyy'), 'Kiryat Bialik', 'Berne', 'Health crisis', 736);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('25-06-2008', 'dd-mm-yyyy'), 'Eilat', 'Berne', 'Hazardous leak', 959);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('12-07-2007', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Fanya', 'Armed assailant', 678);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('16-02-2009', 'dd-mm-yyyy'), 'Baka al-Gharbiyye', 'Wrennie', 'Armed assailant', 174);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('20-01-2009', 'dd-mm-yyyy'), 'Yavne', 'Wrennie', 'Hazardous leak', 140);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('12-05-2007', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Fanya', 'Ground shaking', 877);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('20-06-2011', 'dd-mm-yyyy'), 'Kiryat Bialik', 'Fanya', 'Rotating storm', 456);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('25-06-2001', 'dd-mm-yyyy'), 'Rehovot', 'Wrennie', 'Rotating storm', 765);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('10-04-2011', 'dd-mm-yyyy'), 'Givatayim', 'Berne', 'Health crisis', 400);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('11-08-2006', 'dd-mm-yyyy'), 'Eilat', 'Berne', 'Hazardous leak', 733);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('26-06-2005', 'dd-mm-yyyy'), 'Beit Shean', 'Fanya', 'Health crisis', 773);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('14-06-2009', 'dd-mm-yyyy'), 'Kiryat Shmona', 'Berne', 'Severe cyclone', 489);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('30-05-2023', 'dd-mm-yyyy'), 'Netanya', 'Berne', 'Health crisis', 806);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('15-03-2001', 'dd-mm-yyyy'), 'Beitar Illit', 'Fanya', 'Ground shaking', 119);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('26-12-2024', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Berne', 'Health crisis', 754);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('18-06-2017', 'dd-mm-yyyy'), 'Sakhnin', 'Wrennie', 'Ground shaking', 78);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('18-08-2018', 'dd-mm-yyyy'), 'Ramat Gan', 'Fanya', 'Water inundation', 935);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('21-09-2012', 'dd-mm-yyyy'), 'Sakhnin', 'Wrennie', 'Rotating storm', 450);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('26-06-2021', 'dd-mm-yyyy'), 'Kiryat Gat', 'Berne', 'Building blaze', 185);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('17-11-2023', 'dd-mm-yyyy'), 'Beersheba', 'Fanya', 'Armed assailant', 562);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('01-04-2006', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Fanya', 'Ground shaking', 830);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('16-06-2017', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Berne', 'Electricity failure', 663);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('20-04-2005', 'dd-mm-yyyy'), 'Jerusalem', 'Fanya', 'Hazardous leak', 372);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('12-02-2006', 'dd-mm-yyyy'), 'Afula', 'Fanya', 'Electricity failure', 96);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('05-06-2012', 'dd-mm-yyyy'), 'Ariel', 'Berne', 'Health crisis', 985);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('06-07-2020', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Fanya', 'Severe cyclone', 64);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('13-07-2000', 'dd-mm-yyyy'), 'Baka al-Gharbiyye', 'Wrennie', 'Rotating storm', 499);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('17-12-2014', 'dd-mm-yyyy'), 'Kiryat Motzkin', 'Wrennie', 'Water inundation', 926);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('02-06-2021', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Fanya', 'Rotating storm', 250);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('31-03-2014', 'dd-mm-yyyy'), 'Beitar Illit', 'Wrennie', 'Severe cyclone', 97);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('26-08-2005', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Fanya', 'Toxic emission', 821);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('24-11-2013', 'dd-mm-yyyy'), 'Ofakim', 'Wrennie', 'Rotating storm', 772);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('14-03-2018', 'dd-mm-yyyy'), 'Eilat', 'Wrennie', 'Hazardous leak', 778);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('24-09-2014', 'dd-mm-yyyy'), 'Or Akiva', 'Fanya', 'Health crisis', 545);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('18-05-2022', 'dd-mm-yyyy'), 'Ra''anana', 'Berne', 'Rotating storm', 950);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('18-02-2015', 'dd-mm-yyyy'), 'Hadera', 'Berne', 'Water inundation', 522);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('12-12-2007', 'dd-mm-yyyy'), 'Tirat Carmel', 'Wrennie', 'Ground shaking', 832);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('06-09-2016', 'dd-mm-yyyy'), 'Hod HaSharon', 'Berne', 'Electricity failure', 742);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('26-04-2006', 'dd-mm-yyyy'), 'Rishon LeZion', 'Wrennie', 'Electricity failure', 530);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('18-04-2004', 'dd-mm-yyyy'), 'Hod HaSharon', 'Berne', 'Hazardous leak', 844);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('20-06-2014', 'dd-mm-yyyy'), 'Or Akiva', 'Fanya', 'Toxic emission', 266);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('22-12-2021', 'dd-mm-yyyy'), 'Jerusalem', 'Berne', 'Hazardous leak', 216);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('20-02-2008', 'dd-mm-yyyy'), 'Hadera', 'Wrennie', 'Rotating storm', 247);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('11-01-2021', 'dd-mm-yyyy'), 'Netivot', 'Berne', 'Health crisis', 77);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('11-05-2016', 'dd-mm-yyyy'), 'Ofakim', 'Wrennie', 'Health crisis', 114);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('21-07-2023', 'dd-mm-yyyy'), 'Nof HaGalil', 'Wrennie', 'Hazardous leak', 209);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('18-06-2011', 'dd-mm-yyyy'), 'Yavne', 'Berne', 'Hazardous leak', 208);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('24-09-2009', 'dd-mm-yyyy'), 'Herzliya', 'Fanya', 'Severe cyclone', 923);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('23-02-2004', 'dd-mm-yyyy'), 'Or Akiva', 'Fanya', 'Hazardous leak', 54);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('09-04-2007', 'dd-mm-yyyy'), 'Lod', 'Berne', 'Building blaze', 831);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('14-06-2016', 'dd-mm-yyyy'), 'Modi''in Illit', 'Fanya', 'Building blaze', 117);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('16-05-2006', 'dd-mm-yyyy'), 'Nahariya', 'Berne', 'Rotating storm', 39);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('18-01-2011', 'dd-mm-yyyy'), 'Hadera', 'Berne', 'Health crisis', 151);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('08-11-2006', 'dd-mm-yyyy'), 'Afula', 'Berne', 'Water inundation', 702);
commit;
prompt 100 records committed...
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('26-08-2016', 'dd-mm-yyyy'), 'Yavne', 'Fanya', 'Toxic emission', 207);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('11-01-2014', 'dd-mm-yyyy'), 'Kiryat Ono', 'Wrennie', 'Hazardous leak', 994);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('04-03-2017', 'dd-mm-yyyy'), 'Rishon LeZion', 'Berne', 'Toxic emission', 881);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('02-04-2013', 'dd-mm-yyyy'), 'Elad', 'Fanya', 'Severe cyclone', 770);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('06-02-2023', 'dd-mm-yyyy'), 'Bat Yam', 'Fanya', 'Hazardous leak', 555);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('27-12-2015', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Berne', 'Toxic emission', 697);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('28-09-2017', 'dd-mm-yyyy'), 'Hadera', 'Wrennie', 'Toxic emission', 113);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('02-08-2010', 'dd-mm-yyyy'), 'Kafr Qasim', 'Berne', 'Hazardous leak', 163);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('01-02-2002', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Berne', 'Toxic emission', 680);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('25-03-2007', 'dd-mm-yyyy'), 'Haifa', 'Wrennie', 'Toxic emission', 436);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('10-06-2018', 'dd-mm-yyyy'), 'Ofakim', 'Berne', 'Rotating storm', 516);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('26-09-2022', 'dd-mm-yyyy'), 'Elad', 'Berne', 'Building blaze', 454);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('29-01-2014', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Fanya', 'Rotating storm', 339);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('13-03-2007', 'dd-mm-yyyy'), 'Netanya', 'Wrennie', 'Building blaze', 931);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('05-08-2012', 'dd-mm-yyyy'), 'Ramat Gan', 'Berne', 'Electricity failure', 451);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('15-08-2020', 'dd-mm-yyyy'), 'Nesher', 'Wrennie', 'Severe cyclone', 745);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('03-09-2016', 'dd-mm-yyyy'), 'Sakhnin', 'Berne', 'Water inundation', 385);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('02-02-2024', 'dd-mm-yyyy'), 'Tamra', 'Wrennie', 'Health crisis', 843);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('10-06-2022', 'dd-mm-yyyy'), 'Yokneam Illit', 'Fanya', 'Hazardous leak', 433);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('12-01-2006', 'dd-mm-yyyy'), 'Yavne', 'Fanya', 'Ground shaking', 81);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('10-06-2004', 'dd-mm-yyyy'), 'Sakhnin', 'Berne', 'Water inundation', 928);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('13-01-2022', 'dd-mm-yyyy'), 'Ramat Gan', 'Fanya', 'Health crisis', 418);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('17-02-2001', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Fanya', 'Hazardous leak', 584);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('01-01-2007', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Berne', 'Water inundation', 446);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('11-08-2007', 'dd-mm-yyyy'), 'Netivot', 'Fanya', 'Toxic emission', 980);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('07-11-2008', 'dd-mm-yyyy'), 'Arad', 'Wrennie', 'Toxic emission', 781);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('18-04-2012', 'dd-mm-yyyy'), 'Ofakim', 'Wrennie', 'Electricity failure', 38);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('08-10-2022', 'dd-mm-yyyy'), 'Kafr Qasim', 'Wrennie', 'Building blaze', 560);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('27-04-2008', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Fanya', 'Building blaze', 507);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('30-10-2013', 'dd-mm-yyyy'), 'Jerusalem', 'Fanya', 'Hazardous leak', 720);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('03-01-2017', 'dd-mm-yyyy'), 'Yavne', 'Wrennie', 'Ground shaking', 730);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('22-06-2015', 'dd-mm-yyyy'), 'Afula', 'Wrennie', 'Ground shaking', 777);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('19-03-2018', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Berne', 'Water inundation', 879);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('02-09-2010', 'dd-mm-yyyy'), 'Kiryat Ono', 'Wrennie', 'Hazardous leak', 165);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('16-06-2011', 'dd-mm-yyyy'), 'Ashdod', 'Fanya', 'Severe cyclone', 930);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('19-07-2023', 'dd-mm-yyyy'), 'Kiryat Ono', 'Fanya', 'Hazardous leak', 554);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('02-12-2017', 'dd-mm-yyyy'), 'Kiryat Gat', 'Berne', 'Ground shaking', 618);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('02-11-2020', 'dd-mm-yyyy'), 'Acre', 'Fanya', 'Ground shaking', 591);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('08-11-2005', 'dd-mm-yyyy'), 'Yokneam Illit', 'Fanya', 'Severe cyclone', 647);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('13-08-2022', 'dd-mm-yyyy'), 'Nof HaGalil', 'Wrennie', 'Building blaze', 180);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('14-11-2024', 'dd-mm-yyyy'), 'Nesher', 'Berne', 'Water inundation', 126);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('27-03-2015', 'dd-mm-yyyy'), 'Herzliya', 'Berne', 'Hazardous leak', 452);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('14-11-2009', 'dd-mm-yyyy'), 'Ariel', 'Berne', 'Health crisis', 669);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('14-10-2004', 'dd-mm-yyyy'), 'Petah Tikva', 'Wrennie', 'Ground shaking', 69);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('15-11-2007', 'dd-mm-yyyy'), 'Sderot', 'Berne', 'Building blaze', 414);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('31-01-2024', 'dd-mm-yyyy'), 'Kiryat Gat', 'Fanya', 'Health crisis', 378);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('07-11-2005', 'dd-mm-yyyy'), 'Tiberias', 'Wrennie', 'Ground shaking', 202);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('01-05-2001', 'dd-mm-yyyy'), 'Petah Tikva', 'Wrennie', 'Electricity failure', 321);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('21-07-2007', 'dd-mm-yyyy'), 'Nof HaGalil', 'Fanya', 'Health crisis', 917);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('06-06-2003', 'dd-mm-yyyy'), 'Kafr Qasim', 'Wrennie', 'Ground shaking', 634);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('17-03-2002', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Berne', 'Rotating storm', 189);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('06-08-2004', 'dd-mm-yyyy'), 'Petah Tikva', 'Berne', 'Severe cyclone', 939);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('29-12-2005', 'dd-mm-yyyy'), 'Sakhnin', 'Wrennie', 'Severe cyclone', 506);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('02-04-2024', 'dd-mm-yyyy'), 'Qalansawe', 'Wrennie', 'Water inundation', 751);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('08-07-2019', 'dd-mm-yyyy'), 'Karmiel', 'Fanya', 'Hazardous leak', 703);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('30-11-2002', 'dd-mm-yyyy'), 'Or Akiva', 'Fanya', 'Hazardous leak', 129);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('26-12-2015', 'dd-mm-yyyy'), 'Netanya', 'Wrennie', 'Health crisis', 981);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('27-09-2008', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Fanya', 'Ground shaking', 377);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('01-10-2015', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Wrennie', 'Rotating storm', 771);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('03-06-2002', 'dd-mm-yyyy'), 'Nof HaGalil', 'Fanya', 'Rotating storm', 690);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('14-11-2021', 'dd-mm-yyyy'), 'Givatayim', 'Berne', 'Severe cyclone', 992);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('23-10-2015', 'dd-mm-yyyy'), 'Afula', 'Wrennie', 'Ground shaking', 472);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('24-03-2004', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Wrennie', 'Hazardous leak', 149);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('14-01-2005', 'dd-mm-yyyy'), 'Ashkelon', 'Fanya', 'Severe cyclone', 828);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('08-01-2019', 'dd-mm-yyyy'), 'Or Yehuda', 'Fanya', 'Rotating storm', 275);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('20-09-2022', 'dd-mm-yyyy'), 'Givatayim', 'Fanya', 'Health crisis', 292);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('22-07-2017', 'dd-mm-yyyy'), 'Rehovot', 'Wrennie', 'Hazardous leak', 990);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('06-06-2014', 'dd-mm-yyyy'), 'Herzliya', 'Fanya', 'Building blaze', 512);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('21-11-2009', 'dd-mm-yyyy'), 'Tamra', 'Berne', 'Toxic emission', 657);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('06-12-2011', 'dd-mm-yyyy'), 'Netanya', 'Berne', 'Electricity failure', 565);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('27-12-2008', 'dd-mm-yyyy'), 'Rishon LeZion', 'Fanya', 'Electricity failure', 56);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('28-06-2011', 'dd-mm-yyyy'), 'Yokneam Illit', 'Fanya', 'Armed assailant', 485);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('07-06-2008', 'dd-mm-yyyy'), 'Nazareth', 'Berne', 'Electricity failure', 474);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('07-06-2011', 'dd-mm-yyyy'), 'Holon', 'Berne', 'Rotating storm', 750);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('28-02-2015', 'dd-mm-yyyy'), 'Beit Shean', 'Berne', 'Water inundation', 756);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('08-01-2015', 'dd-mm-yyyy'), 'Sakhnin', 'Wrennie', 'Toxic emission', 619);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('17-01-2010', 'dd-mm-yyyy'), 'Kiryat Bialik', 'Wrennie', 'Hazardous leak', 478);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('27-08-2014', 'dd-mm-yyyy'), 'Beersheba', 'Wrennie', 'Health crisis', 398);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('11-09-2017', 'dd-mm-yyyy'), 'Nesher', 'Wrennie', 'Health crisis', 279);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('31-08-2020', 'dd-mm-yyyy'), 'Tamra', 'Fanya', 'Ground shaking', 659);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('04-01-2021', 'dd-mm-yyyy'), 'Bat Yam', 'Fanya', 'Water inundation', 240);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('09-09-2018', 'dd-mm-yyyy'), 'Lod', 'Berne', 'Rotating storm', 713);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('01-07-2016', 'dd-mm-yyyy'), 'Sakhnin', 'Fanya', 'Armed assailant', 594);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('15-09-2020', 'dd-mm-yyyy'), 'Tiberias', 'Wrennie', 'Rotating storm', 823);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('30-03-2019', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Wrennie', 'Toxic emission', 695);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('25-10-2018', 'dd-mm-yyyy'), 'Karmiel', 'Fanya', 'Hazardous leak', 285);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('28-02-2009', 'dd-mm-yyyy'), 'Nof HaGalil', 'Berne', 'Toxic emission', 741);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('29-01-2009', 'dd-mm-yyyy'), 'Tel Aviv', 'Fanya', 'Toxic emission', 274);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('09-10-2022', 'dd-mm-yyyy'), 'Nazareth', 'Wrennie', 'Electricity failure', 272);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('08-03-2005', 'dd-mm-yyyy'), 'Karmiel', 'Wrennie', 'Electricity failure', 558);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('15-05-2022', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Berne', 'Water inundation', 335);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('22-12-2015', 'dd-mm-yyyy'), 'Yavne', 'Fanya', 'Rotating storm', 855);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('01-10-2001', 'dd-mm-yyyy'), 'Modi''in Illit', 'Fanya', 'Rotating storm', 784);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('04-11-2019', 'dd-mm-yyyy'), 'Hod HaSharon', 'Wrennie', 'Severe cyclone', 982);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('09-06-2004', 'dd-mm-yyyy'), 'Herzliya', 'Berne', 'Water inundation', 685);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('24-11-2015', 'dd-mm-yyyy'), 'Herzliya', 'Wrennie', 'Electricity failure', 738);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('13-04-2024', 'dd-mm-yyyy'), 'Tirat Carmel', 'Wrennie', 'Ground shaking', 644);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('01-10-2012', 'dd-mm-yyyy'), 'Jerusalem', 'Fanya', 'Ground shaking', 351);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('21-07-2000', 'dd-mm-yyyy'), 'Kiryat Ono', 'Wrennie', 'Water inundation', 420);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('02-12-2012', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Fanya', 'Severe cyclone', 248);
commit;
prompt 200 records committed...
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('24-06-2023', 'dd-mm-yyyy'), 'Ramla', 'Fanya', 'Water inundation', 79);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('21-05-2016', 'dd-mm-yyyy'), 'Hadera', 'Fanya', 'Ground shaking', 547);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('08-10-2022', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Fanya', 'Health crisis', 219);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('30-08-2007', 'dd-mm-yyyy'), 'Kafr Qasim', 'Berne', 'Rotating storm', 820);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('12-12-2018', 'dd-mm-yyyy'), 'Kiryat Shmona', 'Fanya', 'Water inundation', 661);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('09-04-2008', 'dd-mm-yyyy'), 'Ramla', 'Wrennie', 'Toxic emission', 232);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('20-06-2022', 'dd-mm-yyyy'), 'Giv''at Shmuel', 'Fanya', 'Water inundation', 969);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('21-09-2015', 'dd-mm-yyyy'), 'Hadera', 'Wrennie', 'Armed assailant', 946);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('09-01-2001', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Wrennie', 'Ground shaking', 467);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('18-11-2024', 'dd-mm-yyyy'), 'Sderot', 'Berne', 'Severe cyclone', 643);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('31-08-2012', 'dd-mm-yyyy'), 'Kiryat Gat', 'Berne', 'Building blaze', 391);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('07-08-2024', 'dd-mm-yyyy'), 'Ness Ziona', 'Berne', 'Severe cyclone', 94);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('09-09-2023', 'dd-mm-yyyy'), 'Bnei Brak', 'Fanya', 'Water inundation', 792);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('17-05-2012', 'dd-mm-yyyy'), 'Elad', 'Berne', 'Rotating storm', 984);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('12-01-2016', 'dd-mm-yyyy'), 'Tiberias', 'Berne', 'Water inundation', 999);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('10-02-2021', 'dd-mm-yyyy'), 'Giv''at Shmuel', 'Wrennie', 'Health crisis', 327);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('19-07-2016', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Fanya', 'Building blaze', 520);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('25-06-2021', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Wrennie', 'Armed assailant', 90);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('29-05-2013', 'dd-mm-yyyy'), 'Tamra', 'Fanya', 'Ground shaking', 431);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('10-04-2018', 'dd-mm-yyyy'), 'Dimona', 'Berne', 'Electricity failure', 876);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('25-05-2013', 'dd-mm-yyyy'), 'Nazareth', 'Fanya', 'Ground shaking', 357);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('21-04-2014', 'dd-mm-yyyy'), 'Beit Shean', 'Fanya', 'Water inundation', 453);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('11-11-2003', 'dd-mm-yyyy'), 'Kafr Qasim', 'Berne', 'Armed assailant', 549);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('12-04-2002', 'dd-mm-yyyy'), 'Haifa', 'Wrennie', 'Severe cyclone', 775);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('08-03-2018', 'dd-mm-yyyy'), 'Kiryat Gat', 'Fanya', 'Building blaze', 824);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('23-10-2003', 'dd-mm-yyyy'), 'Acre', 'Fanya', 'Hazardous leak', 737);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('30-03-2012', 'dd-mm-yyyy'), 'Nazareth', 'Berne', 'Building blaze', 55);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('28-02-2011', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut', 'Berne', 'Electricity failure', 122);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('24-11-2000', 'dd-mm-yyyy'), 'Giv''at Shmuel', 'Wrennie', 'Toxic emission', 439);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('17-07-2007', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut', 'Berne', 'Armed assailant', 622);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('22-05-2017', 'dd-mm-yyyy'), 'Ma''alot-Tarshiha', 'Fanya', 'Hazardous leak', 42);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('15-10-2006', 'dd-mm-yyyy'), 'Ramla', 'Berne', 'Ground shaking', 590);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('12-08-2023', 'dd-mm-yyyy'), 'Holon', 'Wrennie', 'Severe cyclone', 52);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('23-11-2003', 'dd-mm-yyyy'), 'Hod HaSharon', 'Berne', 'Health crisis', 152);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('01-02-2013', 'dd-mm-yyyy'), 'Yokneam Illit', 'Berne', 'Severe cyclone', 525);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('30-09-2016', 'dd-mm-yyyy'), 'Modi''in Illit', 'Berne', 'Electricity failure', 601);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('28-01-2016', 'dd-mm-yyyy'), 'Eilat', 'Wrennie', 'Hazardous leak', 295);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('02-05-2014', 'dd-mm-yyyy'), 'Ramat Gan', 'Berne', 'Severe cyclone', 484);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('25-09-2012', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Berne', 'Toxic emission', 517);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('23-06-2007', 'dd-mm-yyyy'), 'Nof HaGalil', 'Wrennie', 'Toxic emission', 862);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('06-06-2000', 'dd-mm-yyyy'), 'Petah Tikva', 'Wrennie', 'Armed assailant', 233);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('31-12-2007', 'dd-mm-yyyy'), 'Kiryat Gat', 'Fanya', 'Electricity failure', 40);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('20-09-2007', 'dd-mm-yyyy'), 'Tamra', 'Berne', 'Ground shaking', 265);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('18-11-2003', 'dd-mm-yyyy'), 'Or Akiva', 'Wrennie', 'Severe cyclone', 975);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('24-12-2013', 'dd-mm-yyyy'), 'Kfar Saba', 'Berne', 'Rotating storm', 762);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('23-01-2009', 'dd-mm-yyyy'), 'Bat Yam', 'Fanya', 'Toxic emission', 995);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('19-08-2020', 'dd-mm-yyyy'), 'Ashkelon', 'Fanya', 'Hazardous leak', 693);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('07-05-2016', 'dd-mm-yyyy'), 'Nazareth', 'Wrennie', 'Ground shaking', 401);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('21-10-2002', 'dd-mm-yyyy'), 'Kiryat Yam', 'Fanya', 'Water inundation', 986);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('13-05-2018', 'dd-mm-yyyy'), 'Modi''in Illit', 'Wrennie', 'Health crisis', 399);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('28-03-2007', 'dd-mm-yyyy'), 'Kafr Qasim', 'Berne', 'Electricity failure', 229);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('14-03-2012', 'dd-mm-yyyy'), 'Sakhnin', 'Fanya', 'Rotating storm', 574);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('06-07-2019', 'dd-mm-yyyy'), 'Bnei Brak', 'Berne', 'Health crisis', 496);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('20-10-2012', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Wrennie', 'Building blaze', 805);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('26-07-2006', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut', 'Berne', 'Building blaze', 845);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('19-01-2011', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Fanya', 'Severe cyclone', 654);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('01-04-2018', 'dd-mm-yyyy'), 'Eilat', 'Wrennie', 'Water inundation', 308);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('25-03-2019', 'dd-mm-yyyy'), 'Elad', 'Wrennie', 'Hazardous leak', 905);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('13-01-2006', 'dd-mm-yyyy'), 'Ness Ziona', 'Fanya', 'Water inundation', 125);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('09-08-2002', 'dd-mm-yyyy'), 'Nahariya', 'Berne', 'Ground shaking', 544);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('22-06-2023', 'dd-mm-yyyy'), 'Tiberias', 'Fanya', 'Armed assailant', 89);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('13-04-2002', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Wrennie', 'Ground shaking', 164);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('02-12-2003', 'dd-mm-yyyy'), 'Giv''at Shmuel', 'Wrennie', 'Ground shaking', 610);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('31-07-2010', 'dd-mm-yyyy'), 'Beit Shemesh', 'Wrennie', 'Water inundation', 721);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('07-09-2017', 'dd-mm-yyyy'), 'Tiberias', 'Fanya', 'Armed assailant', 967);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('04-08-2016', 'dd-mm-yyyy'), 'Kiryat Gat', 'Wrennie', 'Armed assailant', 375);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('14-08-2016', 'dd-mm-yyyy'), 'Herzliya', 'Fanya', 'Armed assailant', 36);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('05-09-2020', 'dd-mm-yyyy'), 'Nazareth', 'Fanya', 'Rotating storm', 179);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('27-09-2005', 'dd-mm-yyyy'), 'Ramla', 'Wrennie', 'Building blaze', 161);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('01-07-2012', 'dd-mm-yyyy'), 'Nahariya', 'Wrennie', 'Building blaze', 540);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('21-08-2022', 'dd-mm-yyyy'), 'Qalansawe', 'Fanya', 'Rotating storm', 264);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('17-09-2005', 'dd-mm-yyyy'), 'Herzliya', 'Fanya', 'Hazardous leak', 707);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('01-02-2019', 'dd-mm-yyyy'), 'Elad', 'Fanya', 'Water inundation', 200);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('19-04-2022', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Berne', 'Water inundation', 955);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('28-04-2016', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Wrennie', 'Hazardous leak', 797);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('01-05-2016', 'dd-mm-yyyy'), 'Tirat Carmel', 'Berne', 'Severe cyclone', 388);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('22-02-2008', 'dd-mm-yyyy'), 'Nof HaGalil', 'Berne', 'Electricity failure', 780);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('28-01-2001', 'dd-mm-yyyy'), 'Ramla', 'Berne', 'Severe cyclone', 322);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('27-11-2006', 'dd-mm-yyyy'), 'Qalansawe', 'Wrennie', 'Water inundation', 150);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('21-12-2010', 'dd-mm-yyyy'), 'Petah Tikva', 'Fanya', 'Hazardous leak', 609);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('13-01-2008', 'dd-mm-yyyy'), 'Elad', 'Fanya', 'Water inundation', 988);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('04-10-2016', 'dd-mm-yyyy'), 'Kfar Yona', 'Berne', 'Electricity failure', 977);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('29-01-2014', 'dd-mm-yyyy'), 'Nazareth', 'Wrennie', 'Rotating storm', 223);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('20-03-2008', 'dd-mm-yyyy'), 'Eilat', 'Berne', 'Health crisis', 300);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('17-03-2015', 'dd-mm-yyyy'), 'Kfar Yona', 'Fanya', 'Water inundation', 541);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('11-05-2020', 'dd-mm-yyyy'), 'Ness Ziona', 'Berne', 'Severe cyclone', 816);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('20-12-2018', 'dd-mm-yyyy'), 'Acre', 'Berne', 'Rotating storm', 59);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('29-09-2007', 'dd-mm-yyyy'), 'Nesher', 'Berne', 'Severe cyclone', 934);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('18-11-2011', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Berne', 'Building blaze', 947);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('06-06-2008', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Fanya', 'Health crisis', 853);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('20-02-2020', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Wrennie', 'Health crisis', 61);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('19-02-2013', 'dd-mm-yyyy'), 'Kfar Saba', 'Berne', 'Ground shaking', 869);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('15-01-2010', 'dd-mm-yyyy'), 'Tamra', 'Fanya', 'Water inundation', 553);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('27-07-2012', 'dd-mm-yyyy'), 'Kiryat Bialik', 'Wrennie', 'Armed assailant', 631);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('16-11-2004', 'dd-mm-yyyy'), 'Tiberias', 'Wrennie', 'Water inundation', 442);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('02-11-2005', 'dd-mm-yyyy'), 'Elad', 'Fanya', 'Rotating storm', 968);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('16-07-2020', 'dd-mm-yyyy'), 'Safed', 'Fanya', 'Rotating storm', 386);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('15-01-2017', 'dd-mm-yyyy'), 'Nesher', 'Fanya', 'Rotating storm', 182);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('26-06-2009', 'dd-mm-yyyy'), 'Tayibe', 'Berne', 'Armed assailant', 62);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('26-03-2012', 'dd-mm-yyyy'), 'Ashdod', 'Berne', 'Ground shaking', 269);
commit;
prompt 300 records committed...
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Fire', to_date('14-04-2008', 'dd-mm-yyyy'), 'Sakhnin', 'Fanya', 'Severe cyclone', 795);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('20-12-2010', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Fanya', 'Rotating storm', 652);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('30-05-2012', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Wrennie', 'Toxic emission', 518);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('30-06-2021', 'dd-mm-yyyy'), 'Kiryat Motzkin', 'Berne', 'Health crisis', 389);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('01-06-2015', 'dd-mm-yyyy'), 'Kiryat Shmona', 'Berne', 'Building blaze', 782);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('18-12-2022', 'dd-mm-yyyy'), 'Nazareth', 'Fanya', 'Toxic emission', 48);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('10-01-2000', 'dd-mm-yyyy'), 'Jerusalem', 'Fanya', 'Toxic emission', 230);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('02-10-2020', 'dd-mm-yyyy'), 'Rehovot', 'Fanya', 'Ground shaking', 167);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('19-03-2005', 'dd-mm-yyyy'), 'Eilat', 'Berne', 'Ground shaking', 978);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('23-02-2017', 'dd-mm-yyyy'), 'Nesher', 'Wrennie', 'Toxic emission', 571);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('18-12-2003', 'dd-mm-yyyy'), 'Ra''anana', 'Fanya', 'Ground shaking', 482);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('30-08-2004', 'dd-mm-yyyy'), 'Kafr Qasim', 'Wrennie', 'Building blaze', 486);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('02-04-2022', 'dd-mm-yyyy'), 'Beersheba', 'Berne', 'Hazardous leak', 220);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('19-04-2001', 'dd-mm-yyyy'), 'Rehovot', 'Berne', 'Rotating storm', 359);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('01-02-2017', 'dd-mm-yyyy'), 'Kfar Saba', 'Wrennie', 'Ground shaking', 366);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('23-12-2016', 'dd-mm-yyyy'), 'Yavne', 'Berne', 'Electricity failure', 677);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('03-11-2000', 'dd-mm-yyyy'), 'Afula', 'Wrennie', 'Severe cyclone', 495);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('28-11-2018', 'dd-mm-yyyy'), 'Or Akiva', 'Fanya', 'Hazardous leak', 63);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('24-03-2021', 'dd-mm-yyyy'), 'Safed', 'Fanya', 'Hazardous leak', 444);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('25-04-2002', 'dd-mm-yyyy'), 'Givatayim', 'Wrennie', 'Health crisis', 699);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('02-06-2023', 'dd-mm-yyyy'), 'Givatayim', 'Wrennie', 'Rotating storm', 249);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('12-01-2003', 'dd-mm-yyyy'), 'Tira', 'Wrennie', 'Armed assailant', 735);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('25-10-2019', 'dd-mm-yyyy'), 'Safed', 'Fanya', 'Hazardous leak', 602);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('24-01-2010', 'dd-mm-yyyy'), 'Kiryat Yam', 'Fanya', 'Severe cyclone', 316);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('11-04-2016', 'dd-mm-yyyy'), 'Rishon LeZion', 'Wrennie', 'Hazardous leak', 983);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('07-09-2017', 'dd-mm-yyyy'), 'Yokneam Illit', 'Wrennie', 'Severe cyclone', 577);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('12-02-2009', 'dd-mm-yyyy'), 'Rehovot', 'Wrennie', 'Electricity failure', 256);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('28-05-2009', 'dd-mm-yyyy'), 'Modi''in Illit', 'Wrennie', 'Hazardous leak', 294);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('06-08-2019', 'dd-mm-yyyy'), 'Lod', 'Wrennie', 'Electricity failure', 172);
commit;
prompt 329 records loaded
prompt Loading ROLESP...
insert into ROLESP (roname, roid, rodescribe)
values (' Develops software tools to enhance emergency response capabilities', 768, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Provides technical support for operational systems during incidents', 769, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the integration of new technologies into existing emergency response frameworks', 770, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates with IT teams to ensure system readiness and reliability', 771, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Develops and implements data management systems for emergency operations', 772, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Provides training on the use of technological tools and systems', 773, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Ensures the security and integrity of operational data', 774, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Develops automated systems for resource tracking and allocation', 775, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the deployment of ', 776, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Social Services Coordinator', 681, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Fleet Manager', 682, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Immigration and Customs Enforcement (ICE)', 683, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Animal Shelter Manager', 684, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Hazardous Materials Specialist', 685, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Transportation Security Administration (TSA)', 686, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Crisis Hotline Coordinator', 687, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Occupational Health and Safety Specialist', 688, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Department of Defense (DoD)', 689, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Public Works Coordinator', 690, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Fire Safety Manager', 691, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Federal Aviation Administration (FAA)', 692, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Volunteer Coordinator', 693, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Security Clearance Manager', 694, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Department of Energy (DOE)', 695, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Communications Manager', 696, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Emergency Preparedness Coordinator', 697, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Drug Enforcement Administration (DEA)', 698, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Training and Exercises Coordinator', 699, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Fire Protection Engineer', 700, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Responsible for managing emergency response teams and rapid response systems', 701, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates and oversees the actions of various teams during emergencies', 702, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages resources and team training to enhance emergency preparedness', 703, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Supervises team performance and ensures compliance with procedures and standards', 704, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Develops strategies and plans to improve operational efficiency', 705, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates with local authorities and external organizations', 706, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the process of incident investigation and lesson learning', 707, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Responsible for planning and conducting periodic drills', 708, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates communication and information systems during emergencies', 709, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages family and community liaison during incidents', 710, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the establishment of command and control centers', 711, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates international team activities during disasters', 712, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the process of fundraising and resource allocation', 713, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Responsible for the strategic development of the emergency operations', 714, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the implementation of safety protocols and guidelines', 715, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates logistics and support services during major incidents', 716, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Supervises the development of emergency response plans', 717, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the integration of new technologies in operational processes', 718, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates with health services and medical teams during crises', 719, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Responsible for staff welfare and support during prolonged incidents', 720, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the training and development programs for emergency personnel', 721, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages volunteer recruitment processes and promotes participation in organizational activities', 722, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Contributes to the training and engagement of volunteers within the community', 723, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Provides support and guidance to volunteers during mission execution', 724, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates volunteer deployment and ensures they are well-prepared', 725, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees volunteer welfare and morale', 726, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Organizes volunteer recognition programs and events', 727, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Facilitates communication between volunteers and management', 728, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Develops volunteer engagement strategies and retention plans', 729, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Ensures volunteers receive necessary certifications and training', 730, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages volunteer schedules and assignments', 731, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Provides feedback and evaluations to volunteers', 732, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Facilitates volunteer involvement in community outreach programs', 733, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates volunteer efforts during large-scale emergencies', 734, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Maintains a database of active and available volunteers', 735, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Organizes regular meetings and training sessions for volunteers', 736, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Develops partnerships with other organizations to enhance volunteer programs', 737, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates the logistics of volunteer deployments', 738, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Ensures that volunteers have the necessary equipment and resources', 739, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Provides crisis management training to volunteers', 740, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Develops policies and procedures for volunteer activities', 741, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Responsible for the process of procuring and distributing equipment and supplies during emergencies', 742, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the storage and maintenance of emergency response equipment', 743, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates the transportation of resources to and from incident sites', 744, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the logistics of setting up and maintaining temporary shelters', 745, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the supply chain and ensures the availability of critical resources', 746, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates with vendors and suppliers to secure necessary materials', 747, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the logistical aspects of disaster relief operations', 748, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the inventory and tracking of emergency supplies', 749, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates the deployment of logistical support teams', 750, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Ensures the efficient allocation of resources during emergencies', 751, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the management of transportation fleets', 752, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates the logistics of evacuation procedures', 753, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the setup and operation of emergency response centers', 754, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the logistics of large-scale public health responses', 755, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates the delivery of aid and support to affected populations', 756, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the logistics of international relief efforts', 757, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Oversees the logistical planning for special events and large gatherings', 758, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates the logistics of search and rescue operations', 759, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Manages the logistics of medical supply distribution', 760, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Coordinates the setup and maintenance of communication systems', 761, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Tactical Operations Planner', 762, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Responsible for the development and maintenance of computerized systems for operational management and support', 763, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Conducts data analysis and process optimization to improve performance and efficiency', 764, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Assists in the establishment of technological systems and applications to support operational and management processes', 765, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Monitors and assesses cybersecurity threats and vulnerabilities during emergency operations', 766, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Implements and maintains emergency communication systems', 767, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Environmental Agencies', 662, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Services Coordinator', 663, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Infrastructure Security Manager', 664, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Federal Emergency Management Agency (FEMA)', 665, ' logistic');
commit;
prompt 100 records committed...
insert into ROLESP (roname, roid, rodescribe)
values (' Crisis Resource Coordinator', 666, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Emergency Medical Services (EMS) Director', 667, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with International Red Crescent', 668, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Volunteer Deployment Coordinator', 669, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Recovery Specialist', 670, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Head of Operations Department', 561, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Head of Training Unit', 562, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Head of Operational Doctrine Unit', 563, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Head of Operational Investigations', 564, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Coordinator', 565, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Israel Police', 566, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Fire and Rescue Services', 567, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with the National Emergency Authority (NEA)', 568, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Magen David Adom (MDA)', 569, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Control and Monitoring Center (CMC) Manager', 570, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Shift Supervisor at the CMC', 571, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Planning Officer', 572, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Regional Operations Officer', 573, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Intelligence Officer', 574, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Communication Officer', 575, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Logistics Manager', 576, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Communication Specialist', 577, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Community Emergency Coordinator', 578, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Medical Training Instructor', 579, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Training Instructor', 580, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Volunteer Team Leader', 581, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Volunteer Recruitment Coordinator', 582, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Response Manager', 583, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Maintenance Coordinator', 584, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Hazardous Materials (HazMat) Officer', 585, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Medical Officer', 586, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' First Response Officer', 587, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Systems Upgrade Project Manager', 588, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' External Operational Relations Coordinator', 589, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Planning and Drills Officer', 590, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Officer for Motorcycle Unit', 591, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Officer for Foot Patrol Unit', 592, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Officer for Private Vehicle Responders', 593, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Search and Rescue Team Leader', 594, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Medical Liaison with Hospitals', 595, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Event Investigation Coordinator', 596, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Education and Public Relations Officer', 597, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Information Systems Specialist', 598, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Joint Project Manager with External Bodies', 599, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Procurement Manager', 600, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Civil Defense', 601, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Environmental Protection Agency', 602, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Public Health Services', 603, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Research Analyst', 604, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Incident Command System (ICS) Coordinator', 605, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Tactical Operations Planner', 606, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Response Dispatcher', 607, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Risk Management Specialist', 608, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Military Forces', 609, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Transportation Authority', 610, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Cybersecurity Analyst', 611, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Crisis Communication Specialist', 612, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Social Services', 613, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Legal Advisor', 614, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Human Resources Manager', 615, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Search and Rescue Canine Handler', 616, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Community Outreach Coordinator', 617, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Security Coordinator', 618, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Utility Companies', 619, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Hazard Mitigation Planner', 620, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Non-Governmental Organizations (NGOs)', 621, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Budget Analyst', 622, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Critical Incident Stress Management Coordinator', 623, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Educational Institutions', 624, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Incident Documentation Specialist', 625, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Facilities Manager', 626, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Telecommunications Providers', 627, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Counterterrorism Operations Officer', 628, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Mass Casualty Incident Manager', 629, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Border Control', 630, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Technology Specialist', 631, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Animal Control Services', 632, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Public Information Officer', 633, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Community Resilience Coordinator', 634, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Energy Companies', 635, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Shelter Coordinator', 636, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Performance Analyst', 637, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with International Agencies', 638, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Disaster Recovery Coordinator', 639, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Religious Organizations', 640, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Volunteer Services Coordinator', 641, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Behavioral Health Specialist', 642, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Transportation Security Administration (TSA)', 643, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Medical Dispatch Supervisor', 644, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Geographic Information Systems (GIS) Analyst', 645, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Coast Guard', 646, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Crisis Intervention Team Coordinator', 647, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Supply Chain Manager', 648, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Red Cross', 649, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Cyber Incident Response Manager', 650, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with United Nations Agencies', 651, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Telecommunications Specialist', 652, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Insurance Companies', 653, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Operations Center (EOC) Manager', 654, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Geospatial Intelligence Analyst', 655, ' voluntary');
commit;
prompt 200 records committed...
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Aviation Authority', 656, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Management Training Coordinator', 657, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Cultural Resource Manager', 658, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Homeland Security', 659, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Planning Coordinator', 660, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Continuity of Operations (COOP) Planner', 661, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with National Guard', 671, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Logistics Coordinator', 672, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Risk Assessment Analyst', 673, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with International Disaster Relief Organizations', 674, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Crisis Negotiation Team Coordinator', 675, ' logistic');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Emergency Management Specialist', 676, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Food and Drug Administration (FDA)', 677, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Resource Management Coordinator', 678, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Compliance Officer', 679, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Occupational Safety and Health Administration (OSHA)', 680, ' voluntary');
commit;
prompt 216 records loaded
prompt Loading TEAMP...
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (393, '273 Nancy Junction', '206-349-3863', 'Johnath', 'joswaldaw@virginia.edu', 655);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (394, '3 Bartillon Park', '987-446-1376', 'Jayne', 'jchiechioax@altervista.org', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (395, '78058 Commercial Way', '140-210-1387', 'Annissa', 'aglyneay@jiathis.com', 627);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (396, '4 Autumn Leaf Lane', '822-942-8543', 'Nara', 'nbrettonaz@instagram.com', 608);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (397, '22791 Milwaukee Alley', '335-816-0181', 'Jacinta', 'jvoadenb0@miibeian.gov.cn', 600);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (398, '753 American Ash Park', '912-857-9758', 'Frannie', 'fmoineb1@hc360.com', 689);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (399, '52965 Monument Junction', '272-601-9799', 'Debbie', 'dbuglerb2@woothemes.com', 565);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (400, '6924 Sloan Way', '942-992-5296', 'Jan', 'jlakinb3@vk.com', 666);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (296, '2 Mallard Place', '978-946-1682', 'Beverley', 'bsim87@cocolog-nifty.com', 698);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (297, '7 Bunting Court', '544-787-7420', 'Suzanne', 'sbrightie88@bloglines.com', 646);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (298, '1 Dottie Alley', '278-268-0753', 'Irwin', 'ifullick89@blogger.com', 687);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (299, '5365 Stoughton Lane', '233-522-3867', 'Romonda', 'rharfoot8a@japanpost.jp', 698);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (300, '28 Hoepker Park', '424-855-1415', 'Fonz', 'ffardo8b@privacy.gov.au', 685);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (301, '2 Farmco Way', '717-136-7923', 'Erek', 'eesmonde8c@cornell.edu', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (302, '34 Emmet Alley', '478-319-0374', 'Fonz', 'fklassman8d@go.com', 611);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (303, '596 Gale Court', '737-834-7130', 'Heloise', 'hpavitt8e@slashdot.org', 607);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (304, '6 Logan Point', '569-323-3768', 'Loraine', 'lmacdaid8f@psu.edu', 688);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (305, '9 Jenifer Circle', '919-258-3603', 'Scott', 'sfairleigh8g@sakura.ne.jp', 583);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (306, '36939 Lakewood Plaza', '980-834-0989', 'Vaughan', 'vstart8h@zimbio.com', 633);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (307, '4 Straubel Parkway', '506-904-7349', 'Brock', 'bitzkovitch8i@cisco.com', 678);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (308, '7843 Grasskamp Parkway', '980-743-2152', 'Giacinta', 'gmorling8j@oakley.com', 629);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (309, '7606 Northfield Trail', '489-322-3161', 'Tami', 'tpuig8k@discovery.com', 619);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (310, '9408 South Lane', '948-884-2354', 'Ellette', 'esijmons8l@newyorker.com', 683);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (311, '60773 Dexter Street', '668-657-5350', 'Latisha', 'loffell8m@usgs.gov', 599);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (312, '2537 Golden Leaf Point', '711-711-3818', 'Polly', 'pcampkin8n@yandex.ru', 679);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (313, '11 Clarendon Hill', '709-288-6034', 'Petra', 'pthredder8o@gmpg.org', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (314, '511 Elmside Place', '149-395-8722', 'Konstantin', 'kguilaem8p@cisco.com', 655);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (315, '06 Oak Valley Center', '175-328-0591', 'Sayre', 'sscouller8q@comcast.net', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (316, '5 Rutledge Pass', '946-945-2117', 'Agnes', 'aleggon8r@weather.com', 618);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (317, '09 Lakewood Junction', '229-587-8709', 'Barth', 'bdyment8s@howstuffworks.com', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (318, '7094 Upham Road', '689-811-1457', 'Baryram', 'bbrodhead8t@mediafire.com', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (319, '17 Tennessee Point', '402-840-5260', 'Nicolai', 'nsawyer8u@yellowpages.com', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (320, '24859 Helena Park', '477-776-4478', 'Sanford', 'stousy8v@mac.com', 622);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (321, '78 Hoffman Court', '401-159-2426', 'Genevieve', 'ghenaughan8w@biblegateway.com', 644);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (322, '53 2nd Plaza', '642-666-2895', 'Ernesto', 'epaulusch8x@linkedin.com', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (323, '58 Gerald Trail', '626-758-5201', 'Burr', 'bgoosnell8y@sourceforge.net', 615);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (324, '6 Hoepker Circle', '689-363-5173', 'Arabela', 'adudill8z@cpanel.net', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (325, '85 Starling Pass', '988-870-6545', 'Ginni', 'gbenny90@taobao.com', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (326, '164 Schiller Street', '125-232-3473', 'Ellyn', 'eshevels91@tumblr.com', 696);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (327, '9297 Kedzie Plaza', '434-702-4066', 'Bennie', 'bottiwill92@cornell.edu', 567);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (328, '9381 Graedel Circle', '313-695-5718', 'Pauline', 'phugonin93@hibu.com', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (329, '1080 Florence Street', '751-745-5885', 'Carlo', 'cspringtorp94@reverbnation.com', 650);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (330, '6 Mayfield Street', '214-313-8544', 'Betteanne', 'bspridgeon95@cargocollective.com', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (331, '93 Tennessee Alley', '116-531-1245', 'Kerk', 'kpasby96@accuweather.com', 598);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (332, '81157 Elmside Center', '618-390-7876', 'Beatrice', 'brobe97@newyorker.com', 604);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (333, '22 Manitowish Trail', '314-653-9420', 'Donovan', 'dhellyer98@blinklist.com', 656);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (334, '58323 Eastlawn Drive', '955-470-8107', 'Lukas', 'lforrestall99@de.vu', 654);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (335, '11 Southridge Way', '572-356-2239', 'Francisco', 'fduckfield9a@timesonline.co.uk', 633);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (336, '81467 Ramsey Center', '831-936-4174', 'Amelita', 'asickling9b@smugmug.com', 629);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (337, '05 Burning Wood Point', '829-473-6400', 'Goldina', 'ghulstrom9c@imgur.com', 674);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (338, '911 Summerview Circle', '685-919-8710', 'Carolina', 'cifill9d@sitemeter.com', 574);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (339, '48 Scofield Street', '851-891-1288', 'Kimberlyn', 'kyakovlev9e@scribd.com', 652);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (340, '038 Troy Circle', '165-930-4202', 'Sanson', 'snorthway9f@yandex.ru', 624);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (341, '50951 Melby Terrace', '138-545-2740', 'Barthel', 'bbernath9g@163.com', 641);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (342, '720 Thierer Terrace', '816-107-9797', 'Cesaro', 'cwaine9h@usgs.gov', 564);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (343, '28 Gerald Place', '690-983-6609', 'Mable', 'mdrysdall9i@g.co', 604);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (344, '094 Sloan Trail', '141-601-7123', 'Keven', 'kcleminshaw9j@examiner.com', 631);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (345, '66 Jenna Park', '751-676-8287', 'Fitz', 'fbenley9k@bbc.co.uk', 669);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (346, '6370 Oneill Center', '314-978-7662', 'Shirleen', 'sbrinklow9l@indiatimes.com', 624);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (347, '9012 Grasskamp Street', '398-219-8307', 'Janeta', 'jtabrett9m@yahoo.co.jp', 565);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (348, '308 Dahle Point', '381-823-2182', 'Veronique', 'vlies9n@abc.net.au', 634);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (349, '12292 Briar Crest Center', '499-257-9222', 'Cass', 'cpechacek9o@squarespace.com', 684);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (350, '1 Weeping Birch Circle', '143-210-9152', 'Sean', 'sburroughes9p@timesonline.co.uk', 697);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (351, '0 Longview Circle', '492-161-0419', 'Hobey', 'hbottomley9q@wikipedia.org', 566);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (352, '70 Fair Oaks Center', '479-611-7629', 'Jorrie', 'jdwire9r@com.com', 668);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (353, '366 Becker Junction', '874-969-3422', 'Oren', 'odrayn9s@delicious.com', 657);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (354, '7 High Crossing Drive', '590-738-5084', 'Sullivan', 'scowell9t@alibaba.com', 618);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (355, '51375 Spohn Court', '610-844-2623', 'Nance', 'ndanslow9u@nationalgeographic.com', 625);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (356, '930 Columbus Circle', '678-103-3259', 'Burk', 'bmasedon9v@twitter.com', 647);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (357, '8 Talisman Terrace', '844-543-4476', 'Marnie', 'mfakeley9w@businessweek.com', 618);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (358, '029 Kedzie Terrace', '496-876-0651', 'Ab', 'ahutton9x@wp.com', 690);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (359, '4 Scoville Alley', '126-435-8044', 'Sansone', 'sfidoe9y@ucoz.com', 645);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (360, '28711 Blue Bill Park Junction', '264-757-5806', 'Wit', 'wguslon9z@blogger.com', 690);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (361, '15 Summit Circle', '281-198-1761', 'Catherine', 'cwilcota0@qq.com', 580);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (362, '04 Old Gate Circle', '489-127-6218', 'Susi', 'sduminia1@scribd.com', 565);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (363, '2145 Butternut Point', '142-220-1861', 'Tymon', 'tblunsena2@nba.com', 679);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (364, '836 Hoffman Way', '673-297-3533', 'Monroe', 'mguillouxa3@yolasite.com', 589);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (365, '550 Anniversary Crossing', '928-228-0382', 'Waylin', 'wdelorta4@wix.com', 635);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (366, '9 Main Avenue', '512-446-9968', 'Van', 'vbroadeya5@spiegel.de', 672);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (367, '37 Randy Plaza', '936-559-1082', 'Enrico', 'egheorghea6@a8.net', 635);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (368, '2870 Melrose Avenue', '413-145-8095', 'Jens', 'jcoverlyna7@is.gd', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (369, '1115 Cody Pass', '392-895-3079', 'Renae', 'rpfeiffera8@shutterfly.com', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (370, '542 Maple Wood Circle', '184-166-6837', 'Jana', 'jjergera9@sakura.ne.jp', 611);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (371, '74 Monterey Avenue', '681-985-8934', 'Abraham', 'acheeldaa@yandex.ru', 684);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (372, '037 Ludington Alley', '962-442-1755', 'Cyrillus', 'cstovingab@ucoz.ru', 587);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (373, '394 Browning Pass', '909-636-5177', 'Neille', 'nrussilllac@about.me', 630);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (374, '29820 Clarendon Crossing', '859-652-7370', 'Kele', 'kshrievesad@google.com.hk', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (375, '0719 Dayton Lane', '378-587-9474', 'Jacky', 'jcarruthersae@upenn.edu', 592);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (376, '6 Macpherson Terrace', '701-679-8671', 'Jamie', 'jrahlofaf@bluehost.com', 583);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (377, '2414 Fairfield Drive', '192-893-2914', 'Tab', 'tostrichag@bloglines.com', 639);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (378, '28107 Dahle Point', '940-133-7213', 'Thibaut', 'tdietscheah@zdnet.com', 638);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (379, '74298 Mcguire Alley', '550-403-0840', 'Aldridge', 'abunnellai@prweb.com', 638);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (380, '2 Tomscot Circle', '687-205-2422', 'Charleen', 'cconingaj@indiegogo.com', 687);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (381, '59 Continental Court', '165-211-9045', 'Pietrek', 'psimukovak@joomla.org', 658);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (382, '675 Mendota Alley', '416-131-5580', 'Anestassia', 'againsfordal@cornell.edu', 649);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (383, '22445 Londonderry Parkway', '423-736-7558', 'Nalani', 'ncalwayam@reddit.com', 684);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (384, '5 Nobel Street', '578-397-3260', 'Fredric', 'fgobyan@istockphoto.com', 585);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (385, '51 Oakridge Junction', '310-453-8972', 'Adi', 'aturkao@4shared.com', 618);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (386, '7931 Clemons Trail', '710-323-6271', 'Lian', 'ljansaap@indiegogo.com', 641);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (387, '0 Kenwood Way', '198-281-5863', 'Jeramie', 'jstraineaq@indiegogo.com', 631);
commit;
prompt 100 records committed...
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (388, '03 Manley Street', '671-489-7748', 'Franklin', 'ffullbrookar@feedburner.com', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (389, '0818 Mallory Way', '485-864-1721', 'Andree', 'aligertonas@oaic.gov.au', 619);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (390, '50 Prairieview Way', '645-921-7982', 'Rhea', 'rmcmeekanat@house.gov', 585);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (391, '07778 Nobel Trail', '502-841-9029', 'Albertina', 'aclappertonau@cbc.ca', 638);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (392, '3 Hovde Junction', '554-181-5972', 'Jarrett', 'jhavillav@com.com', 630);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (197, '004 Moland Center', '556-351-6284', 'Haleigh', 'hsparkes5g@digg.com', 588);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (198, '13 Bayside Plaza', '444-532-4734', 'Natalie', 'ntremayle5h@google.com', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (199, '2476 Nancy Avenue', '338-840-1260', 'Deeyn', 'dtoler5i@nytimes.com', 641);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (200, '13 Truax Court', '256-818-3719', 'Oren', 'oshoebrook5j@imageshack.us', 600);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (201, '55 Barnett Trail', '840-303-4961', 'Christalle', 'caudsley5k@wikimedia.org', 624);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (202, '6525 Anzinger Center', '108-538-5082', 'Nicolai', 'ncolaton5l@sakura.ne.jp', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (203, '2227 Butternut Point', '176-355-7854', 'Gwendolen', 'gtams5m@gnu.org', 641);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (204, '308 Golf Way', '985-649-4245', 'Barrie', 'bloosely5n@unblog.fr', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (205, '2209 Eliot Park', '424-869-5235', 'Sauveur', 'skliesl5o@surveymonkey.com', 666);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (206, '69221 Cordelia Drive', '813-745-2962', 'Nealy', 'nayrs5p@fotki.com', 656);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (207, '09 Sommers Crossing', '259-781-6862', 'Ariella', 'abeven5q@wikipedia.org', 573);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (208, '4 Maple Avenue', '951-208-8154', 'Jenni', 'jmarages5r@msn.com', 564);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (209, '878 Waubesa Junction', '999-661-3767', 'Court', 'cskeffington5s@oaic.gov.au', 595);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (210, '75 Lawn Avenue', '313-210-9113', 'Ulick', 'uweeden5t@phpbb.com', 655);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (211, '239 Moose Circle', '434-947-1077', 'Siusan', 'slorkin5u@surveymonkey.com', 670);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (212, '55613 Hauk Center', '368-744-8393', 'Stavro', 'snouch5v@bluehost.com', 640);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (213, '78836 Banding Point', '265-466-8692', 'Efren', 'echazerand5w@amazon.de', 649);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (214, '10 Graceland Point', '800-354-7927', 'Hatti', 'hraddon5x@cdc.gov', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (215, '9 Upham Crossing', '153-496-1953', 'Althea', 'abelleny5y@live.com', 697);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (216, '2 Homewood Road', '104-389-3653', 'Shela', 'saxe5z@sakura.ne.jp', 677);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (217, '6278 Sachtjen Parkway', '319-478-8344', 'Florinda', 'fklauber60@myspace.com', 651);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (218, '21079 North Place', '294-182-8183', 'Eleni', 'eplumstead61@usa.gov', 685);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (219, '1749 Comanche Lane', '816-279-1580', 'Araldo', 'apilkinton62@edublogs.org', 666);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (220, '76301 Armistice Center', '597-217-6754', 'Mireille', 'mmahaffey63@nytimes.com', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (221, '8365 Reindahl Alley', '135-788-9673', 'Otto', 'ostubbins64@archive.org', 588);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (222, '22986 Katie Place', '211-118-1511', 'Yehudi', 'ysloegrave65@technorati.com', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (223, '4 Granby Way', '320-375-5705', 'Garrik', 'ggodball66@1und1.de', 664);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (224, '9081 Mesta Crossing', '111-912-1544', 'Mariann', 'mglaze67@google.com.au', 645);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (225, '6514 Cody Alley', '976-952-0858', 'Lazaro', 'lcoakley68@dot.gov', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (226, '446 Dryden Terrace', '788-769-5483', 'Clemence', 'cheggman69@yolasite.com', 575);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (227, '413 Eastwood Alley', '513-693-7325', 'Kipp', 'kcrosson6a@si.edu', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (228, '1 Buhler Place', '537-789-1991', 'Phillie', 'psebert6b@ovh.net', 586);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (229, '902 Menomonie Street', '953-539-7240', 'Gerry', 'gkarpe6c@wired.com', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (230, '853 Dunning Center', '994-122-1166', 'Florina', 'fpease6d@yelp.com', 651);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (231, '224 Spohn Place', '318-952-2194', 'Lara', 'lmcgarrell6e@seesaa.net', 655);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (232, '6 Wayridge Crossing', '984-979-2273', 'Elvina', 'efellibrand6f@disqus.com', 674);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (233, '837 West Avenue', '291-149-8707', 'Pauline', 'pfoyston6g@ftc.gov', 676);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (234, '0 Transport Pass', '389-375-6681', 'Gianna', 'gtremlett6h@facebook.com', 619);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (235, '19289 Reinke Avenue', '737-116-7360', 'Ange', 'avedenichev6i@scientificamerican.com', 695);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (236, '9 Ryan Crossing', '413-205-7022', 'Haskel', 'hstitch6j@squarespace.com', 602);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (237, '4 Monument Way', '523-384-6140', 'Ebeneser', 'ecorain6k@zimbio.com', 598);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (238, '56 Jenna Street', '184-170-1308', 'Burr', 'bportugal6l@wisc.edu', 573);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (239, '656 Northwestern Trail', '101-337-7880', 'Dudley', 'dmccarrison6m@hud.gov', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (240, '12 Waubesa Road', '181-638-0284', 'Brad', 'bleonardi6n@163.com', 609);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (241, '92 Fuller Place', '636-717-4451', 'Markus', 'mattac6o@ow.ly', 627);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (242, '3670 Toban Terrace', '223-908-1193', 'Brannon', 'bsmee6p@independent.co.uk', 578);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (243, '9359 South Court', '254-805-3691', 'Gunther', 'gseamarke6q@4shared.com', 620);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (244, '95 Drewry Court', '238-797-1571', 'Adolphus', 'acallen6r@berkeley.edu', 645);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (245, '792 Mosinee Alley', '310-720-7898', 'Alexandro', 'aclaypoole6s@com.com', 600);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (246, '9 Bluestem Pass', '756-772-9083', 'Gusta', 'gchallens6t@google.com', 608);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (247, '2813 Aberg Junction', '357-218-1036', 'Brennan', 'bgodber6u@trellian.com', 688);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (248, '25 Ludington Hill', '486-297-3906', 'Odie', 'owhannel6v@lycos.com', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (249, '95672 Muir Pass', '204-153-4495', 'Nerta', 'nmacalpyne6w@businessweek.com', 678);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (250, '892 Esker Plaza', '160-693-0410', 'Marcel', 'mdeek6x@ftc.gov', 595);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (251, '906 Iowa Avenue', '599-928-4394', 'Corrie', 'ccolquete6y@clickbank.net', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (252, '94 Valley Edge Lane', '401-507-6064', 'Harland', 'hflorentine6z@pinterest.com', 620);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (253, '7 Ramsey Place', '756-394-3018', 'Shelli', 'sslora70@dailymail.co.uk', 573);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (254, '055 Bowman Park', '300-915-9064', 'Francklyn', 'fguitel71@bloglovin.com', 668);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (255, '1431 West Plaza', '784-561-7125', 'Carlynne', 'chartmann72@thetimes.co.uk', 627);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (256, '23 Butterfield Place', '616-745-4392', 'Colan', 'caisthorpe73@nps.gov', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (257, '247 Springs Place', '500-636-0298', 'Carlyn', 'clingwood74@shutterfly.com', 677);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (258, '6 Scott Road', '833-596-7734', 'Sidoney', 'spyzer75@prlog.org', 570);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (259, '38569 Meadow Ridge Parkway', '529-746-3022', 'Davide', 'dhunnam76@msu.edu', 649);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (260, '50551 Katie Road', '372-156-0932', 'Chaddy', 'cchilcott77@plala.or.jp', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (261, '90 Starling Lane', '385-202-3805', 'Silvano', 'scoolbear78@usnews.com', 623);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (262, '8 Pawling Terrace', '651-788-9404', 'Vilma', 'vwhalebelly79@cloudflare.com', 683);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (263, '3 Starling Road', '637-418-8350', 'Liza', 'lbrolan7a@about.me', 568);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (264, '6280 Blaine Terrace', '602-701-8625', 'Freddy', 'fhinken7b@csmonitor.com', 618);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (265, '49 Vernon Lane', '369-561-8103', 'Rube', 'rpentin7c@google.fr', 561);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (266, '99 Fordem Avenue', '994-860-6293', 'Sebastien', 'sbreckin7d@smugmug.com', 689);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (267, '592 Comanche Center', '893-426-6834', 'Oran', 'oreims7e@istockphoto.com', 616);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (268, '445 Daystar Road', '212-462-3212', 'Jilli', 'jglauber7f@seattletimes.com', 564);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (269, '7 Kensington Point', '623-216-6776', 'Dagny', 'dloblie7g@sakura.ne.jp', 627);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (270, '7483 Fieldstone Avenue', '668-901-4969', 'Bruis', 'bcamel7h@phoca.cz', 650);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (271, '46578 Harbort Crossing', '611-885-7041', 'Brooke', 'bglas7i@tripod.com', 689);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (272, '073 Mallard Place', '632-764-5705', 'Renee', 'rwitterick7j@cyberchimps.com', 578);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (273, '4158 Crownhardt Junction', '750-182-7121', 'Piotr', 'pwoodwin7k@addthis.com', 606);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (274, '2 Emmet Way', '541-749-9149', 'Ellerey', 'egayden7l@tinypic.com', 627);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (275, '7 Bay Parkway', '430-165-0315', 'Leopold', 'lbattelle7m@1und1.de', 643);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (276, '1 Darwin Court', '864-461-8785', 'Brunhilde', 'blutz7n@homestead.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (277, '934 Waubesa Drive', '787-822-4596', 'Kathie', 'kodonohoe7o@ihg.com', 693);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (278, '141 Lillian Drive', '360-462-4990', 'Way', 'wdagnan7p@hexun.com', 698);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (279, '24037 Grayhawk Hill', '206-335-1322', 'Bradney', 'bcrighton7q@ted.com', 565);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (280, '48 Nelson Place', '489-564-4357', 'De', 'dsharples7r@naver.com', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (281, '2 Myrtle Drive', '137-235-0338', 'Ole', 'owooland7s@apache.org', 682);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (282, '8 Pepper Wood Circle', '137-758-7884', 'Tersina', 'tmix7t@usnews.com', 602);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (283, '3 Independence Alley', '450-735-2186', 'Linell', 'lwardingly7u@instagram.com', 658);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (284, '18 Vidon Trail', '612-597-6216', 'Tobie', 'tgate7v@canalblog.com', 586);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (285, '4 5th Circle', '170-491-0160', 'Aluino', 'amathouse7w@patch.com', 684);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (286, '47 Forest Drive', '825-168-2058', 'Clayborn', 'canthony7x@va.gov', 659);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (287, '0 Petterle Road', '449-219-6380', 'Chad', 'cniccols7y@npr.org', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (288, '65704 Declaration Crossing', '168-181-7798', 'Dulcy', 'dgrevatt7z@examiner.com', 596);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (289, '750 Sugar Point', '872-618-6197', 'Adolphus', 'adarinton80@bluehost.com', 625);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (290, '39961 Cottonwood Trail', '166-149-4209', 'Harman', 'hgariff81@nasa.gov', 652);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (291, '47012 Karstens Lane', '788-866-3849', 'Catha', 'cfarlane82@eventbrite.com', 698);
commit;
prompt 200 records committed...
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (292, '7 Corben Place', '905-588-5458', 'Eberhard', 'echitson83@lulu.com', 665);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (293, '92 Goodland Junction', '346-832-5840', 'Rik', 'rverbrugge84@exblog.jp', 637);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (294, '18291 Fremont Avenue', '153-338-6883', 'Ozzie', 'onaisbit85@bloglovin.com', 598);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (295, '6 Nobel Park', '874-618-4557', 'Farrel', 'fdingsdale86@issuu.com', 669);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (100, '9553 Valley Edge Plaza', '718-865-6696', 'Teddie', 'tbattrum2r@google.cn', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (101, '7430 Loeprich Way', '160-865-3208', 'Tierney', 'tlightewood2s@businesswire.com', 685);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (102, '08 Quincy Terrace', '975-311-0878', 'Lelah', 'lthurbon2t@reuters.com', 610);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (103, '7 Barnett Crossing', '660-832-5465', 'Daisie', 'ddakhov2u@addthis.com', 675);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (104, '20 Hoard Trail', '929-362-1340', 'Erna', 'egarbutt2v@trellian.com', 700);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (105, '76101 Aberg Lane', '506-877-8049', 'Dion', 'dfirbank2w@nps.gov', 691);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (106, '4769 Tennessee Avenue', '293-144-7719', 'Tod', 'tdannell2x@ucoz.ru', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (107, '2 Tomscot Way', '552-874-6831', 'Doyle', 'dbradforth2y@devhub.com', 656);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (108, '11 Pine View Crossing', '854-612-0186', 'Vania', 'vscotfurth2z@indiegogo.com', 658);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (109, '2 Kingsford Avenue', '854-841-5208', 'Valentin', 'vcurryer30@salon.com', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (110, '1583 Mallory Street', '408-314-4632', 'Jarid', 'jtrenfield31@google.cn', 653);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (111, '2 Tony Place', '587-267-4970', 'Hyacintha', 'htry32@nifty.com', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (112, '2 Fieldstone Trail', '511-219-2628', 'Loreen', 'leatttok33@walmart.com', 650);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (113, '34274 Dakota Pass', '398-107-1850', 'Kordula', 'kcolliss34@redcross.org', 575);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (114, '70 Di Loreto Crossing', '217-207-9799', 'Pier', 'prahl35@drupal.org', 665);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (115, '4328 Pine View Lane', '773-655-2066', 'Wynn', 'wpepys36@vk.com', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (116, '6 Lerdahl Parkway', '988-552-9427', 'Malinda', 'mbelloch37@archive.org', 597);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (117, '996 Lighthouse Bay Court', '431-729-8060', 'Anetta', 'abertenshaw38@bigcartel.com', 611);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (118, '0706 Russell Terrace', '450-664-3548', 'Rosie', 'rnelius39@odnoklassniki.ru', 597);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (119, '0 Pierstorff Point', '316-503-2255', 'Lorene', 'lcapstick3a@wp.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (120, '898 Judy Junction', '105-247-0908', 'Georgine', 'gtomlins3b@dagondesign.com', 673);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (121, '45 Elka Trail', '366-940-1525', 'Rozanna', 'rhannigane3c@sakura.ne.jp', 595);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (122, '1 Sugar Park', '872-748-1987', 'Lazarus', 'lcouchman3d@google.ru', 633);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (123, '3 Arrowood Parkway', '576-458-5301', 'Brittani', 'baldred3e@usatoday.com', 637);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (124, '6 Bluejay Point', '590-569-8736', 'Cornie', 'ctoffanelli3f@disqus.com', 682);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (125, '2 Sherman Plaza', '798-143-7665', 'Zeke', 'zgidney3g@timesonline.co.uk', 591);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (126, '1102 Myrtle Pass', '754-527-9889', 'Kathie', 'kscotcher3h@cbsnews.com', 676);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (127, '3635 Bobwhite Lane', '892-759-3222', 'Miguela', 'mmccoughan3i@who.int', 698);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (128, '7 La Follette Crossing', '140-892-0912', 'Bennie', 'bearp3j@tinyurl.com', 610);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (129, '3 Declaration Hill', '299-845-9377', 'Karlotte', 'kpennicott3k@phpbb.com', 611);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (130, '902 Chive Plaza', '504-416-9254', 'Elianora', 'epaskerful3l@skyrock.com', 606);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (131, '76 Fisk Point', '805-205-2261', 'Brnaba', 'bkalf3m@slideshare.net', 676);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (132, '5 Lake View Plaza', '180-363-8625', 'Etta', 'eroper3n@hp.com', 647);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (133, '3 Bunting Plaza', '358-828-7986', 'Lauri', 'lravenshaw3o@jalbum.net', 597);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (134, '8 Rockefeller Way', '921-482-2346', 'Lita', 'ldick3p@latimes.com', 583);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (135, '0787 Garrison Court', '432-781-4899', 'Florenza', 'fwashbrook3q@state.gov', 655);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (136, '8 Debs Crossing', '111-456-3102', 'Junie', 'jevans3r@prweb.com', 664);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (137, '04815 Pine View Street', '963-561-1238', 'Biron', 'brollinson3s@pcworld.com', 591);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (138, '0242 Evergreen Lane', '607-399-3235', 'Ian', 'ipython3t@purevolume.com', 575);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (139, '2350 Reinke Parkway', '738-260-5442', 'Virgie', 'vbangham3u@wiley.com', 650);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (140, '842 Bayside Terrace', '388-770-7881', 'Cass', 'cbirchett3v@squidoo.com', 573);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (141, '7 Maryland Place', '810-949-9770', 'Sephira', 'skuschel3w@mysql.com', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (142, '9 Clemons Crossing', '270-154-8770', 'Nowell', 'nwhiteland3x@indiegogo.com', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (143, '1708 Stoughton Lane', '472-539-2853', 'Andy', 'alaws3y@accuweather.com', 629);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (144, '966 Meadow Vale Way', '305-436-0805', 'Corey', 'cpopov3z@topsy.com', 571);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (145, '18 Kipling Hill', '138-606-4731', 'Laurie', 'lcaustic40@state.tx.us', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (146, '1062 Vidon Alley', '844-424-4220', 'Dorena', 'dchilds41@reddit.com', 584);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (147, '94452 Kinsman Parkway', '862-539-0605', 'Bambie', 'bturpin42@chronoengine.com', 696);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (148, '06104 Arapahoe Point', '390-627-1377', 'Dorrie', 'dmorcomb43@hibu.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (149, '581 Maple Hill', '819-490-3856', 'Emmaline', 'eburgess44@stumbleupon.com', 579);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (150, '08572 Fairfield Pass', '536-663-9844', 'Milzie', 'msemble45@spiegel.de', 598);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (151, '25 Springview Crossing', '394-382-1491', 'Wain', 'wcardiff46@dailymail.co.uk', 667);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (152, '7254 Homewood Place', '957-858-1788', 'Bailey', 'bheeran47@comsenz.com', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (153, '54236 Miller Way', '643-485-3299', 'Latashia', 'lguiducci48@huffingtonpost.com', 572);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (154, '56519 3rd Plaza', '189-219-0378', 'Nicole', 'npawfoot49@google.com.br', 594);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (155, '96040 Park Meadow Road', '852-381-9251', 'Francesco', 'fguinan4a@csmonitor.com', 690);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (156, '7001 Boyd Crossing', '632-426-7987', 'Winnah', 'wdecourt4b@is.gd', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (157, '11 Hanson Avenue', '272-281-0782', 'Geraldine', 'gkilbee4c@twitpic.com', 586);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (158, '56 Longview Parkway', '836-414-1925', 'Abbi', 'atook4d@yelp.com', 615);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (159, '1440 Namekagon Trail', '755-809-0007', 'Roderigo', 'rblandamore4e@nba.com', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (160, '386 Hanover Park', '525-826-0135', 'Patty', 'pstorcke4f@delicious.com', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (161, '89752 Haas Drive', '983-654-4603', 'Yettie', 'ycowerd4g@virginia.edu', 683);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (162, '9652 Twin Pines Pass', '854-878-2324', 'Baillie', 'brosenbarg4h@sina.com.cn', 639);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (163, '23 Killdeer Park', '327-334-4023', 'Dalia', 'ddigiorgio4i@naver.com', 694);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (164, '13320 Sachtjen Plaza', '903-953-8267', 'Anastassia', 'abaldi4j@trellian.com', 628);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (165, '38523 Del Mar Lane', '682-744-5844', 'Selig', 'shebborne4k@springer.com', 692);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (166, '75247 Birchwood Way', '280-878-8858', 'Phaedra', 'pgrinin4l@phpbb.com', 625);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (167, '997 Memorial Center', '443-293-5738', 'Winona', 'wfarmer4m@joomla.org', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (168, '034 Erie Point', '304-484-4081', 'Lexi', 'lcanet4n@bravesites.com', 685);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (169, '353 Laurel Way', '393-773-7518', 'Rik', 'rmcavey4o@hexun.com', 652);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (170, '3900 Havey Drive', '715-475-4127', 'Leslie', 'lheninghem4p@mtv.com', 570);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (171, '12694 Anzinger Trail', '562-209-0300', 'Roxine', 'rgudger4q@sciencedirect.com', 676);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (172, '70383 Stone Corner Alley', '492-968-3045', 'Darci', 'dmacpadene4r@networksolutions.com', 686);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (173, '96498 Del Sol Parkway', '468-632-0377', 'Bret', 'biacovozzo4s@edublogs.org', 589);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (174, '1 Summer Ridge Point', '301-182-6945', 'Matt', 'mhuthart4t@stumbleupon.com', 674);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (175, '1 Florence Center', '859-976-3073', 'Job', 'jhedlestone4u@deviantart.com', 614);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (176, '535 Stephen Hill', '596-195-4432', 'Mirilla', 'mmarsden4v@buzzfeed.com', 580);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (177, '8 Michigan Alley', '563-348-5485', 'Mylo', 'mpoxon4w@shareasale.com', 596);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (178, '8 Comanche Street', '744-970-1602', 'Janka', 'jlasselle4x@npr.org', 594);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (179, '2 Milwaukee Lane', '425-134-5682', 'Ibrahim', 'icolchett4y@mayoclinic.com', 694);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (180, '07850 Jenna Parkway', '883-852-7356', 'Eben', 'eperry4z@homestead.com', 670);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (181, '6 Esker Drive', '135-207-3421', 'Nollie', 'nsmedmoor50@phpbb.com', 592);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (182, '27 Vidon Court', '954-780-4092', 'Darrick', 'dstaining51@shinystat.com', 567);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (183, '6 Park Meadow Avenue', '837-443-1242', 'Stearne', 'slonghorne52@photobucket.com', 629);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (184, '8752 Kenwood Parkway', '319-784-7620', 'Dacey', 'dclerke53@dot.gov', 599);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (185, '94 Johnson Center', '456-343-2012', 'Domini', 'dweatherdon54@un.org', 571);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (186, '1213 Westridge Terrace', '244-720-9319', 'Freeland', 'fsoughton55@list-manage.com', 607);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (187, '7970 Dakota Crossing', '263-409-0386', 'Wyn', 'wannetts56@technorati.com', 694);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (188, '29 Clove Road', '670-463-4269', 'Roderich', 'randrzejczak57@yandex.ru', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (189, '6 Debs Plaza', '246-699-4865', 'Drucy', 'dkarpychev58@networkadvertising.org', 624);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (190, '02796 Porter Pass', '678-711-7598', 'Kane', 'kkondratovich59@behance.net', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (191, '2905 Birchwood Plaza', '317-433-0604', 'Alan', 'aivashkin5a@behance.net', 619);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (192, '724 Armistice Way', '519-580-6008', 'Hadlee', 'hbartram5b@diigo.com', 622);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (193, '38414 Hintze Crossing', '920-793-9000', 'Birgit', 'bsonschein5c@comsenz.com', 636);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (194, '954 Mosinee Point', '402-247-0937', 'Findley', 'fderoeck5d@g.co', 611);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (195, '9790 Sunbrook Pass', '381-436-7646', 'Giffy', 'gvankov5e@fda.gov', 614);
commit;
prompt 300 records committed...
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (196, '135 Oriole Court', '926-453-7907', 'Robb', 'rradborne5f@china.com.cn', 675);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (92, '969 West Terrace', '948-552-9511', 'Glynda', 'gdadd2j@mtv.com', 697);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (93, '1791 Gerald Alley', '240-560-2245', 'Theodora', 'tscinelli2k@yahoo.co.jp', 573);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (94, '6443 Buell Street', '835-580-0159', 'Kial', 'kgamlyn2l@example.com', 593);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (95, '96739 Menomonie Circle', '507-766-1137', 'Regan', 'rabbe2m@odnoklassniki.ru', 645);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (96, '05 Waywood Parkway', '640-935-8469', 'Hildagarde', 'hslocomb2n@theguardian.com', 659);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (97, '0820 Fairfield Drive', '617-257-1471', 'Penelope', 'pcongrave2o@yelp.com', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (98, '74 Laurel Way', '914-884-7818', 'Nehemiah', 'nmallinder2p@gov.uk', 581);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (99, '67174 Calypso Parkway', '115-559-0445', 'Shaine', 'sreal2q@businessinsider.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (1, '44186 Sugar Park', '197-698-5926', 'Berne', 'bsloane0@state.gov', 692);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (2, '75 Cody Avenue', '498-380-2480', 'Wrennie', 'wquarrington1@washington.edu', 639);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (3, '07979 Merry Drive', '667-773-7493', 'Fanya', 'foldland2@aboutads.info', 574);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (4, '501 Holmberg Crossing', '330-848-3920', 'Thomas', 'troyl3@amazon.co.jp', 603);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (5, '2802 Gina Crossing', '246-592-4320', 'Kalie', 'kfylan4@sourceforge.net', 598);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (6, '9 Dryden Circle', '821-406-5190', 'Ezmeralda', 'ecovely5@ucla.edu', 590);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (7, '438 Eagan Way', '448-153-7041', 'Pinchas', 'pharbottle6@ning.com', 628);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (8, '2734 Mallard Place', '966-360-6440', 'Jaine', 'joliveti7@cbslocal.com', 600);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (9, '41442 Havey Trail', '946-543-2804', 'Kelwin', 'kspottiswood8@wix.com', 678);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (10, '1 Westridge Drive', '395-572-4603', 'Dukie', 'djirus9@dell.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (11, '9 David Place', '691-276-6012', 'Edyth', 'esellersa@soundcloud.com', 609);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (12, '1784 Straubel Way', '725-648-6113', 'Mitchell', 'mfookesb@bluehost.com', 614);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (13, '09 Di Loreto Hill', '887-304-5445', 'Corrie', 'cstagc@msu.edu', 583);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (14, '5928 Crowley Junction', '216-441-9280', 'Merci', 'mmabeyd@indiegogo.com', 696);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (15, '45044 Crownhardt Road', '691-716-3924', 'Minette', 'mcoultharde@aol.com', 624);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (16, '5264 Oak Valley Circle', '588-372-1705', 'Jacky', 'jhurrenf@netvibes.com', 615);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (17, '38 Melody Drive', '689-234-3553', 'Clarie', 'cquartlyg@salon.com', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (18, '175 Spaight Center', '490-310-7989', 'Jaymie', 'jdunabieh@free.fr', 641);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (19, '31 6th Center', '647-446-4499', 'Devina', 'dpiscoi@adobe.com', 567);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (20, '1 Farwell Park', '643-476-5823', 'Joel', 'jsyrettj@theguardian.com', 568);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (21, '4 Kings Avenue', '735-919-1798', 'Evin', 'ewhiteoakk@trellian.com', 637);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (22, '1 Saint Paul Place', '630-452-2511', 'Kariotta', 'kguyerl@printfriendly.com', 561);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (23, '73 Arrowood Center', '125-190-7763', 'Ronalda', 'rfortunm@webnode.com', 657);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (24, '089 Luster Pass', '645-148-5870', 'Shina', 'sbromheadn@usgs.gov', 654);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (25, '390 Artisan Drive', '623-559-1116', 'Sheelagh', 'sgoricko@hc360.com', 602);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (26, '8420 Lerdahl Hill', '159-174-2973', 'Laryssa', 'lschwartzp@wordpress.org', 657);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (27, '1809 Dovetail Avenue', '114-455-4622', 'Karyn', 'kalltimesq@theatlantic.com', 660);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (28, '0 Holy Cross Lane', '516-372-5514', 'Kylie', 'khaselgrover@seesaa.net', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (29, '52324 Autumn Leaf Way', '656-622-0015', 'Lyle', 'lraywoods@telegraph.co.uk', 610);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (30, '80758 Golf Course Center', '848-473-7222', 'Ashlin', 'ayewdallt@deliciousdays.com', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (31, '888 Crest Line Place', '616-613-3936', 'Dido', 'dkaradzasu@issuu.com', 660);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (32, '95 Westend Way', '584-870-4764', 'Aura', 'aflavellev@google.pl', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (33, '7057 Mallard Pass', '227-941-9324', 'Lusa', 'lcabralw@utexas.edu', 607);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (34, '7303 Glacier Hill Lane', '591-368-6023', 'Kev', 'kwalesax@yellowbook.com', 634);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (35, '8 La Follette Avenue', '982-354-0804', 'Agathe', 'aduffreey@apache.org', 615);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (36, '86341 Linden Parkway', '949-479-4439', 'Whittaker', 'wshoebottomz@seattletimes.com', 589);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (37, '93 Drewry Way', '351-549-4371', 'Melony', 'msansbury10@wordpress.org', 563);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (38, '2614 Ohio Alley', '236-981-2415', 'Sigismond', 'sloffhead11@timesonline.co.uk', 687);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (39, '68 Everett Avenue', '331-885-8151', 'Shermie', 'spetegrew12@uiuc.edu', 583);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (40, '54439 Anhalt Terrace', '552-665-5260', 'Cordey', 'cbrafield13@wikipedia.org', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (41, '6224 Messerschmidt Street', '550-460-6023', 'Terrence', 'tcretney14@census.gov', 649);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (42, '97273 Memorial Point', '744-901-3116', 'Latashia', 'lcohani15@freewebs.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (43, '800 Bultman Terrace', '846-569-1204', 'Margaux', 'mhowen16@census.gov', 575);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (44, '95163 Hoffman Parkway', '467-276-8979', 'Haydon', 'hcrosland17@pinterest.com', 634);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (45, '05053 Bellgrove Center', '592-821-2005', 'Christen', 'clegalle18@salon.com', 600);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (46, '78 Warner Center', '501-471-2037', 'Roberto', 'rverheyden19@sakura.ne.jp', 682);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (47, '46632 Loomis Center', '633-875-7055', 'Shirlene', 'shefford1a@cyberchimps.com', 667);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (48, '3 Old Shore Street', '986-844-1294', 'Elbert', 'esmithen1b@creativecommons.org', 657);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (49, '73188 Bunker Hill Street', '195-136-6674', 'Danie', 'dmurrie1c@paypal.com', 683);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (50, '55 Rigney Street', '831-305-3915', 'Thornton', 'tinstock1d@ustream.tv', 599);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (51, '8728 Melrose Circle', '551-258-9154', 'Fancie', 'fwaldren1e@ehow.com', 568);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (52, '3 Springs Way', '534-661-0112', 'Fannie', 'fgransden1f@wikia.com', 673);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (53, '07276 Dawn Plaza', '751-430-3860', 'Hettie', 'hmactrustam1g@unc.edu', 676);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (54, '0 Coolidge Point', '160-399-1246', 'Roderick', 'rleacy1h@zimbio.com', 661);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (55, '7 Oak Valley Place', '918-565-9720', 'Willyt', 'wyukhov1i@netscape.com', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (56, '567 Sunfield Place', '904-917-8465', 'Irvin', 'igaiford1j@house.gov', 566);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (57, '168 Cambridge Parkway', '285-777-8462', 'Jorry', 'jraiker1k@over-blog.com', 640);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (58, '3938 Delaware Street', '384-517-3714', 'Jasun', 'jferentz1l@g.co', 571);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (59, '63 Warbler Trail', '352-444-1177', 'Barbabra', 'btethcote1m@google.ru', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (60, '22 Dennis Lane', '302-846-0511', 'Ruthann', 'rcrammy1n@symantec.com', 696);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (61, '2 Vahlen Center', '382-852-4992', 'Timothee', 'tcottel1o@sohu.com', 692);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (62, '3777 Corscot Drive', '935-284-0470', 'Gloriane', 'gvials1p@tiny.cc', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (63, '13929 Menomonie Center', '439-930-2993', 'Noelyn', 'njosifovitz1q@senate.gov', 670);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (64, '0182 New Castle Place', '232-862-2964', 'Marcile', 'mhuyhton1r@uiuc.edu', 579);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (65, '896 Vera Parkway', '815-250-8455', 'Shaine', 'smccard1s@cpanel.net', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (66, '03577 Haas Trail', '296-702-9781', 'Kore', 'kglassford1t@soundcloud.com', 651);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (67, '8682 Cascade Street', '604-115-0956', 'Adelbert', 'atrenholm1u@scribd.com', 604);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (68, '8780 Butterfield Lane', '612-381-9548', 'Fraze', 'fgrieves1v@umich.edu', 638);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (69, '07 Eagan Way', '237-724-0860', 'Hettie', 'hgrindle1w@livejournal.com', 696);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (70, '84 Badeau Road', '282-837-4024', 'Jackie', 'jjury1x@globo.com', 674);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (71, '48936 Hanover Crossing', '650-245-2832', 'Kaile', 'kvamplew1y@amazon.co.uk', 590);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (72, '055 Tennessee Lane', '166-483-1168', 'Lotta', 'lcomino1z@auda.org.au', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (73, '11 Glendale Hill', '120-313-2102', 'Merralee', 'mvaun20@stumbleupon.com', 625);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (74, '9 Lighthouse Bay Way', '768-322-3786', 'Bard', 'bgittus21@hostgator.com', 664);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (75, '08870 Menomonie Court', '584-104-2820', 'Bibbie', 'bneve22@gravatar.com', 679);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (76, '3 Scoville Center', '198-747-5798', 'Juditha', 'jison23@japanpost.jp', 667);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (77, '8 Debra Point', '855-455-4818', 'Annalise', 'afrean24@tripadvisor.com', 623);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (78, '9092 Sachtjen Avenue', '643-683-5680', 'Winfield', 'wspinnace25@weather.com', 614);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (79, '50 Elmside Park', '329-403-8705', 'Norbie', 'nmcconnal26@reference.com', 627);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (80, '40 Fisk Place', '218-185-1852', 'Lee', 'lelgar27@state.gov', 597);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (81, '03237 Granby Road', '771-372-7063', 'Cornelius', 'cbrimicombe28@ebay.co.uk', 639);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (82, '62401 6th Plaza', '626-912-0021', 'Doralynn', 'dtyson29@uiuc.edu', 668);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (83, '96 Ronald Regan Crossing', '884-946-8501', 'Stern', 'ssparkes2a@opensource.org', 608);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (84, '72747 Larry Drive', '262-817-9196', 'Bordy', 'bbowbrick2b@mtv.com', 586);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (85, '5 Laurel Street', '710-108-2109', 'Devinne', 'dvandevelde2c@ebay.co.uk', 667);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (86, '29 Merchant Street', '619-732-9382', 'Broderick', 'bculver2d@msu.edu', 620);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (87, '8128 Packers Center', '371-505-4096', 'Devi', 'dbanham2e@t.co', 678);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (88, '4 Troy Court', '372-124-7693', 'Persis', 'pbirley2f@pen.io', 647);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (89, '434 Anniversary Circle', '912-983-5445', 'Flynn', 'ffontelles2g@comsenz.com', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (90, '7 Randy Drive', '530-907-3056', 'Elysia', 'eriping2h@t-online.de', 660);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (91, '7 Starling Terrace', '276-782-0098', 'Zsazsa', 'zpenvarden2i@mediafire.com', 605);
commit;
prompt 400 records loaded
prompt Loading ACTIN...
insert into ACTIN (teid, evid)
values (2, 38);
insert into ACTIN (teid, evid)
values (3, 163);
insert into ACTIN (teid, evid)
values (3, 389);
insert into ACTIN (teid, evid)
values (4, 69);
insert into ACTIN (teid, evid)
values (4, 295);
insert into ACTIN (teid, evid)
values (4, 446);
insert into ACTIN (teid, evid)
values (4, 605);
insert into ACTIN (teid, evid)
values (4, 639);
insert into ACTIN (teid, evid)
values (4, 713);
insert into ACTIN (teid, evid)
values (4, 881);
insert into ACTIN (teid, evid)
values (5, 117);
insert into ACTIN (teid, evid)
values (5, 639);
insert into ACTIN (teid, evid)
values (6, 574);
insert into ACTIN (teid, evid)
values (6, 680);
insert into ACTIN (teid, evid)
values (7, 174);
insert into ACTIN (teid, evid)
values (7, 304);
insert into ACTIN (teid, evid)
values (9, 795);
insert into ACTIN (teid, evid)
values (10, 436);
insert into ACTIN (teid, evid)
values (10, 450);
insert into ACTIN (teid, evid)
values (10, 452);
insert into ACTIN (teid, evid)
values (11, 366);
insert into ACTIN (teid, evid)
values (11, 554);
insert into ACTIN (teid, evid)
values (12, 452);
insert into ACTIN (teid, evid)
values (12, 816);
insert into ACTIN (teid, evid)
values (13, 485);
insert into ACTIN (teid, evid)
values (13, 554);
insert into ACTIN (teid, evid)
values (14, 249);
insert into ACTIN (teid, evid)
values (14, 495);
insert into ACTIN (teid, evid)
values (14, 732);
insert into ACTIN (teid, evid)
values (15, 351);
insert into ACTIN (teid, evid)
values (15, 735);
insert into ACTIN (teid, evid)
values (16, 555);
insert into ACTIN (teid, evid)
values (17, 596);
insert into ACTIN (teid, evid)
values (17, 618);
insert into ACTIN (teid, evid)
values (17, 619);
insert into ACTIN (teid, evid)
values (18, 518);
insert into ACTIN (teid, evid)
values (18, 977);
insert into ACTIN (teid, evid)
values (19, 174);
insert into ACTIN (teid, evid)
values (19, 923);
insert into ACTIN (teid, evid)
values (19, 941);
insert into ACTIN (teid, evid)
values (19, 953);
insert into ACTIN (teid, evid)
values (20, 90);
insert into ACTIN (teid, evid)
values (20, 149);
insert into ACTIN (teid, evid)
values (20, 830);
insert into ACTIN (teid, evid)
values (20, 853);
insert into ACTIN (teid, evid)
values (20, 881);
insert into ACTIN (teid, evid)
values (21, 63);
insert into ACTIN (teid, evid)
values (21, 164);
insert into ACTIN (teid, evid)
values (21, 248);
insert into ACTIN (teid, evid)
values (21, 420);
insert into ACTIN (teid, evid)
values (21, 978);
insert into ACTIN (teid, evid)
values (23, 816);
insert into ACTIN (teid, evid)
values (23, 941);
insert into ACTIN (teid, evid)
values (24, 335);
insert into ACTIN (teid, evid)
values (24, 418);
insert into ACTIN (teid, evid)
values (25, 691);
insert into ACTIN (teid, evid)
values (25, 806);
insert into ACTIN (teid, evid)
values (26, 81);
insert into ACTIN (teid, evid)
values (26, 161);
insert into ACTIN (teid, evid)
values (26, 163);
insert into ACTIN (teid, evid)
values (26, 485);
insert into ACTIN (teid, evid)
values (26, 516);
insert into ACTIN (teid, evid)
values (26, 730);
insert into ACTIN (teid, evid)
values (26, 934);
insert into ACTIN (teid, evid)
values (26, 946);
insert into ACTIN (teid, evid)
values (27, 316);
insert into ACTIN (teid, evid)
values (27, 591);
insert into ACTIN (teid, evid)
values (28, 39);
insert into ACTIN (teid, evid)
values (28, 152);
insert into ACTIN (teid, evid)
values (28, 163);
insert into ACTIN (teid, evid)
values (28, 562);
insert into ACTIN (teid, evid)
values (28, 931);
insert into ACTIN (teid, evid)
values (29, 654);
insert into ACTIN (teid, evid)
values (29, 853);
insert into ACTIN (teid, evid)
values (30, 609);
insert into ACTIN (teid, evid)
values (30, 677);
insert into ACTIN (teid, evid)
values (32, 308);
insert into ACTIN (teid, evid)
values (32, 496);
insert into ACTIN (teid, evid)
values (32, 677);
insert into ACTIN (teid, evid)
values (32, 853);
insert into ACTIN (teid, evid)
values (33, 375);
insert into ACTIN (teid, evid)
values (33, 414);
insert into ACTIN (teid, evid)
values (33, 754);
insert into ACTIN (teid, evid)
values (33, 980);
insert into ACTIN (teid, evid)
values (35, 385);
insert into ACTIN (teid, evid)
values (37, 294);
insert into ACTIN (teid, evid)
values (38, 116);
insert into ACTIN (teid, evid)
values (38, 229);
insert into ACTIN (teid, evid)
values (39, 152);
insert into ACTIN (teid, evid)
values (39, 693);
insert into ACTIN (teid, evid)
values (40, 269);
insert into ACTIN (teid, evid)
values (40, 448);
insert into ACTIN (teid, evid)
values (40, 843);
insert into ACTIN (teid, evid)
values (41, 643);
insert into ACTIN (teid, evid)
values (42, 216);
insert into ACTIN (teid, evid)
values (42, 279);
insert into ACTIN (teid, evid)
values (42, 450);
insert into ACTIN (teid, evid)
values (42, 462);
insert into ACTIN (teid, evid)
values (43, 266);
insert into ACTIN (teid, evid)
values (43, 401);
commit;
prompt 100 records committed...
insert into ACTIN (teid, evid)
values (43, 439);
insert into ACTIN (teid, evid)
values (43, 693);
insert into ACTIN (teid, evid)
values (43, 765);
insert into ACTIN (teid, evid)
values (44, 54);
insert into ACTIN (teid, evid)
values (44, 462);
insert into ACTIN (teid, evid)
values (45, 605);
insert into ACTIN (teid, evid)
values (45, 832);
insert into ACTIN (teid, evid)
values (46, 96);
insert into ACTIN (teid, evid)
values (46, 545);
insert into ACTIN (teid, evid)
values (47, 117);
insert into ACTIN (teid, evid)
values (47, 167);
insert into ACTIN (teid, evid)
values (47, 678);
insert into ACTIN (teid, evid)
values (47, 741);
insert into ACTIN (teid, evid)
values (47, 787);
insert into ACTIN (teid, evid)
values (48, 272);
insert into ACTIN (teid, evid)
values (48, 661);
insert into ACTIN (teid, evid)
values (49, 292);
insert into ACTIN (teid, evid)
values (50, 67);
insert into ACTIN (teid, evid)
values (51, 541);
insert into ACTIN (teid, evid)
values (52, 631);
insert into ACTIN (teid, evid)
values (52, 792);
insert into ACTIN (teid, evid)
values (54, 207);
insert into ACTIN (teid, evid)
values (54, 433);
insert into ACTIN (teid, evid)
values (54, 741);
insert into ACTIN (teid, evid)
values (54, 821);
insert into ACTIN (teid, evid)
values (54, 844);
insert into ACTIN (teid, evid)
values (55, 558);
insert into ACTIN (teid, evid)
values (56, 454);
insert into ACTIN (teid, evid)
values (57, 975);
insert into ACTIN (teid, evid)
values (58, 321);
insert into ACTIN (teid, evid)
values (59, 652);
insert into ACTIN (teid, evid)
values (59, 862);
insert into ACTIN (teid, evid)
values (61, 992);
insert into ACTIN (teid, evid)
values (62, 378);
insert into ACTIN (teid, evid)
values (62, 530);
insert into ACTIN (teid, evid)
values (63, 450);
insert into ACTIN (teid, evid)
values (64, 294);
insert into ACTIN (teid, evid)
values (65, 602);
insert into ACTIN (teid, evid)
values (67, 39);
insert into ACTIN (teid, evid)
values (67, 42);
insert into ACTIN (teid, evid)
values (67, 79);
insert into ACTIN (teid, evid)
values (67, 639);
insert into ACTIN (teid, evid)
values (68, 581);
insert into ACTIN (teid, evid)
values (69, 478);
insert into ACTIN (teid, evid)
values (69, 985);
insert into ACTIN (teid, evid)
values (70, 67);
insert into ACTIN (teid, evid)
values (70, 172);
insert into ACTIN (teid, evid)
values (70, 759);
insert into ACTIN (teid, evid)
values (71, 591);
insert into ACTIN (teid, evid)
values (71, 770);
insert into ACTIN (teid, evid)
values (71, 959);
insert into ACTIN (teid, evid)
values (72, 558);
insert into ACTIN (teid, evid)
values (72, 601);
insert into ACTIN (teid, evid)
values (72, 695);
insert into ACTIN (teid, evid)
values (73, 935);
insert into ACTIN (teid, evid)
values (73, 975);
insert into ACTIN (teid, evid)
values (74, 596);
insert into ACTIN (teid, evid)
values (78, 62);
insert into ACTIN (teid, evid)
values (80, 634);
insert into ACTIN (teid, evid)
values (80, 733);
insert into ACTIN (teid, evid)
values (80, 736);
insert into ACTIN (teid, evid)
values (81, 294);
insert into ACTIN (teid, evid)
values (82, 414);
insert into ACTIN (teid, evid)
values (82, 978);
insert into ACTIN (teid, evid)
values (83, 38);
insert into ACTIN (teid, evid)
values (83, 756);
insert into ACTIN (teid, evid)
values (84, 678);
insert into ACTIN (teid, evid)
values (87, 155);
insert into ACTIN (teid, evid)
values (87, 435);
insert into ACTIN (teid, evid)
values (87, 516);
insert into ACTIN (teid, evid)
values (88, 654);
insert into ACTIN (teid, evid)
values (88, 787);
insert into ACTIN (teid, evid)
values (89, 274);
insert into ACTIN (teid, evid)
values (92, 39);
insert into ACTIN (teid, evid)
values (92, 489);
insert into ACTIN (teid, evid)
values (93, 266);
insert into ACTIN (teid, evid)
values (93, 577);
insert into ACTIN (teid, evid)
values (93, 876);
insert into ACTIN (teid, evid)
values (94, 39);
insert into ACTIN (teid, evid)
values (94, 140);
insert into ACTIN (teid, evid)
values (94, 179);
insert into ACTIN (teid, evid)
values (94, 782);
insert into ACTIN (teid, evid)
values (95, 541);
insert into ACTIN (teid, evid)
values (95, 821);
insert into ACTIN (teid, evid)
values (95, 926);
insert into ACTIN (teid, evid)
values (96, 219);
insert into ACTIN (teid, evid)
values (96, 832);
insert into ACTIN (teid, evid)
values (97, 77);
insert into ACTIN (teid, evid)
values (97, 507);
insert into ACTIN (teid, evid)
values (97, 905);
insert into ACTIN (teid, evid)
values (98, 639);
insert into ACTIN (teid, evid)
values (98, 821);
insert into ACTIN (teid, evid)
values (99, 512);
insert into ACTIN (teid, evid)
values (100, 584);
insert into ACTIN (teid, evid)
values (101, 499);
insert into ACTIN (teid, evid)
values (101, 643);
insert into ACTIN (teid, evid)
values (102, 219);
insert into ACTIN (teid, evid)
values (102, 558);
insert into ACTIN (teid, evid)
values (102, 935);
insert into ACTIN (teid, evid)
values (103, 750);
commit;
prompt 200 records committed...
insert into ACTIN (teid, evid)
values (103, 935);
insert into ACTIN (teid, evid)
values (104, 453);
insert into ACTIN (teid, evid)
values (105, 319);
insert into ACTIN (teid, evid)
values (106, 81);
insert into ACTIN (teid, evid)
values (107, 955);
insert into ACTIN (teid, evid)
values (108, 116);
insert into ACTIN (teid, evid)
values (108, 304);
insert into ACTIN (teid, evid)
values (108, 959);
insert into ACTIN (teid, evid)
values (109, 55);
insert into ACTIN (teid, evid)
values (109, 590);
insert into ACTIN (teid, evid)
values (109, 605);
insert into ACTIN (teid, evid)
values (110, 584);
insert into ACTIN (teid, evid)
values (110, 792);
insert into ACTIN (teid, evid)
values (111, 97);
insert into ACTIN (teid, evid)
values (111, 507);
insert into ACTIN (teid, evid)
values (112, 265);
insert into ACTIN (teid, evid)
values (112, 978);
insert into ACTIN (teid, evid)
values (113, 48);
insert into ACTIN (teid, evid)
values (113, 59);
insert into ACTIN (teid, evid)
values (113, 208);
insert into ACTIN (teid, evid)
values (113, 372);
insert into ACTIN (teid, evid)
values (114, 269);
insert into ACTIN (teid, evid)
values (115, 294);
insert into ACTIN (teid, evid)
values (115, 756);
insert into ACTIN (teid, evid)
values (115, 977);
insert into ACTIN (teid, evid)
values (116, 577);
insert into ACTIN (teid, evid)
values (116, 732);
insert into ACTIN (teid, evid)
values (117, 562);
insert into ACTIN (teid, evid)
values (118, 96);
insert into ACTIN (teid, evid)
values (118, 357);
insert into ACTIN (teid, evid)
values (118, 451);
insert into ACTIN (teid, evid)
values (118, 530);
insert into ACTIN (teid, evid)
values (119, 517);
insert into ACTIN (teid, evid)
values (119, 609);
insert into ACTIN (teid, evid)
values (119, 844);
insert into ACTIN (teid, evid)
values (120, 610);
insert into ACTIN (teid, evid)
values (121, 174);
insert into ACTIN (teid, evid)
values (121, 378);
insert into ACTIN (teid, evid)
values (121, 982);
insert into ACTIN (teid, evid)
values (122, 90);
insert into ACTIN (teid, evid)
values (122, 119);
insert into ACTIN (teid, evid)
values (122, 601);
insert into ACTIN (teid, evid)
values (123, 736);
insert into ACTIN (teid, evid)
values (125, 152);
insert into ACTIN (teid, evid)
values (125, 520);
insert into ACTIN (teid, evid)
values (125, 547);
insert into ACTIN (teid, evid)
values (128, 248);
insert into ACTIN (teid, evid)
values (128, 496);
insert into ACTIN (teid, evid)
values (128, 574);
insert into ACTIN (teid, evid)
values (129, 433);
insert into ACTIN (teid, evid)
values (129, 507);
insert into ACTIN (teid, evid)
values (130, 38);
insert into ACTIN (teid, evid)
values (130, 806);
insert into ACTIN (teid, evid)
values (131, 294);
insert into ACTIN (teid, evid)
values (132, 81);
insert into ACTIN (teid, evid)
values (132, 308);
insert into ACTIN (teid, evid)
values (132, 399);
insert into ACTIN (teid, evid)
values (132, 472);
insert into ACTIN (teid, evid)
values (132, 657);
insert into ACTIN (teid, evid)
values (132, 946);
insert into ACTIN (teid, evid)
values (134, 318);
insert into ACTIN (teid, evid)
values (134, 499);
insert into ACTIN (teid, evid)
values (135, 207);
insert into ACTIN (teid, evid)
values (136, 265);
insert into ACTIN (teid, evid)
values (136, 462);
insert into ACTIN (teid, evid)
values (137, 619);
insert into ACTIN (teid, evid)
values (137, 643);
insert into ACTIN (teid, evid)
values (137, 670);
insert into ACTIN (teid, evid)
values (137, 982);
insert into ACTIN (teid, evid)
values (139, 400);
insert into ACTIN (teid, evid)
values (139, 777);
insert into ACTIN (teid, evid)
values (140, 602);
insert into ACTIN (teid, evid)
values (140, 832);
insert into ACTIN (teid, evid)
values (141, 930);
insert into ACTIN (teid, evid)
values (143, 89);
insert into ACTIN (teid, evid)
values (144, 622);
insert into ACTIN (teid, evid)
values (144, 652);
insert into ACTIN (teid, evid)
values (145, 472);
insert into ACTIN (teid, evid)
values (145, 986);
insert into ACTIN (teid, evid)
values (146, 219);
insert into ACTIN (teid, evid)
values (146, 644);
insert into ACTIN (teid, evid)
values (146, 669);
insert into ACTIN (teid, evid)
values (147, 63);
insert into ACTIN (teid, evid)
values (147, 957);
insert into ACTIN (teid, evid)
values (148, 693);
insert into ACTIN (teid, evid)
values (149, 61);
insert into ACTIN (teid, evid)
values (149, 399);
insert into ACTIN (teid, evid)
values (150, 256);
insert into ACTIN (teid, evid)
values (150, 560);
insert into ACTIN (teid, evid)
values (152, 741);
insert into ACTIN (teid, evid)
values (152, 995);
insert into ACTIN (teid, evid)
values (153, 247);
insert into ACTIN (teid, evid)
values (153, 605);
insert into ACTIN (teid, evid)
values (153, 678);
insert into ACTIN (teid, evid)
values (153, 770);
insert into ACTIN (teid, evid)
values (153, 947);
insert into ACTIN (teid, evid)
values (154, 163);
insert into ACTIN (teid, evid)
values (155, 79);
insert into ACTIN (teid, evid)
values (156, 321);
insert into ACTIN (teid, evid)
values (156, 703);
commit;
prompt 300 records committed...
insert into ACTIN (teid, evid)
values (156, 968);
insert into ACTIN (teid, evid)
values (157, 399);
insert into ACTIN (teid, evid)
values (158, 771);
insert into ACTIN (teid, evid)
values (160, 229);
insert into ACTIN (teid, evid)
values (161, 401);
insert into ACTIN (teid, evid)
values (161, 516);
insert into ACTIN (teid, evid)
values (161, 631);
insert into ACTIN (teid, evid)
values (161, 959);
insert into ACTIN (teid, evid)
values (161, 988);
insert into ACTIN (teid, evid)
values (162, 316);
insert into ACTIN (teid, evid)
values (163, 489);
insert into ACTIN (teid, evid)
values (164, 77);
insert into ACTIN (teid, evid)
values (164, 445);
insert into ACTIN (teid, evid)
values (164, 581);
insert into ACTIN (teid, evid)
values (165, 124);
insert into ACTIN (teid, evid)
values (165, 221);
insert into ACTIN (teid, evid)
values (165, 545);
insert into ACTIN (teid, evid)
values (166, 316);
insert into ACTIN (teid, evid)
values (166, 751);
insert into ACTIN (teid, evid)
values (166, 877);
insert into ACTIN (teid, evid)
values (166, 946);
insert into ACTIN (teid, evid)
values (167, 52);
insert into ACTIN (teid, evid)
values (167, 678);
insert into ACTIN (teid, evid)
values (168, 772);
insert into ACTIN (teid, evid)
values (168, 923);
insert into ACTIN (teid, evid)
values (169, 358);
insert into ACTIN (teid, evid)
values (169, 446);
insert into ACTIN (teid, evid)
values (169, 549);
insert into ACTIN (teid, evid)
values (170, 149);
insert into ACTIN (teid, evid)
values (170, 759);
insert into ACTIN (teid, evid)
values (170, 773);
insert into ACTIN (teid, evid)
values (170, 832);
insert into ACTIN (teid, evid)
values (170, 855);
insert into ACTIN (teid, evid)
values (171, 805);
insert into ACTIN (teid, evid)
values (171, 986);
insert into ACTIN (teid, evid)
values (174, 219);
insert into ACTIN (teid, evid)
values (174, 691);
insert into ACTIN (teid, evid)
values (174, 879);
insert into ACTIN (teid, evid)
values (174, 934);
insert into ACTIN (teid, evid)
values (175, 759);
insert into ACTIN (teid, evid)
values (175, 778);
insert into ACTIN (teid, evid)
values (175, 980);
insert into ACTIN (teid, evid)
values (176, 318);
insert into ACTIN (teid, evid)
values (176, 378);
insert into ACTIN (teid, evid)
values (178, 703);
insert into ACTIN (teid, evid)
values (179, 816);
insert into ACTIN (teid, evid)
values (179, 947);
insert into ACTIN (teid, evid)
values (180, 208);
insert into ACTIN (teid, evid)
values (181, 571);
insert into ACTIN (teid, evid)
values (182, 445);
insert into ACTIN (teid, evid)
values (182, 845);
insert into ACTIN (teid, evid)
values (184, 995);
insert into ACTIN (teid, evid)
values (185, 398);
insert into ACTIN (teid, evid)
values (185, 442);
insert into ACTIN (teid, evid)
values (186, 61);
insert into ACTIN (teid, evid)
values (186, 179);
insert into ACTIN (teid, evid)
values (186, 398);
insert into ACTIN (teid, evid)
values (186, 489);
insert into ACTIN (teid, evid)
values (187, 134);
insert into ACTIN (teid, evid)
values (187, 221);
insert into ACTIN (teid, evid)
values (187, 562);
insert into ACTIN (teid, evid)
values (188, 495);
insert into ACTIN (teid, evid)
values (188, 983);
insert into ACTIN (teid, evid)
values (189, 124);
insert into ACTIN (teid, evid)
values (189, 820);
insert into ACTIN (teid, evid)
values (190, 165);
insert into ACTIN (teid, evid)
values (190, 316);
insert into ACTIN (teid, evid)
values (190, 576);
insert into ACTIN (teid, evid)
values (190, 795);
insert into ACTIN (teid, evid)
values (190, 977);
insert into ACTIN (teid, evid)
values (191, 554);
insert into ACTIN (teid, evid)
values (191, 670);
insert into ACTIN (teid, evid)
values (192, 304);
insert into ACTIN (teid, evid)
values (192, 446);
insert into ACTIN (teid, evid)
values (192, 778);
insert into ACTIN (teid, evid)
values (192, 941);
insert into ACTIN (teid, evid)
values (193, 478);
insert into ACTIN (teid, evid)
values (194, 249);
insert into ACTIN (teid, evid)
values (195, 56);
insert into ACTIN (teid, evid)
values (195, 64);
insert into ACTIN (teid, evid)
values (196, 167);
insert into ACTIN (teid, evid)
values (196, 269);
insert into ACTIN (teid, evid)
values (196, 994);
insert into ACTIN (teid, evid)
values (197, 391);
insert into ACTIN (teid, evid)
values (198, 266);
insert into ACTIN (teid, evid)
values (198, 391);
insert into ACTIN (teid, evid)
values (198, 988);
insert into ACTIN (teid, evid)
values (199, 77);
insert into ACTIN (teid, evid)
values (199, 125);
insert into ACTIN (teid, evid)
values (200, 380);
insert into ACTIN (teid, evid)
values (201, 565);
insert into ACTIN (teid, evid)
values (202, 119);
insert into ACTIN (teid, evid)
values (202, 272);
insert into ACTIN (teid, evid)
values (204, 946);
insert into ACTIN (teid, evid)
values (204, 959);
insert into ACTIN (teid, evid)
values (205, 507);
insert into ACTIN (teid, evid)
values (205, 654);
insert into ACTIN (teid, evid)
values (206, 472);
insert into ACTIN (teid, evid)
values (206, 558);
insert into ACTIN (teid, evid)
values (206, 934);
commit;
prompt 400 records committed...
insert into ACTIN (teid, evid)
values (206, 995);
insert into ACTIN (teid, evid)
values (207, 467);
insert into ACTIN (teid, evid)
values (207, 547);
insert into ACTIN (teid, evid)
values (208, 432);
insert into ACTIN (teid, evid)
values (208, 703);
insert into ACTIN (teid, evid)
values (209, 372);
insert into ACTIN (teid, evid)
values (210, 249);
insert into ACTIN (teid, evid)
values (211, 69);
insert into ACTIN (teid, evid)
values (211, 124);
insert into ACTIN (teid, evid)
values (213, 164);
insert into ACTIN (teid, evid)
values (213, 182);
insert into ACTIN (teid, evid)
values (213, 467);
insert into ACTIN (teid, evid)
values (214, 189);
insert into ACTIN (teid, evid)
values (214, 697);
insert into ACTIN (teid, evid)
values (214, 780);
insert into ACTIN (teid, evid)
values (215, 445);
insert into ACTIN (teid, evid)
values (216, 36);
insert into ACTIN (teid, evid)
values (218, 327);
insert into ACTIN (teid, evid)
values (218, 745);
insert into ACTIN (teid, evid)
values (218, 775);
insert into ACTIN (teid, evid)
values (219, 512);
insert into ACTIN (teid, evid)
values (220, 163);
insert into ACTIN (teid, evid)
values (220, 554);
insert into ACTIN (teid, evid)
values (221, 544);
insert into ACTIN (teid, evid)
values (221, 806);
insert into ACTIN (teid, evid)
values (221, 968);
insert into ACTIN (teid, evid)
values (222, 981);
insert into ACTIN (teid, evid)
values (223, 452);
insert into ACTIN (teid, evid)
values (223, 795);
insert into ACTIN (teid, evid)
values (223, 823);
insert into ACTIN (teid, evid)
values (224, 318);
insert into ACTIN (teid, evid)
values (224, 450);
insert into ACTIN (teid, evid)
values (224, 467);
insert into ACTIN (teid, evid)
values (224, 742);
insert into ACTIN (teid, evid)
values (225, 372);
insert into ACTIN (teid, evid)
values (225, 797);
insert into ACTIN (teid, evid)
values (225, 821);
insert into ACTIN (teid, evid)
values (226, 97);
insert into ACTIN (teid, evid)
values (226, 223);
insert into ACTIN (teid, evid)
values (226, 489);
insert into ACTIN (teid, evid)
values (226, 520);
insert into ACTIN (teid, evid)
values (226, 780);
insert into ACTIN (teid, evid)
values (227, 745);
insert into ACTIN (teid, evid)
values (227, 772);
insert into ACTIN (teid, evid)
values (229, 95);
insert into ACTIN (teid, evid)
values (229, 797);
insert into ACTIN (teid, evid)
values (230, 185);
insert into ACTIN (teid, evid)
values (230, 750);
insert into ACTIN (teid, evid)
values (230, 756);
insert into ACTIN (teid, evid)
values (230, 862);
insert into ACTIN (teid, evid)
values (231, 456);
insert into ACTIN (teid, evid)
values (231, 590);
insert into ACTIN (teid, evid)
values (231, 953);
insert into ACTIN (teid, evid)
values (232, 485);
insert into ACTIN (teid, evid)
values (233, 89);
insert into ACTIN (teid, evid)
values (233, 240);
insert into ACTIN (teid, evid)
values (234, 48);
insert into ACTIN (teid, evid)
values (235, 149);
insert into ACTIN (teid, evid)
values (235, 264);
insert into ACTIN (teid, evid)
values (235, 351);
insert into ACTIN (teid, evid)
values (236, 81);
insert into ACTIN (teid, evid)
values (236, 391);
insert into ACTIN (teid, evid)
values (236, 482);
insert into ACTIN (teid, evid)
values (236, 486);
insert into ACTIN (teid, evid)
values (237, 485);
insert into ACTIN (teid, evid)
values (237, 596);
insert into ACTIN (teid, evid)
values (237, 685);
insert into ACTIN (teid, evid)
values (237, 720);
insert into ACTIN (teid, evid)
values (237, 735);
insert into ACTIN (teid, evid)
values (238, 391);
insert into ACTIN (teid, evid)
values (238, 445);
insert into ACTIN (teid, evid)
values (238, 607);
insert into ACTIN (teid, evid)
values (240, 62);
insert into ACTIN (teid, evid)
values (240, 119);
insert into ACTIN (teid, evid)
values (240, 647);
insert into ACTIN (teid, evid)
values (242, 442);
insert into ACTIN (teid, evid)
values (242, 935);
insert into ACTIN (teid, evid)
values (243, 351);
insert into ACTIN (teid, evid)
values (244, 208);
insert into ACTIN (teid, evid)
values (245, 129);
insert into ACTIN (teid, evid)
values (245, 452);
insert into ACTIN (teid, evid)
values (246, 116);
insert into ACTIN (teid, evid)
values (247, 248);
insert into ACTIN (teid, evid)
values (247, 496);
insert into ACTIN (teid, evid)
values (248, 109);
insert into ACTIN (teid, evid)
values (248, 269);
insert into ACTIN (teid, evid)
values (248, 522);
insert into ACTIN (teid, evid)
values (248, 643);
insert into ACTIN (teid, evid)
values (248, 771);
insert into ACTIN (teid, evid)
values (248, 778);
insert into ACTIN (teid, evid)
values (248, 959);
insert into ACTIN (teid, evid)
values (249, 400);
insert into ACTIN (teid, evid)
values (250, 772);
insert into ACTIN (teid, evid)
values (250, 946);
insert into ACTIN (teid, evid)
values (251, 652);
insert into ACTIN (teid, evid)
values (252, 824);
insert into ACTIN (teid, evid)
values (253, 269);
insert into ACTIN (teid, evid)
values (253, 327);
insert into ACTIN (teid, evid)
values (253, 453);
insert into ACTIN (teid, evid)
values (253, 530);
commit;
prompt 500 records committed...
insert into ACTIN (teid, evid)
values (253, 594);
insert into ACTIN (teid, evid)
values (253, 770);
insert into ACTIN (teid, evid)
values (253, 782);
insert into ACTIN (teid, evid)
values (253, 905);
insert into ACTIN (teid, evid)
values (254, 335);
insert into ACTIN (teid, evid)
values (255, 321);
insert into ACTIN (teid, evid)
values (256, 274);
insert into ACTIN (teid, evid)
values (257, 39);
insert into ACTIN (teid, evid)
values (257, 495);
insert into ACTIN (teid, evid)
values (257, 691);
insert into ACTIN (teid, evid)
values (257, 775);
insert into ACTIN (teid, evid)
values (257, 784);
insert into ACTIN (teid, evid)
values (258, 265);
insert into ACTIN (teid, evid)
values (259, 124);
insert into ACTIN (teid, evid)
values (259, 375);
insert into ACTIN (teid, evid)
values (259, 690);
insert into ACTIN (teid, evid)
values (260, 380);
insert into ACTIN (teid, evid)
values (260, 454);
insert into ACTIN (teid, evid)
values (260, 577);
insert into ACTIN (teid, evid)
values (261, 114);
insert into ACTIN (teid, evid)
values (261, 832);
insert into ACTIN (teid, evid)
values (261, 983);
insert into ACTIN (teid, evid)
values (262, 820);
insert into ACTIN (teid, evid)
values (264, 482);
insert into ACTIN (teid, evid)
values (264, 506);
insert into ACTIN (teid, evid)
values (264, 519);
insert into ACTIN (teid, evid)
values (266, 78);
insert into ACTIN (teid, evid)
values (266, 247);
insert into ACTIN (teid, evid)
values (266, 318);
insert into ACTIN (teid, evid)
values (266, 520);
insert into ACTIN (teid, evid)
values (266, 562);
insert into ACTIN (teid, evid)
values (267, 472);
insert into ACTIN (teid, evid)
values (267, 663);
insert into ACTIN (teid, evid)
values (267, 713);
insert into ACTIN (teid, evid)
values (268, 116);
insert into ACTIN (teid, evid)
values (268, 751);
insert into ACTIN (teid, evid)
values (268, 988);
insert into ACTIN (teid, evid)
values (269, 35);
insert into ACTIN (teid, evid)
values (269, 152);
insert into ACTIN (teid, evid)
values (269, 751);
insert into ACTIN (teid, evid)
values (269, 933);
insert into ACTIN (teid, evid)
values (270, 609);
insert into ACTIN (teid, evid)
values (270, 762);
insert into ACTIN (teid, evid)
values (270, 934);
insert into ACTIN (teid, evid)
values (271, 134);
insert into ACTIN (teid, evid)
values (271, 322);
insert into ACTIN (teid, evid)
values (271, 869);
insert into ACTIN (teid, evid)
values (272, 507);
insert into ACTIN (teid, evid)
values (273, 377);
insert into ACTIN (teid, evid)
values (274, 451);
insert into ACTIN (teid, evid)
values (274, 669);
insert into ACTIN (teid, evid)
values (275, 448);
insert into ACTIN (teid, evid)
values (275, 623);
insert into ACTIN (teid, evid)
values (276, 266);
insert into ACTIN (teid, evid)
values (276, 435);
insert into ACTIN (teid, evid)
values (276, 544);
insert into ACTIN (teid, evid)
values (278, 83);
insert into ACTIN (teid, evid)
values (278, 223);
insert into ACTIN (teid, evid)
values (278, 269);
insert into ACTIN (teid, evid)
values (278, 541);
insert into ACTIN (teid, evid)
values (278, 980);
insert into ACTIN (teid, evid)
values (279, 36);
insert into ACTIN (teid, evid)
values (280, 530);
insert into ACTIN (teid, evid)
values (281, 220);
insert into ACTIN (teid, evid)
values (281, 601);
insert into ACTIN (teid, evid)
values (283, 366);
insert into ACTIN (teid, evid)
values (283, 486);
insert into ACTIN (teid, evid)
values (283, 519);
insert into ACTIN (teid, evid)
values (283, 601);
insert into ACTIN (teid, evid)
values (284, 207);
insert into ACTIN (teid, evid)
values (284, 693);
insert into ACTIN (teid, evid)
values (285, 745);
insert into ACTIN (teid, evid)
values (285, 772);
insert into ACTIN (teid, evid)
values (286, 63);
insert into ACTIN (teid, evid)
values (286, 516);
insert into ACTIN (teid, evid)
values (286, 990);
insert into ACTIN (teid, evid)
values (287, 221);
insert into ACTIN (teid, evid)
values (288, 221);
insert into ACTIN (teid, evid)
values (290, 134);
insert into ACTIN (teid, evid)
values (290, 540);
insert into ACTIN (teid, evid)
values (290, 713);
insert into ACTIN (teid, evid)
values (292, 388);
insert into ACTIN (teid, evid)
values (292, 399);
insert into ACTIN (teid, evid)
values (293, 436);
insert into ACTIN (teid, evid)
values (294, 185);
insert into ACTIN (teid, evid)
values (296, 42);
insert into ACTIN (teid, evid)
values (297, 375);
insert into ACTIN (teid, evid)
values (298, 707);
insert into ACTIN (teid, evid)
values (299, 707);
insert into ACTIN (teid, evid)
values (299, 750);
insert into ACTIN (teid, evid)
values (300, 117);
insert into ACTIN (teid, evid)
values (300, 546);
insert into ACTIN (teid, evid)
values (301, 89);
insert into ACTIN (teid, evid)
values (302, 163);
insert into ACTIN (teid, evid)
values (302, 165);
insert into ACTIN (teid, evid)
values (302, 659);
insert into ACTIN (teid, evid)
values (303, 274);
insert into ACTIN (teid, evid)
values (303, 855);
insert into ACTIN (teid, evid)
values (304, 707);
insert into ACTIN (teid, evid)
values (304, 797);
commit;
prompt 600 records committed...
insert into ACTIN (teid, evid)
values (304, 978);
insert into ACTIN (teid, evid)
values (307, 647);
insert into ACTIN (teid, evid)
values (307, 756);
insert into ACTIN (teid, evid)
values (308, 862);
insert into ACTIN (teid, evid)
values (309, 155);
insert into ACTIN (teid, evid)
values (310, 90);
insert into ACTIN (teid, evid)
values (310, 385);
insert into ACTIN (teid, evid)
values (310, 467);
insert into ACTIN (teid, evid)
values (310, 750);
insert into ACTIN (teid, evid)
values (310, 772);
insert into ACTIN (teid, evid)
values (312, 125);
insert into ACTIN (teid, evid)
values (312, 229);
insert into ACTIN (teid, evid)
values (312, 336);
insert into ACTIN (teid, evid)
values (312, 433);
insert into ACTIN (teid, evid)
values (313, 432);
insert into ACTIN (teid, evid)
values (314, 489);
insert into ACTIN (teid, evid)
values (314, 496);
insert into ACTIN (teid, evid)
values (314, 544);
insert into ACTIN (teid, evid)
values (314, 975);
insert into ACTIN (teid, evid)
values (316, 189);
insert into ACTIN (teid, evid)
values (317, 129);
insert into ACTIN (teid, evid)
values (317, 279);
insert into ACTIN (teid, evid)
values (317, 549);
insert into ACTIN (teid, evid)
values (317, 762);
insert into ACTIN (teid, evid)
values (318, 821);
insert into ACTIN (teid, evid)
values (318, 830);
insert into ACTIN (teid, evid)
values (319, 358);
insert into ACTIN (teid, evid)
values (319, 562);
insert into ACTIN (teid, evid)
values (320, 618);
insert into ACTIN (teid, evid)
values (320, 702);
insert into ACTIN (teid, evid)
values (320, 844);
insert into ACTIN (teid, evid)
values (321, 151);
insert into ACTIN (teid, evid)
values (321, 220);
insert into ACTIN (teid, evid)
values (321, 737);
insert into ACTIN (teid, evid)
values (321, 980);
insert into ACTIN (teid, evid)
values (322, 48);
insert into ACTIN (teid, evid)
values (322, 855);
insert into ACTIN (teid, evid)
values (323, 905);
insert into ACTIN (teid, evid)
values (324, 853);
insert into ACTIN (teid, evid)
values (325, 584);
insert into ACTIN (teid, evid)
values (325, 797);
insert into ACTIN (teid, evid)
values (326, 68);
insert into ACTIN (teid, evid)
values (326, 986);
insert into ACTIN (teid, evid)
values (327, 95);
insert into ACTIN (teid, evid)
values (327, 247);
insert into ACTIN (teid, evid)
values (327, 605);
insert into ACTIN (teid, evid)
values (328, 219);
insert into ACTIN (teid, evid)
values (328, 733);
insert into ACTIN (teid, evid)
values (328, 968);
insert into ACTIN (teid, evid)
values (329, 116);
insert into ACTIN (teid, evid)
values (329, 223);
insert into ACTIN (teid, evid)
values (329, 358);
insert into ACTIN (teid, evid)
values (330, 295);
insert into ACTIN (teid, evid)
values (330, 469);
insert into ACTIN (teid, evid)
values (330, 721);
insert into ACTIN (teid, evid)
values (332, 750);
insert into ACTIN (teid, evid)
values (333, 950);
insert into ACTIN (teid, evid)
values (333, 978);
insert into ACTIN (teid, evid)
values (334, 968);
insert into ACTIN (teid, evid)
values (335, 420);
insert into ACTIN (teid, evid)
values (335, 738);
insert into ACTIN (teid, evid)
values (336, 172);
insert into ACTIN (teid, evid)
values (337, 547);
insert into ACTIN (teid, evid)
values (338, 661);
insert into ACTIN (teid, evid)
values (338, 703);
insert into ACTIN (teid, evid)
values (340, 386);
insert into ACTIN (teid, evid)
values (340, 699);
insert into ACTIN (teid, evid)
values (340, 756);
insert into ACTIN (teid, evid)
values (341, 220);
insert into ACTIN (teid, evid)
values (341, 275);
insert into ACTIN (teid, evid)
values (341, 380);
insert into ACTIN (teid, evid)
values (341, 644);
insert into ACTIN (teid, evid)
values (341, 816);
insert into ACTIN (teid, evid)
values (341, 936);
insert into ACTIN (teid, evid)
values (342, 335);
insert into ACTIN (teid, evid)
values (343, 61);
insert into ACTIN (teid, evid)
values (343, 713);
insert into ACTIN (teid, evid)
values (343, 759);
insert into ACTIN (teid, evid)
values (344, 631);
insert into ACTIN (teid, evid)
values (344, 992);
insert into ACTIN (teid, evid)
values (345, 982);
insert into ACTIN (teid, evid)
values (346, 116);
insert into ACTIN (teid, evid)
values (347, 519);
insert into ACTIN (teid, evid)
values (347, 571);
insert into ACTIN (teid, evid)
values (348, 275);
insert into ACTIN (teid, evid)
values (348, 518);
insert into ACTIN (teid, evid)
values (348, 831);
insert into ACTIN (teid, evid)
values (349, 124);
insert into ACTIN (teid, evid)
values (349, 164);
insert into ACTIN (teid, evid)
values (349, 754);
insert into ACTIN (teid, evid)
values (350, 780);
insert into ACTIN (teid, evid)
values (350, 816);
insert into ACTIN (teid, evid)
values (351, 602);
insert into ACTIN (teid, evid)
values (351, 782);
insert into ACTIN (teid, evid)
values (352, 316);
insert into ACTIN (teid, evid)
values (352, 357);
insert into ACTIN (teid, evid)
values (352, 472);
insert into ACTIN (teid, evid)
values (352, 771);
insert into ACTIN (teid, evid)
values (353, 167);
insert into ACTIN (teid, evid)
values (353, 208);
commit;
prompt 700 records committed...
insert into ACTIN (teid, evid)
values (353, 594);
insert into ACTIN (teid, evid)
values (353, 639);
insert into ACTIN (teid, evid)
values (354, 54);
insert into ACTIN (teid, evid)
values (354, 78);
insert into ACTIN (teid, evid)
values (354, 777);
insert into ACTIN (teid, evid)
values (354, 821);
insert into ACTIN (teid, evid)
values (354, 975);
insert into ACTIN (teid, evid)
values (355, 707);
insert into ACTIN (teid, evid)
values (355, 741);
insert into ACTIN (teid, evid)
values (356, 179);
insert into ACTIN (teid, evid)
values (357, 517);
insert into ACTIN (teid, evid)
values (357, 525);
insert into ACTIN (teid, evid)
values (358, 773);
insert into ACTIN (teid, evid)
values (359, 442);
insert into ACTIN (teid, evid)
values (361, 221);
insert into ACTIN (teid, evid)
values (361, 707);
insert into ACTIN (teid, evid)
values (361, 721);
insert into ACTIN (teid, evid)
values (362, 163);
insert into ACTIN (teid, evid)
values (362, 208);
insert into ACTIN (teid, evid)
values (363, 617);
insert into ACTIN (teid, evid)
values (364, 574);
insert into ACTIN (teid, evid)
values (365, 336);
insert into ACTIN (teid, evid)
values (365, 844);
insert into ACTIN (teid, evid)
values (366, 36);
insert into ACTIN (teid, evid)
values (366, 202);
insert into ACTIN (teid, evid)
values (366, 216);
insert into ACTIN (teid, evid)
values (366, 366);
insert into ACTIN (teid, evid)
values (366, 545);
insert into ACTIN (teid, evid)
values (366, 784);
insert into ACTIN (teid, evid)
values (367, 828);
insert into ACTIN (teid, evid)
values (368, 256);
insert into ACTIN (teid, evid)
values (368, 435);
insert into ACTIN (teid, evid)
values (368, 797);
insert into ACTIN (teid, evid)
values (369, 555);
insert into ACTIN (teid, evid)
values (370, 713);
insert into ACTIN (teid, evid)
values (371, 59);
insert into ACTIN (teid, evid)
values (371, 316);
insert into ACTIN (teid, evid)
values (371, 445);
insert into ACTIN (teid, evid)
values (371, 634);
insert into ACTIN (teid, evid)
values (372, 456);
insert into ACTIN (teid, evid)
values (372, 610);
insert into ACTIN (teid, evid)
values (372, 832);
insert into ACTIN (teid, evid)
values (375, 773);
insert into ACTIN (teid, evid)
values (377, 339);
insert into ACTIN (teid, evid)
values (378, 401);
insert into ACTIN (teid, evid)
values (378, 485);
insert into ACTIN (teid, evid)
values (379, 402);
insert into ACTIN (teid, evid)
values (379, 697);
insert into ACTIN (teid, evid)
values (379, 950);
insert into ACTIN (teid, evid)
values (380, 821);
insert into ACTIN (teid, evid)
values (380, 931);
insert into ACTIN (teid, evid)
values (381, 94);
insert into ACTIN (teid, evid)
values (381, 207);
insert into ACTIN (teid, evid)
values (381, 507);
insert into ACTIN (teid, evid)
values (381, 517);
insert into ACTIN (teid, evid)
values (382, 525);
insert into ACTIN (teid, evid)
values (382, 541);
insert into ACTIN (teid, evid)
values (382, 869);
insert into ACTIN (teid, evid)
values (383, 652);
insert into ACTIN (teid, evid)
values (385, 442);
insert into ACTIN (teid, evid)
values (386, 414);
insert into ACTIN (teid, evid)
values (387, 56);
insert into ACTIN (teid, evid)
values (387, 185);
insert into ACTIN (teid, evid)
values (389, 484);
insert into ACTIN (teid, evid)
values (389, 754);
insert into ACTIN (teid, evid)
values (390, 109);
insert into ACTIN (teid, evid)
values (390, 607);
insert into ACTIN (teid, evid)
values (390, 730);
insert into ACTIN (teid, evid)
values (391, 164);
insert into ACTIN (teid, evid)
values (391, 442);
insert into ACTIN (teid, evid)
values (391, 699);
insert into ACTIN (teid, evid)
values (392, 83);
insert into ACTIN (teid, evid)
values (392, 584);
insert into ACTIN (teid, evid)
values (392, 832);
insert into ACTIN (teid, evid)
values (392, 981);
insert into ACTIN (teid, evid)
values (393, 547);
insert into ACTIN (teid, evid)
values (393, 677);
insert into ACTIN (teid, evid)
values (394, 63);
insert into ACTIN (teid, evid)
values (394, 96);
insert into ACTIN (teid, evid)
values (394, 256);
insert into ACTIN (teid, evid)
values (395, 375);
insert into ACTIN (teid, evid)
values (395, 454);
insert into ACTIN (teid, evid)
values (396, 591);
insert into ACTIN (teid, evid)
values (397, 617);
insert into ACTIN (teid, evid)
values (397, 618);
insert into ACTIN (teid, evid)
values (397, 876);
insert into ACTIN (teid, evid)
values (398, 269);
insert into ACTIN (teid, evid)
values (398, 318);
insert into ACTIN (teid, evid)
values (398, 385);
insert into ACTIN (teid, evid)
values (398, 617);
insert into ACTIN (teid, evid)
values (399, 380);
insert into ACTIN (teid, evid)
values (399, 467);
insert into ACTIN (teid, evid)
values (399, 472);
insert into ACTIN (teid, evid)
values (399, 742);
insert into ACTIN (teid, evid)
values (399, 805);
insert into ACTIN (teid, evid)
values (400, 96);
insert into ACTIN (teid, evid)
values (400, 462);
insert into ACTIN (teid, evid)
values (400, 824);
commit;
prompt 798 records loaded
prompt Loading CATEGORY...
insert into CATEGORY (categoryid, name, emergencylevel)
values (403, 'EEG Machines (Electroencephalogram)', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (404, 'EMG Machines (Electromyography)', 6);
insert into CATEGORY (categoryid, name, emergencylevel)
values (405, 'EKG Machines (Electrocardiogram)', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (406, 'Holter Monitors', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (407, 'Defibrillator Monitors', 9);
insert into CATEGORY (categoryid, name, emergencylevel)
values (408, 'Pacemakers', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (409, 'Pulse Oximeters (Continuous Monitoring)', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (410, 'Capnography Monitors', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (411, 'Blood Gas Analyzers', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (412, 'Coagulation Analyzers', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (413, 'Centrifuges', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (414, 'Microscopes', 4);
insert into CATEGORY (categoryid, name, emergencylevel)
values (415, 'Blood Banking Equipment', 6);
insert into CATEGORY (categoryid, name, emergencylevel)
values (416, 'Blood Warmers', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (417, 'Infusion Pumps (Large Volume)', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (418, 'Enteral Feeding Pumps', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (419, 'Patient Lifts', 4);
insert into CATEGORY (categoryid, name, emergencylevel)
values (420, 'Patient Transfer Sheets', 3);
insert into CATEGORY (categoryid, name, emergencylevel)
values (421, 'Nebulizers (Portable)', 6);
insert into CATEGORY (categoryid, name, emergencylevel)
values (422, 'Peak Flow Meters', 4);
insert into CATEGORY (categoryid, name, emergencylevel)
values (423, 'Spirometers', 5);
commit;
prompt 21 records loaded
prompt Loading DONOR...
insert into DONOR (donorid, name, isactive, designation)
values (1010, 'LiamRhodes', 'n', 'Rhodes');
insert into DONOR (donorid, name, isactive, designation)
values (95, 'MarlonCharles', 'n', 'For the memory of the family -Charles');
insert into DONOR (donorid, name, isactive, designation)
values (96, 'MarleyWahlberg', 'n', 'For the memory of the family -Wahlberg');
insert into DONOR (donorid, name, isactive, designation)
values (99, 'CeliaBoyle', 'n', 'For the memory of the family -Boyle');
insert into DONOR (donorid, name, isactive, designation)
values (107, 'MekhiCobbs', 'n', 'For the memory of the family -Cobbs');
insert into DONOR (donorid, name, isactive, designation)
values (110, 'BalthazarHong', 'n', 'For the memory of the family -Hong');
insert into DONOR (donorid, name, isactive, designation)
values (117, 'RoscoLi', 'n', 'For the memory of the family -Li');
insert into DONOR (donorid, name, isactive, designation)
values (139, 'FrancesHatchet', 'y', 'For the memory of the family -Hatchet');
insert into DONOR (donorid, name, isactive, designation)
values (161, 'TaylorChandler', 'y', 'For the memory of the family -Chandler');
insert into DONOR (donorid, name, isactive, designation)
values (169, 'JohnetteMetcalf', 'n', 'For the memory of the family -Metcalf');
insert into DONOR (donorid, name, isactive, designation)
values (179, 'AzucarColtrane', 'n', 'For the memory of the family -Coltrane');
insert into DONOR (donorid, name, isactive, designation)
values (181, 'CheechEngland', 'n', 'For the memory of the family -England');
insert into DONOR (donorid, name, isactive, designation)
values (187, 'BeverleyLindo', 'n', 'For the memory of the family -Lindo');
insert into DONOR (donorid, name, isactive, designation)
values (195, 'LariGarner', 'n', 'For the memory of the family -Garner');
insert into DONOR (donorid, name, isactive, designation)
values (197, 'JimmieFonda', 'n', 'For the memory of the family -Fonda');
insert into DONOR (donorid, name, isactive, designation)
values (199, 'KevnSampson', 'y', 'For the memory of the family -Sampson');
insert into DONOR (donorid, name, isactive, designation)
values (219, 'MelJudd', 'n', 'For the memory of the family -Judd');
insert into DONOR (donorid, name, isactive, designation)
values (227, 'ToriCarlyle', 'n', 'For the memory of the family -Carlyle');
insert into DONOR (donorid, name, isactive, designation)
values (228, 'AndraeAvalon', 'y', 'For the memory of the family -Avalon');
insert into DONOR (donorid, name, isactive, designation)
values (253, 'ColmBurstyn', 'n', 'For the memory of the family -Burstyn');
insert into DONOR (donorid, name, isactive, designation)
values (262, 'CliveFender', 'n', 'For the memory of the family -Fender');
insert into DONOR (donorid, name, isactive, designation)
values (1001, 'Shlomo Y', 'n', 'For memory of Shlomo');
insert into DONOR (donorid, name, isactive, designation)
values (1002, 'Shlomo Y', 'n', 'For memory of Shlomo');
insert into DONOR (donorid, name, isactive, designation)
values (1003, 'Shlomo Y', 'n', 'For memory of Shlomo');
insert into DONOR (donorid, name, isactive, designation)
values (334, 'JohnnyLynskey', 'n', 'For the memory of the family -Lynskey');
insert into DONOR (donorid, name, isactive, designation)
values (338, 'NikkiFolds', 'y', 'For the memory of the family -Folds');
insert into DONOR (donorid, name, isactive, designation)
values (346, 'GenaConnery', 'n', 'For the memory of the family -Connery');
insert into DONOR (donorid, name, isactive, designation)
values (349, 'ElisabethMidler', 'n', 'For the memory of the family -Midler');
insert into DONOR (donorid, name, isactive, designation)
values (351, 'BonnieMoraz', 'n', 'For the memory of the family -Moraz');
insert into DONOR (donorid, name, isactive, designation)
values (355, 'RhettO''Sullivan', 'n', 'For the memory of the family -O''Sullivan');
insert into DONOR (donorid, name, isactive, designation)
values (1000, 'Aharon Moshe', 'n', 'For memory of family Moshe');
insert into DONOR (donorid, name, isactive, designation)
values (363, 'JoannaZellweger', 'n', 'For the memory of the family -Zellweger');
insert into DONOR (donorid, name, isactive, designation)
values (375, 'JefferyLiotta', 'n', 'For the memory of the family -Liotta');
insert into DONOR (donorid, name, isactive, designation)
values (377, 'DaveyBailey', 'n', 'For the memory of the family -Bailey');
insert into DONOR (donorid, name, isactive, designation)
values (54, 'CrispinRedford', 'n', 'For the memory of the family -Redford');
insert into DONOR (donorid, name, isactive, designation)
values (57, 'JeanMacDonald', 'n', 'For the memory of the family -MacDonald');
insert into DONOR (donorid, name, isactive, designation)
values (60, 'PamelaCoburn', 'n', 'For the memory of the family -Coburn');
commit;
prompt 37 records loaded
prompt Loading DONATION...
insert into DONATION (donationid, donationdate, itemid, donorid)
values (80, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (81, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (82, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (83, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (84, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (85, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (86, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (87, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (88, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (89, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (90, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (91, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (92, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (101, to_date('16-06-2024 05:20:06', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1312, to_date('14-05-2021', 'dd-mm-yyyy'), 128, 107);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1318, to_date('12-08-2019', 'dd-mm-yyyy'), 44, 355);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1340, to_date('31-10-1993', 'dd-mm-yyyy'), 61, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1349, to_date('04-03-2023', 'dd-mm-yyyy'), 127, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1355, to_date('18-06-2021', 'dd-mm-yyyy'), 95, 99);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1357, to_date('04-04-1989', 'dd-mm-yyyy'), 45, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1373, to_date('09-07-2022', 'dd-mm-yyyy'), 22, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1382, to_date('25-04-1971', 'dd-mm-yyyy'), 116, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1384, to_date('28-01-2020', 'dd-mm-yyyy'), 72, 338);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1385, to_date('23-05-2020', 'dd-mm-yyyy'), 53, 228);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1390, to_date('22-06-1970', 'dd-mm-yyyy'), 33, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1391, to_date('17-04-1999', 'dd-mm-yyyy'), 117, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1397, to_date('20-02-2021', 'dd-mm-yyyy'), 90, 96);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1398, to_date('25-11-2023', 'dd-mm-yyyy'), 30, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1006, to_date('03-09-2021', 'dd-mm-yyyy'), 104, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1008, to_date('13-08-2021', 'dd-mm-yyyy'), 45, 60);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1014, to_date('28-01-2023', 'dd-mm-yyyy'), 85, 139);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1028, to_date('28-07-2012', 'dd-mm-yyyy'), 17, 346);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1034, to_date('05-09-1996', 'dd-mm-yyyy'), 4, 349);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1044, to_date('13-06-2021', 'dd-mm-yyyy'), 68, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1052, to_date('14-02-1987', 'dd-mm-yyyy'), 128, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1053, to_date('04-01-2022', 'dd-mm-yyyy'), 115, 161);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1055, to_date('01-12-2021', 'dd-mm-yyyy'), 29, 349);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1074, to_date('16-06-2016', 'dd-mm-yyyy'), 96, 107);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1075, to_date('15-10-2020', 'dd-mm-yyyy'), 127, 110);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1079, to_date('10-06-2023', 'dd-mm-yyyy'), 42, 351);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1080, to_date('15-07-2009', 'dd-mm-yyyy'), 52, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1082, to_date('19-05-1978', 'dd-mm-yyyy'), 64, 99);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1094, to_date('18-04-1997', 'dd-mm-yyyy'), 111, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1111, to_date('30-09-2022', 'dd-mm-yyyy'), 42, 334);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1123, to_date('30-01-1974', 'dd-mm-yyyy'), 92, 253);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1127, to_date('08-02-1984', 'dd-mm-yyyy'), 45, 355);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1132, to_date('27-12-2023', 'dd-mm-yyyy'), 108, 377);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1136, to_date('10-08-2002', 'dd-mm-yyyy'), 21, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1142, to_date('29-08-1979', 'dd-mm-yyyy'), 19, 195);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1146, to_date('28-12-2019', 'dd-mm-yyyy'), 116, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1148, to_date('15-03-2004', 'dd-mm-yyyy'), 95, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1150, to_date('29-12-2019', 'dd-mm-yyyy'), 22, 187);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1151, to_date('12-03-2023', 'dd-mm-yyyy'), 113, 117);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1152, to_date('17-09-1967', 'dd-mm-yyyy'), 67, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1172, to_date('18-05-2022', 'dd-mm-yyyy'), 32, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1190, to_date('26-02-2023', 'dd-mm-yyyy'), 82, 346);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1203, to_date('12-07-2020', 'dd-mm-yyyy'), 35, 54);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1207, to_date('30-04-1966', 'dd-mm-yyyy'), 46, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1217, to_date('30-11-2019', 'dd-mm-yyyy'), 45, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1223, to_date('19-07-2019', 'dd-mm-yyyy'), 62, 375);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1234, to_date('29-08-1975', 'dd-mm-yyyy'), 82, 377);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1237, to_date('15-06-2008', 'dd-mm-yyyy'), 16, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1262, to_date('16-08-2023', 'dd-mm-yyyy'), 12, 181);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1265, to_date('30-10-1981', 'dd-mm-yyyy'), 65, 363);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1268, to_date('30-01-2023', 'dd-mm-yyyy'), 43, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1273, to_date('25-08-2023', 'dd-mm-yyyy'), 68, 195);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1274, to_date('31-08-1994', 'dd-mm-yyyy'), 67, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1280, to_date('23-06-2021', 'dd-mm-yyyy'), 85, 363);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1282, to_date('08-03-2012', 'dd-mm-yyyy'), 42, 181);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1285, to_date('20-10-2006', 'dd-mm-yyyy'), 82, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1287, to_date('19-12-1963', 'dd-mm-yyyy'), 116, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1293, to_date('06-08-2022', 'dd-mm-yyyy'), 32, 253);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1294, to_date('05-05-1996', 'dd-mm-yyyy'), 70, 95);
commit;
prompt 73 records loaded
prompt Loading EMERGENBODIES...
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Police', 890, ' 100', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Fire Department', 891, ' 101', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Emergency Medical Services (EMS)', 892, ' 102', 269, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Coast Guard', 893, ' 103', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Search and Rescue', 894, ' 104', 652, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Disaster Response Teams', 895, ' 105', 652, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Ambulance Services', 896, ' 106', 269, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Mountain Rescue', 897, ' 107', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Water Rescue', 898, ' 108', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Civil Defense', 899, ' 109', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' National Guard', 900, ' 110', 269, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Bomb Squad', 901, ' 111', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Hazardous Materials (HAZMAT) Teams', 902, ' 112', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Air Ambulance', 903, ' 113', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Wildlife Rescue', 904, ' 114', 652, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Anti-Terrorism Units', 905, ' 115', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Red Cross', 906, ' 116', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Poison Control', 907, ' 117', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Crisis Intervention Teams', 908, ' 118', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Public Health Emergency Services', 909, ' 119', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Tactical Response Unit', 976, '150', 955, '10');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Crisis Intervention Teams', 994, '129', 182, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Poison Control', 955, '204', 402, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 916, '199', 782, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Crisis Intervention Teams', 998, '171', 90, '7');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 935, '202', 540, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 956, '124', 185, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 968, '130', 781, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Coast Guard', 941, '202', 517, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('National Guard', 978, '131', 152, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Poison Control', 918, '161', 562, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Disaster Response Team', 911, '162', 90, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 995, '161', 83, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 986, '140', 321, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 983, '151', 319, '1');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Poison Control', 925, '173', 759, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 987, '144', 165, '1');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 943, '194', 94, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 974, '169', 862, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 973, '123', 40, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Coast Guard', 938, '185', 140, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Medical Services (EMS)', 940, '159', 264, '10');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 977, '184', 200, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Red Cross', 926, '156', 797, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 996, '187', 795, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 997, '135', 824, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Medical Services (EMS)', 934, '197', 936, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Tactical Response Unit', 962, '188', 230, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 953, '191', 114, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Animal Rescue Services', 915, '176', 806, '10');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 957, '135', 738, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Coast Guard', 989, '162', 980, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 970, '198', 202, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 950, '200', 879, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Animal Rescue Services', 990, '179', 52, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Tactical Response Unit', 999, '209', 126, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 972, '209', 877, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 942, '154', 375, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Volunteer Firefighters', 917, '125', 591, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 920, '192', 555, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 985, '139', 420, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 937, '148', 48, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Medical Reserve Corps (MRC)', 967, '183', 695, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Medical Reserve Corps (MRC)', 958, '188', 179, '7');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 922, '202', 496, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('National Guard', 965, '160', 754, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 947, '195', 327, '7');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('HazMat (Hazardous Materials) Team', 961, '142', 930, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 910, '162', 546, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 936, '162', 485, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 981, '144', 436, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 969, '157', 659, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 939, '144', 357, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('National Guard', 933, '204', 657, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 960, '145', 975, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 932, '148', 782, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 912, '199', 220, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Crisis Intervention Teams', 971, '147', 618, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Red Cross', 975, '159', 418, '10');
commit;
prompt 79 records loaded
prompt Loading DONERTO...
insert into DONERTO (donationdate, donationid, donorid, boid)
values (to_date('18-07-2024', 'dd-mm-yyyy'), 1, 1010, 890);
insert into DONERTO (donationdate, donationid, donorid, boid)
values (to_date('19-07-2024', 'dd-mm-yyyy'), 2, 95, 891);
insert into DONERTO (donationdate, donationid, donorid, boid)
values (to_date('20-07-2024', 'dd-mm-yyyy'), 3, 96, 892);
insert into DONERTO (donationdate, donationid, donorid, boid)
values (to_date('21-07-2024', 'dd-mm-yyyy'), 4, 99, 893);
insert into DONERTO (donationdate, donationid, donorid, boid)
values (to_date('22-07-2024', 'dd-mm-yyyy'), 5, 107, 894);
insert into DONERTO (donationdate, donationid, donorid, boid)
values (to_date('24-07-2024', 'dd-mm-yyyy'), 7, 117, 896);
insert into DONERTO (donationdate, donationid, donorid, boid)
values (to_date('26-07-2024', 'dd-mm-yyyy'), 9, 161, 898);
commit;
prompt 7 records loaded
prompt Loading EMERGENCYDRILL...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-12-2020', 'dd-mm-yyyy'), 74, 885, 'earthquake drill', 'Safed', 711, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-02-2003', 'dd-mm-yyyy'), 492, 220, 'tornado drill', 'Beit Shemesh', 53, 'Tel Aviv''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('13-04-2000', 'dd-mm-yyyy'), 147, 749, 'active shooter drill', 'Bat Yam', 59, 'Rehovot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-06-2004', 'dd-mm-yyyy'), 177, 702, 'earthquake drill', 'Tel Aviv', 317, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-03-2017', 'dd-mm-yyyy'), 647, 315, 'fire drill', 'Eilat', 959, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-02-2010', 'dd-mm-yyyy'), 738, 306, 'tornado drill', 'Dimona', 558, 'Beit Shemesh''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-02-2015', 'dd-mm-yyyy'), 248, 426, 'evacuation drill', 'Umm al-Fahm', 814, 'Hadera''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-02-2024', 'dd-mm-yyyy'), 735, 271, 'earthquake drill', 'Yavne', 984, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-09-2005', 'dd-mm-yyyy'), 540, 309, 'earthquake drill', 'Dimona', 884, '''5 Weizmann St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('27-10-2018', 'dd-mm-yyyy'), 119, 876, 'fire drill', 'Karmiel', 321, 'Be''er Sheva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-10-2016', 'dd-mm-yyyy'), 196, 737, 'earthquake drill', 'Beit Shemesh', 868, 'Modi''in''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-02-2001', 'dd-mm-yyyy'), 240, 396, 'active shooter drill', 'Qalansawe', 861, '''19 HaRav Kook St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-10-2016', 'dd-mm-yyyy'), 477, 389, 'evacuation drill', 'Karmiel', 337, 'Safed''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-11-2019', 'dd-mm-yyyy'), 900, 386, 'tornado drill', 'Nazareth', 580, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-08-2024', 'dd-mm-yyyy'), 400, 873, 'tornado drill', 'Rishon LeZion', 541, 'Yavne''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-04-2009', 'dd-mm-yyyy'), 895, 557, 'tornado drill', 'Giv''atayim', 986, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-06-2015', 'dd-mm-yyyy'), 270, 518, 'fire drill', 'Kiryat Shmona', 273, '''13 Weizmann Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-01-2016', 'dd-mm-yyyy'), 846, 366, 'fire drill', 'Afula', 238, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-11-2005', 'dd-mm-yyyy'), 809, 46, 'evacuation drill', 'Hadera', 739, 'Herzliya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-08-2013', 'dd-mm-yyyy'), 935, 409, 'evacuation drill', 'Ramat Gan', 465, 'Kfar Saba''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-06-2012', 'dd-mm-yyyy'), 479, 362, 'earthquake drill', 'Yavne', 511, '''25 Sheshet HaYamim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-09-2022', 'dd-mm-yyyy'), 490, 432, 'fire drill', 'Sakhnin', 139, '''17 HaEmek St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 458, 330, 'active shooter drill', 'Rehovot', 372, '''29 HaNegev Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-07-2021', 'dd-mm-yyyy'), 319, 229, 'evacuation drill', 'Ashdod', 276, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-05-2016', 'dd-mm-yyyy'), 264, 847, 'tornado drill', 'Qalansawe', 991, 'Acre''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 411, 693, 'earthquake drill', 'Raanana', 883, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-04-2016', 'dd-mm-yyyy'), 243, 646, 'active shooter drill', 'Lod', 181, '''1 Rothschild Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-07-2016', 'dd-mm-yyyy'), 228, 701, 'active shooter drill', 'Bnei Brak', 151, 'Herzliya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-01-2012', 'dd-mm-yyyy'), 668, 856, 'active shooter drill', 'Ramat Gan', 174, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-05-2021', 'dd-mm-yyyy'), 304, 162, 'evacuation drill', 'Afula', 445, 'Nahariya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-02-2008', 'dd-mm-yyyy'), 816, 616, 'earthquake drill', 'Holon', 351, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-12-2021', 'dd-mm-yyyy'), 382, 237, 'fire drill', 'Umm al-Fahm', 153, '''30 HaZayit St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-01-2010', 'dd-mm-yyyy'), 977, 44, 'fire drill', 'Karmiel', 635, 'Rehovot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-04-2015', 'dd-mm-yyyy'), 949, 868, 'earthquake drill', 'Netanya', 573, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-10-2002', 'dd-mm-yyyy'), 61, 594, 'earthquake drill', 'Kiryat Shmona', 971, '''28 HaBesor St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-10-2022', 'dd-mm-yyyy'), 608, 277, 'fire drill', 'Bat Yam', 732, 'Herzliya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-02-2020', 'dd-mm-yyyy'), 156, 322, 'evacuation drill', 'Holon', 824, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 450, 655, 'tornado drill', 'Tiberias', 99, 'Rehovot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-10-2006', 'dd-mm-yyyy'), 737, 738, 'earthquake drill', 'Rishon LeZion', 469, '''17 HaEmek St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-01-2006', 'dd-mm-yyyy'), 165, 361, 'fire drill', 'Rehovot', 121, 'Haifa''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 15, 319, 'evacuation drill', 'Ramat Gan', 571, 'Tel Aviv''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-02-2012', 'dd-mm-yyyy'), 375, 831, 'fire drill', 'Nazareth', 34, 'Hadera''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-11-2015', 'dd-mm-yyyy'), 975, 882, 'earthquake drill', 'Eilat', 56, '''16 Keren HaYesod St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('27-09-2021', 'dd-mm-yyyy'), 831, 55, 'evacuation drill', 'Hadera', 449, 'Petah Tikva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-06-2001', 'dd-mm-yyyy'), 261, 391, 'fire drill', 'Modi''in', 995, 'Ashkelon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-04-2001', 'dd-mm-yyyy'), 256, 899, 'earthquake drill', 'Raanana', 133, '''19 HaRav Kook St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-11-2013', 'dd-mm-yyyy'), 704, 870, 'tornado drill', 'Acre', 686, '''31 HaPalmach St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-06-2024', 'dd-mm-yyyy'), 359, 610, 'evacuation drill', 'Be''er Sheva', 529, '''3 Herzl St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-01-2018', 'dd-mm-yyyy'), 227, 521, 'fire drill', 'Nazareth', 256, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-03-2003', 'dd-mm-yyyy'), 751, 555, 'earthquake drill', 'Giv''atayim', 722, 'Qalansawe''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-01-2006', 'dd-mm-yyyy'), 512, 483, 'fire drill', 'Be''er Sheva', 231, '''11 Sokolov St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-12-2014', 'dd-mm-yyyy'), 128, 55, 'fire drill', 'Eilat', 814, 'Tirat Carmel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-01-2009', 'dd-mm-yyyy'), 314, 805, 'fire drill', 'Arad', 436, 'Rehovot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-07-2008', 'dd-mm-yyyy'), 142, 484, 'tornado drill', 'Eilat', 915, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-11-2017', 'dd-mm-yyyy'), 812, 546, 'tornado drill', 'Sakhnin', 746, '''8 Aluf Sadeh St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-01-2022', 'dd-mm-yyyy'), 520, 701, 'fire drill', 'Be''er Sheva', 732, '''12 Moshe Dayan Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-04-2020', 'dd-mm-yyyy'), 356, 539, 'earthquake drill', 'Netanya', 295, 'Dimona''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-07-2018', 'dd-mm-yyyy'), 697, 562, 'earthquake drill', 'Jerusalem', 854, 'Dimona''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-12-2020', 'dd-mm-yyyy'), 657, 571, 'evacuation drill', 'Sderot', 14, '''23 HaShalom St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 262, 376, 'active shooter drill', 'Beit Shemesh', 417, '''12 Moshe Dayan Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-08-2012', 'dd-mm-yyyy'), 758, 104, 'active shooter drill', 'Eilat', 314, 'Ashdod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 446, 529, 'fire drill', 'Sakhnin', 112, 'Haifa''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-11-2016', 'dd-mm-yyyy'), 72, 798, 'active shooter drill', 'Modi''in', 296, 'Or Yehuda''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-06-2016', 'dd-mm-yyyy'), 213, 845, 'active shooter drill', 'Dimona', 365, '''28 HaBesor St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-03-2017', 'dd-mm-yyyy'), 839, 392, 'earthquake drill', 'Ramat Gan', 147, 'Tel Aviv''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-11-2012', 'dd-mm-yyyy'), 596, 630, 'tornado drill', 'Ramat Gan', 928, '''29 HaNegev Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-10-2020', 'dd-mm-yyyy'), 983, 550, 'earthquake drill', 'Sakhnin', 462, 'Tel Aviv''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-05-2019', 'dd-mm-yyyy'), 524, 345, 'evacuation drill', 'Bat Yam', 861, '''13 Weizmann Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-01-2014', 'dd-mm-yyyy'), 899, 829, 'fire drill', 'Beit Shemesh', 167, 'Ashdod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-12-2013', 'dd-mm-yyyy'), 798, 401, 'fire drill', 'Beit Shemesh', 572, '''22 David Remez St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-04-2000', 'dd-mm-yyyy'), 281, 583, 'fire drill', 'Arad', 767, 'Herzliya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 764, 452, 'fire drill', 'Qalansawe', 437, '''33 HaTzafon St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('28-10-2018', 'dd-mm-yyyy'), 296, 511, 'earthquake drill', 'Giv''atayim', 264, 'Sderot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-07-2013', 'dd-mm-yyyy'), 289, 409, 'earthquake drill', 'Giv''atayim', 352, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('20-02-2013', 'dd-mm-yyyy'), 600, 894, 'fire drill', 'Safed', 692, 'Be''er Sheva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-01-2010', 'dd-mm-yyyy'), 232, 71, 'evacuation drill', 'Or Yehuda', 947, 'Qalansawe''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-10-2015', 'dd-mm-yyyy'), 878, 510, 'earthquake drill', 'Kfar Saba', 144, 'Afula''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-02-2002', 'dd-mm-yyyy'), 946, 874, 'active shooter drill', 'Petah Tikva', 454, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-02-2017', 'dd-mm-yyyy'), 294, 84, 'earthquake drill', 'Holon', 605, 'Modi''in''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-04-2008', 'dd-mm-yyyy'), 609, 511, 'tornado drill', 'Giv''atayim', 848, '''25 Sheshet HaYamim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-12-2020', 'dd-mm-yyyy'), 146, 220, 'evacuation drill', 'Eilat', 123, '''3 Herzl St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-08-2022', 'dd-mm-yyyy'), 456, 658, 'evacuation drill', 'Kiryat Shmona', 761, '''7 Begin Rd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-10-2004', 'dd-mm-yyyy'), 447, 567, 'tornado drill', 'Be''er Sheva', 942, 'Kfar Saba''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-10-2004', 'dd-mm-yyyy'), 892, 515, 'earthquake drill', 'Giv''atayim', 436, '''2 Jabotinsky St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-04-2013', 'dd-mm-yyyy'), 468, 644, 'tornado drill', 'Modi''in', 714, 'Herzliya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('13-07-2017', 'dd-mm-yyyy'), 523, 334, 'active shooter drill', 'Eilat', 178, 'Yavne''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-10-2019', 'dd-mm-yyyy'), 971, 504, 'active shooter drill', 'Bat Yam', 412, 'Karmiel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 807, 245, 'active shooter drill', 'Afula', 475, 'Qalansawe''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-09-2019', 'dd-mm-yyyy'), 121, 160, 'fire drill', 'Qalansawe', 975, '''34 HaGilboa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-11-2019', 'dd-mm-yyyy'), 881, 479, 'active shooter drill', 'Kiryat Shmona', 628, 'Netanya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-07-2017', 'dd-mm-yyyy'), 370, 577, 'earthquake drill', 'Kfar Saba', 93, '''22 David Remez St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-01-2001', 'dd-mm-yyyy'), 806, 413, 'tornado drill', 'Nahariya', 243, 'Petah Tikva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-12-2024', 'dd-mm-yyyy'), 733, 757, 'evacuation drill', 'Netanya', 829, '''12 Moshe Dayan Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-03-2006', 'dd-mm-yyyy'), 756, 298, 'tornado drill', 'Afula', 726, '''14 HaNassi St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-05-2021', 'dd-mm-yyyy'), 669, 756, 'tornado drill', 'Holon', 822, 'Hadera''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('27-06-2014', 'dd-mm-yyyy'), 773, 464, 'fire drill', 'Safed', 834, 'Jerusalem''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-10-2014', 'dd-mm-yyyy'), 714, 499, 'evacuation drill', 'Ramat Gan', 757, 'Giv''atayim''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-07-2011', 'dd-mm-yyyy'), 921, 725, 'active shooter drill', 'Modi''in', 537, 'Holon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-05-2013', 'dd-mm-yyyy'), 451, 566, 'earthquake drill', 'Tirat Carmel', 467, 'Kfar Saba''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-11-2021', 'dd-mm-yyyy'), 198, 371, 'earthquake drill', 'Lod', 491, 'Holon''', null);
commit;
prompt 100 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-02-2011', 'dd-mm-yyyy'), 630, 260, 'fire drill', 'Hadera', 697, '''11 Sokolov St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('27-05-2020', 'dd-mm-yyyy'), 435, 470, 'evacuation drill', 'Giv''atayim', 0, '''20 HaAri St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-08-2005', 'dd-mm-yyyy'), 50, 731, 'evacuation drill', 'Arad', 682, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-02-2008', 'dd-mm-yyyy'), 634, 778, 'tornado drill', 'Beit Shemesh', 943, '''35 HaAlon St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 170, 417, 'evacuation drill', 'Bat Yam', 427, '''28 HaBesor St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-06-2000', 'dd-mm-yyyy'), 862, 359, 'tornado drill', 'Dimona', 792, 'Jerusalem''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-02-2008', 'dd-mm-yyyy'), 271, 446, 'active shooter drill', 'Tel Aviv', 552, '''26 HaDekel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-11-2014', 'dd-mm-yyyy'), 757, 562, 'active shooter drill', 'Bat Yam', 530, 'Hadera''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-07-2005', 'dd-mm-yyyy'), 252, 506, 'evacuation drill', 'Lod', 77, 'Be''er Sheva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-09-2008', 'dd-mm-yyyy'), 871, 764, 'tornado drill', 'Nahariya', 195, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-10-2008', 'dd-mm-yyyy'), 767, 499, 'active shooter drill', 'Acre', 585, 'Bat Yam''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-08-2020', 'dd-mm-yyyy'), 293, 486, 'fire drill', 'Kiryat Shmona', 596, '''31 HaPalmach St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-11-2016', 'dd-mm-yyyy'), 742, 705, 'fire drill', 'Petah Tikva', 155, '''35 HaAlon St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-12-2002', 'dd-mm-yyyy'), 684, 172, 'evacuation drill', 'Kiryat Shmona', 366, '''20 HaAri St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 353, 572, 'evacuation drill', 'Acre', 53, 'Safed''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-07-2004', 'dd-mm-yyyy'), 931, 367, 'earthquake drill', 'Qalansawe', 527, '''7 Begin Rd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-08-2007', 'dd-mm-yyyy'), 833, 809, 'tornado drill', 'Eilat', 81, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-02-2018', 'dd-mm-yyyy'), 749, 892, 'tornado drill', 'Bat Yam', 341, 'Jerusalem''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-05-2022', 'dd-mm-yyyy'), 708, 309, 'earthquake drill', 'Acre', 885, 'Or Yehuda''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-05-2005', 'dd-mm-yyyy'), 759, 643, 'evacuation drill', 'Jerusalem', 483, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-09-2003', 'dd-mm-yyyy'), 98, 517, 'fire drill', 'Karmiel', 718, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-02-2021', 'dd-mm-yyyy'), 917, 741, 'evacuation drill', 'Yavne', 650, 'Beit Shemesh''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-06-2016', 'dd-mm-yyyy'), 149, 113, 'active shooter drill', 'Acre', 791, 'Acre''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-10-2001', 'dd-mm-yyyy'), 234, 741, 'tornado drill', 'Sakhnin', 746, 'Haifa''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-03-2013', 'dd-mm-yyyy'), 632, 373, 'active shooter drill', 'Hadera', 490, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-06-2000', 'dd-mm-yyyy'), 32, 829, 'earthquake drill', 'Bat Yam', 789, 'Tirat Carmel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-05-2006', 'dd-mm-yyyy'), 590, 601, 'evacuation drill', 'Eilat', 857, 'Petah Tikva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('13-11-2019', 'dd-mm-yyyy'), 148, 810, 'evacuation drill', 'Or Yehuda', 802, 'Or Yehuda''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-04-2004', 'dd-mm-yyyy'), 320, 293, 'tornado drill', 'Eilat', 621, '''19 HaRav Kook St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-09-2016', 'dd-mm-yyyy'), 715, 66, 'active shooter drill', 'Hadera', 103, 'Rishon LeZion''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-06-2000', 'dd-mm-yyyy'), 639, 745, 'earthquake drill', 'Kiryat Shmona', 83, 'Beit Shemesh''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-03-2006', 'dd-mm-yyyy'), 791, 390, 'active shooter drill', 'Tel Aviv', 483, '''25 Sheshet HaYamim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-08-2010', 'dd-mm-yyyy'), 580, 783, 'tornado drill', 'Herzliya', 453, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-10-2021', 'dd-mm-yyyy'), 491, 875, 'tornado drill', 'Sderot', 900, '''26 HaDekel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 954, 736, 'active shooter drill', 'Hadera', 831, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-03-2000', 'dd-mm-yyyy'), 298, 429, 'active shooter drill', 'Giv''atayim', 792, 'Rishon LeZion''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-05-2007', 'dd-mm-yyyy'), 503, 574, 'evacuation drill', 'Giv''atayim', 584, '''5 Weizmann St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-10-2010', 'dd-mm-yyyy'), 114, 354, 'earthquake drill', 'Nazareth', 98, 'Tirat Carmel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-08-2022', 'dd-mm-yyyy'), 663, 701, 'fire drill', 'Ashdod', 502, '''7 Begin Rd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 100, 672, 'tornado drill', 'Bat Yam', 700, '''33 HaTzafon St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-10-2006', 'dd-mm-yyyy'), 526, 714, 'active shooter drill', 'Sakhnin', 880, 'Bat Yam''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-12-2011', 'dd-mm-yyyy'), 19, 425, 'active shooter drill', 'Sakhnin', 303, 'Or Yehuda''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 384, 572, 'tornado drill', 'Lod', 92, 'Arad''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-07-2001', 'dd-mm-yyyy'), 118, 332, 'fire drill', 'Bat Yam', 308, 'Arad''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-05-2016', 'dd-mm-yyyy'), 369, 355, 'earthquake drill', 'Hadera', 826, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-06-2000', 'dd-mm-yyyy'), 898, 582, 'tornado drill', 'Safed', 152, 'Kfar Saba''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-12-2006', 'dd-mm-yyyy'), 284, 865, 'earthquake drill', 'Holon', 393, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-10-2008', 'dd-mm-yyyy'), 513, 809, 'tornado drill', 'Ramat Gan', 60, 'Ashkelon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-03-2019', 'dd-mm-yyyy'), 208, 803, 'evacuation drill', 'Afula', 665, 'Acre''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-03-2008', 'dd-mm-yyyy'), 107, 694, 'tornado drill', 'Sakhnin', 326, '''12 Moshe Dayan Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-09-2013', 'dd-mm-yyyy'), 434, 696, 'active shooter drill', 'Or Yehuda', 789, '''3 Herzl St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-04-2011', 'dd-mm-yyyy'), 505, 483, 'tornado drill', 'Acre', 465, 'Ashkelon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-11-2024', 'dd-mm-yyyy'), 124, 858, 'active shooter drill', 'Eilat', 839, '''14 HaNassi St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('27-09-2009', 'dd-mm-yyyy'), 554, 165, 'evacuation drill', 'Rishon LeZion', 464, '''24 HaTikva St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-08-2009', 'dd-mm-yyyy'), 478, 66, 'earthquake drill', 'Rishon LeZion', 944, '''11 Sokolov St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-04-2014', 'dd-mm-yyyy'), 563, 69, 'fire drill', 'Afula', 356, 'Sderot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-10-2002', 'dd-mm-yyyy'), 794, 741, 'evacuation drill', 'Tel Aviv', 63, 'Beit Shemesh''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-06-2017', 'dd-mm-yyyy'), 701, 203, 'active shooter drill', 'Acre', 234, '''24 HaTikva St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-12-2009', 'dd-mm-yyyy'), 403, 480, 'active shooter drill', 'Ashkelon', 610, '''8 Aluf Sadeh St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('28-12-2013', 'dd-mm-yyyy'), 905, 316, 'earthquake drill', 'Be''er Sheva', 254, 'Sderot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-09-2010', 'dd-mm-yyyy'), 425, 785, 'earthquake drill', 'Giv''atayim', 277, '''13 Weizmann Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-01-2010', 'dd-mm-yyyy'), 166, 393, 'evacuation drill', 'Hadera', 418, 'Netanya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-01-2021', 'dd-mm-yyyy'), 161, 685, 'active shooter drill', 'Qalansawe', 817, 'Ashdod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-02-2002', 'dd-mm-yyyy'), 159, 865, 'evacuation drill', 'Nahariya', 64, 'Ashkelon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-04-2013', 'dd-mm-yyyy'), 135, 84, 'earthquake drill', 'Karmiel', 912, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-05-2019', 'dd-mm-yyyy'), 800, 138, 'fire drill', 'Kfar Saba', 497, '''29 HaNegev Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-09-2016', 'dd-mm-yyyy'), 780, 189, 'earthquake drill', 'Giv''atayim', 758, '''24 HaTikva St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('13-03-2020', 'dd-mm-yyyy'), 219, 680, 'evacuation drill', 'Petah Tikva', 470, 'Tirat Carmel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-03-2000', 'dd-mm-yyyy'), 385, 545, 'tornado drill', 'Sakhnin', 857, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-07-2017', 'dd-mm-yyyy'), 111, 533, 'fire drill', 'Yavne', 514, '''28 HaBesor St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-05-2021', 'dd-mm-yyyy'), 835, 412, 'earthquake drill', 'Afula', 702, 'Safed''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-10-2024', 'dd-mm-yyyy'), 42, 164, 'earthquake drill', 'Arad', 293, 'Petah Tikva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-10-2021', 'dd-mm-yyyy'), 407, 665, 'tornado drill', 'Bat Yam', 243, 'Umm al-Fahm''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-02-2006', 'dd-mm-yyyy'), 150, 858, 'evacuation drill', 'Or Yehuda', 705, '''30 HaZayit St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-10-2004', 'dd-mm-yyyy'), 664, 561, 'active shooter drill', 'Kfar Saba', 130, 'Nahariya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-01-2009', 'dd-mm-yyyy'), 466, 556, 'tornado drill', 'Rehovot', 287, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-03-2022', 'dd-mm-yyyy'), 325, 289, 'fire drill', 'Yavne', 661, 'Herzliya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-09-2011', 'dd-mm-yyyy'), 231, 227, 'tornado drill', 'Hadera', 118, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-08-2007', 'dd-mm-yyyy'), 133, 677, 'earthquake drill', 'Giv''atayim', 380, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-04-2019', 'dd-mm-yyyy'), 903, 198, 'fire drill', 'Sderot', 85, 'Hadera''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-03-2003', 'dd-mm-yyyy'), 20, 754, 'earthquake drill', 'Afula', 16, 'Safed''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('20-02-2002', 'dd-mm-yyyy'), 539, 575, 'evacuation drill', 'Safed', 344, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 467, 56, 'evacuation drill', 'Rehovot', 814, '''25 Sheshet HaYamim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('27-09-2014', 'dd-mm-yyyy'), 802, 385, 'evacuation drill', 'Jerusalem', 89, '''27 HaNarkis St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-12-2022', 'dd-mm-yyyy'), 709, 71, 'tornado drill', 'Ramat Gan', 583, '''14 HaNassi St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-12-2012', 'dd-mm-yyyy'), 994, 517, 'active shooter drill', 'Dimona', 634, 'Modi''in''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-06-2010', 'dd-mm-yyyy'), 640, 743, 'active shooter drill', 'Karmiel', 677, 'Sderot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-01-2008', 'dd-mm-yyyy'), 850, 741, 'fire drill', 'Nahariya', 847, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-11-2014', 'dd-mm-yyyy'), 790, 811, 'earthquake drill', 'Eilat', 451, 'Rishon LeZion''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-04-2009', 'dd-mm-yyyy'), 998, 787, 'active shooter drill', 'Modi''in', 300, 'Umm al-Fahm''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-09-2016', 'dd-mm-yyyy'), 621, 327, 'fire drill', 'Rehovot', 852, 'Yavne''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-01-2002', 'dd-mm-yyyy'), 582, 4, 'fire drill', 'Bat Yam', 71, '''31 HaPalmach St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-12-2004', 'dd-mm-yyyy'), 588, 657, 'active shooter drill', 'Tiberias', 982, 'Safed''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-11-2003', 'dd-mm-yyyy'), 762, 68, 'evacuation drill', 'Rehovot', 497, '''5 Weizmann St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-12-2016', 'dd-mm-yyyy'), 430, 205, 'earthquake drill', 'Or Yehuda', 597, 'Karmiel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-10-2001', 'dd-mm-yyyy'), 475, 31, 'evacuation drill', 'Karmiel', 725, '''2 Jabotinsky St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-02-2003', 'dd-mm-yyyy'), 174, 636, 'fire drill', 'Umm al-Fahm', 897, 'Safed''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-08-2007', 'dd-mm-yyyy'), 313, 436, 'tornado drill', 'Ashdod', 409, '''24 HaTikva St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-10-2013', 'dd-mm-yyyy'), 570, 450, 'evacuation drill', 'Giv''atayim', 125, 'Jerusalem''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('28-08-2023', 'dd-mm-yyyy'), 617, 545, 'fire drill', 'Rehovot', 513, '''8 Aluf Sadeh St', null);
commit;
prompt 200 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-10-2007', 'dd-mm-yyyy'), 710, 143, 'earthquake drill', 'Rishon LeZion', 165, '''5 Weizmann St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-10-2022', 'dd-mm-yyyy'), 507, 455, 'tornado drill', 'Yavne', 6, '''5 Weizmann St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-12-2003', 'dd-mm-yyyy'), 677, 43, 'tornado drill', 'Lod', 732, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-07-2008', 'dd-mm-yyyy'), 175, 345, 'active shooter drill', 'Raanana', 925, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('28-10-2005', 'dd-mm-yyyy'), 273, 278, 'tornado drill', 'Arad', 920, '''34 HaGilboa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('20-03-2017', 'dd-mm-yyyy'), 793, 175, 'fire drill', 'Bnei Brak', 937, 'Afula''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-11-2017', 'dd-mm-yyyy'), 431, 664, 'evacuation drill', 'Dimona', 961, 'Jerusalem''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-09-2001', 'dd-mm-yyyy'), 604, 869, 'active shooter drill', 'Nazareth', 121, '''8 Aluf Sadeh St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-03-2017', 'dd-mm-yyyy'), 436, 662, 'fire drill', 'Giv''atayim', 111, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-05-2017', 'dd-mm-yyyy'), 316, 245, 'active shooter drill', 'Modi''in', 414, 'Petah Tikva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-09-2003', 'dd-mm-yyyy'), 386, 610, 'earthquake drill', 'Holon', 667, '''8 Aluf Sadeh St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 348, 76, 'active shooter drill', 'Tirat Carmel', 675, 'Tirat Carmel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-04-2013', 'dd-mm-yyyy'), 184, 10, 'tornado drill', 'Kiryat Shmona', 942, 'Kfar Saba''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-01-2022', 'dd-mm-yyyy'), 720, 374, 'tornado drill', 'Sakhnin', 916, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-11-2003', 'dd-mm-yyyy'), 480, 340, 'fire drill', 'Tirat Carmel', 847, '''28 HaBesor St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-04-2009', 'dd-mm-yyyy'), 474, 356, 'earthquake drill', 'Bat Yam', 504, '''5 Weizmann St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-10-2006', 'dd-mm-yyyy'), 649, 335, 'tornado drill', 'Netanya', 883, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-03-2011', 'dd-mm-yyyy'), 328, 661, 'evacuation drill', 'Holon', 660, '''19 HaRav Kook St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-11-2011', 'dd-mm-yyyy'), 519, 594, 'earthquake drill', 'Rishon LeZion', 970, 'Jerusalem''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-07-2008', 'dd-mm-yyyy'), 824, 346, 'evacuation drill', 'Holon', 37, 'Or Yehuda''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-08-2011', 'dd-mm-yyyy'), 183, 700, 'active shooter drill', 'Lod', 740, 'Rehovot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-10-2015', 'dd-mm-yyyy'), 188, 667, 'tornado drill', 'Nahariya', 298, 'Ashdod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-05-2002', 'dd-mm-yyyy'), 360, 498, 'tornado drill', 'Or Yehuda', 14, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-10-2022', 'dd-mm-yyyy'), 323, 609, 'earthquake drill', 'Yavne', 877, '''1 Rothschild Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-11-2016', 'dd-mm-yyyy'), 962, 656, 'tornado drill', 'Eilat', 472, '''27 HaNarkis St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('13-12-2021', 'dd-mm-yyyy'), 989, 789, 'earthquake drill', 'Lod', 726, '''34 HaGilboa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-09-2022', 'dd-mm-yyyy'), 152, 667, 'active shooter drill', 'Karmiel', 178, 'Bat Yam''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-06-2024', 'dd-mm-yyyy'), 947, 448, 'fire drill', 'Yavne', 919, '''16 Keren HaYesod St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 460, 298, 'fire drill', 'Herzliya', 306, '''8 Aluf Sadeh St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-10-2001', 'dd-mm-yyyy'), 814, 304, 'fire drill', 'Giv''atayim', 315, '''34 HaGilboa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 4, 45, 'earthquake drill', '54 Mariners Cove Junction', 158, 'PO Box 49321', 406);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-12-2024', 'dd-mm-yyyy'), 10, 45, 'active shooter drill', '2437 Commercial Court', 322, 'Room 1419', 412);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 16, 180, 'fire drill', '43604 Village Road', 497, 'Room 1017', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-01-2004', 'dd-mm-yyyy'), 136, 120, 'tornado drill', 'Nahariya', 537, 'Dimona''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('28-02-2010', 'dd-mm-yyyy'), 247, 535, 'tornado drill', 'Arad', 504, 'Karmiel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('13-04-2019', 'dd-mm-yyyy'), 103, 750, 'evacuation drill', 'Giv''atayim', 990, '''24 HaTikva St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-03-2009', 'dd-mm-yyyy'), 96, 287, 'tornado drill', 'Eilat', 13, '''4 Hillel St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-09-2022', 'dd-mm-yyyy'), 413, 437, 'evacuation drill', 'Petah Tikva', 338, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-09-2017', 'dd-mm-yyyy'), 813, 179, 'active shooter drill', 'Arad', 506, 'Nahariya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-02-2020', 'dd-mm-yyyy'), 312, 449, 'active shooter drill', 'Sakhnin', 276, '''29 HaNegev Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-09-2001', 'dd-mm-yyyy'), 766, 651, 'earthquake drill', 'Safed', 566, '''21 Jaffa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-03-2005', 'dd-mm-yyyy'), 132, 389, 'evacuation drill', 'Qalansawe', 917, 'Nahariya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-07-2005', 'dd-mm-yyyy'), 317, 222, 'fire drill', 'Umm al-Fahm', 222, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-11-2007', 'dd-mm-yyyy'), 644, 136, 'evacuation drill', 'Netanya', 334, 'Arad''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-12-2002', 'dd-mm-yyyy'), 681, 710, 'evacuation drill', 'Beit Shemesh', 786, 'Bat Yam''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-02-2006', 'dd-mm-yyyy'), 342, 603, 'earthquake drill', 'Rehovot', 103, '''19 HaRav Kook St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 366, 20, 'evacuation drill', 'Dimona', 364, 'Giv''atayim''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-06-2005', 'dd-mm-yyyy'), 22, 157, 'evacuation drill', 'Ramat Gan', 971, '''2 Jabotinsky St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-01-2002', 'dd-mm-yyyy'), 470, 45, 'evacuation drill', 'Giv''atayim', 845, 'Netanya''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-01-2014', 'dd-mm-yyyy'), 876, 48, 'active shooter drill', 'Rishon LeZion', 410, 'Rishon LeZion''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-11-2014', 'dd-mm-yyyy'), 990, 717, 'active shooter drill', 'Dimona', 72, '''13 Weizmann Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-03-2022', 'dd-mm-yyyy'), 555, 690, 'earthquake drill', 'Umm al-Fahm', 408, 'Bat Yam''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('20-06-2024', 'dd-mm-yyyy'), 760, 492, 'fire drill', 'Qalansawe', 899, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-01-2016', 'dd-mm-yyyy'), 856, 715, 'evacuation drill', 'Nazareth', 818, '''17 HaEmek St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-09-2021', 'dd-mm-yyyy'), 656, 46, 'fire drill', 'Afula', 138, 'Ashkelon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-10-2000', 'dd-mm-yyyy'), 76, 252, 'fire drill', 'Umm al-Fahm', 65, 'Karmiel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-11-2008', 'dd-mm-yyyy'), 535, 745, 'evacuation drill', 'Beit Shemesh', 35, 'Be''er Sheva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('03-05-2003', 'dd-mm-yyyy'), 236, 461, 'earthquake drill', 'Yavne', 888, 'Umm al-Fahm''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-05-2009', 'dd-mm-yyyy'), 57, 546, 'tornado drill', 'Netanya', 17, '''24 HaTikva St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-11-2009', 'dd-mm-yyyy'), 395, 323, 'earthquake drill', 'Hadera', 766, 'Karmiel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-11-2024', 'dd-mm-yyyy'), 14, 772, 'tornado drill', 'Raanana', 316, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-06-2022', 'dd-mm-yyyy'), 203, 417, 'active shooter drill', 'Safed', 950, 'Qalansawe''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-05-2010', 'dd-mm-yyyy'), 559, 540, 'earthquake drill', 'Beit Shemesh', 131, '''14 HaNassi St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-05-2018', 'dd-mm-yyyy'), 689, 804, 'active shooter drill', 'Bnei Brak', 493, '''34 HaGilboa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-08-2021', 'dd-mm-yyyy'), 853, 424, 'fire drill', 'Afula', 187, '''1 Rothschild Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-06-2004', 'dd-mm-yyyy'), 890, 824, 'active shooter drill', 'Umm al-Fahm', 788, '''34 HaGilboa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-08-2017', 'dd-mm-yyyy'), 951, 778, 'tornado drill', 'Karmiel', 1000, '''13 Weizmann Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-02-2005', 'dd-mm-yyyy'), 602, 366, 'earthquake drill', 'Lod', 591, '''15 HaMelacha St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-10-2004', 'dd-mm-yyyy'), 875, 712, 'fire drill', 'Lod', 520, 'Qalansawe''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('20-04-2004', 'dd-mm-yyyy'), 69, 231, 'fire drill', 'Raanana', 484, 'Qalansawe''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-10-2006', 'dd-mm-yyyy'), 776, 221, 'active shooter drill', 'Sderot', 405, '''17 HaEmek St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-05-2002', 'dd-mm-yyyy'), 108, 884, 'earthquake drill', 'Holon', 222, 'Giv''atayim''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 117, 677, 'evacuation drill', 'Lod', 419, 'Hadera''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-02-2015', 'dd-mm-yyyy'), 303, 414, 'earthquake drill', 'Karmiel', 881, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-10-2014', 'dd-mm-yyyy'), 77, 413, 'earthquake drill', 'Tel Aviv', 739, 'Be''er Sheva''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-04-2020', 'dd-mm-yyyy'), 126, 801, 'earthquake drill', 'Umm al-Fahm', 178, '''17 HaEmek St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-08-2007', 'dd-mm-yyyy'), 187, 305, 'evacuation drill', 'Haifa', 480, '''1 Rothschild Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('08-04-2017', 'dd-mm-yyyy'), 932, 732, 'tornado drill', 'Modi''in', 134, 'Afula''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-05-2020', 'dd-mm-yyyy'), 538, 848, 'evacuation drill', 'Kiryat Shmona', 800, '''6 Ben Gurion Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('25-03-2008', 'dd-mm-yyyy'), 940, 812, 'tornado drill', 'Raanana', 834, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-01-2012', 'dd-mm-yyyy'), 785, 353, 'evacuation drill', 'Modi''in', 700, 'Rehovot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-10-2005', 'dd-mm-yyyy'), 930, 228, 'earthquake drill', 'Lod', 984, '''14 HaNassi St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-08-2002', 'dd-mm-yyyy'), 63, 713, 'fire drill', 'Eilat', 967, '''20 HaAri St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-07-2004', 'dd-mm-yyyy'), 744, 745, 'earthquake drill', 'Raanana', 468, 'Safed''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-06-2004', 'dd-mm-yyyy'), 897, 150, 'earthquake drill', 'Tirat Carmel', 367, 'Sakhnin''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-10-2008', 'dd-mm-yyyy'), 645, 299, 'earthquake drill', 'Karmiel', 126, 'Beit Shemesh''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-11-2002', 'dd-mm-yyyy'), 880, 320, 'evacuation drill', 'Giv''atayim', 16, 'Sakhnin''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-08-2012', 'dd-mm-yyyy'), 389, 48, 'active shooter drill', 'Bnei Brak', 709, '''21 Jaffa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-12-2016', 'dd-mm-yyyy'), 253, 159, 'tornado drill', 'Tirat Carmel', 685, 'Holon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-06-2020', 'dd-mm-yyyy'), 412, 583, 'active shooter drill', 'Bnei Brak', 280, '''19 HaRav Kook St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('12-05-2018', 'dd-mm-yyyy'), 197, 513, 'fire drill', 'Nazareth', 347, 'Dimona''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-03-2006', 'dd-mm-yyyy'), 28, 552, 'evacuation drill', 'Dimona', 553, '''12 Moshe Dayan Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-11-2011', 'dd-mm-yyyy'), 685, 480, 'fire drill', 'Dimona', 536, 'Arad''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-12-2016', 'dd-mm-yyyy'), 915, 815, 'earthquake drill', 'Acre', 521, '''34 HaGilboa St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-01-2016', 'dd-mm-yyyy'), 667, 321, 'fire drill', 'Rishon LeZion', 623, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 629, 459, 'tornado drill', 'Rishon LeZion', 663, '''33 HaTzafon St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('15-05-2021', 'dd-mm-yyyy'), 272, 219, 'fire drill', 'Ramat Gan', 14, 'Karmiel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('16-07-2007', 'dd-mm-yyyy'), 326, 888, 'active shooter drill', 'Dimona', 719, 'Or Yehuda''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-02-2007', 'dd-mm-yyyy'), 189, 609, 'fire drill', 'Yavne', 112, 'Kfar Saba''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-07-2020', 'dd-mm-yyyy'), 532, 337, 'active shooter drill', 'Raanana', 896, '''35 HaAlon St', null);
commit;
prompt 300 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-10-2005', 'dd-mm-yyyy'), 414, 138, 'evacuation drill', 'Be''er Sheva', 630, '''11 Sokolov St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-02-2000', 'dd-mm-yyyy'), 593, 593, 'earthquake drill', 'Modi''in', 148, '''31 HaPalmach St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-09-2007', 'dd-mm-yyyy'), 796, 39, 'fire drill', 'Bnei Brak', 225, '''5 Weizmann St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-03-2017', 'dd-mm-yyyy'), 534, 588, 'fire drill', 'Bnei Brak', 268, 'Ramat Gan''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('13-05-2009', 'dd-mm-yyyy'), 235, 451, 'earthquake drill', 'Eilat', 312, '''27 HaNarkis St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('27-01-2021', 'dd-mm-yyyy'), 428, 753, 'earthquake drill', 'Jerusalem', 606, '''33 HaTzafon St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('28-08-2014', 'dd-mm-yyyy'), 659, 544, 'tornado drill', 'Safed', 22, '''24 HaTikva St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-03-2012', 'dd-mm-yyyy'), 180, 807, 'evacuation drill', 'Nahariya', 807, 'Arad''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-06-2020', 'dd-mm-yyyy'), 939, 249, 'active shooter drill', 'Modi''in', 613, '''25 Sheshet HaYamim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-09-2007', 'dd-mm-yyyy'), 827, 459, 'fire drill', 'Hadera', 607, 'Giv''atayim''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('18-04-2008', 'dd-mm-yyyy'), 465, 74, 'tornado drill', 'Acre', 708, '''12 Moshe Dayan Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-07-2004', 'dd-mm-yyyy'), 222, 795, 'active shooter drill', 'Umm al-Fahm', 990, '''8 Aluf Sadeh St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('30-10-2000', 'dd-mm-yyyy'), 24, 766, 'evacuation drill', 'Ashdod', 748, 'Qalansawe''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 215, 685, 'evacuation drill', 'Nahariya', 502, '''3 Herzl St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-07-2000', 'dd-mm-yyyy'), 461, 545, 'earthquake drill', 'Ashkelon', 736, 'Dimona''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('14-06-2005', 'dd-mm-yyyy'), 486, 508, 'evacuation drill', 'Ashdod', 363, 'Beit Shemesh''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-11-2002', 'dd-mm-yyyy'), 521, 428, 'evacuation drill', 'Safed', 570, '''16 Keren HaYesod St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-02-2022', 'dd-mm-yyyy'), 504, 320, 'active shooter drill', 'Qalansawe', 528, 'Acre''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 401, 347, 'earthquake drill', 'Qalansawe', 134, '''23 HaShalom St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-10-2014', 'dd-mm-yyyy'), 788, 604, 'tornado drill', 'Sakhnin', 438, 'Dimona''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('26-01-2018', 'dd-mm-yyyy'), 416, 641, 'tornado drill', 'Kfar Saba', 103, 'Umm al-Fahm''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-03-2010', 'dd-mm-yyyy'), 441, 562, 'tornado drill', 'Yavne', 378, 'Lod''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-06-2015', 'dd-mm-yyyy'), 592, 716, 'earthquake drill', 'Ashkelon', 838, 'Tirat Carmel''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('09-01-2011', 'dd-mm-yyyy'), 115, 501, 'earthquake drill', 'Raanana', 399, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-09-2014', 'dd-mm-yyyy'), 765, 833, 'earthquake drill', 'Arad', 82, '''7 Begin Rd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('31-10-2014', 'dd-mm-yyyy'), 543, 868, 'evacuation drill', 'Bnei Brak', 605, '''15 HaMelacha St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-03-2013', 'dd-mm-yyyy'), 43, 439, 'fire drill', 'Rishon LeZion', 790, 'Rehovot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('29-09-2013', 'dd-mm-yyyy'), 39, 661, 'earthquake drill', 'Be''er Sheva', 440, 'Sderot''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 740, 162, 'active shooter drill', 'Netanya', 890, 'Acre''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('23-09-2009', 'dd-mm-yyyy'), 585, 788, 'evacuation drill', 'Afula', 585, '''29 HaNegev Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('07-06-2007', 'dd-mm-yyyy'), 603, 329, 'tornado drill', 'Or Yehuda', 785, '''18 HaTamar St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('06-11-2019', 'dd-mm-yyyy'), 581, 279, 'active shooter drill', 'Modi''in', 125, '''7 Begin Rd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('04-06-2006', 'dd-mm-yyyy'), 857, 835, 'fire drill', 'Nahariya', 478, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('01-09-2020', 'dd-mm-yyyy'), 955, 899, 'earthquake drill', 'Kiryat Shmona', 435, 'Yavne''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-04-2015', 'dd-mm-yyyy'), 140, 755, 'evacuation drill', 'Tiberias', 365, 'Holon''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('10-01-2021', 'dd-mm-yyyy'), 29, 86, 'active shooter drill', 'Kfar Saba', 397, '''2 Jabotinsky St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-05-2015', 'dd-mm-yyyy'), 390, 235, 'earthquake drill', 'Or Yehuda', 96, '''3 Herzl St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-05-2021', 'dd-mm-yyyy'), 746, 561, 'evacuation drill', 'Umm al-Fahm', 34, 'Kfar Saba''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('02-08-2008', 'dd-mm-yyyy'), 259, 142, 'earthquake drill', 'Umm al-Fahm', 487, '''10 HaTayasim Blvd', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('21-03-2017', 'dd-mm-yyyy'), 277, 64, 'active shooter drill', 'Arad', 259, 'Or Yehuda''', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 84, 41, 'tornado drill', 'Modi''in', 387, '''19 HaRav Kook St', null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 2, 30, 'tornado drill', '2902 Clemons Crossing', 364, 'PO Box 37418', 404);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 1, 45, 'tornado drill', '48 Erie Circle', 435, 'Room 970', 403);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, categoryid)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 3, 180, 'active shooter drill', '87528 Oneill Crossing', 24, 'PO Box 24972', 405);
commit;
prompt 344 records loaded
prompt Loading DRILLCATEGORYOF...
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (1, 403);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (2, 404);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (3, 405);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (4, 406);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (10, 412);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (16, 405);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (22, 404);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (22, 410);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (96, 407);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (136, 406);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (317, 408);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (342, 409);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (681, 411);
insert into DRILLCATEGORYOF (emdrid, categoryid)
values (876, 412);
commit;
prompt 14 records loaded
prompt Loading EVDEBRIEFING...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (967, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (968, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (969, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (970, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (971, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (972, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (973, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (974, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (975, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (976, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (977, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (978, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (979, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (980, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (981, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (982, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (983, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (984, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (985, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (986, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (987, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (988, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (989, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (783, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (784, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (785, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (786, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (787, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (788, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (789, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (790, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (791, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (792, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (793, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (794, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (795, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (796, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (797, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (798, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (799, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (800, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (801, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (802, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (803, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (804, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (805, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (806, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (807, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (808, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (809, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (810, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (811, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (812, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (813, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (814, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (815, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (816, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (817, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (818, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (819, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (820, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (821, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (822, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (823, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (824, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (825, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (826, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (827, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (828, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (829, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (830, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (831, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (832, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (833, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (834, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (835, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (836, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (837, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (838, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (839, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (840, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (841, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (842, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (843, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (844, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (845, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (846, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (847, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (848, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (849, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (850, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (851, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (852, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (853, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (854, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (855, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (856, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (857, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (858, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (859, ' Nadav Shalem', 0, ' Well Done');
commit;
prompt 100 records committed...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (860, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (861, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (862, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (863, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (864, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (865, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (866, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (867, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (868, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (869, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (870, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (871, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (872, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (873, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (874, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (875, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (876, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (877, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (878, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (879, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (880, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (881, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (882, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (883, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (884, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (885, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (886, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (887, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (888, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (889, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (890, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (891, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (892, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (893, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (894, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (895, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (896, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (897, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (898, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (899, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (900, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (901, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (902, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (903, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (904, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (905, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (906, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (907, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (908, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (909, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (910, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (911, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (912, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (913, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (914, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (915, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (916, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (917, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (918, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (919, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (920, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (921, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (922, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (923, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (924, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (925, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (926, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (927, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (928, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (929, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (930, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (931, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (932, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (933, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (934, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (935, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (936, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (937, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (938, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (939, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (940, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (941, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (942, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (943, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (944, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (945, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (946, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (947, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (948, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (949, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (950, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (951, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (952, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (953, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (954, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (955, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (956, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (957, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (958, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (959, ' Nadav Shalem', 1, ' Failure');
commit;
prompt 200 records committed...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (960, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (961, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (962, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (963, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (964, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (965, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (966, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (691, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (692, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (693, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (694, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (695, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (696, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (697, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (698, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (699, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (700, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (701, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (702, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (703, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (704, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (705, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (706, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (707, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (708, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (709, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (710, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (711, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (712, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (713, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (590, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (591, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (592, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (593, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (594, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (595, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (596, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (597, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (598, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (599, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (600, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (601, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (602, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (603, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (604, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (605, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (606, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (607, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (608, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (609, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (610, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (611, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (612, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (613, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (614, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (615, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (616, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (617, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (618, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (619, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (620, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (621, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (622, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (623, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (624, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (625, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (626, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (627, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (628, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (629, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (630, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (631, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (632, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (633, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (634, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (635, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (636, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (637, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (638, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (639, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (640, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (641, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (642, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (643, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (644, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (645, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (646, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (647, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (648, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (649, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (650, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (651, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (652, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (653, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (654, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (655, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (656, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (657, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (658, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (659, ' Nitai Gal', 1, ' Well Done');
commit;
prompt 300 records committed...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (660, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (661, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (662, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (663, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (664, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (665, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (666, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (667, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (668, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (669, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (670, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (671, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (672, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (673, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (674, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (675, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (676, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (677, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (678, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (679, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (680, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (681, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (682, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (683, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (684, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (685, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (686, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (687, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (688, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (689, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (690, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (714, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (715, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (716, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (717, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (718, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (719, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (720, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (721, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (722, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (723, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (724, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (725, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (726, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (727, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (728, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (729, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (730, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (731, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (732, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (733, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (734, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (735, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (736, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (737, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (738, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (739, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (740, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (741, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (742, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (743, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (744, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (745, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (746, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (747, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (748, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (749, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (750, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (751, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (752, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (753, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (754, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (755, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (756, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (757, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (758, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (759, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (760, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (761, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (762, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (763, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (764, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (765, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (766, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (767, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (768, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (769, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (770, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (771, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (772, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (773, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (774, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (775, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (776, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (777, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (778, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (779, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (780, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (781, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (782, ' Nadav Shalem', 1, ' Medium operation');
commit;
prompt 400 records loaded
prompt Loading LOCATION...
insert into LOCATION (phonenumber, address, instructions)
values (999999254, '80 Wincott Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999256, '89 Varzea grande Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999258, '96 Oakenfold Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999260, '27 Moreno Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999261, '31 Ruiz Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999262, '340 Lakewood Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999263, '66 Gagnon Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999265, '759 Rowan Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999266, '8 Arquette Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999268, '49 Guy Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999269, '11 Susan Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999270, '3 Tramaine Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999271, '48 Nikka Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999273, '60 Livermore Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999274, '91 Gabriel Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999278, '610 Hannah', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999279, '96 Getty Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999280, '11 Choice Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999281, '51 Seoul Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999285, '831 David Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999288, '49 Paquin Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999290, '64 Duisburg Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999291, '289 Tilda Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999293, '418 Cooper Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999294, '82 Vega Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999296, '83 Pepper Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999298, '60 Hawn Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999299, '67 Los Angeles Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999300, '85 Day-Lewis Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999301, '65 McDowall', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999303, '79 Pointe-claire', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999304, '31 Friedrichshafe Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999305, '361 El Paso Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999306, '96 Cheadle Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999310, '51 Clarence Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999312, '521 Rhames Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999313, '99 Wilder Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999315, '89 Santiago Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999316, '14 Melanie', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999317, '73rd Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999319, '45 Spall Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999321, '527 Ethan Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999322, '520 Li Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999323, '78 McGriff', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999325, '98 Hoskins Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999326, '8 Ceasar Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999330, '39 Spring City Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999331, '91 Bassett Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999333, '85 Seann Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999334, '63rd Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999335, '64 Bogguss Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999337, '23rd Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999339, '60 Charlize Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999340, '488 Yavne Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999341, '95 Merillee Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999342, '29 Saint Paul Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999357, '97 Leipzig Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999358, '73rd Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999359, '2 Washington Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999360, '77 Corona Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999361, '19 Ferraz  vasconcelos Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999362, '75 Hong Kong Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999363, '1 Beck Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999364, '68 Carrack', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999343, '44 Bryson Ave', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999345, '301 Lynne Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999346, '33 Hampton Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999347, '48 Holts Summit', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999349, '98 Issaquah', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999350, '53 Joinville Ave', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999351, '18 Wolf Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999352, '82 Nicole Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999353, '36 B?nes Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999354, '38 Davison Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999369, '43rd Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999370, '371 Rod Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999373, '6 Cuba Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999374, '22 Gdansk Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999375, '74 Nyn?shamn Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999377, '71 Jim Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999378, '12 Patrick Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999379, '81 Nielsen Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999380, '28 Victoria Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999381, '49 Miami Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999382, '26 Amarillo Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999383, '40 Reykjavik Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999384, '783 Barbara Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999385, '267 Westerberg Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999389, '99 Robby Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999000, '38 Tilly Drive', '"permission from facility manager"');
insert into LOCATION (phonenumber, address, instructions)
values (999999001, '26 Gunton Street', '"permission from tenant"');
insert into LOCATION (phonenumber, address, instructions)
values (999999002, '31st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999003, '758 Bryan Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999004, '29 Tlalpan Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999006, '6 Pasadena', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999007, '242 Lavigne Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999008, '32 Peter Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999009, '32 Newton-le-willows Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999010, '73 Bellevue Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999011, '64 Phillippe Drive', 'permission from organization head');
commit;
prompt 100 records committed...
insert into LOCATION (phonenumber, address, instructions)
values (999999012, '95 Quinn Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999013, '16 Yolanda Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999014, '8 Hayes', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999015, '35 Gambon Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999016, '994 Wesley Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999018, '82 Hawke Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999019, '79 Warrington Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999020, '79 Domingo Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999021, '83rd Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999022, '7 Aracruz Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999023, '18 Darren Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999025, '60 Roberts Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999027, '72 Rosas Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999028, '21 Peterson Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999029, '430 Carlton Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999030, '14 Day Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999031, '42nd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999032, '42 Trieste Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999033, '74 Day Ave', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999035, '71st Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999036, '80 Calcutta Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999037, '4 Patrick Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999039, '79 Kenoly Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999043, '89 Burns Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999044, '10 Sizemore Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999045, '87 Schlieren Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999046, '7 Johansson Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999049, '18 Wayman Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999050, '872 Marina Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999051, '33rd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999052, '799 Neill Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999054, '196 Rosanna Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999055, '1 Whitman Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999058, '95 Caan', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999060, '19 Keeslar Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999061, '51 Wakayama Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999062, '94 Augst Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999064, '73rd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999065, '65 Emmerich', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999067, '43 Pitney Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999068, '91st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999070, '636 Dallas Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999071, '54 Dabney Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999072, '1 Betty Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999073, '92 Andrew Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999074, '22 Eugene Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999075, '16 Crudup Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999076, '56 Longueuil Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999078, '883 Oshkosh Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999080, '25 Worrell Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999081, '80 Hughes Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999082, '13 George Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999083, '50 Santana', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999085, '52 Key Biscayne Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999087, '13rd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999088, '11 Stephanie Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999089, '7 Terence Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999090, '80 Grier Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999091, '34 Coltrane Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999229, '62 Concordville Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999230, '9 Barry Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999231, '55 Dysart Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999232, '74 Vaughn Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999233, '89 Luzern Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999800, 'heretz 9', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999235, '59 O''fallon Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999801, 'Yosef 19', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999900, 'Yosef 50', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999238, '17 Seth Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999901, 'Moshe 30', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999240, '667 Holts Summit Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999241, '100 Ripley Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999242, '11 Belle Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999243, '35 Annie Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999244, '154 Madonna Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999245, '73rd Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999246, '729 Drogenbos Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999248, '63 Johnson Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999249, '52 Matt Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999250, '97 Crete Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999251, '20 Apple', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999252, '42 Port Macquarie Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999253, '58 Frances Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (541234567, '123 Herzl St', ' premisson from manager');
insert into LOCATION (phonenumber, address, instructions)
values (543456789, '789 Dizengoff St', ' premisson from supervisor');
insert into LOCATION (phonenumber, address, instructions)
values (544567890, '101 Allenby St', ' premisson from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (545678901, '202 Jaffa Rd', ' premisson from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (546789012, '303 Ben Yehuda St', ' premisson from landlord');
insert into LOCATION (phonenumber, address, instructions)
values (548901234, '505 Ibn Gvirol St', ' premisson from property manager');
insert into LOCATION (phonenumber, address, instructions)
values (541098765, '808 HaNeviim St', ' premisson from site manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999092, 'Shosanim 100, NY', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999095, '36 Josh Ave', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999096, '965 Matarazzo Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999097, '80 Howard Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999098, '89 Chalee Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999099, '51 Heath Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999100, '75 Wetzlar', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999101, '732 Cozier Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999102, '93 Sao roque Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999103, '37 Lionel Ave', 'permission from manager');
commit;
prompt 200 records committed...
insert into LOCATION (phonenumber, address, instructions)
values (999999104, '60 Tambor Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999106, '82 Van Helden Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999107, '4 Haggard Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999108, '5 Porto alegre Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999109, '30 Schaumburg Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999110, '851 Avalon Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999111, '16 Tinsley Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999112, '1 Miles Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999114, '8 Vincent Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999116, '38 Padova', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999117, '89 Chandler Ave', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999118, '48 Astin Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999119, '8 West Launceston Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999120, '75 Dempsey Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999121, '87 Aniston Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999122, '50 Arlington', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999123, '577 Traralgon Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999124, '886 Huston Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999125, '724 Cassidy', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999126, '91 Carla Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999127, '41 Angelina', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999128, '30 Head Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999129, '71 Keitel Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999132, '22 Manaus Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999133, '23rd Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999134, '61 Keeslar Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999136, '17 Grand Rapids', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999137, '61 Bingham Farms Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999138, '70 Benicio Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999139, '42 Frampton Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999140, '18 Cuba Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999141, '245 Shand Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999143, '523 Bale Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999144, '535 Indianapolis', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999146, '18 Richie', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999148, '35 Sinatra Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999150, '679 Lapointe Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999153, '5 Linney Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999154, '82nd Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999155, '32nd Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999156, '30 Vendetta Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999157, '38 Kenoly Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999160, '90 Llewelyn Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999163, '63rd Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999165, '626 Carlingford Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999167, '99 Lila Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999168, '22 Zagreb Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999170, '70 Nathan Ave', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999172, '491 Miki Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999174, '84 Cochran Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999175, '97 Jaime Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999176, '676 Janeane Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999177, '88 Dermot Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999178, '87 Eileen Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999180, '17 Breslin', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999182, '49 Trejo Ave', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999183, '45 Kid', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999185, '86 Elijah', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999186, '82 Gryner Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999191, '78 Chapeco', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999192, '96 Naha Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999193, '23 Haysbert Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999194, '904 Brothers', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999195, '2 Olin Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999196, '93 North Yorkshire Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999197, '35 Sedaka Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999198, '25 Nicosia Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999199, '86 Borgnine Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999200, '92 Wehrheim Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999201, '23 Boothe Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999202, '25 Puckett Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999205, '99 Tualatin Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999206, '80 Chely Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999207, '86 Pleasure Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999208, '31st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999210, '45 Bend Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999211, '776 Hawke', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999212, '83 Duchovny Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999213, '93 Gibbons Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999215, '72 Schneider Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999216, '74 Owen Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999217, '76 Browne Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999218, '52nd Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999220, '134 Zuerich Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999222, '59 Moraz Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999223, '21 Elias Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999225, '99 Carson City', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999227, '89 Gatlin Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999228, '21st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (543098765, '111 Weizmann St', ' premisson from department head');
insert into LOCATION (phonenumber, address, instructions)
values (544098765, '222 Begin Blvd', ' premisson from company');
insert into LOCATION (phonenumber, address, instructions)
values (545098765, '333 Yefet St', ' premisson from local authorities');
insert into LOCATION (phonenumber, address, instructions)
values (546098765, '444 Derech Hashalom', ' premisson from neighborhood committee');
insert into LOCATION (phonenumber, address, instructions)
values (547098765, '555 Agron St', ' premisson from site coordinator');
insert into LOCATION (phonenumber, address, instructions)
values (549098765, '777 Jabotinsky St', ' premisson from organization head');
commit;
prompt 295 records loaded
prompt Loading ITEM...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (568, 'Medical Needles and Syringes', 'Gloves designed for single use to prevent contamination and infection.', 272, 1, 412, 999999157);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (570, 'Oxygen Tank', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 355, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (571, 'Medical Waste Bins', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 1160, 0, 407, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (572, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 676, 0, 409, 999999114);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (573, 'Disposable Bedpans', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 1072, 0, 403, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (574, 'Alcohol Swabs', 'Blades used for cutting through orthopedic casts during cast removal.', 528, 1, 411, 999999050);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (575, 'Hemostatic Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 183, 1, 416, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (576, 'Ambu Bags', 'Pouches used to hold and sterilize medical instruments and supplies.', 102, 1, 414, 999999108);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (577, 'Defibrillator pads', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 166, 0, 413, 999999251);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (578, 'Disposable Bedpans', 'Catheters used to remove secretions and fluids from the airway.', 1008, 1, 421, 999999061);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (579, 'Nebulizer Mask', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 300, 0, 422, 999999359);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (580, 'Anesthesia Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 190, 1, 413, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (581, 'Nebulizer Mask', 'A type of adhesive tape used to secure dressings or bandages in place.', 1048, 1, 415, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (582, 'Medical Traction Splints', 'Flexible tubes inserted into the bladder to drain urine.', 436, 1, 403, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (583, 'Chest Decompression Needles', 'Devices used to stabilize and support fractured bones externally.', 285, 1, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (584, 'Laryngeal Mask Airways', 'A device used to measure the pressure of the blood in the arteries.', 424, 0, 411, 999999343);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (585, 'Medical Suction Device', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 1464, 0, 415, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (586, 'Cardiac Monitor', 'Tubes used for collecting and storing blood samples for laboratory testing.', 748, 1, 408, 999999025);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (587, 'Pulse Oximeter', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 353, 0, 413, 999999361);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (588, 'Epinephrine Auto-Injector', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 896, 0, 410, 999999049);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (589, 'Orthopedic Splinting Tools', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 311, 1, 413, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (590, 'Pulse Oximeter', 'Medication used to relieve pain.', 948, 1, 408, 999999207);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (591, 'Orthopedic Implants', 'Stretchers designed for use in ambulances for transporting patients.', 1316, 1, 410, 999999043);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (592, 'Disposable Bedpans', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 416, 1, 408, 999999337);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (593, 'Portable Oxygen Concentrators', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 160, 0, 423, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (594, 'Ambu Bags', 'Devices used to stabilize and support fractured bones externally.', 129, 0, 414, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (595, 'Portable Ultrasound Machines', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 192, 1, 418, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (596, 'Medical Gloves', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 83, 0, 422, 999999249);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (597, 'Defibrillator pads', 'A device that measures and displays the electrical activity of the heart.', 1104, 1, 405, 999999150);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (598, 'Ambulance Stretchers', 'A kit containing devices used to establish or maintain a patient''s airway.', 134, 0, 406, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (599, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 584, 0, 412, 999999044);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (394, 'Cardiac Monitor', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 1268, 0, 410, 999999357);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (395, 'Intravenous Drip Stands', 'Devices used to warm intravenous fluids before administration to patients.', 1320, 0, 410, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (396, 'Tracheostomy Tubes', 'A device used to measure the concentration of glucose in the blood.', 380, 1, 419, 999999052);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (397, 'Medical Traction Splints', 'Devices used to warm intravenous fluids before administration to patients.', 90, 1, 419, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (398, 'Orthopedic Internal Fixation Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 588, 1, 407, 999999223);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (399, 'Ambulance Stretchers', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 72, 0, 419, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (400, 'Orthopedic External Fixators', 'A device used to assist or replace spontaneous breathing in patients.', 354, 1, 420, 999999227);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (401, 'Stretcher', 'Needles used for emergency decompression of tension pneumothorax.', 211, 0, 423, 999999125);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (402, 'Cardiac Monitor', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 1016, 0, 421, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (403, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 1288, 1, 421, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (404, 'Laryngoscope', 'A device used to measure the concentration of glucose in the blood.', 1448, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (405, 'Defibrillator pads', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 1040, 0, 410, 999999197);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (406, 'Medical Sterilization Pouches', 'A training device used to simulate the operation of an automated external defibrillator.', 219, 0, 416, 999999004);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (407, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 404, 0, 404, 999999141);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (408, 'Pulse Oximeter', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 948, 1, 415, 999999358);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (409, 'Laryngoscope', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 364, 0, 420, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (410, 'Orthopedic Braces', 'A training device used to simulate the operation of an automated external defibrillator.', 197, 1, 414, 999999271);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (411, 'Glucose Meter', 'Blades used for cutting through orthopedic casts during cast removal.', 327, 0, 418, 999999153);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (412, 'Portable Ventilator', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 300, 0, 419, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (413, 'Medical Waste Bins', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 225, 0, 414, 999999251);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (414, 'Disposable Bedpans', 'Stands used to support bags of intravenous fluids during administration to patients.', 680, 1, 412, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (415, 'Glucose Meter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 289, 0, 419, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (416, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 852, 0, 405, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (417, 'Medical Ventilator Circuits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 932, 1, 410, 999999206);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (418, 'Medical Waste Bins', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 226, 0, 413, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (419, 'Cervical Collar', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 264, 0, 406, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (420, 'First Aid Kit', 'A device inserted through the nose to maintain an open airway.', 176, 1, 416, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (569, 'First Aid Kit', 'A large sterile dressing used to cover extensive wounds or burns.', 432, 1, 410, 999999073);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (449, 'Feeding Tube Extensions', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 860, 1, 408, 999999384);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (450, 'Intravenous Cannulas', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 1544, 1, 410, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (451, 'Portable Oxygen Concentrators', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 940, 1, 408, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (421, 'Orthopedic Internal Fixation Devices', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 120, 1, 406, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (422, 'Cervical Collar', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 728, 0, 408, 999999240);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (423, 'Portable Oxygen Concentrators', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 339, 1, 414, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (424, 'Ambulance Stretchers', 'A dressing used to cover and protect burns.', 149, 1, 423, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (425, 'Nasal Oxygen Cannulas', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 468, 0, 403, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (426, 'Laryngoscope Blades', 'Handheld ultrasound devices used for point-of-care diagnostics.', 936, 1, 415, 999999180);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (427, 'Splinter Forceps', 'A kit containing supplies and equipment for administering basic first aid.', 194, 0, 418, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (428, 'Orthopedic Braces', 'A device used to remove mucus blood or other fluids from the body.', 400, 0, 421, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (429, 'Electrocardiogram (ECG) Machines', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 311, 1, 419, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (430, 'Medical Suction Catheters', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 297, 1, 413, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (431, 'Portable Ultrasound Machines', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 512, 0, 412, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (432, 'Disinfectant Wipes', 'A kit containing devices used to establish or maintain a patient''s airway.', 1032, 0, 417, 999999085);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (433, 'Medical Waste Bins', 'Catheters used to remove secretions and fluids from the airway.', 748, 0, 412, 549098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (434, 'Urinary Catheters', 'A device used to measure the pressure of the blood in the arteries.', 1440, 1, 409, 999999062);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (435, 'Cervical Collar', 'Defibrillators designed for easy transport and use in various settings.', 396, 1, 408, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (436, 'Cardiac Monitor', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 80, 0, 420, 999999071);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (437, 'Nasogastric Tubes', 'A device used to remove mucus blood or other fluids from the body.', 343, 1, 418, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (438, 'Intravenous Cannulas', 'Flexible tubes inserted into the bladder to drain urine.', 784, 0, 421, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (439, 'Backboard', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 309, 0, 406, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (440, 'Tracheostomy Tube Holders', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 820, 0, 415, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (441, 'Disinfectant Wipes', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 90, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (442, 'Blood Pressure Cuff', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 97, 1, 414, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (443, 'Defibrillator pads', 'Devices used to warm intravenous fluids before administration to patients.', 130, 0, 414, 999999074);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (444, 'Disposable Syringes', 'A dressing used to cover and protect burns.', 129, 0, 420, 999999153);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (445, 'Medical Cast Saw Blades', 'Scales used to measure the weight of patients.', 800, 1, 417, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (446, 'Oxygen Tank', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 1160, 1, 415, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (447, 'Intravenous Infusion Pumps', 'Defibrillators designed for easy transport and use in various settings.', 264, 0, 406, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (448, 'Disposable Gloves', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 832, 0, 417, 999999104);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (333, 'Blood Collection Tubes', 'Stretchers designed for use in ambulances for transporting patients.', 107, 0, 422, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (452, 'Medical Feeding Pumps', 'Gloves designed for single use to prevent contamination and infection.', 1464, 0, 410, 999999306);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (453, 'IV Start Kit', 'Devices used to stabilize and support fractured bones externally.', 246, 1, 419, 999999134);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (454, 'Orthopedic Implants', 'A mask used to deliver aerosolized medication to the lungs.', 170, 0, 419, 999999353);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (455, 'Nebulizer Mask', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 1428, 1, 410, 999999186);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (456, 'IV Start Kit', 'A device used to remove mucus blood or other fluids from the body.', 588, 1, 409, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (457, 'Chest Decompression Needles', 'Blades used for cutting through orthopedic casts during cast removal.', 1220, 1, 403, 999999343);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (458, 'Disinfectant Wipes', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 77, 1, 419, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (459, 'Tracheostomy Tubes', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 256, 0, 416, 999999315);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (460, 'Nasopharyngeal Airway', 'A medical instrument used to view the inside of the throat and larynx.', 124, 0, 419, 999999070);
commit;
prompt 100 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (461, 'AED Training Unit', 'A kit containing supplies and equipment for administering basic first aid.', 656, 0, 403, 999999298);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (462, 'Disposable Bedpans', 'A device used to remove mucus blood or other fluids from the body.', 1476, 0, 417, 999999037);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (463, 'Laryngoscope Blades', 'Needles used for injections or drawing blood samples.', 880, 1, 404, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (464, 'Epinephrine Auto-Injector', 'Devices specifically designed for managing pediatric airways during resuscitation.', 1312, 0, 407, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (465, 'Orthopedic Implants', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 1540, 0, 403, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (466, 'Orthopedic Splinting Materials', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 332, 0, 420, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (467, 'Enteral Feeding Tubes', 'A type of adhesive tape used to secure dressings or bandages in place.', 372, 1, 415, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (468, 'Electrocardiogram (ECG) Machines', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 1504, 0, 403, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (469, 'Backboard', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 227, 0, 416, 999999196);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (470, 'Feeding Tube Extensions', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 142, 1, 406, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (471, 'Nasogastric Tubes', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 340, 1, 414, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (472, 'Electrocardiogram (ECG) Machines', 'Pouches used to hold and sterilize medical instruments and supplies.', 1056, 0, 403, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (473, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 375, 1, 420, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (474, 'Neck Brace', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 100, 0, 423, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (475, 'Orthopedic Splinting Tools', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 1248, 1, 403, 999999304);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (476, 'Oxygen Tank', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 195, 1, 413, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (477, 'Medical Oxygen Masks', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 928, 0, 407, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (478, 'Stretcher', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 892, 1, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (479, 'Orthopedic Traction Devices', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1400, 1, 407, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (480, 'Disinfectant Wipes', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 404, 1, 412, 546098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (481, 'Tracheostomy Tubes', 'Devices used to stabilize and support fractured bones externally.', 1412, 0, 407, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (482, 'Medical Scales', 'A device used to measure the oxygen saturation of the blood.', 748, 1, 408, 999999218);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (483, 'Laryngeal Mask Airways', 'Tourniquets used to control severe bleeding from extremity wounds.', 368, 1, 405, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (484, 'Suture Kit', 'A medical instrument used to view the inside of the throat and larynx.', 166, 1, 423, 999999097);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (485, 'Portable Defibrillators', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 440, 1, 408, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (486, 'Portable Ultrasound Machines', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 279, 0, 420, 999999334);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (487, 'IV Start Kit', 'Materials used to immobilize and support fractures or injuries.', 284, 0, 423, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (488, 'Intravenous Cannulas', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 120, 1, 418, 999999182);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (489, 'Nebulizer', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 668, 0, 410, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (490, 'Defibrillator pads', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 386, 1, 422, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (491, 'Tracheostomy Tube Holders', 'Thin tubes inserted into veins to administer fluids or medication.', 564, 0, 421, 999999096);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (492, 'Backboard', 'Defibrillators designed for easy transport and use in various settings.', 688, 0, 408, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (493, 'Enteral Feeding Tubes', 'A dressing used to cover and protect burns.', 756, 0, 409, 999999252);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (494, 'Blood Pressure Cuff', 'Devices used to warm intravenous fluids before administration to patients.', 334, 1, 420, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (495, 'Neck Brace', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 752, 1, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (496, 'Orthopedic Tourniquet Systems', 'Devices used to warm intravenous fluids before administration to patients.', 213, 1, 416, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (497, 'Airway Kit', 'Gloves designed for single use to prevent contamination and infection.', 1448, 0, 408, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (498, 'Medical Tape', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 948, 0, 411, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (499, 'Pediatric Airway Management Devices', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 1292, 0, 405, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (500, 'Electrocardiogram (ECG) Machines', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 656, 1, 403, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (501, 'Orthopedic Tourniquet Systems', 'A device used to measure the concentration of glucose in the blood.', 556, 1, 409, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (502, 'Ambu Bags', 'Gloves designed for single use to prevent contamination and infection.', 215, 1, 414, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (503, 'Orthopedic Cast', 'A dressing designed to promote blood clotting and control bleeding.', 386, 0, 420, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (504, 'Diagnostic Kits', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 992, 1, 410, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (505, 'Intravenous Infusion Pumps', 'A tank containing compressed oxygen for medical use.', 134, 1, 423, 999999389);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (506, 'Orthopedic Casting Materials', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 508, 1, 421, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (507, 'Orthopedic Splinting Materials', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 251, 0, 423, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (508, 'IV Start Kit', 'A device used for immobilizing a fractured or injured bone.', 259, 0, 419, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (509, 'Orthopedic Splinting Tools', 'Stands used to support bags of intravenous fluids during administration to patients.', 239, 0, 423, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (510, 'Medical Traction Splints', 'A kit containing supplies and equipment for administering basic first aid.', 317, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (511, 'Orthopedic External Fixators', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 196, 0, 423, 999999183);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (512, 'Splint', 'A device used to measure the pressure of the blood in the arteries.', 964, 1, 403, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (513, 'Cardiac Monitor', 'A kit containing instruments and materials for suturing wounds.', 245, 1, 422, 999999319);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (514, 'Laryngoscope', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 272, 1, 410, 999999045);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (515, 'Blood Collection Tubes', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 888, 1, 407, 999999064);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (516, 'IV Fluid Warmers', 'Braces used to support and stabilize joints or limbs.', 186, 0, 413, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (517, 'Orthopedic Casting Materials', 'A large sterile dressing used to cover extensive wounds or burns.', 1260, 0, 404, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (518, 'Orthopedic Tourniquet Systems', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 1512, 0, 415, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (519, 'Oxygen Tank', 'Handheld devices used to measure blood pressure in clinical or home settings.', 1412, 0, 405, 543098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (520, 'Medical Cast Saw Blades', 'Thin tubes inserted into veins to administer fluids or medication.', 94, 1, 420, 999999271);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (521, 'Medical Suction Device', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 1268, 1, 407, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (522, 'Burn Dressing', 'Braces used to support and stabilize joints or limbs.', 528, 1, 408, 999999065);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (523, 'Blood Collection Tubes', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 652, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (524, 'Ambu Bags', 'A dressing used to cover and protect burns.', 1512, 0, 411, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (525, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1376, 1, 415, 999999352);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (526, 'IV Start Kit', 'A portable bed or litter for transporting patients.', 996, 0, 405, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (527, 'Nasal Oxygen Cannulas', 'Implants used to stabilize or repair fractured or damaged bones.', 1148, 0, 408, 999999194);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (528, 'Medical Tourniquets', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 1212, 1, 417, 999999235);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (529, 'Blood Pressure Cuff', 'Stretchers designed for use in ambulances for transporting patients.', 178, 0, 423, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (530, 'Portable Ultrasound Machines', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 896, 0, 410, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (531, 'Medical Tape', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 900, 0, 411, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (532, 'Tracheostomy Tubes', 'Medication used to relieve pain.', 372, 0, 404, 999999303);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (533, 'Intravenous Administration Sets', 'A sterile solution of salt in water used for various medical purposes.', 248, 1, 411, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (534, 'Orthopedic Splinting Materials', 'A dressing used to cover and protect burns.', 1312, 1, 408, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (535, 'Tracheostomy Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 61, 0, 419, 999999143);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (536, 'First Aid Kit', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 146, 0, 406, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (537, 'Ambu Bags', 'A device used to measure the pressure of the blood in the arteries.', 351, 0, 416, 999999342);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (538, 'Orthopedic Boots', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 183, 1, 416, 999999373);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (539, 'Hypodermic Needles', 'Forceps designed for removing splinters or foreign objects from the skin.', 260, 0, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (540, 'Nasal Oxygen Cannulas', 'A mask used to deliver aerosolized medication to the lungs.', 165, 1, 422, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (541, 'Feeding Tube Extensions', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 892, 1, 405, 999999051);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (542, 'Medical Gloves', 'Strips used with a glucose meter to test the level of glucose in the blood.', 1348, 0, 404, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (543, 'Medical Suction Device', 'A device that measures and displays the electrical activity of the heart.', 137, 0, 422, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (544, 'Portable Blood Pressure Monitors', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 276, 0, 403, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (545, 'Tracheostomy Tubes', 'A kit containing supplies and equipment for administering basic first aid.', 936, 0, 409, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (546, 'Cardiac Defibrillator Training Units', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 876, 1, 403, 999999382);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (547, 'Stretcher', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 107, 1, 406, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (548, 'Medical Oxygen Masks', 'A tank containing compressed oxygen for medical use.', 500, 0, 405, 999999246);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (549, 'Medical Cast Saw Blades', 'A training device used to simulate the operation of an automated external defibrillator.', 220, 0, 420, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (550, 'Medical Tape', 'Sets of needles and syringes used for injections or aspirations.', 356, 0, 412, 999999091);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (551, 'Medical Oxygen Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 880, 1, 417, 999999123);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (552, 'Orthopedic External Fixators', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 824, 1, 410, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (553, 'Orthopedic Casting Materials', 'Medication used to relieve pain.', 496, 1, 403, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (554, 'Epinephrine Auto-Injector', 'Handheld devices used to measure blood pressure in clinical or home settings.', 1416, 1, 405, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (555, 'Laryngeal Mask Airways', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 608, 0, 412, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (556, 'Hypodermic Needles', 'A device used to remove mucus blood or other fluids from the body.', 1180, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (557, 'Diagnostic Kits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 343, 0, 406, 999999285);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (558, 'Orthopedic Tourniquet Systems', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 1012, 1, 403, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (559, 'Intravenous Cannulas', 'A type of adhesive tape used to secure dressings or bandages in place.', 776, 1, 415, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (560, 'Laryngoscope Blades', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 324, 0, 407, 999999300);
commit;
prompt 200 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (561, 'Disposable Syringes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 1120, 1, 404, 999999127);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (562, 'Medical Waste Bins', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 194, 0, 406, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (563, 'Medical Tape', 'A device that measures and displays the electrical activity of the heart.', 1252, 0, 408, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (564, 'Laryngoscope', 'Defibrillators designed for easy transport and use in various settings.', 236, 1, 413, 999999296);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (565, 'Oxygen Mask', 'Tubes used for collecting and storing blood samples for laboratory testing.', 390, 1, 416, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (566, 'Orthopedic Splint', 'A sterile solution of salt in water used for various medical purposes.', 572, 0, 421, 999999046);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (567, 'Orthopedic Splinting Tools', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 386, 1, 414, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (363, 'Medical Tape', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 1516, 1, 405, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (364, 'Medical Tourniquets', 'Training devices used to simulate the operation of cardiac defibrillators.', 1336, 1, 421, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (365, 'Ambu Bags', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 1468, 0, 415, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (366, 'Intravenous Catheter', 'Needles used for injections or drawing blood samples.', 359, 0, 406, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (367, 'Medical Tape', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 293, 1, 406, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (368, 'Medical Waste Bins', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1556, 1, 412, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (369, 'Urinary Catheters', 'A kit containing instruments and materials for suturing wounds.', 1280, 0, 409, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (370, 'Splint', 'Scales used to measure the weight of patients.', 362, 1, 419, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (371, 'Cardiac Monitor', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 668, 0, 410, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (372, 'Intravenous Infusion Pumps', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 148, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (373, 'Pediatric Airway Management Devices', 'Devices used to warm intravenous fluids before administration to patients.', 644, 0, 412, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (374, 'Blood Collection Tubes', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 134, 0, 416, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (375, 'Orthopedic Walker', 'Implants used to stabilize or repair fractured or damaged bones.', 266, 1, 423, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (376, 'Nebulizer', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 279, 0, 420, 999999349);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (377, 'Suture Kit', 'Thin tubes inserted into veins to administer fluids or medication.', 1512, 1, 403, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (378, 'Nasopharyngeal Airway', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 230, 1, 406, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (379, 'Cervical Collar', 'Disposable containers used for collecting urine and feces from bedridden patients.', 286, 1, 423, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (380, 'Blood Glucose Test Strips', 'A device used to measure the concentration of glucose in the blood.', 366, 0, 418, 999999375);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (381, 'IV Fluid Warmers', 'Stands used to support bags of intravenous fluids during administration to patients.', 556, 1, 405, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (382, 'Medical Suction Catheters', 'Stands used to support bags of intravenous fluids during administration to patients.', 1060, 1, 410, 999999136);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (383, 'Intravenous Cannulas', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 1180, 0, 404, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (384, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 178, 1, 416, 999999124);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (385, 'Oxygen Mask', 'Stretchers designed for use in ambulances for transporting patients.', 916, 0, 407, 541098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (386, 'Pediatric Airway Management Devices', 'Handheld devices used to measure blood pressure in clinical or home settings.', 344, 1, 419, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (387, 'Splinting Materials', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 202, 0, 418, 999999294);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (388, 'Oxygen Tank', 'Boots designed to immobilize and protect the foot and ankle.', 126, 1, 423, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (389, 'Medical Tape', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 832, 0, 408, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (390, 'Pressure Infusion Bags', 'Sets of needles and syringes used for injections or aspirations.', 788, 1, 410, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (391, 'Portable Defibrillators', 'Tourniquets used to control severe bleeding from extremity wounds.', 312, 0, 405, 999999299);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (392, 'Stretcher', 'A device used to measure the pressure of the blood in the arteries.', 274, 0, 413, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (334, 'Disinfectant Wipes', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 524, 0, 421, 999999346);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (335, 'Orthopedic Walker', 'Devices used to stabilize and support fractured bones externally.', 484, 0, 407, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (336, 'Airway Kit', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 884, 0, 417, 999999263);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (337, 'Stretcher', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 131, 1, 413, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (338, 'Nebulizer Mask', 'Medication used to relieve pain.', 122, 1, 413, 999999280);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (339, 'Pressure Infusion Bags', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 113, 1, 423, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (340, 'Nebulizer Mask', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 140, 0, 416, 999999217);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (341, 'Multi-Trauma Dressing', 'Stands used to support bags of intravenous fluids during administration to patients.', 1256, 0, 405, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (342, 'Cardiac Defibrillator Training Units', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 1112, 1, 411, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (343, 'Portable Ventilator', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 117, 1, 419, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (344, 'Disposable Bedpans', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 1320, 1, 411, 999999326);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (345, 'AED Training Unit', 'A kit containing devices used to establish or maintain a patient''s airway.', 1552, 0, 421, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (346, 'Orthopedic Walker', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 436, 0, 421, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (347, 'First Aid Kit', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 137, 1, 422, 999999058);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (348, 'Pulse Oximeter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 284, 0, 405, 999999185);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (349, 'Medical Suction Canisters', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 760, 0, 404, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (350, 'Laryngoscope', 'A kit containing instruments and materials for suturing wounds.', 124, 0, 418, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (351, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 928, 0, 412, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (352, 'Nebulizer', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 248, 0, 406, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (353, 'Blood Pressure Cuff', 'Handheld ultrasound devices used for point-of-care diagnostics.', 432, 0, 415, 999999216);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (354, 'Medical Feeding Pumps', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 136, 1, 416, 999999170);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (355, 'Multi-Trauma Dressing', 'A device used to measure the concentration of glucose in the blood.', 156, 0, 423, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (356, 'Disinfectant Wipes', 'Medication used to relieve pain.', 245, 1, 422, 999999228);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (357, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 288, 0, 405, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (358, 'Hemostatic Dressing', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 716, 1, 411, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (359, 'Cervical Collar', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 167, 1, 420, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (360, 'Splint', 'A device used to measure the oxygen saturation of the blood.', 150, 0, 418, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (361, 'Saline Solution', 'Scales used to measure the weight of patients.', 1496, 0, 409, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (362, 'Glucose Meter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 784, 0, 412, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (393, 'First Aid Kit', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 276, 1, 410, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (4, 'Oxygen Mask', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 120, 0, 403, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (218, 'Medical Ventilator Circuits', 'A device used to assist or replace spontaneous breathing in patients.', 240, 0, 414, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (219, 'Tracheostomy Tube Holders', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 1000, 0, 409, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (220, 'Tourniquet', 'A dressing used to cover and protect burns.', 1212, 0, 407, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (221, 'Portable Defibrillators', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 312, 0, 423, 999999261);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (222, 'First Aid Kit', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 206, 0, 414, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (223, 'Medical Sterilization Pouches', 'A device that measures and displays the electrical activity of the heart.', 242, 0, 423, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (224, 'Suture Kit', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 119, 0, 413, 999999347);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (225, 'Defibrillator pads', 'Strips used with a glucose meter to test the level of glucose in the blood.', 492, 0, 409, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (226, 'Laryngeal Mask Airways', 'Syringes designed for single use to administer medication or draw blood.', 198, 0, 418, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (227, 'Hemostatic Dressing', 'A device used to remove mucus blood or other fluids from the body.', 824, 0, 409, 999999362);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (228, 'Nebulizer', 'Needles used for injections or drawing blood samples.', 263, 1, 420, 999999055);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (229, 'Feeding Tube Extensions', 'Defibrillators designed for easy transport and use in various settings.', 324, 0, 404, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (230, 'Orthopedic External Fixators', 'A type of adhesive tape used to secure dressings or bandages in place.', 1272, 0, 417, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (231, 'Hypodermic Needles', 'Scales used to measure the weight of patients.', 984, 0, 404, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (232, 'Intravenous Catheter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 992, 1, 403, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (233, 'Disinfectant Wipes', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 104, 0, 420, 999999279);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (234, 'Laryngeal Mask Airways', 'Gloves designed for single use to prevent contamination and infection.', 326, 1, 418, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (235, 'Enteral Feeding Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 1528, 1, 407, 999999363);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (236, 'Portable Defibrillators', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 196, 0, 406, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (237, 'Pulse Oximeter', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 904, 1, 411, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (238, 'Burn Dressing', 'A device used to measure the pressure of the blood in the arteries.', 309, 0, 413, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (239, 'Medical Feeding Pumps', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 166, 0, 416, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (240, 'Orthopedic Walker', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 1120, 1, 409, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (241, 'Nasogastric Tubes', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 552, 0, 411, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (242, 'IV Fluid Warmers', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 812, 0, 410, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (243, 'Splinter Forceps', 'Braces used to support and stabilize joints or limbs.', 1200, 0, 403, 999999075);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (244, 'Chest Seal', 'Stretchers designed for use in ambulances for transporting patients.', 1316, 0, 421, 999999168);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (245, 'Neck Brace', 'Boots designed to immobilize and protect the foot and ankle.', 242, 0, 416, 999999241);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (246, 'Urinary Catheters', 'Materials used to immobilize and support fractures or injuries.', 308, 0, 408, 999999285);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (247, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 130, 1, 416, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (248, 'Cardiac Monitor', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 144, 1, 413, 999999341);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (249, 'IV Start Kit', 'A device used to measure the oxygen saturation of the blood.', 239, 0, 420, 999999114);
commit;
prompt 300 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (250, 'Medical Feeding Pumps', 'Devices used to stabilize and support fractured bones externally.', 760, 0, 409, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (251, 'Intravenous Administration Sets', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 896, 0, 405, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (252, 'Medical Ventilator Circuits', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 1268, 1, 412, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (253, 'Burn Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 920, 0, 407, 999999174);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (254, 'Anesthesia Masks', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 356, 0, 409, 999999195);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (255, 'Tracheostomy Care Kits', 'Stands used to support bags of intravenous fluids during administration to patients.', 260, 1, 415, 999999156);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (256, 'Epinephrine Auto-Injector', 'Medication used to relieve pain.', 153, 0, 419, 999999268);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (257, 'Intravenous Catheter', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 1336, 0, 408, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (258, 'Portable Blood Pressure Monitors', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 370, 1, 423, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (259, 'Urinary Catheters', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 440, 1, 412, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (260, 'Disinfectant Wipes', 'Handheld ultrasound devices used for point-of-care diagnostics.', 359, 1, 419, 999999312);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (261, 'Cervical Collar', 'Devices used to warm intravenous fluids before administration to patients.', 173, 1, 414, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (262, 'Splint', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 628, 0, 412, 999999266);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (263, 'Orthopedic Boots', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 108, 0, 418, 999999254);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (264, 'Medical Tourniquets', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 464, 1, 408, 999999076);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (265, 'Splint', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 196, 1, 414, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (266, 'Orthopedic Splinting Tools', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 908, 0, 410, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (267, 'Stretcher', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 820, 0, 421, 546789012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (268, 'Urinary Catheters', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 134, 1, 406, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (269, 'Chest Decompression Needles', 'Pouches used to hold and sterilize medical instruments and supplies.', 812, 1, 412, 999999092);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (270, 'Medical Waste Bins', 'Tourniquets used to control severe bleeding from extremity wounds.', 812, 1, 421, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (271, 'Orthopedic Braces', 'A device used to measure the concentration of glucose in the blood.', 1248, 1, 409, 999999269);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (272, 'Intravenous Cannulas', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 412, 1, 421, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (273, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 1532, 1, 412, 999999139);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (274, 'Cardiac Defibrillator Training Units', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 268, 1, 417, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (275, 'Cardiac Defibrillator Training Units', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 1280, 1, 412, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (276, 'Nebulizer Mask', 'A device used to remove mucus blood or other fluids from the body.', 524, 1, 403, 999999213);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (277, 'Medical Gloves', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 844, 1, 411, 999999192);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (278, 'Medical Suction Canisters', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 1468, 0, 405, 999999274);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (279, 'Medical Sterilization Pouches', 'A device used to remove mucus blood or other fluids from the body.', 672, 1, 404, 544098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (280, 'Cardiac Defibrillator Training Units', 'A device used to assist or replace spontaneous breathing in patients.', 884, 0, 403, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (281, 'Oxygen Mask', 'Devices specifically designed for managing pediatric airways during resuscitation.', 744, 1, 408, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (282, 'Medical Suction Canisters', 'A device used to assist or replace spontaneous breathing in patients.', 540, 0, 410, 999999273);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (283, 'Medical Ventilator Circuits', 'Stretchers designed for use in ambulances for transporting patients.', 102, 1, 418, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (284, 'Oxygen Tank', 'Handheld ultrasound devices used for point-of-care diagnostics.', 97, 0, 420, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (285, 'Suture Kit', 'Catheters used to remove secretions and fluids from the airway.', 448, 0, 421, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (286, 'Orthopedic Splinting Tools', 'A device inserted through the nose to maintain an open airway.', 452, 0, 417, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (287, 'Medical Feeding Pumps', 'A training device used to simulate the operation of an automated external defibrillator.', 496, 1, 408, 999999177);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (288, 'Intravenous Infusion Pumps', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 1520, 0, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (289, 'Medical Feeding Pumps', 'A device inserted through the nose to maintain an open airway.', 214, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (290, 'Hypodermic Needles', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 381, 1, 419, 999999126);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (291, 'Portable Oxygen Concentrators', 'A sterile solution of salt in water used for various medical purposes.', 1172, 1, 405, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (292, 'Tourniquet', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 134, 0, 418, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (293, 'Pediatric Airway Management Devices', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 118, 1, 414, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (294, 'First Aid Kit', 'Defibrillators designed for easy transport and use in various settings.', 318, 1, 423, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (295, 'Medical Suction Canisters', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 836, 0, 407, 999999364);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (296, 'Hypodermic Needles', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 70, 0, 414, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (297, 'CPR Mask', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 346, 1, 413, 999999243);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (298, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 952, 0, 403, 999999293);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (299, 'Stretcher', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 1420, 1, 408, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (300, 'Defibrillator pads', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 138, 1, 413, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (301, 'Medical Suction Canisters', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 343, 1, 420, 999999374);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (302, 'Intravenous Cannulas', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 280, 1, 404, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (303, 'Electrocardiogram (ECG) Machines', 'Needles used for emergency decompression of tension pneumothorax.', 1180, 1, 415, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (304, 'Disposable Bedpans', 'Braces used to support and stabilize joints or limbs.', 118, 1, 422, 548901234);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (305, 'Cardiac Monitor', 'Gloves designed for single use to prevent contamination and infection.', 336, 0, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (306, 'Defibrillator pads', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 376, 0, 420, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (307, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 1560, 0, 404, 999999035);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (308, 'Pulse Oximeter', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 952, 1, 411, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (309, 'Adhesive Bandages', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 304, 0, 421, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (310, 'Orthopedic Casting Materials', 'Flexible tubes inserted into the bladder to drain urine.', 78, 0, 414, 999999095);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (311, 'Disinfectant Wipes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 369, 0, 416, 999999144);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (312, 'Enteral Feeding Tubes', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 580, 0, 415, 999999132);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (313, 'Pulse Oximeter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 146, 0, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (314, 'Medical Cast Saw Blades', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 648, 0, 408, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (315, 'Splinting Materials', 'Syringes designed for single use to administer medication or draw blood.', 352, 0, 412, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (316, 'Nebulizer Mask', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 233, 1, 420, 999999148);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (317, 'Burn Dressing', 'Pouches used to hold and sterilize medical instruments and supplies.', 1496, 1, 408, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (318, 'Neck Brace', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 504, 1, 407, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (319, 'Laryngeal Mask Airways', 'Devices specifically designed for managing pediatric airways during resuscitation.', 544, 0, 415, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (320, 'Tourniquet', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 322, 1, 423, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (321, 'Hemostatic Dressing', 'Sets of needles and syringes used for injections or aspirations.', 190, 0, 416, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (322, 'Feeding Tube Extensions', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 296, 0, 417, 999999230);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (323, 'Portable Ventilator', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 1264, 1, 408, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (324, 'Electrocardiogram (ECG) Machines', 'Braces used to support and stabilize joints or limbs.', 362, 0, 406, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (325, 'First Aid Kit', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 1412, 1, 403, 999999253);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (326, 'Laryngoscope Blades', 'A device that measures and displays the electrical activity of the heart.', 704, 1, 403, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (327, 'Intravenous Cannulas', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 289, 1, 419, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (328, 'Intravenous Catheter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 150, 1, 422, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (329, 'Disposable Gloves', 'Implants used to stabilize or repair fractured or damaged bones.', 1360, 0, 412, 999999220);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (330, 'Orthopedic Walker', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 628, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (331, 'Blood Pressure Cuff', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 166, 1, 418, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (332, 'Intravenous Cannulas', 'Stretchers designed for use in ambulances for transporting patients.', 77, 0, 420, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (6, 'Cardiac Monitor', 'A device that measures and displays the electrical activity of the heart.', 192, 0, 405, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (8, 'Backboard', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 176, 0, 407, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (9, 'Splint', 'A device used for immobilizing a fractured or injured bone.', 112, 1, 408, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (10, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 140, 0, 409, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (11, 'Neck Brace', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 136, 1, 410, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (12, 'Nebulizer', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 112, 0, 411, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (14, 'Blood Pressure Cuff', 'A device used to measure the pressure of the blood in the arteries.', 32, 0, 413, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (15, 'Suture Kit', 'A kit containing instruments and materials for suturing wounds.', 11, 1, 414, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (16, 'Orthopedic Splint', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 152, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (17, 'Glucose Meter', 'A device used to measure the concentration of glucose in the blood.', 18, 1, 416, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (18, 'Epinephrine Auto-Injector', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 112, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (19, 'Burn Dressing', 'A dressing used to cover and protect burns.', 46, 1, 418, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (20, 'Defibrillator pads', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 13, 0, 419, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (21, 'Oxygen Tank', 'A tank containing compressed oxygen for medical use.', 24, 1, 420, 999999110);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (22, 'Airway Kit', 'A kit containing devices used to establish or maintain a patient''s airway.', 168, 0, 421, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (24, 'Pulse Oximeter', 'A device used to measure the oxygen saturation of the blood.', 52, 0, 423, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (28, 'Nasopharyngeal Airway', 'A device inserted through the nose to maintain an open airway.', 132, 0, 403, 999999099);
commit;
prompt 400 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (29, 'Medical Gloves', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 152, 1, 404, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (30, 'Adhesive Bandages', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 136, 0, 405, 999999080);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (31, 'Saline Solution', 'A sterile solution of salt in water used for various medical purposes.', 72, 1, 406, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (32, 'Cervical Collar', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 156, 0, 407, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (33, 'Multi-Trauma Dressing', 'A large sterile dressing used to cover extensive wounds or burns.', 168, 1, 408, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (34, 'Nebulizer Mask', 'A mask used to deliver aerosolized medication to the lungs.', 116, 0, 409, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (35, 'Stretcher', 'A portable bed or litter for transporting patients.', 172, 1, 410, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (36, 'CPR Mask', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 108, 0, 411, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (37, 'First Aid Kit', 'A kit containing supplies and equipment for administering basic first aid.', 184, 1, 412, 999999321);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (38, 'Blood Collection Tubes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 82, 0, 413, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (39, 'Disposable Syringes', 'Syringes designed for single use to administer medication or draw blood.', 44, 1, 414, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (40, 'Medical Tape', 'A type of adhesive tape used to secure dressings or bandages in place.', 180, 0, 415, 999999222);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (41, 'AED Training Unit', 'A training device used to simulate the operation of an automated external defibrillator.', 96, 1, 416, 999999129);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (42, 'Intravenous Catheter', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 188, 0, 417, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (43, 'Splinting Materials', 'Materials used to immobilize and support fractures or injuries.', 98, 1, 418, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (44, 'Blood Glucose Test Strips', 'Strips used with a glucose meter to test the level of glucose in the blood.', 50, 0, 419, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (45, 'Medical Suction Device', 'A device used to remove mucus blood or other fluids from the body.', 53, 1, 420, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (46, 'Chest Seal', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 204, 0, 421, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (47, 'Orthopedic Cast', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 54, 1, 422, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (48, 'Alcohol Swabs', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 110, 0, 423, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (52, 'Splinter Forceps', 'Forceps designed for removing splinters or foreign objects from the skin.', 236, 0, 403, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (53, 'IV Start Kit', 'A kit containing supplies for starting intravenous lines.', 232, 1, 404, 999999123);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (54, 'Portable Ventilator', 'A device used to assist or replace spontaneous breathing in patients.', 244, 0, 405, 999999178);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (55, 'Analgesic Medication', 'Medication used to relieve pain.', 120, 1, 406, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (56, 'Hemostatic Dressing', 'A dressing designed to promote blood clotting and control bleeding.', 252, 0, 407, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (57, 'Laryngoscope', 'A medical instrument used to view the inside of the throat and larynx.', 248, 1, 408, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (58, 'Orthopedic Boots', 'Boots designed to immobilize and protect the foot and ankle.', 260, 0, 409, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (59, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 256, 1, 410, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (60, 'Disposable Gloves', 'Gloves designed for single use to prevent contamination and infection.', 268, 0, 411, 999999191);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (61, 'Orthopedic Walker', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 264, 1, 412, 999999212);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (62, 'IV Fluid Warmers', 'Devices used to warm intravenous fluids before administration to patients.', 138, 0, 413, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (63, 'Rescue Breathing Masks', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 68, 1, 414, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (64, 'Disinfectant Wipes', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 284, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (65, 'Diagnostic Kits', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 140, 1, 416, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (66, 'Portable Ultrasound Machines', 'Handheld ultrasound devices used for point-of-care diagnostics.', 292, 0, 417, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (67, 'Cardiac Defibrillator Training Units', 'Training devices used to simulate the operation of cardiac defibrillators.', 144, 1, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (68, 'Nasogastric Tubes', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 75, 0, 419, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (69, 'Orthopedic Splinting Materials', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 74, 1, 420, 999999103);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (70, 'Laryngeal Mask Airways', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 308, 0, 421, 999999345);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (71, 'Ambu Bags', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 76, 1, 422, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (72, 'Hypodermic Needles', 'Needles used for injections or drawing blood samples.', 158, 0, 423, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (76, 'Medical Tourniquets', 'Tourniquets used to control severe bleeding from extremity wounds.', 332, 0, 403, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (77, 'Intravenous Cannulas', 'Thin tubes inserted into veins to administer fluids or medication.', 328, 1, 404, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (78, 'Tracheostomy Tubes', 'Tubes inserted into a surgically created opening in the trachea to assist breathing.', 340, 0, 405, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (79, 'Portable Oxygen Concentrators', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 168, 1, 406, 999999007);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (80, 'Electrocardiogram (ECG) Machines', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 348, 0, 407, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (81, 'Medical Scales', 'Scales used to measure the weight of patients.', 344, 1, 408, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (82, 'Pediatric Airway Management Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 356, 0, 409, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (83, 'Medical Suction Catheters', 'Catheters used to remove secretions and fluids from the airway.', 352, 1, 410, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (84, 'Orthopedic Casting Materials', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 364, 0, 411, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (85, 'Nasal Oxygen Cannulas', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 360, 1, 412, 999999232);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (87, 'Ambulance Stretchers', 'Stretchers designed for use in ambulances for transporting patients.', 92, 1, 414, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (88, 'Intravenous Drip Stands', 'Stands used to support bags of intravenous fluids during administration to patients.', 380, 0, 415, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (89, 'Medical Ventilator Circuits', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 188, 1, 416, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (90, 'Orthopedic Splinting Tools', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 388, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (91, 'Medical Needles and Syringes', 'Sets of needles and syringes used for injections or aspirations.', 192, 1, 418, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (92, 'Portable Blood Pressure Monitors', 'Handheld devices used to measure blood pressure in clinical or home settings.', 99, 0, 419, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (93, 'Enteral Feeding Tubes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 98, 1, 420, 999999012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (94, 'Medical Oxygen Masks', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 404, 0, 421, 999999370);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (95, 'Chest Decompression Needles', 'Needles used for emergency decompression of tension pneumothorax.', 100, 1, 422, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (96, 'Intravenous Infusion Pumps', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 103, 0, 423, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (101, 'Portable Defibrillators', 'Defibrillators designed for easy transport and use in various settings.', 424, 1, 404, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (102, 'Disposable Bedpans', 'Disposable containers used for collecting urine and feces from bedridden patients.', 436, 0, 405, 999999089);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (103, 'Orthopedic External Fixators', 'Devices used to stabilize and support fractured bones externally.', 108, 1, 406, 999999060);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (104, 'Medical Cast Saw Blades', 'Blades used for cutting through orthopedic casts during cast removal.', 444, 0, 407, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (105, 'Medical Feeding Pumps', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 440, 1, 408, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (106, 'Pressure Infusion Bags', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 452, 0, 409, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (107, 'Laryngoscope Blades', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 448, 1, 410, 999999098);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (108, 'Orthopedic Traction Devices', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 460, 0, 411, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (110, 'Urinary Catheters', 'Flexible tubes inserted into the bladder to drain urine.', 117, 0, 413, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (111, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 116, 1, 414, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (112, 'Anesthesia Masks', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 476, 0, 415, 999999117);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (113, 'Orthopedic Implants', 'Implants used to stabilize or repair fractured or damaged bones.', 118, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (114, 'Medical Traction Splints', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 484, 0, 417, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (115, 'Feeding Tube Extensions', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 120, 1, 418, 999999120);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (116, 'Tracheostomy Care Kits', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 123, 0, 419, 999999032);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (117, 'Medical Suction Canisters', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 122, 1, 420, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (118, 'Orthopedic Tourniquet Systems', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 500, 0, 421, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (124, 'Medical Waste Bins', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 524, 0, 403, 999999027);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (125, 'Tracheostomy Tube Holders', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 520, 1, 404, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (127, 'Orthopedic Internal Fixation Devices', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 132, 1, 406, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (128, 'Intravenous Administration Sets', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 540, 0, 407, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (200, 'Oxygen Tank', 'A kit containing supplies and equipment for administering basic first aid.', 260, 0, 421, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (201, 'Tracheostomy Tubes', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 368, 0, 422, 999999330);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (202, 'Intravenous Cannulas', 'Needles used for injections or drawing blood samples.', 160, 0, 418, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (203, 'Medical Needles and Syringes', 'Devices specifically designed for managing pediatric airways during resuscitation.', 126, 1, 423, 999999379);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (204, 'Epinephrine Auto-Injector', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 145, 1, 406, 999999351);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (205, 'Orthopedic External Fixators', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1464, 1, 411, 999999305);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (206, 'Tracheostomy Care Kits', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 992, 1, 412, 999999083);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (207, 'Feeding Tube Extensions', 'Materials used to immobilize and support fractures or injuries.', 261, 0, 423, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (208, 'Tracheostomy Tubes', 'A device used for immobilizing a fractured or injured bone.', 700, 0, 412, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (209, 'Pressure Infusion Bags', 'A medical instrument used to view the inside of the throat and larynx.', 832, 0, 415, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (210, 'Blood Collection Tubes', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 888, 0, 410, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (211, 'Intravenous Administration Sets', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 584, 1, 403, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (212, 'Medical Suction Catheters', 'Defibrillators designed for easy transport and use in various settings.', 97, 0, 414, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (213, 'Feeding Tube Extensions', 'Medication used to relieve pain.', 104, 1, 419, 999999281);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (214, 'Cervical Collar', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 206, 0, 414, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (215, 'Orthopedic Splint', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 1460, 0, 409, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (216, 'AED Training Unit', 'Handheld ultrasound devices used for point-of-care diagnostics.', 992, 1, 404, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (217, 'Nasopharyngeal Airway', 'A type of adhesive tape used to secure dressings or bandages in place.', 636, 0, 407, 999999230);
commit;
prompt 500 records loaded
prompt Loading MAINTENANCE...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (83, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (84, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (85, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (86, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (87, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (88, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (89, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (90, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (91, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (92, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (93, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (94, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (95, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (96, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (97, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (98, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (99, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 36);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (100, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (101, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (102, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (103, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (104, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (105, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (106, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (107, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (108, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (109, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (110, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (111, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (112, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (113, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (114, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (115, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (116, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (117, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (118, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (119, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (120, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (121, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (122, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (123, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (124, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (125, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (126, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (127, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (128, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (129, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (130, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (131, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (132, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 92);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (133, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (134, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (135, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (136, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (137, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (138, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (139, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 52);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (140, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (141, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (142, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (143, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (144, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (145, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (146, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (147, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 64);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (148, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (149, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (150, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 29);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (151, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (152, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (153, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (154, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (155, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (156, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (157, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 87);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (158, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (159, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (160, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (161, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (162, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (163, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (164, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (165, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (166, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (167, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (168, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (169, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (170, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (171, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (172, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (173, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (174, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (175, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (176, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (177, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (178, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (179, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (180, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (181, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (182, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 96);
commit;
prompt 100 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (183, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (184, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 101);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (185, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (186, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (187, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (188, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (189, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (190, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (191, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (192, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (193, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (194, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (195, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (196, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (197, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (198, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (199, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (200, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (201, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (202, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (203, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (204, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (205, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (206, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (207, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (208, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (209, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (210, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (211, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (212, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (213, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (214, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (215, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (216, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (217, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (218, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (219, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (220, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (221, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 85);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (222, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (223, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 111);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (224, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (225, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (226, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (227, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (228, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (229, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 87);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (230, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (231, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (232, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (233, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (234, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (235, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (236, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 61);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (237, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (238, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (239, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (240, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (241, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (242, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (243, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (244, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (245, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (246, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (247, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 112);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (248, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (249, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (302, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (303, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (304, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (305, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (306, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (307, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (308, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (309, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (310, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (311, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (312, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (313, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (314, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (315, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (316, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (317, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (318, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (319, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (320, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (321, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (322, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (323, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (324, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (325, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (326, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (327, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (328, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (329, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (330, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 114);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (331, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 12);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (332, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 52);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (333, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (334, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 20);
commit;
prompt 200 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (335, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (336, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (337, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (338, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (339, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (340, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (341, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (342, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (343, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (344, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (345, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (346, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (347, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (348, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (349, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (350, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (351, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (352, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (353, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (354, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (355, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (356, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 102);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (357, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (358, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 6);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (359, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 80);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (360, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (361, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (362, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (363, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (364, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (365, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (366, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (367, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (368, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (369, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (370, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (371, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (372, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (373, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (374, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (375, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (376, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 76);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (377, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (378, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (379, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (380, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (381, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (382, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (383, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (384, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (385, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (386, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (387, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (388, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (389, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (390, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (391, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (392, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (393, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (394, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (395, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (396, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (397, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (398, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (399, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (400, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (250, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (251, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (252, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (253, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (254, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (255, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (256, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 102);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (257, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (258, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 94);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (259, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 21);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (260, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (261, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (262, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (263, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (264, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 94);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (265, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (266, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (267, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (268, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (269, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (270, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (271, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (272, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (273, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 10);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (274, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (275, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (276, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (277, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (278, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (279, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (280, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (281, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 64);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (282, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 65);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (283, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
commit;
prompt 300 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (284, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (285, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (286, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (287, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (288, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (289, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (290, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (291, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (292, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (293, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (294, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (295, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (296, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (297, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (298, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 40);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (299, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (300, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 12);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (301, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (401, to_date('01-07-2023', 'dd-mm-yyyy'), 'clean', 341);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (402, to_date('01-02-2023', 'dd-mm-yyyy'), 'healthy check', 338);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (403, to_date('01-08-2023', 'dd-mm-yyyy'), 'check validation', 362);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (404, to_date('01-12-2022', 'dd-mm-yyyy'), 'insert values for check', 351);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (405, to_date('01-06-2023', 'dd-mm-yyyy'), 'Replaced tires', 365);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (406, to_date('01-10-2023', 'dd-mm-yyyy'), 'Replaced battery', 334);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (407, to_date('01-08-2023', 'dd-mm-yyyy'), 'clean', 341);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (408, to_date('02-12-2023', 'dd-mm-yyyy'), 'healthy check', 338);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (409, to_date('09-08-2023', 'dd-mm-yyyy'), 'check validation', 362);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (410, to_date('20-03-2023', 'dd-mm-yyyy'), 'insert values for check', 351);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (411, to_date('01-01-2024', 'dd-mm-yyyy'), 'Replaced tires', 365);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (1, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (2, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 38);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (3, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 6);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (4, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (5, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (6, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 76);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (7, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 114);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (8, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (9, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (10, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (11, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (12, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (13, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 40);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (14, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (15, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (16, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (17, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (18, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (19, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (20, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (21, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 36);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (22, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (23, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (24, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (25, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (26, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (27, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (28, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (29, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (30, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 111);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (31, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (32, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (33, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (34, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (35, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (36, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (37, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 80);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (38, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (39, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (40, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (41, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (42, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (43, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (44, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (45, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (46, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 21);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (47, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (48, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (49, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (50, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 101);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (51, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (52, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (53, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (54, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (55, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 92);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (56, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (57, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 85);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (58, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (59, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (60, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (61, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (62, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (63, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (64, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 30);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (65, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (66, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (67, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (68, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (69, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (70, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (71, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 60);
commit;
prompt 400 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (72, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (73, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (74, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (75, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (76, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 112);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (77, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (78, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (79, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (80, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (81, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (82, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 105);
commit;
prompt 411 records loaded
prompt Loading MAINTENAN...
insert into MAINTENAN (idmaintenance, itemid)
values (83, 570);
insert into MAINTENAN (idmaintenance, itemid)
values (84, 572);
insert into MAINTENAN (idmaintenance, itemid)
values (85, 573);
commit;
prompt 3 records loaded
prompt Loading OPERATION...
insert into OPERATION (itemid, operatorid)
values (4, 100);
insert into OPERATION (itemid, operatorid)
values (4, 154);
insert into OPERATION (itemid, operatorid)
values (4, 313);
insert into OPERATION (itemid, operatorid)
values (4, 441);
insert into OPERATION (itemid, operatorid)
values (6, 419);
insert into OPERATION (itemid, operatorid)
values (8, 165);
insert into OPERATION (itemid, operatorid)
values (8, 327);
insert into OPERATION (itemid, operatorid)
values (9, 120);
insert into OPERATION (itemid, operatorid)
values (9, 214);
insert into OPERATION (itemid, operatorid)
values (9, 389);
insert into OPERATION (itemid, operatorid)
values (10, 220);
insert into OPERATION (itemid, operatorid)
values (10, 479);
insert into OPERATION (itemid, operatorid)
values (10, 492);
insert into OPERATION (itemid, operatorid)
values (11, 106);
insert into OPERATION (itemid, operatorid)
values (11, 115);
insert into OPERATION (itemid, operatorid)
values (11, 189);
insert into OPERATION (itemid, operatorid)
values (11, 296);
insert into OPERATION (itemid, operatorid)
values (11, 330);
insert into OPERATION (itemid, operatorid)
values (11, 429);
insert into OPERATION (itemid, operatorid)
values (12, 258);
insert into OPERATION (itemid, operatorid)
values (12, 280);
insert into OPERATION (itemid, operatorid)
values (12, 351);
insert into OPERATION (itemid, operatorid)
values (12, 445);
insert into OPERATION (itemid, operatorid)
values (14, 100);
insert into OPERATION (itemid, operatorid)
values (14, 246);
insert into OPERATION (itemid, operatorid)
values (14, 283);
insert into OPERATION (itemid, operatorid)
values (15, 121);
insert into OPERATION (itemid, operatorid)
values (15, 141);
insert into OPERATION (itemid, operatorid)
values (15, 189);
insert into OPERATION (itemid, operatorid)
values (15, 471);
insert into OPERATION (itemid, operatorid)
values (16, 159);
insert into OPERATION (itemid, operatorid)
values (16, 264);
insert into OPERATION (itemid, operatorid)
values (16, 464);
insert into OPERATION (itemid, operatorid)
values (17, 121);
insert into OPERATION (itemid, operatorid)
values (17, 180);
insert into OPERATION (itemid, operatorid)
values (17, 238);
insert into OPERATION (itemid, operatorid)
values (17, 293);
insert into OPERATION (itemid, operatorid)
values (18, 145);
insert into OPERATION (itemid, operatorid)
values (18, 379);
insert into OPERATION (itemid, operatorid)
values (18, 455);
insert into OPERATION (itemid, operatorid)
values (18, 466);
insert into OPERATION (itemid, operatorid)
values (18, 469);
insert into OPERATION (itemid, operatorid)
values (19, 201);
insert into OPERATION (itemid, operatorid)
values (19, 275);
insert into OPERATION (itemid, operatorid)
values (19, 429);
insert into OPERATION (itemid, operatorid)
values (20, 119);
insert into OPERATION (itemid, operatorid)
values (20, 282);
insert into OPERATION (itemid, operatorid)
values (20, 365);
insert into OPERATION (itemid, operatorid)
values (20, 431);
insert into OPERATION (itemid, operatorid)
values (20, 447);
insert into OPERATION (itemid, operatorid)
values (20, 490);
insert into OPERATION (itemid, operatorid)
values (21, 110);
insert into OPERATION (itemid, operatorid)
values (21, 157);
insert into OPERATION (itemid, operatorid)
values (21, 183);
insert into OPERATION (itemid, operatorid)
values (21, 258);
insert into OPERATION (itemid, operatorid)
values (22, 115);
insert into OPERATION (itemid, operatorid)
values (22, 386);
insert into OPERATION (itemid, operatorid)
values (22, 394);
insert into OPERATION (itemid, operatorid)
values (22, 439);
insert into OPERATION (itemid, operatorid)
values (22, 457);
insert into OPERATION (itemid, operatorid)
values (24, 144);
insert into OPERATION (itemid, operatorid)
values (24, 206);
insert into OPERATION (itemid, operatorid)
values (24, 277);
insert into OPERATION (itemid, operatorid)
values (24, 284);
insert into OPERATION (itemid, operatorid)
values (24, 396);
insert into OPERATION (itemid, operatorid)
values (24, 465);
insert into OPERATION (itemid, operatorid)
values (24, 476);
insert into OPERATION (itemid, operatorid)
values (28, 197);
insert into OPERATION (itemid, operatorid)
values (28, 220);
insert into OPERATION (itemid, operatorid)
values (28, 228);
insert into OPERATION (itemid, operatorid)
values (28, 315);
insert into OPERATION (itemid, operatorid)
values (28, 328);
insert into OPERATION (itemid, operatorid)
values (28, 483);
insert into OPERATION (itemid, operatorid)
values (29, 181);
insert into OPERATION (itemid, operatorid)
values (29, 217);
insert into OPERATION (itemid, operatorid)
values (29, 317);
insert into OPERATION (itemid, operatorid)
values (29, 337);
insert into OPERATION (itemid, operatorid)
values (30, 304);
insert into OPERATION (itemid, operatorid)
values (30, 375);
insert into OPERATION (itemid, operatorid)
values (30, 411);
insert into OPERATION (itemid, operatorid)
values (30, 472);
insert into OPERATION (itemid, operatorid)
values (31, 165);
insert into OPERATION (itemid, operatorid)
values (31, 274);
insert into OPERATION (itemid, operatorid)
values (31, 322);
insert into OPERATION (itemid, operatorid)
values (31, 394);
insert into OPERATION (itemid, operatorid)
values (31, 421);
insert into OPERATION (itemid, operatorid)
values (31, 446);
insert into OPERATION (itemid, operatorid)
values (31, 495);
insert into OPERATION (itemid, operatorid)
values (32, 104);
insert into OPERATION (itemid, operatorid)
values (32, 202);
insert into OPERATION (itemid, operatorid)
values (32, 356);
insert into OPERATION (itemid, operatorid)
values (32, 449);
insert into OPERATION (itemid, operatorid)
values (33, 185);
insert into OPERATION (itemid, operatorid)
values (33, 187);
insert into OPERATION (itemid, operatorid)
values (33, 325);
insert into OPERATION (itemid, operatorid)
values (33, 361);
insert into OPERATION (itemid, operatorid)
values (33, 424);
insert into OPERATION (itemid, operatorid)
values (34, 169);
insert into OPERATION (itemid, operatorid)
values (35, 102);
insert into OPERATION (itemid, operatorid)
values (35, 369);
commit;
prompt 100 records committed...
insert into OPERATION (itemid, operatorid)
values (36, 103);
insert into OPERATION (itemid, operatorid)
values (36, 197);
insert into OPERATION (itemid, operatorid)
values (36, 350);
insert into OPERATION (itemid, operatorid)
values (36, 369);
insert into OPERATION (itemid, operatorid)
values (36, 459);
insert into OPERATION (itemid, operatorid)
values (37, 127);
insert into OPERATION (itemid, operatorid)
values (37, 211);
insert into OPERATION (itemid, operatorid)
values (37, 240);
insert into OPERATION (itemid, operatorid)
values (38, 263);
insert into OPERATION (itemid, operatorid)
values (38, 358);
insert into OPERATION (itemid, operatorid)
values (38, 386);
insert into OPERATION (itemid, operatorid)
values (38, 456);
insert into OPERATION (itemid, operatorid)
values (39, 256);
insert into OPERATION (itemid, operatorid)
values (39, 353);
insert into OPERATION (itemid, operatorid)
values (40, 128);
insert into OPERATION (itemid, operatorid)
values (40, 154);
insert into OPERATION (itemid, operatorid)
values (40, 257);
insert into OPERATION (itemid, operatorid)
values (40, 261);
insert into OPERATION (itemid, operatorid)
values (40, 328);
insert into OPERATION (itemid, operatorid)
values (41, 171);
insert into OPERATION (itemid, operatorid)
values (41, 178);
insert into OPERATION (itemid, operatorid)
values (41, 218);
insert into OPERATION (itemid, operatorid)
values (41, 327);
insert into OPERATION (itemid, operatorid)
values (41, 423);
insert into OPERATION (itemid, operatorid)
values (42, 175);
insert into OPERATION (itemid, operatorid)
values (42, 318);
insert into OPERATION (itemid, operatorid)
values (42, 329);
insert into OPERATION (itemid, operatorid)
values (42, 499);
insert into OPERATION (itemid, operatorid)
values (43, 309);
insert into OPERATION (itemid, operatorid)
values (43, 312);
insert into OPERATION (itemid, operatorid)
values (43, 364);
insert into OPERATION (itemid, operatorid)
values (43, 417);
insert into OPERATION (itemid, operatorid)
values (44, 173);
insert into OPERATION (itemid, operatorid)
values (44, 297);
insert into OPERATION (itemid, operatorid)
values (45, 155);
insert into OPERATION (itemid, operatorid)
values (45, 260);
insert into OPERATION (itemid, operatorid)
values (45, 284);
insert into OPERATION (itemid, operatorid)
values (45, 450);
insert into OPERATION (itemid, operatorid)
values (46, 147);
insert into OPERATION (itemid, operatorid)
values (46, 187);
insert into OPERATION (itemid, operatorid)
values (46, 201);
insert into OPERATION (itemid, operatorid)
values (46, 202);
insert into OPERATION (itemid, operatorid)
values (46, 289);
insert into OPERATION (itemid, operatorid)
values (46, 307);
insert into OPERATION (itemid, operatorid)
values (46, 370);
insert into OPERATION (itemid, operatorid)
values (46, 447);
insert into OPERATION (itemid, operatorid)
values (47, 141);
insert into OPERATION (itemid, operatorid)
values (47, 321);
insert into OPERATION (itemid, operatorid)
values (47, 365);
insert into OPERATION (itemid, operatorid)
values (47, 443);
insert into OPERATION (itemid, operatorid)
values (47, 476);
insert into OPERATION (itemid, operatorid)
values (48, 159);
insert into OPERATION (itemid, operatorid)
values (48, 213);
insert into OPERATION (itemid, operatorid)
values (48, 392);
insert into OPERATION (itemid, operatorid)
values (48, 454);
insert into OPERATION (itemid, operatorid)
values (52, 113);
insert into OPERATION (itemid, operatorid)
values (52, 466);
insert into OPERATION (itemid, operatorid)
values (53, 117);
insert into OPERATION (itemid, operatorid)
values (53, 167);
insert into OPERATION (itemid, operatorid)
values (53, 279);
insert into OPERATION (itemid, operatorid)
values (54, 112);
insert into OPERATION (itemid, operatorid)
values (54, 197);
insert into OPERATION (itemid, operatorid)
values (55, 155);
insert into OPERATION (itemid, operatorid)
values (55, 178);
insert into OPERATION (itemid, operatorid)
values (55, 291);
insert into OPERATION (itemid, operatorid)
values (55, 295);
insert into OPERATION (itemid, operatorid)
values (55, 345);
insert into OPERATION (itemid, operatorid)
values (55, 390);
insert into OPERATION (itemid, operatorid)
values (56, 113);
insert into OPERATION (itemid, operatorid)
values (56, 164);
insert into OPERATION (itemid, operatorid)
values (56, 211);
insert into OPERATION (itemid, operatorid)
values (57, 107);
insert into OPERATION (itemid, operatorid)
values (57, 133);
insert into OPERATION (itemid, operatorid)
values (57, 210);
insert into OPERATION (itemid, operatorid)
values (57, 442);
insert into OPERATION (itemid, operatorid)
values (58, 195);
insert into OPERATION (itemid, operatorid)
values (58, 240);
insert into OPERATION (itemid, operatorid)
values (58, 305);
insert into OPERATION (itemid, operatorid)
values (58, 353);
insert into OPERATION (itemid, operatorid)
values (58, 419);
insert into OPERATION (itemid, operatorid)
values (59, 147);
insert into OPERATION (itemid, operatorid)
values (60, 121);
insert into OPERATION (itemid, operatorid)
values (60, 203);
insert into OPERATION (itemid, operatorid)
values (60, 207);
insert into OPERATION (itemid, operatorid)
values (60, 259);
insert into OPERATION (itemid, operatorid)
values (60, 332);
insert into OPERATION (itemid, operatorid)
values (60, 353);
insert into OPERATION (itemid, operatorid)
values (60, 381);
insert into OPERATION (itemid, operatorid)
values (60, 485);
insert into OPERATION (itemid, operatorid)
values (61, 126);
insert into OPERATION (itemid, operatorid)
values (62, 244);
insert into OPERATION (itemid, operatorid)
values (62, 280);
insert into OPERATION (itemid, operatorid)
values (62, 285);
insert into OPERATION (itemid, operatorid)
values (62, 396);
insert into OPERATION (itemid, operatorid)
values (62, 445);
insert into OPERATION (itemid, operatorid)
values (63, 154);
insert into OPERATION (itemid, operatorid)
values (63, 275);
insert into OPERATION (itemid, operatorid)
values (63, 319);
insert into OPERATION (itemid, operatorid)
values (63, 389);
insert into OPERATION (itemid, operatorid)
values (63, 457);
commit;
prompt 200 records committed...
insert into OPERATION (itemid, operatorid)
values (64, 124);
insert into OPERATION (itemid, operatorid)
values (64, 178);
insert into OPERATION (itemid, operatorid)
values (64, 223);
insert into OPERATION (itemid, operatorid)
values (64, 370);
insert into OPERATION (itemid, operatorid)
values (64, 384);
insert into OPERATION (itemid, operatorid)
values (64, 444);
insert into OPERATION (itemid, operatorid)
values (65, 229);
insert into OPERATION (itemid, operatorid)
values (65, 456);
insert into OPERATION (itemid, operatorid)
values (66, 143);
insert into OPERATION (itemid, operatorid)
values (66, 167);
insert into OPERATION (itemid, operatorid)
values (66, 184);
insert into OPERATION (itemid, operatorid)
values (66, 249);
insert into OPERATION (itemid, operatorid)
values (66, 319);
insert into OPERATION (itemid, operatorid)
values (66, 400);
insert into OPERATION (itemid, operatorid)
values (67, 118);
insert into OPERATION (itemid, operatorid)
values (67, 217);
insert into OPERATION (itemid, operatorid)
values (67, 335);
insert into OPERATION (itemid, operatorid)
values (67, 433);
insert into OPERATION (itemid, operatorid)
values (68, 164);
insert into OPERATION (itemid, operatorid)
values (68, 227);
insert into OPERATION (itemid, operatorid)
values (68, 245);
insert into OPERATION (itemid, operatorid)
values (68, 391);
insert into OPERATION (itemid, operatorid)
values (69, 184);
insert into OPERATION (itemid, operatorid)
values (69, 279);
insert into OPERATION (itemid, operatorid)
values (69, 305);
insert into OPERATION (itemid, operatorid)
values (69, 325);
insert into OPERATION (itemid, operatorid)
values (70, 261);
insert into OPERATION (itemid, operatorid)
values (70, 262);
insert into OPERATION (itemid, operatorid)
values (70, 302);
insert into OPERATION (itemid, operatorid)
values (70, 421);
insert into OPERATION (itemid, operatorid)
values (70, 485);
insert into OPERATION (itemid, operatorid)
values (71, 249);
insert into OPERATION (itemid, operatorid)
values (71, 311);
insert into OPERATION (itemid, operatorid)
values (71, 371);
insert into OPERATION (itemid, operatorid)
values (71, 403);
insert into OPERATION (itemid, operatorid)
values (71, 451);
insert into OPERATION (itemid, operatorid)
values (72, 167);
insert into OPERATION (itemid, operatorid)
values (72, 391);
insert into OPERATION (itemid, operatorid)
values (72, 467);
insert into OPERATION (itemid, operatorid)
values (72, 480);
insert into OPERATION (itemid, operatorid)
values (72, 483);
insert into OPERATION (itemid, operatorid)
values (72, 487);
insert into OPERATION (itemid, operatorid)
values (76, 333);
insert into OPERATION (itemid, operatorid)
values (76, 484);
insert into OPERATION (itemid, operatorid)
values (78, 132);
insert into OPERATION (itemid, operatorid)
values (78, 171);
insert into OPERATION (itemid, operatorid)
values (78, 186);
insert into OPERATION (itemid, operatorid)
values (78, 288);
insert into OPERATION (itemid, operatorid)
values (78, 321);
insert into OPERATION (itemid, operatorid)
values (78, 361);
insert into OPERATION (itemid, operatorid)
values (78, 438);
insert into OPERATION (itemid, operatorid)
values (78, 453);
insert into OPERATION (itemid, operatorid)
values (78, 456);
insert into OPERATION (itemid, operatorid)
values (78, 462);
insert into OPERATION (itemid, operatorid)
values (79, 214);
insert into OPERATION (itemid, operatorid)
values (79, 298);
insert into OPERATION (itemid, operatorid)
values (79, 311);
insert into OPERATION (itemid, operatorid)
values (79, 323);
insert into OPERATION (itemid, operatorid)
values (79, 358);
insert into OPERATION (itemid, operatorid)
values (80, 303);
insert into OPERATION (itemid, operatorid)
values (80, 306);
insert into OPERATION (itemid, operatorid)
values (80, 359);
insert into OPERATION (itemid, operatorid)
values (80, 370);
insert into OPERATION (itemid, operatorid)
values (81, 153);
insert into OPERATION (itemid, operatorid)
values (81, 312);
insert into OPERATION (itemid, operatorid)
values (81, 333);
insert into OPERATION (itemid, operatorid)
values (82, 130);
insert into OPERATION (itemid, operatorid)
values (82, 313);
insert into OPERATION (itemid, operatorid)
values (83, 206);
insert into OPERATION (itemid, operatorid)
values (83, 288);
insert into OPERATION (itemid, operatorid)
values (84, 135);
insert into OPERATION (itemid, operatorid)
values (84, 269);
insert into OPERATION (itemid, operatorid)
values (84, 281);
insert into OPERATION (itemid, operatorid)
values (84, 348);
insert into OPERATION (itemid, operatorid)
values (84, 351);
insert into OPERATION (itemid, operatorid)
values (84, 438);
insert into OPERATION (itemid, operatorid)
values (84, 472);
insert into OPERATION (itemid, operatorid)
values (84, 475);
insert into OPERATION (itemid, operatorid)
values (84, 497);
insert into OPERATION (itemid, operatorid)
values (85, 273);
insert into OPERATION (itemid, operatorid)
values (85, 324);
insert into OPERATION (itemid, operatorid)
values (85, 423);
insert into OPERATION (itemid, operatorid)
values (87, 116);
insert into OPERATION (itemid, operatorid)
values (87, 163);
insert into OPERATION (itemid, operatorid)
values (88, 269);
insert into OPERATION (itemid, operatorid)
values (89, 102);
insert into OPERATION (itemid, operatorid)
values (89, 123);
insert into OPERATION (itemid, operatorid)
values (89, 271);
insert into OPERATION (itemid, operatorid)
values (89, 385);
insert into OPERATION (itemid, operatorid)
values (89, 398);
insert into OPERATION (itemid, operatorid)
values (90, 126);
insert into OPERATION (itemid, operatorid)
values (90, 133);
insert into OPERATION (itemid, operatorid)
values (90, 262);
insert into OPERATION (itemid, operatorid)
values (90, 305);
insert into OPERATION (itemid, operatorid)
values (90, 381);
insert into OPERATION (itemid, operatorid)
values (91, 254);
insert into OPERATION (itemid, operatorid)
values (91, 325);
insert into OPERATION (itemid, operatorid)
values (91, 463);
insert into OPERATION (itemid, operatorid)
values (92, 230);
insert into OPERATION (itemid, operatorid)
values (92, 277);
commit;
prompt 300 records committed...
insert into OPERATION (itemid, operatorid)
values (92, 480);
insert into OPERATION (itemid, operatorid)
values (93, 115);
insert into OPERATION (itemid, operatorid)
values (93, 306);
insert into OPERATION (itemid, operatorid)
values (93, 313);
insert into OPERATION (itemid, operatorid)
values (94, 147);
insert into OPERATION (itemid, operatorid)
values (94, 358);
insert into OPERATION (itemid, operatorid)
values (94, 368);
insert into OPERATION (itemid, operatorid)
values (94, 372);
insert into OPERATION (itemid, operatorid)
values (94, 400);
insert into OPERATION (itemid, operatorid)
values (94, 442);
insert into OPERATION (itemid, operatorid)
values (95, 375);
insert into OPERATION (itemid, operatorid)
values (95, 405);
insert into OPERATION (itemid, operatorid)
values (96, 201);
insert into OPERATION (itemid, operatorid)
values (96, 222);
insert into OPERATION (itemid, operatorid)
values (96, 300);
insert into OPERATION (itemid, operatorid)
values (96, 429);
insert into OPERATION (itemid, operatorid)
values (101, 190);
insert into OPERATION (itemid, operatorid)
values (101, 312);
insert into OPERATION (itemid, operatorid)
values (101, 320);
insert into OPERATION (itemid, operatorid)
values (101, 322);
insert into OPERATION (itemid, operatorid)
values (101, 468);
insert into OPERATION (itemid, operatorid)
values (102, 327);
insert into OPERATION (itemid, operatorid)
values (102, 328);
insert into OPERATION (itemid, operatorid)
values (102, 329);
insert into OPERATION (itemid, operatorid)
values (102, 447);
insert into OPERATION (itemid, operatorid)
values (103, 191);
insert into OPERATION (itemid, operatorid)
values (103, 479);
insert into OPERATION (itemid, operatorid)
values (105, 161);
insert into OPERATION (itemid, operatorid)
values (105, 198);
insert into OPERATION (itemid, operatorid)
values (105, 296);
insert into OPERATION (itemid, operatorid)
values (105, 387);
insert into OPERATION (itemid, operatorid)
values (106, 189);
insert into OPERATION (itemid, operatorid)
values (106, 224);
insert into OPERATION (itemid, operatorid)
values (106, 239);
insert into OPERATION (itemid, operatorid)
values (106, 293);
insert into OPERATION (itemid, operatorid)
values (106, 394);
insert into OPERATION (itemid, operatorid)
values (107, 161);
insert into OPERATION (itemid, operatorid)
values (107, 272);
insert into OPERATION (itemid, operatorid)
values (107, 279);
insert into OPERATION (itemid, operatorid)
values (107, 406);
insert into OPERATION (itemid, operatorid)
values (107, 482);
insert into OPERATION (itemid, operatorid)
values (107, 491);
insert into OPERATION (itemid, operatorid)
values (108, 137);
insert into OPERATION (itemid, operatorid)
values (108, 312);
insert into OPERATION (itemid, operatorid)
values (110, 128);
insert into OPERATION (itemid, operatorid)
values (110, 140);
insert into OPERATION (itemid, operatorid)
values (110, 152);
insert into OPERATION (itemid, operatorid)
values (110, 239);
insert into OPERATION (itemid, operatorid)
values (110, 275);
insert into OPERATION (itemid, operatorid)
values (110, 316);
insert into OPERATION (itemid, operatorid)
values (110, 337);
insert into OPERATION (itemid, operatorid)
values (110, 356);
insert into OPERATION (itemid, operatorid)
values (111, 234);
insert into OPERATION (itemid, operatorid)
values (111, 321);
insert into OPERATION (itemid, operatorid)
values (111, 327);
insert into OPERATION (itemid, operatorid)
values (112, 162);
insert into OPERATION (itemid, operatorid)
values (112, 352);
insert into OPERATION (itemid, operatorid)
values (112, 367);
insert into OPERATION (itemid, operatorid)
values (113, 290);
insert into OPERATION (itemid, operatorid)
values (113, 296);
insert into OPERATION (itemid, operatorid)
values (113, 379);
insert into OPERATION (itemid, operatorid)
values (113, 400);
insert into OPERATION (itemid, operatorid)
values (114, 123);
insert into OPERATION (itemid, operatorid)
values (114, 127);
insert into OPERATION (itemid, operatorid)
values (114, 146);
insert into OPERATION (itemid, operatorid)
values (114, 438);
insert into OPERATION (itemid, operatorid)
values (115, 176);
insert into OPERATION (itemid, operatorid)
values (115, 186);
insert into OPERATION (itemid, operatorid)
values (115, 270);
insert into OPERATION (itemid, operatorid)
values (115, 276);
insert into OPERATION (itemid, operatorid)
values (115, 309);
insert into OPERATION (itemid, operatorid)
values (116, 196);
insert into OPERATION (itemid, operatorid)
values (116, 262);
insert into OPERATION (itemid, operatorid)
values (116, 273);
insert into OPERATION (itemid, operatorid)
values (116, 298);
insert into OPERATION (itemid, operatorid)
values (117, 171);
insert into OPERATION (itemid, operatorid)
values (117, 194);
insert into OPERATION (itemid, operatorid)
values (117, 215);
insert into OPERATION (itemid, operatorid)
values (117, 314);
insert into OPERATION (itemid, operatorid)
values (117, 315);
insert into OPERATION (itemid, operatorid)
values (117, 473);
insert into OPERATION (itemid, operatorid)
values (118, 147);
insert into OPERATION (itemid, operatorid)
values (118, 174);
insert into OPERATION (itemid, operatorid)
values (118, 178);
insert into OPERATION (itemid, operatorid)
values (118, 202);
insert into OPERATION (itemid, operatorid)
values (118, 255);
insert into OPERATION (itemid, operatorid)
values (118, 279);
insert into OPERATION (itemid, operatorid)
values (118, 356);
insert into OPERATION (itemid, operatorid)
values (118, 384);
insert into OPERATION (itemid, operatorid)
values (124, 387);
insert into OPERATION (itemid, operatorid)
values (124, 399);
insert into OPERATION (itemid, operatorid)
values (124, 419);
insert into OPERATION (itemid, operatorid)
values (124, 430);
insert into OPERATION (itemid, operatorid)
values (125, 245);
insert into OPERATION (itemid, operatorid)
values (125, 276);
insert into OPERATION (itemid, operatorid)
values (125, 299);
insert into OPERATION (itemid, operatorid)
values (125, 429);
insert into OPERATION (itemid, operatorid)
values (127, 117);
insert into OPERATION (itemid, operatorid)
values (128, 221);
insert into OPERATION (itemid, operatorid)
values (128, 224);
commit;
prompt 400 records loaded
prompt Loading OPERATOR...
insert into OPERATOR (teid, tename, idpromission)
values (271, 'TeenaFoxx', null);
insert into OPERATOR (teid, tename, idpromission)
values (272, 'NicholasCash', null);
insert into OPERATOR (teid, tename, idpromission)
values (273, 'BeverleyHamilton', null);
insert into OPERATOR (teid, tename, idpromission)
values (274, 'EmmaBrooke', null);
insert into OPERATOR (teid, tename, idpromission)
values (275, 'TedFranks', null);
insert into OPERATOR (teid, tename, idpromission)
values (276, 'AliLarter', null);
insert into OPERATOR (teid, tename, idpromission)
values (277, 'MindyGaynor', null);
insert into OPERATOR (teid, tename, idpromission)
values (278, 'MichaelRundgren', null);
insert into OPERATOR (teid, tename, idpromission)
values (279, 'LouNivola', null);
insert into OPERATOR (teid, tename, idpromission)
values (280, 'AliChesnutt', null);
insert into OPERATOR (teid, tename, idpromission)
values (281, 'DebiMorse', null);
insert into OPERATOR (teid, tename, idpromission)
values (282, 'JaimeStiers', null);
insert into OPERATOR (teid, tename, idpromission)
values (283, 'RobertCole', null);
insert into OPERATOR (teid, tename, idpromission)
values (284, 'ElvisRuiz', null);
insert into OPERATOR (teid, tename, idpromission)
values (285, 'AllanViterelli', null);
insert into OPERATOR (teid, tename, idpromission)
values (286, 'MykeltiMcCracken', null);
insert into OPERATOR (teid, tename, idpromission)
values (287, 'CarlosMartin', null);
insert into OPERATOR (teid, tename, idpromission)
values (288, 'WalterHyde', null);
insert into OPERATOR (teid, tename, idpromission)
values (289, 'ArturoCurry', null);
insert into OPERATOR (teid, tename, idpromission)
values (290, 'BuddyGarr', null);
insert into OPERATOR (teid, tename, idpromission)
values (291, 'JosephPurefoy', null);
insert into OPERATOR (teid, tename, idpromission)
values (292, 'SamuelNuman', null);
insert into OPERATOR (teid, tename, idpromission)
values (293, 'BurtonHouston', null);
insert into OPERATOR (teid, tename, idpromission)
values (294, 'TyroneWood', null);
insert into OPERATOR (teid, tename, idpromission)
values (295, 'AdamLeguizamo', null);
insert into OPERATOR (teid, tename, idpromission)
values (296, 'ThinVincent', null);
insert into OPERATOR (teid, tename, idpromission)
values (297, 'AhmadWheel', null);
insert into OPERATOR (teid, tename, idpromission)
values (298, 'TeenaEsposito', null);
insert into OPERATOR (teid, tename, idpromission)
values (299, 'WillHoly', null);
insert into OPERATOR (teid, tename, idpromission)
values (300, 'TerriCash', null);
insert into OPERATOR (teid, tename, idpromission)
values (301, 'LeonardoWarburton', null);
insert into OPERATOR (teid, tename, idpromission)
values (302, 'PowersRibisi', null);
insert into OPERATOR (teid, tename, idpromission)
values (303, 'HalSandler', null);
insert into OPERATOR (teid, tename, idpromission)
values (304, 'DennyArden', null);
insert into OPERATOR (teid, tename, idpromission)
values (305, 'IkeHauer', null);
insert into OPERATOR (teid, tename, idpromission)
values (306, 'NataschaUnion', null);
insert into OPERATOR (teid, tename, idpromission)
values (307, 'DomingoHagar', null);
insert into OPERATOR (teid, tename, idpromission)
values (308, 'RosannaDorn', null);
insert into OPERATOR (teid, tename, idpromission)
values (309, 'MurrayClinton', null);
insert into OPERATOR (teid, tename, idpromission)
values (310, 'AprilNeeson', null);
insert into OPERATOR (teid, tename, idpromission)
values (311, 'HexHatosy', null);
insert into OPERATOR (teid, tename, idpromission)
values (312, 'JulianneHedaya', null);
insert into OPERATOR (teid, tename, idpromission)
values (313, 'CurtisAtlas', null);
insert into OPERATOR (teid, tename, idpromission)
values (314, 'RupertTah', null);
insert into OPERATOR (teid, tename, idpromission)
values (315, 'MartyMitra', null);
insert into OPERATOR (teid, tename, idpromission)
values (316, 'GranRispoli', null);
insert into OPERATOR (teid, tename, idpromission)
values (317, 'NedEnglish', null);
insert into OPERATOR (teid, tename, idpromission)
values (318, 'AlbertinaHenstridge', null);
insert into OPERATOR (teid, tename, idpromission)
values (319, 'MichaelWillard', null);
insert into OPERATOR (teid, tename, idpromission)
values (320, 'JulietteColeman', null);
insert into OPERATOR (teid, tename, idpromission)
values (321, 'ChubbyPleasure', null);
insert into OPERATOR (teid, tename, idpromission)
values (322, 'RandySimpson', null);
insert into OPERATOR (teid, tename, idpromission)
values (323, 'MiaMarie', null);
insert into OPERATOR (teid, tename, idpromission)
values (324, 'YaphetWeaving', null);
insert into OPERATOR (teid, tename, idpromission)
values (325, 'JulianneWhitmore', null);
insert into OPERATOR (teid, tename, idpromission)
values (326, 'AdinaKeitel', null);
insert into OPERATOR (teid, tename, idpromission)
values (327, 'MinnieGoodall', null);
insert into OPERATOR (teid, tename, idpromission)
values (328, 'AzucarSpeaks', null);
insert into OPERATOR (teid, tename, idpromission)
values (329, 'PeaboMarsden', null);
insert into OPERATOR (teid, tename, idpromission)
values (330, 'RobMcGinley', null);
insert into OPERATOR (teid, tename, idpromission)
values (331, 'ReneSaucedo', null);
insert into OPERATOR (teid, tename, idpromission)
values (332, 'RhettKirkwood', null);
insert into OPERATOR (teid, tename, idpromission)
values (333, 'WangAndrews', null);
insert into OPERATOR (teid, tename, idpromission)
values (334, 'RandallBroderick', null);
insert into OPERATOR (teid, tename, idpromission)
values (335, 'HoraceCherry', null);
insert into OPERATOR (teid, tename, idpromission)
values (336, 'MirandaMarie', null);
insert into OPERATOR (teid, tename, idpromission)
values (337, 'HarryTanon', null);
insert into OPERATOR (teid, tename, idpromission)
values (338, 'DorryStrong', null);
insert into OPERATOR (teid, tename, idpromission)
values (339, 'DebraCusack', null);
insert into OPERATOR (teid, tename, idpromission)
values (340, 'CubaEnglish', null);
insert into OPERATOR (teid, tename, idpromission)
values (341, 'WallySlater', null);
insert into OPERATOR (teid, tename, idpromission)
values (342, 'AmandaCalle', null);
insert into OPERATOR (teid, tename, idpromission)
values (401, 'CrystalManning', 12345);
insert into OPERATOR (teid, tename, idpromission)
values (402, 'SaffronMurray', 23456);
insert into OPERATOR (teid, tename, idpromission)
values (403, 'NastassjaO''Neal', 34567);
insert into OPERATOR (teid, tename, idpromission)
values (404, 'DickKahn', 45678);
insert into OPERATOR (teid, tename, idpromission)
values (405, 'RhysDafoe', 56789);
insert into OPERATOR (teid, tename, idpromission)
values (406, 'HalleReid', 67890);
insert into OPERATOR (teid, tename, idpromission)
values (407, 'GatesElizondo', 78901);
insert into OPERATOR (teid, tename, idpromission)
values (408, 'WesKingsley', 89012);
insert into OPERATOR (teid, tename, idpromission)
values (409, 'FredaCheadle', 90123);
insert into OPERATOR (teid, tename, idpromission)
values (410, 'JoelyMcPherson', 1234);
insert into OPERATOR (teid, tename, idpromission)
values (411, 'KaronLavigne', null);
insert into OPERATOR (teid, tename, idpromission)
values (412, 'MichaelHeron', null);
insert into OPERATOR (teid, tename, idpromission)
values (413, 'PowersRock', null);
insert into OPERATOR (teid, tename, idpromission)
values (414, 'BradleyHeche', null);
insert into OPERATOR (teid, tename, idpromission)
values (415, 'BuffyUtada', null);
insert into OPERATOR (teid, tename, idpromission)
values (416, 'KingGoldwyn', null);
insert into OPERATOR (teid, tename, idpromission)
values (417, 'IsabellaO''Connor', null);
insert into OPERATOR (teid, tename, idpromission)
values (418, 'ElizabethVan Shelton', null);
insert into OPERATOR (teid, tename, idpromission)
values (419, 'DiamondDiehl', null);
insert into OPERATOR (teid, tename, idpromission)
values (420, 'FionaGlover', null);
insert into OPERATOR (teid, tename, idpromission)
values (421, 'WillLunch', null);
insert into OPERATOR (teid, tename, idpromission)
values (422, 'AdrienHumphrey', null);
insert into OPERATOR (teid, tename, idpromission)
values (423, 'DerrickLaw', null);
insert into OPERATOR (teid, tename, idpromission)
values (424, 'AlannahLeto', null);
insert into OPERATOR (teid, tename, idpromission)
values (425, 'HarryEstevez', null);
insert into OPERATOR (teid, tename, idpromission)
values (426, 'LaraWitt', null);
insert into OPERATOR (teid, tename, idpromission)
values (427, 'JodyParish', null);
insert into OPERATOR (teid, tename, idpromission)
values (428, 'BelindaRush', null);
commit;
prompt 100 records committed...
insert into OPERATOR (teid, tename, idpromission)
values (429, 'MikeHirsch', null);
insert into OPERATOR (teid, tename, idpromission)
values (430, 'StephenAlston', null);
insert into OPERATOR (teid, tename, idpromission)
values (431, 'AndyDeVito', null);
insert into OPERATOR (teid, tename, idpromission)
values (432, 'IkeDiBiasio', null);
insert into OPERATOR (teid, tename, idpromission)
values (433, 'JavonThornton', null);
insert into OPERATOR (teid, tename, idpromission)
values (434, 'MarinaJovovich', null);
insert into OPERATOR (teid, tename, idpromission)
values (435, 'CoreyMorales', null);
insert into OPERATOR (teid, tename, idpromission)
values (436, 'AlbertGray', null);
insert into OPERATOR (teid, tename, idpromission)
values (437, 'LarenzFlanagan', null);
insert into OPERATOR (teid, tename, idpromission)
values (438, 'JessicaPigott-Smith', null);
insert into OPERATOR (teid, tename, idpromission)
values (439, 'AdinaRockwell', null);
insert into OPERATOR (teid, tename, idpromission)
values (440, 'HumbertoSevenfold', null);
insert into OPERATOR (teid, tename, idpromission)
values (441, 'RhysKaryo', null);
insert into OPERATOR (teid, tename, idpromission)
values (442, 'CledusHall', null);
insert into OPERATOR (teid, tename, idpromission)
values (443, 'LynetteBeals', null);
insert into OPERATOR (teid, tename, idpromission)
values (444, 'NedMcNeice', null);
insert into OPERATOR (teid, tename, idpromission)
values (445, 'DarrenDillon', null);
insert into OPERATOR (teid, tename, idpromission)
values (446, 'TerenceLachey', null);
insert into OPERATOR (teid, tename, idpromission)
values (447, 'DebraDrive', null);
insert into OPERATOR (teid, tename, idpromission)
values (448, 'JeremyMars', null);
insert into OPERATOR (teid, tename, idpromission)
values (449, 'TobeyDiCaprio', null);
insert into OPERATOR (teid, tename, idpromission)
values (450, 'NightPeet', null);
insert into OPERATOR (teid, tename, idpromission)
values (451, 'MikaMcKennitt', null);
insert into OPERATOR (teid, tename, idpromission)
values (452, 'GoldieProwse', null);
insert into OPERATOR (teid, tename, idpromission)
values (453, 'RoscoeDe Almeida', null);
insert into OPERATOR (teid, tename, idpromission)
values (454, 'VingHutch', null);
insert into OPERATOR (teid, tename, idpromission)
values (455, 'SethRed', null);
insert into OPERATOR (teid, tename, idpromission)
values (456, 'KimberlyThewlis', null);
insert into OPERATOR (teid, tename, idpromission)
values (457, 'HarrySledge', null);
insert into OPERATOR (teid, tename, idpromission)
values (458, 'GoranIsaacs', null);
insert into OPERATOR (teid, tename, idpromission)
values (459, 'TimothyHanley', null);
insert into OPERATOR (teid, tename, idpromission)
values (460, 'SimonKilmer', null);
insert into OPERATOR (teid, tename, idpromission)
values (461, 'JohnnieTheron', null);
insert into OPERATOR (teid, tename, idpromission)
values (462, 'VondieSchreiber', null);
insert into OPERATOR (teid, tename, idpromission)
values (463, 'MintSwayze', null);
insert into OPERATOR (teid, tename, idpromission)
values (464, 'RuebenJones', null);
insert into OPERATOR (teid, tename, idpromission)
values (465, 'BernieBerry', null);
insert into OPERATOR (teid, tename, idpromission)
values (466, 'AshleyJessee', null);
insert into OPERATOR (teid, tename, idpromission)
values (467, 'HarrisonBell', null);
insert into OPERATOR (teid, tename, idpromission)
values (468, 'LeonardoBacon', null);
insert into OPERATOR (teid, tename, idpromission)
values (469, 'AndrewBonham', null);
insert into OPERATOR (teid, tename, idpromission)
values (470, 'KimberlyThomas', null);
insert into OPERATOR (teid, tename, idpromission)
values (471, 'MatthewWard', null);
insert into OPERATOR (teid, tename, idpromission)
values (472, 'ChristopherFrampton', null);
insert into OPERATOR (teid, tename, idpromission)
values (473, 'GeraldineMacLachlan', null);
insert into OPERATOR (teid, tename, idpromission)
values (474, 'AidanMewes', null);
insert into OPERATOR (teid, tename, idpromission)
values (475, 'DiamondFishburne', null);
insert into OPERATOR (teid, tename, idpromission)
values (476, 'PeteAtkins', null);
insert into OPERATOR (teid, tename, idpromission)
values (477, 'NightBlack', null);
insert into OPERATOR (teid, tename, idpromission)
values (478, 'FreddyDriver', null);
insert into OPERATOR (teid, tename, idpromission)
values (479, 'LouiseClayton', null);
insert into OPERATOR (teid, tename, idpromission)
values (480, 'DaveyDiggs', null);
insert into OPERATOR (teid, tename, idpromission)
values (481, 'GarlandDonovan', null);
insert into OPERATOR (teid, tename, idpromission)
values (482, 'IsaiahPleasure', null);
insert into OPERATOR (teid, tename, idpromission)
values (483, 'AlanLiu', null);
insert into OPERATOR (teid, tename, idpromission)
values (484, 'DanielLoring', null);
insert into OPERATOR (teid, tename, idpromission)
values (485, 'WaymanRooker', null);
insert into OPERATOR (teid, tename, idpromission)
values (486, 'FrankieMilsap', null);
insert into OPERATOR (teid, tename, idpromission)
values (487, 'AimeeGambon', null);
insert into OPERATOR (teid, tename, idpromission)
values (488, 'LucindaAniston', null);
insert into OPERATOR (teid, tename, idpromission)
values (489, 'BradleyPressly', null);
insert into OPERATOR (teid, tename, idpromission)
values (490, 'LionelSpears', null);
insert into OPERATOR (teid, tename, idpromission)
values (491, 'IreneTippe', null);
insert into OPERATOR (teid, tename, idpromission)
values (492, 'GeraldineDanger', null);
insert into OPERATOR (teid, tename, idpromission)
values (493, 'DianeNewman', null);
insert into OPERATOR (teid, tename, idpromission)
values (494, 'DelroyElwes', null);
insert into OPERATOR (teid, tename, idpromission)
values (495, 'PattiSerbedzija', null);
insert into OPERATOR (teid, tename, idpromission)
values (496, 'PamelaSantana', null);
insert into OPERATOR (teid, tename, idpromission)
values (497, 'DianeDavid', null);
insert into OPERATOR (teid, tename, idpromission)
values (498, 'FayeHolbrook', null);
insert into OPERATOR (teid, tename, idpromission)
values (499, 'JonnyRippy', null);
insert into OPERATOR (teid, tename, idpromission)
values (343, 'SalmaShearer', null);
insert into OPERATOR (teid, tename, idpromission)
values (344, 'SteveColtrane', null);
insert into OPERATOR (teid, tename, idpromission)
values (345, 'JohnRush', null);
insert into OPERATOR (teid, tename, idpromission)
values (346, 'TarynMantegna', null);
insert into OPERATOR (teid, tename, idpromission)
values (347, 'RobertaHaslam', null);
insert into OPERATOR (teid, tename, idpromission)
values (348, 'MorrisMcCann', null);
insert into OPERATOR (teid, tename, idpromission)
values (349, 'MurrayShatner', null);
insert into OPERATOR (teid, tename, idpromission)
values (350, 'FionaDriver', null);
insert into OPERATOR (teid, tename, idpromission)
values (351, 'PenelopeAndrews', null);
insert into OPERATOR (teid, tename, idpromission)
values (352, 'MarieMcGriff', null);
insert into OPERATOR (teid, tename, idpromission)
values (353, 'SaulNelson', null);
insert into OPERATOR (teid, tename, idpromission)
values (354, 'ReneLewis', null);
insert into OPERATOR (teid, tename, idpromission)
values (355, 'TreatHagar', null);
insert into OPERATOR (teid, tename, idpromission)
values (356, 'BoTomei', null);
insert into OPERATOR (teid, tename, idpromission)
values (357, 'NedHeslov', null);
insert into OPERATOR (teid, tename, idpromission)
values (358, 'BrianWinter', null);
insert into OPERATOR (teid, tename, idpromission)
values (359, 'EmmylouChristie', null);
insert into OPERATOR (teid, tename, idpromission)
values (360, 'CliffBrolin', null);
insert into OPERATOR (teid, tename, idpromission)
values (361, 'StevieHoliday', null);
insert into OPERATOR (teid, tename, idpromission)
values (362, 'DenisArkenstone', null);
insert into OPERATOR (teid, tename, idpromission)
values (363, 'Mary BethPopper', null);
insert into OPERATOR (teid, tename, idpromission)
values (364, 'SteveCumming', null);
insert into OPERATOR (teid, tename, idpromission)
values (365, 'MadelineBarnett', null);
insert into OPERATOR (teid, tename, idpromission)
values (366, 'JaimeWakeling', null);
insert into OPERATOR (teid, tename, idpromission)
values (367, 'StevieJones', null);
insert into OPERATOR (teid, tename, idpromission)
values (368, 'CliffParm', null);
insert into OPERATOR (teid, tename, idpromission)
values (369, 'AngelaPride', null);
insert into OPERATOR (teid, tename, idpromission)
values (370, 'FairuzaPerrineau', null);
insert into OPERATOR (teid, tename, idpromission)
values (371, 'KevinShaye', null);
commit;
prompt 200 records committed...
insert into OPERATOR (teid, tename, idpromission)
values (372, 'DarrenZeta-Jones', null);
insert into OPERATOR (teid, tename, idpromission)
values (373, 'ChakaWilder', null);
insert into OPERATOR (teid, tename, idpromission)
values (374, 'KatrinWithers', null);
insert into OPERATOR (teid, tename, idpromission)
values (375, 'BenicioCleary', null);
insert into OPERATOR (teid, tename, idpromission)
values (376, 'CrispinLynskey', null);
insert into OPERATOR (teid, tename, idpromission)
values (377, 'BalthazarRifkin', null);
insert into OPERATOR (teid, tename, idpromission)
values (378, 'JesseBirch', null);
insert into OPERATOR (teid, tename, idpromission)
values (379, 'BarryNeill', null);
insert into OPERATOR (teid, tename, idpromission)
values (380, 'MykeltiMoffat', null);
insert into OPERATOR (teid, tename, idpromission)
values (381, 'SuziRankin', null);
insert into OPERATOR (teid, tename, idpromission)
values (382, 'AlessandroOrbit', null);
insert into OPERATOR (teid, tename, idpromission)
values (383, 'GuyCampbell', null);
insert into OPERATOR (teid, tename, idpromission)
values (384, 'EmmMaxwell', null);
insert into OPERATOR (teid, tename, idpromission)
values (385, 'ReneeAmos', null);
insert into OPERATOR (teid, tename, idpromission)
values (386, 'LisaMraz', null);
insert into OPERATOR (teid, tename, idpromission)
values (387, 'OdedMoreno', null);
insert into OPERATOR (teid, tename, idpromission)
values (388, 'BobLangella', null);
insert into OPERATOR (teid, tename, idpromission)
values (389, 'LindaMifune', null);
insert into OPERATOR (teid, tename, idpromission)
values (390, 'HugoHolm', null);
insert into OPERATOR (teid, tename, idpromission)
values (391, 'EmmaPlatt', null);
insert into OPERATOR (teid, tename, idpromission)
values (392, 'EttaVannelli', null);
insert into OPERATOR (teid, tename, idpromission)
values (393, 'GwynethRundgren', null);
insert into OPERATOR (teid, tename, idpromission)
values (394, 'GloriaLarter', null);
insert into OPERATOR (teid, tename, idpromission)
values (395, 'ChuckBenson', null);
insert into OPERATOR (teid, tename, idpromission)
values (396, 'RufusLithgow', null);
insert into OPERATOR (teid, tename, idpromission)
values (397, 'ScarlettReid', null);
insert into OPERATOR (teid, tename, idpromission)
values (398, 'MichelleCrouch', null);
insert into OPERATOR (teid, tename, idpromission)
values (399, 'HazelWorrell', null);
insert into OPERATOR (teid, tename, idpromission)
values (400, 'WesPalmer', null);
insert into OPERATOR (teid, tename, idpromission)
values (100, 'MattCollie', null);
insert into OPERATOR (teid, tename, idpromission)
values (101, 'JulietPfeiffer', null);
insert into OPERATOR (teid, tename, idpromission)
values (102, 'ChristianMewes', null);
insert into OPERATOR (teid, tename, idpromission)
values (103, 'GlenTanon', null);
insert into OPERATOR (teid, tename, idpromission)
values (104, 'OwenLaPaglia', null);
insert into OPERATOR (teid, tename, idpromission)
values (105, 'IvanHatchet', null);
insert into OPERATOR (teid, tename, idpromission)
values (106, 'FranzHunter', null);
insert into OPERATOR (teid, tename, idpromission)
values (107, 'RobGaines', null);
insert into OPERATOR (teid, tename, idpromission)
values (108, 'HexFoxx', null);
insert into OPERATOR (teid, tename, idpromission)
values (109, 'AliciaWinstone', null);
insert into OPERATOR (teid, tename, idpromission)
values (110, 'PhilipBenson', null);
insert into OPERATOR (teid, tename, idpromission)
values (111, 'TziMcAnally', null);
insert into OPERATOR (teid, tename, idpromission)
values (112, 'MarleyBlossoms', null);
insert into OPERATOR (teid, tename, idpromission)
values (113, 'DaveBuffalo', null);
insert into OPERATOR (teid, tename, idpromission)
values (114, 'KirkCromwell', null);
insert into OPERATOR (teid, tename, idpromission)
values (115, 'MarlonSecada', null);
insert into OPERATOR (teid, tename, idpromission)
values (116, 'MaxDiBiasio', null);
insert into OPERATOR (teid, tename, idpromission)
values (117, 'CevinBachman', null);
insert into OPERATOR (teid, tename, idpromission)
values (118, 'MekhiCantrell', null);
insert into OPERATOR (teid, tename, idpromission)
values (119, 'HarryBrando', null);
insert into OPERATOR (teid, tename, idpromission)
values (120, 'HarrisonMcPherson', null);
insert into OPERATOR (teid, tename, idpromission)
values (121, 'LupeRebhorn', null);
insert into OPERATOR (teid, tename, idpromission)
values (122, 'YolandaJeffreys', null);
insert into OPERATOR (teid, tename, idpromission)
values (123, 'RadeLogue', null);
insert into OPERATOR (teid, tename, idpromission)
values (124, 'JuliannePride', null);
insert into OPERATOR (teid, tename, idpromission)
values (125, 'NikSchwarzenegger', null);
insert into OPERATOR (teid, tename, idpromission)
values (126, 'HarrisVai', null);
insert into OPERATOR (teid, tename, idpromission)
values (127, 'ClaireGibson', null);
insert into OPERATOR (teid, tename, idpromission)
values (128, 'PragaLevin', null);
insert into OPERATOR (teid, tename, idpromission)
values (129, 'YaphetTierney', null);
insert into OPERATOR (teid, tename, idpromission)
values (130, 'KathleenBranch', null);
insert into OPERATOR (teid, tename, idpromission)
values (131, 'ReneeKlugh', null);
insert into OPERATOR (teid, tename, idpromission)
values (132, 'ChristopherGill', null);
insert into OPERATOR (teid, tename, idpromission)
values (133, 'TchekyTolkan', null);
insert into OPERATOR (teid, tename, idpromission)
values (134, 'RachidNeil', null);
insert into OPERATOR (teid, tename, idpromission)
values (135, 'LenaDaniels', null);
insert into OPERATOR (teid, tename, idpromission)
values (136, 'EddieCulkin', null);
insert into OPERATOR (teid, tename, idpromission)
values (137, 'HollandWahlberg', null);
insert into OPERATOR (teid, tename, idpromission)
values (138, 'AliciaShand', null);
insert into OPERATOR (teid, tename, idpromission)
values (139, 'ClayTurner', null);
insert into OPERATOR (teid, tename, idpromission)
values (140, 'JeffreyScorsese', null);
insert into OPERATOR (teid, tename, idpromission)
values (141, 'BethRicci', null);
insert into OPERATOR (teid, tename, idpromission)
values (142, 'LucyCoburn', null);
insert into OPERATOR (teid, tename, idpromission)
values (143, 'JoelyPresley', null);
insert into OPERATOR (teid, tename, idpromission)
values (144, 'DesmondNuman', null);
insert into OPERATOR (teid, tename, idpromission)
values (145, 'ChristineGarza', null);
insert into OPERATOR (teid, tename, idpromission)
values (146, 'HeathHatchet', null);
insert into OPERATOR (teid, tename, idpromission)
values (147, 'MurrayWhitley', null);
insert into OPERATOR (teid, tename, idpromission)
values (148, 'TimHeald', null);
insert into OPERATOR (teid, tename, idpromission)
values (149, 'BrentMueller-Stahl', null);
insert into OPERATOR (teid, tename, idpromission)
values (150, 'MollyGraham', null);
insert into OPERATOR (teid, tename, idpromission)
values (151, 'MiaMac', null);
insert into OPERATOR (teid, tename, idpromission)
values (152, 'RoyCash', null);
insert into OPERATOR (teid, tename, idpromission)
values (153, 'LauraSepulveda', null);
insert into OPERATOR (teid, tename, idpromission)
values (154, 'ConnieFuray', null);
insert into OPERATOR (teid, tename, idpromission)
values (155, 'NicoleMacy', null);
insert into OPERATOR (teid, tename, idpromission)
values (156, 'DarrenHeslov', null);
insert into OPERATOR (teid, tename, idpromission)
values (157, 'HectorJackson', null);
insert into OPERATOR (teid, tename, idpromission)
values (158, 'DebraStarr', null);
insert into OPERATOR (teid, tename, idpromission)
values (159, 'SharonStills', null);
insert into OPERATOR (teid, tename, idpromission)
values (160, 'OwenWhite', null);
insert into OPERATOR (teid, tename, idpromission)
values (161, 'LydiaGriggs', null);
insert into OPERATOR (teid, tename, idpromission)
values (162, 'ChadFinn', null);
insert into OPERATOR (teid, tename, idpromission)
values (163, 'PatriciaMoffat', null);
insert into OPERATOR (teid, tename, idpromission)
values (164, 'NicolePostlethwaite', null);
insert into OPERATOR (teid, tename, idpromission)
values (165, 'HarveyHayek', null);
insert into OPERATOR (teid, tename, idpromission)
values (166, 'KeithKapanka', null);
insert into OPERATOR (teid, tename, idpromission)
values (167, 'AustinLewis', null);
insert into OPERATOR (teid, tename, idpromission)
values (168, 'PatrickGeldof', null);
insert into OPERATOR (teid, tename, idpromission)
values (169, 'RandallWillis', null);
insert into OPERATOR (teid, tename, idpromission)
values (170, 'LiamBalk', null);
commit;
prompt 300 records committed...
insert into OPERATOR (teid, tename, idpromission)
values (171, 'SigourneyPenders', null);
insert into OPERATOR (teid, tename, idpromission)
values (172, 'JackHeston', null);
insert into OPERATOR (teid, tename, idpromission)
values (173, 'MillaHayek', null);
insert into OPERATOR (teid, tename, idpromission)
values (174, 'SharonAli', null);
insert into OPERATOR (teid, tename, idpromission)
values (175, 'NigelHeslov', null);
insert into OPERATOR (teid, tename, idpromission)
values (176, 'CharltonCronin', null);
insert into OPERATOR (teid, tename, idpromission)
values (177, 'AndieDukakis', null);
insert into OPERATOR (teid, tename, idpromission)
values (178, 'GarryRhodes', null);
insert into OPERATOR (teid, tename, idpromission)
values (179, 'HarryRaybon', null);
insert into OPERATOR (teid, tename, idpromission)
values (180, 'Jean-ClaudeGuzman', null);
insert into OPERATOR (teid, tename, idpromission)
values (181, 'MaggieGalecki', null);
insert into OPERATOR (teid, tename, idpromission)
values (182, 'VictorVaughan', null);
insert into OPERATOR (teid, tename, idpromission)
values (183, 'CarrieFlanagan', null);
insert into OPERATOR (teid, tename, idpromission)
values (184, 'TommyCraddock', null);
insert into OPERATOR (teid, tename, idpromission)
values (185, 'KurtSpector', null);
insert into OPERATOR (teid, tename, idpromission)
values (186, 'AndreaCraig', null);
insert into OPERATOR (teid, tename, idpromission)
values (187, 'GeenaGilley', null);
insert into OPERATOR (teid, tename, idpromission)
values (188, 'GailardBrooke', null);
insert into OPERATOR (teid, tename, idpromission)
values (189, 'LesleyBullock', null);
insert into OPERATOR (teid, tename, idpromission)
values (190, 'JerryEvans', null);
insert into OPERATOR (teid, tename, idpromission)
values (191, 'TildaWaits', null);
insert into OPERATOR (teid, tename, idpromission)
values (192, 'PattyParsons', null);
insert into OPERATOR (teid, tename, idpromission)
values (193, 'SineadNicholas', null);
insert into OPERATOR (teid, tename, idpromission)
values (194, 'LeslieCurry', null);
insert into OPERATOR (teid, tename, idpromission)
values (195, 'GailardCook', null);
insert into OPERATOR (teid, tename, idpromission)
values (196, 'DomingoImbruglia', null);
insert into OPERATOR (teid, tename, idpromission)
values (197, 'MiaMargulies', null);
insert into OPERATOR (teid, tename, idpromission)
values (198, 'SalGriffiths', null);
insert into OPERATOR (teid, tename, idpromission)
values (199, 'JoaquinHagerty', null);
insert into OPERATOR (teid, tename, idpromission)
values (200, 'NinaSepulveda', null);
insert into OPERATOR (teid, tename, idpromission)
values (201, 'StephenSanchez', null);
insert into OPERATOR (teid, tename, idpromission)
values (202, 'SolomonVanian', null);
insert into OPERATOR (teid, tename, idpromission)
values (203, 'DanielShaw', null);
insert into OPERATOR (teid, tename, idpromission)
values (204, 'VerticalKapanka', null);
insert into OPERATOR (teid, tename, idpromission)
values (205, 'BuffyCampbell', null);
insert into OPERATOR (teid, tename, idpromission)
values (206, 'RitaTennison', null);
insert into OPERATOR (teid, tename, idpromission)
values (207, 'HarrietPayne', null);
insert into OPERATOR (teid, tename, idpromission)
values (208, 'CarleneO''Hara', null);
insert into OPERATOR (teid, tename, idpromission)
values (209, 'AliMcCormack', null);
insert into OPERATOR (teid, tename, idpromission)
values (210, 'ChristineKaryo', null);
insert into OPERATOR (teid, tename, idpromission)
values (211, 'ThinStarr', null);
insert into OPERATOR (teid, tename, idpromission)
values (212, 'LiamGyllenhaal', null);
insert into OPERATOR (teid, tename, idpromission)
values (213, 'ColeFonda', null);
insert into OPERATOR (teid, tename, idpromission)
values (214, 'MiaRodriguez', null);
insert into OPERATOR (teid, tename, idpromission)
values (215, 'DebbieBancroft', null);
insert into OPERATOR (teid, tename, idpromission)
values (216, 'RheaHawn', null);
insert into OPERATOR (teid, tename, idpromission)
values (217, 'ElizaBosco', null);
insert into OPERATOR (teid, tename, idpromission)
values (218, 'GabrielClinton', null);
insert into OPERATOR (teid, tename, idpromission)
values (219, 'HollyFrakes', null);
insert into OPERATOR (teid, tename, idpromission)
values (220, 'CesarKramer', null);
insert into OPERATOR (teid, tename, idpromission)
values (221, 'LisaBlossoms', null);
insert into OPERATOR (teid, tename, idpromission)
values (222, 'DiamondGyllenhaal', null);
insert into OPERATOR (teid, tename, idpromission)
values (223, 'CarlWilliams', null);
insert into OPERATOR (teid, tename, idpromission)
values (224, 'GlenMatheson', null);
insert into OPERATOR (teid, tename, idpromission)
values (225, 'MintMills', null);
insert into OPERATOR (teid, tename, idpromission)
values (226, 'MirandaKingsley', null);
insert into OPERATOR (teid, tename, idpromission)
values (227, 'JoanHaggard', null);
insert into OPERATOR (teid, tename, idpromission)
values (228, 'CaroleEmmerich', null);
insert into OPERATOR (teid, tename, idpromission)
values (229, 'KathleenTillis', null);
insert into OPERATOR (teid, tename, idpromission)
values (230, 'CeiliHimmelman', null);
insert into OPERATOR (teid, tename, idpromission)
values (231, 'JosephBeckinsale', null);
insert into OPERATOR (teid, tename, idpromission)
values (232, 'GeggyKadison', null);
insert into OPERATOR (teid, tename, idpromission)
values (233, 'GilBadalucco', null);
insert into OPERATOR (teid, tename, idpromission)
values (234, 'BridgetteGold', null);
insert into OPERATOR (teid, tename, idpromission)
values (235, 'SonaIsaak', null);
insert into OPERATOR (teid, tename, idpromission)
values (236, 'LeaKlugh', null);
insert into OPERATOR (teid, tename, idpromission)
values (237, 'DorryRipley', null);
insert into OPERATOR (teid, tename, idpromission)
values (238, 'BradleyHaslam', null);
insert into OPERATOR (teid, tename, idpromission)
values (239, 'ReneSingh', null);
insert into OPERATOR (teid, tename, idpromission)
values (240, 'YolandaHawthorne', null);
insert into OPERATOR (teid, tename, idpromission)
values (241, 'CarlosSinatra', null);
insert into OPERATOR (teid, tename, idpromission)
values (242, 'JacksonConnick', null);
insert into OPERATOR (teid, tename, idpromission)
values (243, 'JeanneLemmon', null);
insert into OPERATOR (teid, tename, idpromission)
values (244, 'BelindaDonovan', null);
insert into OPERATOR (teid, tename, idpromission)
values (245, 'GoldieSteagall', null);
insert into OPERATOR (teid, tename, idpromission)
values (246, 'SelmaMatarazzo', null);
insert into OPERATOR (teid, tename, idpromission)
values (247, 'JoshCarrack', null);
insert into OPERATOR (teid, tename, idpromission)
values (248, 'AzucarDiffie', null);
insert into OPERATOR (teid, tename, idpromission)
values (249, 'PhilipBarrymore', null);
insert into OPERATOR (teid, tename, idpromission)
values (250, 'AnneGiamatti', null);
insert into OPERATOR (teid, tename, idpromission)
values (251, 'AniShand', null);
insert into OPERATOR (teid, tename, idpromission)
values (252, 'RitaHayes', null);
insert into OPERATOR (teid, tename, idpromission)
values (253, 'ElvisCurry', null);
insert into OPERATOR (teid, tename, idpromission)
values (254, 'EmilyMarsden', null);
insert into OPERATOR (teid, tename, idpromission)
values (255, 'RyanMaxwell', null);
insert into OPERATOR (teid, tename, idpromission)
values (256, 'CornellVan Der Beek', null);
insert into OPERATOR (teid, tename, idpromission)
values (257, 'MaeWeisz', null);
insert into OPERATOR (teid, tename, idpromission)
values (258, 'BlairEstevez', null);
insert into OPERATOR (teid, tename, idpromission)
values (259, 'TraceSpader', null);
insert into OPERATOR (teid, tename, idpromission)
values (260, 'YaphetO''Neal', null);
insert into OPERATOR (teid, tename, idpromission)
values (261, 'OlympiaWilson', null);
insert into OPERATOR (teid, tename, idpromission)
values (262, 'PaulaHong', null);
insert into OPERATOR (teid, tename, idpromission)
values (263, 'WhoopiLowe', null);
insert into OPERATOR (teid, tename, idpromission)
values (264, 'FirstWhitford', null);
insert into OPERATOR (teid, tename, idpromission)
values (265, 'AdinaO''Keefe', null);
insert into OPERATOR (teid, tename, idpromission)
values (266, 'LynetteCollins', null);
insert into OPERATOR (teid, tename, idpromission)
values (267, 'WallyMoss', null);
insert into OPERATOR (teid, tename, idpromission)
values (268, 'JulietBuscemi', null);
insert into OPERATOR (teid, tename, idpromission)
values (269, 'JesusPonce', null);
insert into OPERATOR (teid, tename, idpromission)
values (270, 'SpikeFlemyng', null);
commit;
prompt 400 records loaded
prompt Loading PRACTICING...
insert into PRACTICING (emdrid, teid)
values (1, 7);
insert into PRACTICING (emdrid, teid)
values (1, 23);
insert into PRACTICING (emdrid, teid)
values (1, 43);
insert into PRACTICING (emdrid, teid)
values (1, 50);
insert into PRACTICING (emdrid, teid)
values (1, 60);
insert into PRACTICING (emdrid, teid)
values (1, 62);
insert into PRACTICING (emdrid, teid)
values (1, 63);
insert into PRACTICING (emdrid, teid)
values (1, 72);
insert into PRACTICING (emdrid, teid)
values (1, 76);
insert into PRACTICING (emdrid, teid)
values (1, 77);
insert into PRACTICING (emdrid, teid)
values (1, 86);
insert into PRACTICING (emdrid, teid)
values (1, 93);
insert into PRACTICING (emdrid, teid)
values (1, 97);
insert into PRACTICING (emdrid, teid)
values (1, 98);
insert into PRACTICING (emdrid, teid)
values (1, 99);
insert into PRACTICING (emdrid, teid)
values (1, 103);
insert into PRACTICING (emdrid, teid)
values (1, 118);
insert into PRACTICING (emdrid, teid)
values (1, 122);
insert into PRACTICING (emdrid, teid)
values (1, 123);
insert into PRACTICING (emdrid, teid)
values (1, 130);
insert into PRACTICING (emdrid, teid)
values (1, 136);
insert into PRACTICING (emdrid, teid)
values (1, 145);
insert into PRACTICING (emdrid, teid)
values (1, 158);
insert into PRACTICING (emdrid, teid)
values (1, 178);
insert into PRACTICING (emdrid, teid)
values (1, 179);
insert into PRACTICING (emdrid, teid)
values (1, 187);
insert into PRACTICING (emdrid, teid)
values (1, 197);
insert into PRACTICING (emdrid, teid)
values (1, 204);
insert into PRACTICING (emdrid, teid)
values (1, 213);
insert into PRACTICING (emdrid, teid)
values (1, 215);
insert into PRACTICING (emdrid, teid)
values (1, 221);
insert into PRACTICING (emdrid, teid)
values (1, 229);
insert into PRACTICING (emdrid, teid)
values (1, 234);
insert into PRACTICING (emdrid, teid)
values (1, 239);
insert into PRACTICING (emdrid, teid)
values (1, 243);
insert into PRACTICING (emdrid, teid)
values (1, 246);
insert into PRACTICING (emdrid, teid)
values (1, 255);
insert into PRACTICING (emdrid, teid)
values (1, 266);
insert into PRACTICING (emdrid, teid)
values (1, 271);
insert into PRACTICING (emdrid, teid)
values (1, 278);
insert into PRACTICING (emdrid, teid)
values (1, 288);
insert into PRACTICING (emdrid, teid)
values (1, 291);
insert into PRACTICING (emdrid, teid)
values (1, 298);
insert into PRACTICING (emdrid, teid)
values (1, 308);
insert into PRACTICING (emdrid, teid)
values (1, 314);
insert into PRACTICING (emdrid, teid)
values (1, 315);
insert into PRACTICING (emdrid, teid)
values (1, 318);
insert into PRACTICING (emdrid, teid)
values (1, 324);
insert into PRACTICING (emdrid, teid)
values (1, 328);
insert into PRACTICING (emdrid, teid)
values (1, 330);
insert into PRACTICING (emdrid, teid)
values (1, 334);
insert into PRACTICING (emdrid, teid)
values (1, 336);
insert into PRACTICING (emdrid, teid)
values (1, 347);
insert into PRACTICING (emdrid, teid)
values (1, 354);
insert into PRACTICING (emdrid, teid)
values (1, 360);
insert into PRACTICING (emdrid, teid)
values (1, 371);
insert into PRACTICING (emdrid, teid)
values (1, 377);
insert into PRACTICING (emdrid, teid)
values (1, 383);
insert into PRACTICING (emdrid, teid)
values (1, 389);
insert into PRACTICING (emdrid, teid)
values (1, 394);
insert into PRACTICING (emdrid, teid)
values (1, 397);
insert into PRACTICING (emdrid, teid)
values (2, 3);
insert into PRACTICING (emdrid, teid)
values (2, 6);
insert into PRACTICING (emdrid, teid)
values (2, 14);
insert into PRACTICING (emdrid, teid)
values (2, 29);
insert into PRACTICING (emdrid, teid)
values (2, 36);
insert into PRACTICING (emdrid, teid)
values (2, 37);
insert into PRACTICING (emdrid, teid)
values (2, 44);
insert into PRACTICING (emdrid, teid)
values (2, 50);
insert into PRACTICING (emdrid, teid)
values (2, 56);
insert into PRACTICING (emdrid, teid)
values (2, 61);
insert into PRACTICING (emdrid, teid)
values (2, 70);
insert into PRACTICING (emdrid, teid)
values (2, 76);
insert into PRACTICING (emdrid, teid)
values (2, 85);
insert into PRACTICING (emdrid, teid)
values (2, 87);
insert into PRACTICING (emdrid, teid)
values (2, 88);
insert into PRACTICING (emdrid, teid)
values (2, 92);
insert into PRACTICING (emdrid, teid)
values (2, 97);
insert into PRACTICING (emdrid, teid)
values (2, 106);
insert into PRACTICING (emdrid, teid)
values (2, 118);
insert into PRACTICING (emdrid, teid)
values (2, 119);
insert into PRACTICING (emdrid, teid)
values (2, 121);
insert into PRACTICING (emdrid, teid)
values (2, 141);
insert into PRACTICING (emdrid, teid)
values (2, 142);
insert into PRACTICING (emdrid, teid)
values (2, 147);
insert into PRACTICING (emdrid, teid)
values (2, 149);
insert into PRACTICING (emdrid, teid)
values (2, 153);
insert into PRACTICING (emdrid, teid)
values (2, 155);
insert into PRACTICING (emdrid, teid)
values (2, 163);
insert into PRACTICING (emdrid, teid)
values (2, 167);
insert into PRACTICING (emdrid, teid)
values (2, 176);
insert into PRACTICING (emdrid, teid)
values (2, 180);
insert into PRACTICING (emdrid, teid)
values (2, 185);
insert into PRACTICING (emdrid, teid)
values (2, 187);
insert into PRACTICING (emdrid, teid)
values (2, 196);
insert into PRACTICING (emdrid, teid)
values (2, 197);
insert into PRACTICING (emdrid, teid)
values (2, 205);
insert into PRACTICING (emdrid, teid)
values (2, 225);
insert into PRACTICING (emdrid, teid)
values (2, 235);
insert into PRACTICING (emdrid, teid)
values (2, 244);
commit;
prompt 100 records committed...
insert into PRACTICING (emdrid, teid)
values (2, 250);
insert into PRACTICING (emdrid, teid)
values (2, 255);
insert into PRACTICING (emdrid, teid)
values (2, 267);
insert into PRACTICING (emdrid, teid)
values (2, 268);
insert into PRACTICING (emdrid, teid)
values (2, 272);
insert into PRACTICING (emdrid, teid)
values (2, 275);
insert into PRACTICING (emdrid, teid)
values (2, 281);
insert into PRACTICING (emdrid, teid)
values (2, 285);
insert into PRACTICING (emdrid, teid)
values (2, 293);
insert into PRACTICING (emdrid, teid)
values (2, 309);
insert into PRACTICING (emdrid, teid)
values (2, 318);
insert into PRACTICING (emdrid, teid)
values (2, 320);
insert into PRACTICING (emdrid, teid)
values (2, 321);
insert into PRACTICING (emdrid, teid)
values (2, 325);
insert into PRACTICING (emdrid, teid)
values (2, 331);
insert into PRACTICING (emdrid, teid)
values (2, 332);
insert into PRACTICING (emdrid, teid)
values (2, 333);
insert into PRACTICING (emdrid, teid)
values (2, 336);
insert into PRACTICING (emdrid, teid)
values (2, 341);
insert into PRACTICING (emdrid, teid)
values (2, 343);
insert into PRACTICING (emdrid, teid)
values (2, 350);
insert into PRACTICING (emdrid, teid)
values (2, 352);
insert into PRACTICING (emdrid, teid)
values (2, 358);
insert into PRACTICING (emdrid, teid)
values (2, 364);
insert into PRACTICING (emdrid, teid)
values (2, 376);
insert into PRACTICING (emdrid, teid)
values (2, 381);
insert into PRACTICING (emdrid, teid)
values (2, 390);
insert into PRACTICING (emdrid, teid)
values (2, 392);
insert into PRACTICING (emdrid, teid)
values (3, 2);
insert into PRACTICING (emdrid, teid)
values (3, 9);
insert into PRACTICING (emdrid, teid)
values (3, 31);
insert into PRACTICING (emdrid, teid)
values (3, 42);
insert into PRACTICING (emdrid, teid)
values (3, 48);
insert into PRACTICING (emdrid, teid)
values (3, 53);
insert into PRACTICING (emdrid, teid)
values (3, 61);
insert into PRACTICING (emdrid, teid)
values (3, 68);
insert into PRACTICING (emdrid, teid)
values (3, 72);
insert into PRACTICING (emdrid, teid)
values (3, 87);
insert into PRACTICING (emdrid, teid)
values (3, 91);
insert into PRACTICING (emdrid, teid)
values (3, 125);
insert into PRACTICING (emdrid, teid)
values (3, 127);
insert into PRACTICING (emdrid, teid)
values (3, 128);
insert into PRACTICING (emdrid, teid)
values (3, 131);
insert into PRACTICING (emdrid, teid)
values (3, 137);
insert into PRACTICING (emdrid, teid)
values (3, 142);
insert into PRACTICING (emdrid, teid)
values (3, 160);
insert into PRACTICING (emdrid, teid)
values (3, 161);
insert into PRACTICING (emdrid, teid)
values (3, 169);
insert into PRACTICING (emdrid, teid)
values (3, 170);
insert into PRACTICING (emdrid, teid)
values (3, 171);
insert into PRACTICING (emdrid, teid)
values (3, 177);
insert into PRACTICING (emdrid, teid)
values (3, 186);
insert into PRACTICING (emdrid, teid)
values (3, 188);
insert into PRACTICING (emdrid, teid)
values (3, 197);
insert into PRACTICING (emdrid, teid)
values (3, 200);
insert into PRACTICING (emdrid, teid)
values (3, 201);
insert into PRACTICING (emdrid, teid)
values (3, 209);
insert into PRACTICING (emdrid, teid)
values (3, 212);
insert into PRACTICING (emdrid, teid)
values (3, 218);
insert into PRACTICING (emdrid, teid)
values (3, 219);
insert into PRACTICING (emdrid, teid)
values (3, 224);
insert into PRACTICING (emdrid, teid)
values (3, 228);
insert into PRACTICING (emdrid, teid)
values (3, 235);
insert into PRACTICING (emdrid, teid)
values (3, 242);
insert into PRACTICING (emdrid, teid)
values (3, 243);
insert into PRACTICING (emdrid, teid)
values (3, 248);
insert into PRACTICING (emdrid, teid)
values (3, 250);
insert into PRACTICING (emdrid, teid)
values (3, 252);
insert into PRACTICING (emdrid, teid)
values (3, 253);
insert into PRACTICING (emdrid, teid)
values (3, 263);
insert into PRACTICING (emdrid, teid)
values (3, 272);
insert into PRACTICING (emdrid, teid)
values (3, 295);
insert into PRACTICING (emdrid, teid)
values (3, 298);
insert into PRACTICING (emdrid, teid)
values (3, 301);
insert into PRACTICING (emdrid, teid)
values (3, 307);
insert into PRACTICING (emdrid, teid)
values (3, 308);
insert into PRACTICING (emdrid, teid)
values (3, 310);
insert into PRACTICING (emdrid, teid)
values (3, 339);
insert into PRACTICING (emdrid, teid)
values (3, 362);
insert into PRACTICING (emdrid, teid)
values (3, 368);
insert into PRACTICING (emdrid, teid)
values (3, 371);
insert into PRACTICING (emdrid, teid)
values (3, 379);
insert into PRACTICING (emdrid, teid)
values (3, 382);
insert into PRACTICING (emdrid, teid)
values (3, 387);
insert into PRACTICING (emdrid, teid)
values (3, 393);
insert into PRACTICING (emdrid, teid)
values (3, 394);
insert into PRACTICING (emdrid, teid)
values (3, 396);
insert into PRACTICING (emdrid, teid)
values (4, 2);
insert into PRACTICING (emdrid, teid)
values (4, 10);
insert into PRACTICING (emdrid, teid)
values (4, 11);
insert into PRACTICING (emdrid, teid)
values (4, 27);
insert into PRACTICING (emdrid, teid)
values (4, 33);
insert into PRACTICING (emdrid, teid)
values (4, 36);
insert into PRACTICING (emdrid, teid)
values (4, 40);
insert into PRACTICING (emdrid, teid)
values (4, 43);
insert into PRACTICING (emdrid, teid)
values (4, 45);
insert into PRACTICING (emdrid, teid)
values (4, 47);
insert into PRACTICING (emdrid, teid)
values (4, 51);
insert into PRACTICING (emdrid, teid)
values (4, 55);
insert into PRACTICING (emdrid, teid)
values (4, 57);
commit;
prompt 200 records committed...
insert into PRACTICING (emdrid, teid)
values (4, 60);
insert into PRACTICING (emdrid, teid)
values (4, 63);
insert into PRACTICING (emdrid, teid)
values (4, 75);
insert into PRACTICING (emdrid, teid)
values (4, 80);
insert into PRACTICING (emdrid, teid)
values (4, 87);
insert into PRACTICING (emdrid, teid)
values (4, 90);
insert into PRACTICING (emdrid, teid)
values (4, 97);
insert into PRACTICING (emdrid, teid)
values (4, 122);
insert into PRACTICING (emdrid, teid)
values (4, 128);
insert into PRACTICING (emdrid, teid)
values (4, 130);
insert into PRACTICING (emdrid, teid)
values (4, 136);
insert into PRACTICING (emdrid, teid)
values (4, 148);
insert into PRACTICING (emdrid, teid)
values (4, 151);
insert into PRACTICING (emdrid, teid)
values (4, 156);
insert into PRACTICING (emdrid, teid)
values (4, 159);
insert into PRACTICING (emdrid, teid)
values (4, 167);
insert into PRACTICING (emdrid, teid)
values (4, 174);
insert into PRACTICING (emdrid, teid)
values (4, 189);
insert into PRACTICING (emdrid, teid)
values (4, 194);
insert into PRACTICING (emdrid, teid)
values (4, 195);
insert into PRACTICING (emdrid, teid)
values (4, 205);
insert into PRACTICING (emdrid, teid)
values (4, 208);
insert into PRACTICING (emdrid, teid)
values (4, 213);
insert into PRACTICING (emdrid, teid)
values (4, 214);
insert into PRACTICING (emdrid, teid)
values (4, 225);
insert into PRACTICING (emdrid, teid)
values (4, 236);
insert into PRACTICING (emdrid, teid)
values (4, 247);
insert into PRACTICING (emdrid, teid)
values (4, 252);
insert into PRACTICING (emdrid, teid)
values (4, 268);
insert into PRACTICING (emdrid, teid)
values (4, 280);
insert into PRACTICING (emdrid, teid)
values (4, 281);
insert into PRACTICING (emdrid, teid)
values (4, 290);
insert into PRACTICING (emdrid, teid)
values (4, 300);
insert into PRACTICING (emdrid, teid)
values (4, 315);
insert into PRACTICING (emdrid, teid)
values (4, 321);
insert into PRACTICING (emdrid, teid)
values (4, 338);
insert into PRACTICING (emdrid, teid)
values (4, 342);
insert into PRACTICING (emdrid, teid)
values (4, 358);
insert into PRACTICING (emdrid, teid)
values (4, 361);
insert into PRACTICING (emdrid, teid)
values (4, 363);
insert into PRACTICING (emdrid, teid)
values (4, 370);
insert into PRACTICING (emdrid, teid)
values (4, 377);
insert into PRACTICING (emdrid, teid)
values (4, 393);
insert into PRACTICING (emdrid, teid)
values (4, 397);
insert into PRACTICING (emdrid, teid)
values (10, 6);
insert into PRACTICING (emdrid, teid)
values (10, 8);
insert into PRACTICING (emdrid, teid)
values (10, 21);
insert into PRACTICING (emdrid, teid)
values (10, 36);
insert into PRACTICING (emdrid, teid)
values (10, 44);
insert into PRACTICING (emdrid, teid)
values (10, 57);
insert into PRACTICING (emdrid, teid)
values (10, 61);
insert into PRACTICING (emdrid, teid)
values (10, 62);
insert into PRACTICING (emdrid, teid)
values (10, 64);
insert into PRACTICING (emdrid, teid)
values (10, 66);
insert into PRACTICING (emdrid, teid)
values (10, 73);
insert into PRACTICING (emdrid, teid)
values (10, 81);
insert into PRACTICING (emdrid, teid)
values (10, 83);
insert into PRACTICING (emdrid, teid)
values (10, 84);
insert into PRACTICING (emdrid, teid)
values (10, 88);
insert into PRACTICING (emdrid, teid)
values (10, 91);
insert into PRACTICING (emdrid, teid)
values (10, 99);
insert into PRACTICING (emdrid, teid)
values (10, 102);
insert into PRACTICING (emdrid, teid)
values (10, 107);
insert into PRACTICING (emdrid, teid)
values (10, 109);
insert into PRACTICING (emdrid, teid)
values (10, 118);
insert into PRACTICING (emdrid, teid)
values (10, 119);
insert into PRACTICING (emdrid, teid)
values (10, 136);
insert into PRACTICING (emdrid, teid)
values (10, 138);
insert into PRACTICING (emdrid, teid)
values (10, 152);
insert into PRACTICING (emdrid, teid)
values (10, 156);
insert into PRACTICING (emdrid, teid)
values (10, 158);
insert into PRACTICING (emdrid, teid)
values (10, 164);
insert into PRACTICING (emdrid, teid)
values (10, 165);
insert into PRACTICING (emdrid, teid)
values (10, 167);
insert into PRACTICING (emdrid, teid)
values (10, 169);
insert into PRACTICING (emdrid, teid)
values (10, 176);
insert into PRACTICING (emdrid, teid)
values (10, 194);
insert into PRACTICING (emdrid, teid)
values (10, 200);
insert into PRACTICING (emdrid, teid)
values (10, 208);
insert into PRACTICING (emdrid, teid)
values (10, 224);
insert into PRACTICING (emdrid, teid)
values (10, 238);
insert into PRACTICING (emdrid, teid)
values (10, 249);
insert into PRACTICING (emdrid, teid)
values (10, 253);
insert into PRACTICING (emdrid, teid)
values (10, 254);
insert into PRACTICING (emdrid, teid)
values (10, 261);
insert into PRACTICING (emdrid, teid)
values (10, 271);
insert into PRACTICING (emdrid, teid)
values (10, 273);
insert into PRACTICING (emdrid, teid)
values (10, 278);
insert into PRACTICING (emdrid, teid)
values (10, 280);
insert into PRACTICING (emdrid, teid)
values (10, 288);
insert into PRACTICING (emdrid, teid)
values (10, 296);
insert into PRACTICING (emdrid, teid)
values (10, 303);
insert into PRACTICING (emdrid, teid)
values (10, 305);
insert into PRACTICING (emdrid, teid)
values (10, 319);
insert into PRACTICING (emdrid, teid)
values (10, 323);
insert into PRACTICING (emdrid, teid)
values (10, 325);
insert into PRACTICING (emdrid, teid)
values (10, 327);
insert into PRACTICING (emdrid, teid)
values (10, 329);
insert into PRACTICING (emdrid, teid)
values (10, 330);
insert into PRACTICING (emdrid, teid)
values (10, 333);
commit;
prompt 300 records committed...
insert into PRACTICING (emdrid, teid)
values (10, 338);
insert into PRACTICING (emdrid, teid)
values (10, 339);
insert into PRACTICING (emdrid, teid)
values (10, 348);
insert into PRACTICING (emdrid, teid)
values (10, 351);
insert into PRACTICING (emdrid, teid)
values (10, 358);
insert into PRACTICING (emdrid, teid)
values (10, 360);
insert into PRACTICING (emdrid, teid)
values (10, 365);
insert into PRACTICING (emdrid, teid)
values (10, 366);
insert into PRACTICING (emdrid, teid)
values (10, 380);
insert into PRACTICING (emdrid, teid)
values (10, 386);
insert into PRACTICING (emdrid, teid)
values (10, 387);
insert into PRACTICING (emdrid, teid)
values (10, 391);
insert into PRACTICING (emdrid, teid)
values (10, 394);
insert into PRACTICING (emdrid, teid)
values (10, 396);
insert into PRACTICING (emdrid, teid)
values (14, 195);
insert into PRACTICING (emdrid, teid)
values (14, 198);
insert into PRACTICING (emdrid, teid)
values (14, 373);
insert into PRACTICING (emdrid, teid)
values (15, 133);
insert into PRACTICING (emdrid, teid)
values (15, 169);
insert into PRACTICING (emdrid, teid)
values (15, 376);
insert into PRACTICING (emdrid, teid)
values (16, 6);
insert into PRACTICING (emdrid, teid)
values (16, 8);
insert into PRACTICING (emdrid, teid)
values (16, 15);
insert into PRACTICING (emdrid, teid)
values (16, 34);
insert into PRACTICING (emdrid, teid)
values (16, 49);
insert into PRACTICING (emdrid, teid)
values (16, 52);
insert into PRACTICING (emdrid, teid)
values (16, 60);
insert into PRACTICING (emdrid, teid)
values (16, 65);
insert into PRACTICING (emdrid, teid)
values (16, 67);
insert into PRACTICING (emdrid, teid)
values (16, 71);
insert into PRACTICING (emdrid, teid)
values (16, 77);
insert into PRACTICING (emdrid, teid)
values (16, 78);
insert into PRACTICING (emdrid, teid)
values (16, 80);
insert into PRACTICING (emdrid, teid)
values (16, 81);
insert into PRACTICING (emdrid, teid)
values (16, 83);
insert into PRACTICING (emdrid, teid)
values (16, 90);
insert into PRACTICING (emdrid, teid)
values (16, 91);
insert into PRACTICING (emdrid, teid)
values (16, 94);
insert into PRACTICING (emdrid, teid)
values (16, 99);
insert into PRACTICING (emdrid, teid)
values (16, 100);
insert into PRACTICING (emdrid, teid)
values (16, 107);
insert into PRACTICING (emdrid, teid)
values (16, 110);
insert into PRACTICING (emdrid, teid)
values (16, 124);
insert into PRACTICING (emdrid, teid)
values (16, 138);
insert into PRACTICING (emdrid, teid)
values (16, 140);
insert into PRACTICING (emdrid, teid)
values (16, 149);
insert into PRACTICING (emdrid, teid)
values (16, 154);
insert into PRACTICING (emdrid, teid)
values (16, 156);
insert into PRACTICING (emdrid, teid)
values (16, 158);
insert into PRACTICING (emdrid, teid)
values (16, 159);
insert into PRACTICING (emdrid, teid)
values (16, 162);
insert into PRACTICING (emdrid, teid)
values (16, 165);
insert into PRACTICING (emdrid, teid)
values (16, 170);
insert into PRACTICING (emdrid, teid)
values (16, 177);
insert into PRACTICING (emdrid, teid)
values (16, 184);
insert into PRACTICING (emdrid, teid)
values (16, 187);
insert into PRACTICING (emdrid, teid)
values (16, 194);
insert into PRACTICING (emdrid, teid)
values (16, 198);
insert into PRACTICING (emdrid, teid)
values (16, 217);
insert into PRACTICING (emdrid, teid)
values (16, 221);
insert into PRACTICING (emdrid, teid)
values (16, 227);
insert into PRACTICING (emdrid, teid)
values (16, 243);
insert into PRACTICING (emdrid, teid)
values (16, 246);
insert into PRACTICING (emdrid, teid)
values (16, 254);
insert into PRACTICING (emdrid, teid)
values (16, 260);
insert into PRACTICING (emdrid, teid)
values (16, 265);
insert into PRACTICING (emdrid, teid)
values (16, 267);
insert into PRACTICING (emdrid, teid)
values (16, 270);
insert into PRACTICING (emdrid, teid)
values (16, 272);
insert into PRACTICING (emdrid, teid)
values (16, 282);
insert into PRACTICING (emdrid, teid)
values (16, 288);
insert into PRACTICING (emdrid, teid)
values (16, 292);
insert into PRACTICING (emdrid, teid)
values (16, 304);
insert into PRACTICING (emdrid, teid)
values (16, 306);
insert into PRACTICING (emdrid, teid)
values (16, 309);
insert into PRACTICING (emdrid, teid)
values (16, 311);
insert into PRACTICING (emdrid, teid)
values (16, 323);
insert into PRACTICING (emdrid, teid)
values (16, 324);
insert into PRACTICING (emdrid, teid)
values (16, 327);
insert into PRACTICING (emdrid, teid)
values (16, 331);
insert into PRACTICING (emdrid, teid)
values (16, 334);
insert into PRACTICING (emdrid, teid)
values (16, 338);
insert into PRACTICING (emdrid, teid)
values (16, 340);
insert into PRACTICING (emdrid, teid)
values (16, 345);
insert into PRACTICING (emdrid, teid)
values (16, 347);
insert into PRACTICING (emdrid, teid)
values (16, 349);
insert into PRACTICING (emdrid, teid)
values (16, 351);
insert into PRACTICING (emdrid, teid)
values (16, 364);
insert into PRACTICING (emdrid, teid)
values (16, 370);
insert into PRACTICING (emdrid, teid)
values (16, 371);
insert into PRACTICING (emdrid, teid)
values (16, 380);
insert into PRACTICING (emdrid, teid)
values (16, 382);
insert into PRACTICING (emdrid, teid)
values (19, 67);
insert into PRACTICING (emdrid, teid)
values (19, 88);
insert into PRACTICING (emdrid, teid)
values (19, 136);
insert into PRACTICING (emdrid, teid)
values (19, 228);
insert into PRACTICING (emdrid, teid)
values (19, 270);
insert into PRACTICING (emdrid, teid)
values (19, 324);
insert into PRACTICING (emdrid, teid)
values (20, 39);
insert into PRACTICING (emdrid, teid)
values (20, 208);
commit;
prompt 400 records committed...
insert into PRACTICING (emdrid, teid)
values (20, 335);
insert into PRACTICING (emdrid, teid)
values (22, 93);
insert into PRACTICING (emdrid, teid)
values (22, 102);
insert into PRACTICING (emdrid, teid)
values (22, 241);
insert into PRACTICING (emdrid, teid)
values (24, 45);
insert into PRACTICING (emdrid, teid)
values (24, 118);
insert into PRACTICING (emdrid, teid)
values (24, 265);
insert into PRACTICING (emdrid, teid)
values (24, 338);
insert into PRACTICING (emdrid, teid)
values (28, 16);
insert into PRACTICING (emdrid, teid)
values (28, 127);
insert into PRACTICING (emdrid, teid)
values (28, 153);
insert into PRACTICING (emdrid, teid)
values (28, 174);
insert into PRACTICING (emdrid, teid)
values (28, 214);
insert into PRACTICING (emdrid, teid)
values (28, 238);
insert into PRACTICING (emdrid, teid)
values (28, 282);
insert into PRACTICING (emdrid, teid)
values (32, 237);
insert into PRACTICING (emdrid, teid)
values (39, 31);
insert into PRACTICING (emdrid, teid)
values (39, 89);
insert into PRACTICING (emdrid, teid)
values (39, 329);
insert into PRACTICING (emdrid, teid)
values (39, 341);
insert into PRACTICING (emdrid, teid)
values (39, 394);
insert into PRACTICING (emdrid, teid)
values (42, 243);
insert into PRACTICING (emdrid, teid)
values (42, 335);
insert into PRACTICING (emdrid, teid)
values (42, 337);
insert into PRACTICING (emdrid, teid)
values (43, 27);
insert into PRACTICING (emdrid, teid)
values (43, 259);
insert into PRACTICING (emdrid, teid)
values (43, 315);
insert into PRACTICING (emdrid, teid)
values (43, 374);
insert into PRACTICING (emdrid, teid)
values (50, 158);
insert into PRACTICING (emdrid, teid)
values (50, 259);
insert into PRACTICING (emdrid, teid)
values (50, 293);
insert into PRACTICING (emdrid, teid)
values (57, 73);
insert into PRACTICING (emdrid, teid)
values (61, 8);
insert into PRACTICING (emdrid, teid)
values (61, 15);
insert into PRACTICING (emdrid, teid)
values (61, 39);
insert into PRACTICING (emdrid, teid)
values (61, 100);
insert into PRACTICING (emdrid, teid)
values (61, 159);
insert into PRACTICING (emdrid, teid)
values (61, 341);
insert into PRACTICING (emdrid, teid)
values (61, 375);
insert into PRACTICING (emdrid, teid)
values (63, 13);
insert into PRACTICING (emdrid, teid)
values (63, 71);
insert into PRACTICING (emdrid, teid)
values (63, 305);
insert into PRACTICING (emdrid, teid)
values (69, 124);
insert into PRACTICING (emdrid, teid)
values (69, 232);
insert into PRACTICING (emdrid, teid)
values (69, 278);
insert into PRACTICING (emdrid, teid)
values (72, 22);
insert into PRACTICING (emdrid, teid)
values (72, 43);
insert into PRACTICING (emdrid, teid)
values (72, 159);
insert into PRACTICING (emdrid, teid)
values (72, 199);
insert into PRACTICING (emdrid, teid)
values (74, 26);
insert into PRACTICING (emdrid, teid)
values (74, 296);
insert into PRACTICING (emdrid, teid)
values (76, 81);
insert into PRACTICING (emdrid, teid)
values (76, 137);
insert into PRACTICING (emdrid, teid)
values (76, 192);
insert into PRACTICING (emdrid, teid)
values (76, 254);
insert into PRACTICING (emdrid, teid)
values (76, 263);
insert into PRACTICING (emdrid, teid)
values (76, 306);
insert into PRACTICING (emdrid, teid)
values (76, 383);
insert into PRACTICING (emdrid, teid)
values (77, 6);
insert into PRACTICING (emdrid, teid)
values (77, 131);
insert into PRACTICING (emdrid, teid)
values (77, 179);
insert into PRACTICING (emdrid, teid)
values (77, 239);
insert into PRACTICING (emdrid, teid)
values (84, 8);
insert into PRACTICING (emdrid, teid)
values (84, 105);
insert into PRACTICING (emdrid, teid)
values (84, 156);
insert into PRACTICING (emdrid, teid)
values (84, 200);
insert into PRACTICING (emdrid, teid)
values (84, 311);
insert into PRACTICING (emdrid, teid)
values (96, 51);
insert into PRACTICING (emdrid, teid)
values (96, 91);
insert into PRACTICING (emdrid, teid)
values (96, 112);
insert into PRACTICING (emdrid, teid)
values (96, 193);
insert into PRACTICING (emdrid, teid)
values (96, 238);
insert into PRACTICING (emdrid, teid)
values (98, 247);
insert into PRACTICING (emdrid, teid)
values (98, 344);
insert into PRACTICING (emdrid, teid)
values (100, 107);
insert into PRACTICING (emdrid, teid)
values (100, 232);
insert into PRACTICING (emdrid, teid)
values (100, 383);
insert into PRACTICING (emdrid, teid)
values (100, 394);
insert into PRACTICING (emdrid, teid)
values (107, 108);
insert into PRACTICING (emdrid, teid)
values (107, 205);
insert into PRACTICING (emdrid, teid)
values (107, 314);
insert into PRACTICING (emdrid, teid)
values (108, 95);
insert into PRACTICING (emdrid, teid)
values (108, 102);
insert into PRACTICING (emdrid, teid)
values (108, 290);
insert into PRACTICING (emdrid, teid)
values (111, 59);
insert into PRACTICING (emdrid, teid)
values (111, 191);
insert into PRACTICING (emdrid, teid)
values (111, 198);
insert into PRACTICING (emdrid, teid)
values (111, 332);
insert into PRACTICING (emdrid, teid)
values (111, 358);
insert into PRACTICING (emdrid, teid)
values (114, 165);
insert into PRACTICING (emdrid, teid)
values (114, 207);
insert into PRACTICING (emdrid, teid)
values (115, 8);
insert into PRACTICING (emdrid, teid)
values (115, 22);
insert into PRACTICING (emdrid, teid)
values (115, 236);
insert into PRACTICING (emdrid, teid)
values (115, 279);
insert into PRACTICING (emdrid, teid)
values (117, 16);
insert into PRACTICING (emdrid, teid)
values (117, 25);
insert into PRACTICING (emdrid, teid)
values (117, 225);
insert into PRACTICING (emdrid, teid)
values (117, 326);
insert into PRACTICING (emdrid, teid)
values (118, 165);
commit;
prompt 500 records committed...
insert into PRACTICING (emdrid, teid)
values (118, 320);
insert into PRACTICING (emdrid, teid)
values (119, 111);
insert into PRACTICING (emdrid, teid)
values (119, 142);
insert into PRACTICING (emdrid, teid)
values (119, 144);
insert into PRACTICING (emdrid, teid)
values (119, 331);
insert into PRACTICING (emdrid, teid)
values (121, 18);
insert into PRACTICING (emdrid, teid)
values (121, 74);
insert into PRACTICING (emdrid, teid)
values (121, 346);
insert into PRACTICING (emdrid, teid)
values (124, 152);
insert into PRACTICING (emdrid, teid)
values (124, 153);
insert into PRACTICING (emdrid, teid)
values (124, 266);
insert into PRACTICING (emdrid, teid)
values (126, 148);
insert into PRACTICING (emdrid, teid)
values (126, 323);
insert into PRACTICING (emdrid, teid)
values (128, 51);
insert into PRACTICING (emdrid, teid)
values (128, 74);
insert into PRACTICING (emdrid, teid)
values (128, 127);
insert into PRACTICING (emdrid, teid)
values (128, 196);
insert into PRACTICING (emdrid, teid)
values (128, 228);
insert into PRACTICING (emdrid, teid)
values (128, 265);
insert into PRACTICING (emdrid, teid)
values (128, 325);
insert into PRACTICING (emdrid, teid)
values (132, 240);
insert into PRACTICING (emdrid, teid)
values (132, 338);
insert into PRACTICING (emdrid, teid)
values (133, 86);
insert into PRACTICING (emdrid, teid)
values (133, 116);
insert into PRACTICING (emdrid, teid)
values (133, 203);
insert into PRACTICING (emdrid, teid)
values (133, 209);
insert into PRACTICING (emdrid, teid)
values (133, 344);
insert into PRACTICING (emdrid, teid)
values (133, 368);
insert into PRACTICING (emdrid, teid)
values (135, 334);
insert into PRACTICING (emdrid, teid)
values (135, 339);
insert into PRACTICING (emdrid, teid)
values (136, 10);
insert into PRACTICING (emdrid, teid)
values (136, 129);
insert into PRACTICING (emdrid, teid)
values (136, 197);
insert into PRACTICING (emdrid, teid)
values (136, 287);
insert into PRACTICING (emdrid, teid)
values (140, 73);
insert into PRACTICING (emdrid, teid)
values (140, 212);
insert into PRACTICING (emdrid, teid)
values (140, 246);
insert into PRACTICING (emdrid, teid)
values (140, 252);
insert into PRACTICING (emdrid, teid)
values (140, 298);
insert into PRACTICING (emdrid, teid)
values (142, 5);
insert into PRACTICING (emdrid, teid)
values (142, 379);
insert into PRACTICING (emdrid, teid)
values (146, 154);
insert into PRACTICING (emdrid, teid)
values (146, 196);
insert into PRACTICING (emdrid, teid)
values (146, 252);
insert into PRACTICING (emdrid, teid)
values (146, 371);
insert into PRACTICING (emdrid, teid)
values (147, 125);
insert into PRACTICING (emdrid, teid)
values (147, 307);
insert into PRACTICING (emdrid, teid)
values (148, 320);
insert into PRACTICING (emdrid, teid)
values (149, 102);
insert into PRACTICING (emdrid, teid)
values (149, 150);
insert into PRACTICING (emdrid, teid)
values (149, 204);
insert into PRACTICING (emdrid, teid)
values (149, 365);
insert into PRACTICING (emdrid, teid)
values (150, 22);
insert into PRACTICING (emdrid, teid)
values (150, 48);
insert into PRACTICING (emdrid, teid)
values (150, 160);
insert into PRACTICING (emdrid, teid)
values (150, 174);
insert into PRACTICING (emdrid, teid)
values (150, 184);
insert into PRACTICING (emdrid, teid)
values (152, 225);
insert into PRACTICING (emdrid, teid)
values (156, 119);
insert into PRACTICING (emdrid, teid)
values (156, 123);
insert into PRACTICING (emdrid, teid)
values (156, 214);
insert into PRACTICING (emdrid, teid)
values (156, 276);
insert into PRACTICING (emdrid, teid)
values (156, 281);
insert into PRACTICING (emdrid, teid)
values (156, 332);
insert into PRACTICING (emdrid, teid)
values (159, 58);
insert into PRACTICING (emdrid, teid)
values (159, 88);
insert into PRACTICING (emdrid, teid)
values (159, 326);
insert into PRACTICING (emdrid, teid)
values (161, 40);
insert into PRACTICING (emdrid, teid)
values (161, 86);
insert into PRACTICING (emdrid, teid)
values (161, 202);
insert into PRACTICING (emdrid, teid)
values (161, 268);
insert into PRACTICING (emdrid, teid)
values (161, 376);
insert into PRACTICING (emdrid, teid)
values (166, 10);
insert into PRACTICING (emdrid, teid)
values (170, 157);
insert into PRACTICING (emdrid, teid)
values (170, 269);
insert into PRACTICING (emdrid, teid)
values (170, 335);
insert into PRACTICING (emdrid, teid)
values (174, 158);
insert into PRACTICING (emdrid, teid)
values (175, 74);
insert into PRACTICING (emdrid, teid)
values (175, 336);
insert into PRACTICING (emdrid, teid)
values (177, 278);
insert into PRACTICING (emdrid, teid)
values (177, 283);
insert into PRACTICING (emdrid, teid)
values (177, 378);
insert into PRACTICING (emdrid, teid)
values (180, 53);
insert into PRACTICING (emdrid, teid)
values (180, 221);
insert into PRACTICING (emdrid, teid)
values (180, 391);
insert into PRACTICING (emdrid, teid)
values (180, 399);
insert into PRACTICING (emdrid, teid)
values (183, 163);
insert into PRACTICING (emdrid, teid)
values (183, 174);
insert into PRACTICING (emdrid, teid)
values (184, 25);
insert into PRACTICING (emdrid, teid)
values (184, 111);
insert into PRACTICING (emdrid, teid)
values (184, 167);
insert into PRACTICING (emdrid, teid)
values (184, 246);
insert into PRACTICING (emdrid, teid)
values (184, 317);
insert into PRACTICING (emdrid, teid)
values (184, 385);
insert into PRACTICING (emdrid, teid)
values (187, 316);
insert into PRACTICING (emdrid, teid)
values (188, 244);
insert into PRACTICING (emdrid, teid)
values (188, 249);
insert into PRACTICING (emdrid, teid)
values (188, 313);
insert into PRACTICING (emdrid, teid)
values (189, 37);
insert into PRACTICING (emdrid, teid)
values (189, 165);
commit;
prompt 600 records committed...
insert into PRACTICING (emdrid, teid)
values (189, 177);
insert into PRACTICING (emdrid, teid)
values (196, 115);
insert into PRACTICING (emdrid, teid)
values (196, 309);
insert into PRACTICING (emdrid, teid)
values (197, 4);
insert into PRACTICING (emdrid, teid)
values (197, 228);
insert into PRACTICING (emdrid, teid)
values (197, 392);
insert into PRACTICING (emdrid, teid)
values (198, 54);
insert into PRACTICING (emdrid, teid)
values (198, 100);
insert into PRACTICING (emdrid, teid)
values (198, 197);
insert into PRACTICING (emdrid, teid)
values (198, 201);
insert into PRACTICING (emdrid, teid)
values (198, 340);
insert into PRACTICING (emdrid, teid)
values (198, 352);
insert into PRACTICING (emdrid, teid)
values (203, 59);
insert into PRACTICING (emdrid, teid)
values (203, 288);
insert into PRACTICING (emdrid, teid)
values (208, 150);
insert into PRACTICING (emdrid, teid)
values (208, 262);
insert into PRACTICING (emdrid, teid)
values (213, 109);
insert into PRACTICING (emdrid, teid)
values (213, 115);
insert into PRACTICING (emdrid, teid)
values (213, 133);
insert into PRACTICING (emdrid, teid)
values (213, 325);
insert into PRACTICING (emdrid, teid)
values (213, 335);
insert into PRACTICING (emdrid, teid)
values (213, 356);
insert into PRACTICING (emdrid, teid)
values (215, 7);
insert into PRACTICING (emdrid, teid)
values (215, 36);
insert into PRACTICING (emdrid, teid)
values (215, 60);
insert into PRACTICING (emdrid, teid)
values (222, 118);
insert into PRACTICING (emdrid, teid)
values (222, 348);
insert into PRACTICING (emdrid, teid)
values (227, 14);
insert into PRACTICING (emdrid, teid)
values (227, 21);
insert into PRACTICING (emdrid, teid)
values (227, 334);
insert into PRACTICING (emdrid, teid)
values (228, 11);
insert into PRACTICING (emdrid, teid)
values (228, 39);
insert into PRACTICING (emdrid, teid)
values (228, 280);
insert into PRACTICING (emdrid, teid)
values (231, 41);
insert into PRACTICING (emdrid, teid)
values (231, 146);
insert into PRACTICING (emdrid, teid)
values (231, 171);
insert into PRACTICING (emdrid, teid)
values (232, 105);
insert into PRACTICING (emdrid, teid)
values (232, 118);
insert into PRACTICING (emdrid, teid)
values (232, 133);
insert into PRACTICING (emdrid, teid)
values (234, 164);
insert into PRACTICING (emdrid, teid)
values (234, 378);
insert into PRACTICING (emdrid, teid)
values (235, 140);
insert into PRACTICING (emdrid, teid)
values (235, 194);
insert into PRACTICING (emdrid, teid)
values (235, 199);
insert into PRACTICING (emdrid, teid)
values (235, 336);
insert into PRACTICING (emdrid, teid)
values (235, 398);
insert into PRACTICING (emdrid, teid)
values (236, 262);
insert into PRACTICING (emdrid, teid)
values (236, 365);
insert into PRACTICING (emdrid, teid)
values (240, 42);
insert into PRACTICING (emdrid, teid)
values (240, 197);
insert into PRACTICING (emdrid, teid)
values (240, 210);
insert into PRACTICING (emdrid, teid)
values (240, 259);
insert into PRACTICING (emdrid, teid)
values (240, 288);
insert into PRACTICING (emdrid, teid)
values (240, 324);
insert into PRACTICING (emdrid, teid)
values (243, 131);
insert into PRACTICING (emdrid, teid)
values (243, 214);
insert into PRACTICING (emdrid, teid)
values (243, 300);
insert into PRACTICING (emdrid, teid)
values (247, 68);
insert into PRACTICING (emdrid, teid)
values (247, 194);
insert into PRACTICING (emdrid, teid)
values (247, 225);
insert into PRACTICING (emdrid, teid)
values (247, 271);
insert into PRACTICING (emdrid, teid)
values (247, 343);
insert into PRACTICING (emdrid, teid)
values (247, 347);
insert into PRACTICING (emdrid, teid)
values (247, 349);
insert into PRACTICING (emdrid, teid)
values (248, 280);
insert into PRACTICING (emdrid, teid)
values (252, 73);
insert into PRACTICING (emdrid, teid)
values (252, 83);
insert into PRACTICING (emdrid, teid)
values (252, 186);
insert into PRACTICING (emdrid, teid)
values (252, 275);
insert into PRACTICING (emdrid, teid)
values (252, 326);
insert into PRACTICING (emdrid, teid)
values (252, 360);
insert into PRACTICING (emdrid, teid)
values (252, 391);
insert into PRACTICING (emdrid, teid)
values (253, 143);
insert into PRACTICING (emdrid, teid)
values (253, 148);
insert into PRACTICING (emdrid, teid)
values (253, 167);
insert into PRACTICING (emdrid, teid)
values (253, 224);
insert into PRACTICING (emdrid, teid)
values (253, 236);
insert into PRACTICING (emdrid, teid)
values (253, 381);
insert into PRACTICING (emdrid, teid)
values (256, 366);
insert into PRACTICING (emdrid, teid)
values (259, 34);
insert into PRACTICING (emdrid, teid)
values (259, 79);
insert into PRACTICING (emdrid, teid)
values (259, 116);
insert into PRACTICING (emdrid, teid)
values (259, 187);
insert into PRACTICING (emdrid, teid)
values (259, 339);
insert into PRACTICING (emdrid, teid)
values (261, 59);
insert into PRACTICING (emdrid, teid)
values (261, 131);
insert into PRACTICING (emdrid, teid)
values (261, 283);
insert into PRACTICING (emdrid, teid)
values (261, 285);
insert into PRACTICING (emdrid, teid)
values (261, 286);
insert into PRACTICING (emdrid, teid)
values (261, 372);
insert into PRACTICING (emdrid, teid)
values (262, 67);
insert into PRACTICING (emdrid, teid)
values (264, 141);
insert into PRACTICING (emdrid, teid)
values (264, 338);
insert into PRACTICING (emdrid, teid)
values (270, 88);
insert into PRACTICING (emdrid, teid)
values (270, 200);
insert into PRACTICING (emdrid, teid)
values (271, 22);
insert into PRACTICING (emdrid, teid)
values (271, 100);
insert into PRACTICING (emdrid, teid)
values (271, 162);
insert into PRACTICING (emdrid, teid)
values (271, 259);
insert into PRACTICING (emdrid, teid)
values (271, 345);
commit;
prompt 700 records committed...
insert into PRACTICING (emdrid, teid)
values (272, 12);
insert into PRACTICING (emdrid, teid)
values (272, 192);
insert into PRACTICING (emdrid, teid)
values (272, 340);
insert into PRACTICING (emdrid, teid)
values (273, 231);
insert into PRACTICING (emdrid, teid)
values (273, 280);
insert into PRACTICING (emdrid, teid)
values (273, 382);
insert into PRACTICING (emdrid, teid)
values (657, 246);
insert into PRACTICING (emdrid, teid)
values (657, 310);
insert into PRACTICING (emdrid, teid)
values (663, 40);
insert into PRACTICING (emdrid, teid)
values (663, 187);
insert into PRACTICING (emdrid, teid)
values (663, 370);
insert into PRACTICING (emdrid, teid)
values (664, 70);
insert into PRACTICING (emdrid, teid)
values (664, 102);
insert into PRACTICING (emdrid, teid)
values (664, 168);
insert into PRACTICING (emdrid, teid)
values (664, 315);
insert into PRACTICING (emdrid, teid)
values (664, 319);
insert into PRACTICING (emdrid, teid)
values (667, 321);
insert into PRACTICING (emdrid, teid)
values (668, 49);
insert into PRACTICING (emdrid, teid)
values (668, 175);
insert into PRACTICING (emdrid, teid)
values (668, 265);
insert into PRACTICING (emdrid, teid)
values (668, 395);
insert into PRACTICING (emdrid, teid)
values (669, 164);
insert into PRACTICING (emdrid, teid)
values (669, 178);
insert into PRACTICING (emdrid, teid)
values (669, 220);
insert into PRACTICING (emdrid, teid)
values (669, 240);
insert into PRACTICING (emdrid, teid)
values (669, 386);
insert into PRACTICING (emdrid, teid)
values (677, 78);
insert into PRACTICING (emdrid, teid)
values (677, 278);
insert into PRACTICING (emdrid, teid)
values (681, 40);
insert into PRACTICING (emdrid, teid)
values (681, 53);
insert into PRACTICING (emdrid, teid)
values (681, 169);
insert into PRACTICING (emdrid, teid)
values (681, 302);
insert into PRACTICING (emdrid, teid)
values (684, 78);
insert into PRACTICING (emdrid, teid)
values (684, 200);
insert into PRACTICING (emdrid, teid)
values (684, 241);
insert into PRACTICING (emdrid, teid)
values (684, 318);
insert into PRACTICING (emdrid, teid)
values (685, 22);
insert into PRACTICING (emdrid, teid)
values (685, 207);
insert into PRACTICING (emdrid, teid)
values (685, 275);
insert into PRACTICING (emdrid, teid)
values (685, 379);
insert into PRACTICING (emdrid, teid)
values (689, 49);
insert into PRACTICING (emdrid, teid)
values (689, 124);
insert into PRACTICING (emdrid, teid)
values (689, 330);
insert into PRACTICING (emdrid, teid)
values (689, 350);
insert into PRACTICING (emdrid, teid)
values (697, 64);
insert into PRACTICING (emdrid, teid)
values (697, 141);
insert into PRACTICING (emdrid, teid)
values (697, 251);
insert into PRACTICING (emdrid, teid)
values (697, 298);
insert into PRACTICING (emdrid, teid)
values (697, 299);
insert into PRACTICING (emdrid, teid)
values (697, 356);
insert into PRACTICING (emdrid, teid)
values (697, 369);
insert into PRACTICING (emdrid, teid)
values (701, 4);
insert into PRACTICING (emdrid, teid)
values (701, 65);
insert into PRACTICING (emdrid, teid)
values (701, 157);
insert into PRACTICING (emdrid, teid)
values (701, 282);
insert into PRACTICING (emdrid, teid)
values (701, 391);
insert into PRACTICING (emdrid, teid)
values (704, 107);
insert into PRACTICING (emdrid, teid)
values (704, 141);
insert into PRACTICING (emdrid, teid)
values (704, 228);
insert into PRACTICING (emdrid, teid)
values (708, 37);
insert into PRACTICING (emdrid, teid)
values (708, 39);
insert into PRACTICING (emdrid, teid)
values (708, 125);
insert into PRACTICING (emdrid, teid)
values (708, 179);
insert into PRACTICING (emdrid, teid)
values (708, 328);
insert into PRACTICING (emdrid, teid)
values (709, 82);
insert into PRACTICING (emdrid, teid)
values (709, 109);
insert into PRACTICING (emdrid, teid)
values (709, 200);
insert into PRACTICING (emdrid, teid)
values (709, 262);
insert into PRACTICING (emdrid, teid)
values (709, 341);
insert into PRACTICING (emdrid, teid)
values (710, 48);
insert into PRACTICING (emdrid, teid)
values (710, 206);
insert into PRACTICING (emdrid, teid)
values (710, 284);
insert into PRACTICING (emdrid, teid)
values (710, 356);
insert into PRACTICING (emdrid, teid)
values (710, 364);
insert into PRACTICING (emdrid, teid)
values (714, 77);
insert into PRACTICING (emdrid, teid)
values (714, 104);
insert into PRACTICING (emdrid, teid)
values (714, 164);
insert into PRACTICING (emdrid, teid)
values (714, 214);
insert into PRACTICING (emdrid, teid)
values (714, 248);
insert into PRACTICING (emdrid, teid)
values (714, 336);
insert into PRACTICING (emdrid, teid)
values (714, 348);
insert into PRACTICING (emdrid, teid)
values (715, 48);
insert into PRACTICING (emdrid, teid)
values (715, 102);
insert into PRACTICING (emdrid, teid)
values (715, 200);
insert into PRACTICING (emdrid, teid)
values (715, 394);
insert into PRACTICING (emdrid, teid)
values (720, 5);
insert into PRACTICING (emdrid, teid)
values (720, 29);
insert into PRACTICING (emdrid, teid)
values (720, 131);
insert into PRACTICING (emdrid, teid)
values (720, 366);
insert into PRACTICING (emdrid, teid)
values (733, 56);
insert into PRACTICING (emdrid, teid)
values (733, 66);
insert into PRACTICING (emdrid, teid)
values (733, 125);
insert into PRACTICING (emdrid, teid)
values (733, 188);
insert into PRACTICING (emdrid, teid)
values (733, 216);
insert into PRACTICING (emdrid, teid)
values (733, 223);
insert into PRACTICING (emdrid, teid)
values (735, 25);
insert into PRACTICING (emdrid, teid)
values (735, 101);
insert into PRACTICING (emdrid, teid)
values (735, 202);
insert into PRACTICING (emdrid, teid)
values (735, 339);
insert into PRACTICING (emdrid, teid)
values (737, 70);
commit;
prompt 800 records committed...
insert into PRACTICING (emdrid, teid)
values (737, 160);
insert into PRACTICING (emdrid, teid)
values (738, 10);
insert into PRACTICING (emdrid, teid)
values (738, 291);
insert into PRACTICING (emdrid, teid)
values (742, 68);
insert into PRACTICING (emdrid, teid)
values (742, 131);
insert into PRACTICING (emdrid, teid)
values (742, 146);
insert into PRACTICING (emdrid, teid)
values (742, 284);
insert into PRACTICING (emdrid, teid)
values (742, 388);
insert into PRACTICING (emdrid, teid)
values (744, 233);
insert into PRACTICING (emdrid, teid)
values (746, 169);
insert into PRACTICING (emdrid, teid)
values (746, 374);
insert into PRACTICING (emdrid, teid)
values (749, 53);
insert into PRACTICING (emdrid, teid)
values (749, 55);
insert into PRACTICING (emdrid, teid)
values (749, 151);
insert into PRACTICING (emdrid, teid)
values (749, 283);
insert into PRACTICING (emdrid, teid)
values (749, 284);
insert into PRACTICING (emdrid, teid)
values (749, 342);
insert into PRACTICING (emdrid, teid)
values (749, 380);
insert into PRACTICING (emdrid, teid)
values (751, 24);
insert into PRACTICING (emdrid, teid)
values (751, 149);
insert into PRACTICING (emdrid, teid)
values (751, 161);
insert into PRACTICING (emdrid, teid)
values (751, 173);
insert into PRACTICING (emdrid, teid)
values (751, 242);
insert into PRACTICING (emdrid, teid)
values (751, 363);
insert into PRACTICING (emdrid, teid)
values (756, 119);
insert into PRACTICING (emdrid, teid)
values (757, 31);
insert into PRACTICING (emdrid, teid)
values (757, 310);
insert into PRACTICING (emdrid, teid)
values (758, 265);
insert into PRACTICING (emdrid, teid)
values (758, 303);
insert into PRACTICING (emdrid, teid)
values (759, 22);
insert into PRACTICING (emdrid, teid)
values (759, 118);
insert into PRACTICING (emdrid, teid)
values (759, 125);
insert into PRACTICING (emdrid, teid)
values (759, 126);
insert into PRACTICING (emdrid, teid)
values (759, 204);
insert into PRACTICING (emdrid, teid)
values (759, 235);
insert into PRACTICING (emdrid, teid)
values (759, 280);
insert into PRACTICING (emdrid, teid)
values (759, 348);
insert into PRACTICING (emdrid, teid)
values (760, 38);
insert into PRACTICING (emdrid, teid)
values (760, 82);
insert into PRACTICING (emdrid, teid)
values (760, 99);
insert into PRACTICING (emdrid, teid)
values (760, 177);
insert into PRACTICING (emdrid, teid)
values (760, 353);
insert into PRACTICING (emdrid, teid)
values (762, 57);
insert into PRACTICING (emdrid, teid)
values (762, 78);
insert into PRACTICING (emdrid, teid)
values (762, 270);
insert into PRACTICING (emdrid, teid)
values (762, 316);
insert into PRACTICING (emdrid, teid)
values (764, 155);
insert into PRACTICING (emdrid, teid)
values (764, 258);
insert into PRACTICING (emdrid, teid)
values (765, 88);
insert into PRACTICING (emdrid, teid)
values (765, 165);
insert into PRACTICING (emdrid, teid)
values (765, 225);
insert into PRACTICING (emdrid, teid)
values (765, 344);
insert into PRACTICING (emdrid, teid)
values (765, 367);
insert into PRACTICING (emdrid, teid)
values (766, 79);
insert into PRACTICING (emdrid, teid)
values (766, 102);
insert into PRACTICING (emdrid, teid)
values (767, 92);
insert into PRACTICING (emdrid, teid)
values (767, 363);
insert into PRACTICING (emdrid, teid)
values (776, 16);
insert into PRACTICING (emdrid, teid)
values (776, 90);
insert into PRACTICING (emdrid, teid)
values (776, 399);
insert into PRACTICING (emdrid, teid)
values (780, 4);
insert into PRACTICING (emdrid, teid)
values (780, 93);
insert into PRACTICING (emdrid, teid)
values (780, 97);
insert into PRACTICING (emdrid, teid)
values (780, 130);
insert into PRACTICING (emdrid, teid)
values (780, 370);
insert into PRACTICING (emdrid, teid)
values (780, 388);
insert into PRACTICING (emdrid, teid)
values (785, 62);
insert into PRACTICING (emdrid, teid)
values (785, 291);
insert into PRACTICING (emdrid, teid)
values (785, 314);
insert into PRACTICING (emdrid, teid)
values (785, 328);
insert into PRACTICING (emdrid, teid)
values (788, 6);
insert into PRACTICING (emdrid, teid)
values (788, 183);
insert into PRACTICING (emdrid, teid)
values (790, 87);
insert into PRACTICING (emdrid, teid)
values (790, 91);
insert into PRACTICING (emdrid, teid)
values (790, 171);
insert into PRACTICING (emdrid, teid)
values (790, 274);
insert into PRACTICING (emdrid, teid)
values (791, 351);
insert into PRACTICING (emdrid, teid)
values (791, 374);
insert into PRACTICING (emdrid, teid)
values (791, 390);
insert into PRACTICING (emdrid, teid)
values (793, 10);
insert into PRACTICING (emdrid, teid)
values (793, 156);
insert into PRACTICING (emdrid, teid)
values (794, 10);
insert into PRACTICING (emdrid, teid)
values (794, 37);
insert into PRACTICING (emdrid, teid)
values (794, 372);
insert into PRACTICING (emdrid, teid)
values (796, 240);
insert into PRACTICING (emdrid, teid)
values (796, 370);
insert into PRACTICING (emdrid, teid)
values (798, 40);
insert into PRACTICING (emdrid, teid)
values (798, 95);
insert into PRACTICING (emdrid, teid)
values (800, 28);
insert into PRACTICING (emdrid, teid)
values (800, 119);
insert into PRACTICING (emdrid, teid)
values (802, 22);
insert into PRACTICING (emdrid, teid)
values (802, 103);
insert into PRACTICING (emdrid, teid)
values (802, 370);
insert into PRACTICING (emdrid, teid)
values (802, 374);
insert into PRACTICING (emdrid, teid)
values (802, 388);
insert into PRACTICING (emdrid, teid)
values (806, 73);
insert into PRACTICING (emdrid, teid)
values (806, 82);
insert into PRACTICING (emdrid, teid)
values (806, 90);
insert into PRACTICING (emdrid, teid)
values (806, 204);
insert into PRACTICING (emdrid, teid)
values (806, 229);
commit;
prompt 900 records committed...
insert into PRACTICING (emdrid, teid)
values (807, 103);
insert into PRACTICING (emdrid, teid)
values (809, 117);
insert into PRACTICING (emdrid, teid)
values (809, 204);
insert into PRACTICING (emdrid, teid)
values (809, 211);
insert into PRACTICING (emdrid, teid)
values (809, 359);
insert into PRACTICING (emdrid, teid)
values (812, 114);
insert into PRACTICING (emdrid, teid)
values (812, 122);
insert into PRACTICING (emdrid, teid)
values (812, 195);
insert into PRACTICING (emdrid, teid)
values (812, 255);
insert into PRACTICING (emdrid, teid)
values (812, 357);
insert into PRACTICING (emdrid, teid)
values (812, 396);
insert into PRACTICING (emdrid, teid)
values (813, 50);
insert into PRACTICING (emdrid, teid)
values (813, 96);
insert into PRACTICING (emdrid, teid)
values (813, 123);
insert into PRACTICING (emdrid, teid)
values (813, 219);
insert into PRACTICING (emdrid, teid)
values (813, 307);
insert into PRACTICING (emdrid, teid)
values (814, 134);
insert into PRACTICING (emdrid, teid)
values (814, 223);
insert into PRACTICING (emdrid, teid)
values (814, 234);
insert into PRACTICING (emdrid, teid)
values (814, 240);
insert into PRACTICING (emdrid, teid)
values (814, 325);
insert into PRACTICING (emdrid, teid)
values (816, 304);
insert into PRACTICING (emdrid, teid)
values (816, 309);
insert into PRACTICING (emdrid, teid)
values (824, 34);
insert into PRACTICING (emdrid, teid)
values (824, 189);
insert into PRACTICING (emdrid, teid)
values (824, 388);
insert into PRACTICING (emdrid, teid)
values (827, 385);
insert into PRACTICING (emdrid, teid)
values (827, 393);
insert into PRACTICING (emdrid, teid)
values (831, 74);
insert into PRACTICING (emdrid, teid)
values (831, 310);
insert into PRACTICING (emdrid, teid)
values (831, 380);
insert into PRACTICING (emdrid, teid)
values (833, 275);
insert into PRACTICING (emdrid, teid)
values (833, 333);
insert into PRACTICING (emdrid, teid)
values (835, 194);
insert into PRACTICING (emdrid, teid)
values (839, 108);
insert into PRACTICING (emdrid, teid)
values (839, 199);
insert into PRACTICING (emdrid, teid)
values (839, 220);
insert into PRACTICING (emdrid, teid)
values (839, 302);
insert into PRACTICING (emdrid, teid)
values (846, 84);
insert into PRACTICING (emdrid, teid)
values (846, 94);
insert into PRACTICING (emdrid, teid)
values (846, 129);
insert into PRACTICING (emdrid, teid)
values (846, 267);
insert into PRACTICING (emdrid, teid)
values (850, 1);
insert into PRACTICING (emdrid, teid)
values (850, 17);
insert into PRACTICING (emdrid, teid)
values (850, 42);
insert into PRACTICING (emdrid, teid)
values (850, 66);
insert into PRACTICING (emdrid, teid)
values (853, 21);
insert into PRACTICING (emdrid, teid)
values (853, 37);
insert into PRACTICING (emdrid, teid)
values (853, 122);
insert into PRACTICING (emdrid, teid)
values (856, 16);
insert into PRACTICING (emdrid, teid)
values (856, 56);
insert into PRACTICING (emdrid, teid)
values (856, 142);
insert into PRACTICING (emdrid, teid)
values (856, 350);
insert into PRACTICING (emdrid, teid)
values (857, 15);
insert into PRACTICING (emdrid, teid)
values (857, 92);
insert into PRACTICING (emdrid, teid)
values (857, 248);
insert into PRACTICING (emdrid, teid)
values (862, 200);
insert into PRACTICING (emdrid, teid)
values (862, 286);
insert into PRACTICING (emdrid, teid)
values (862, 358);
insert into PRACTICING (emdrid, teid)
values (871, 190);
insert into PRACTICING (emdrid, teid)
values (871, 204);
insert into PRACTICING (emdrid, teid)
values (871, 374);
insert into PRACTICING (emdrid, teid)
values (875, 1);
insert into PRACTICING (emdrid, teid)
values (875, 38);
insert into PRACTICING (emdrid, teid)
values (875, 109);
insert into PRACTICING (emdrid, teid)
values (875, 151);
insert into PRACTICING (emdrid, teid)
values (876, 165);
insert into PRACTICING (emdrid, teid)
values (876, 179);
insert into PRACTICING (emdrid, teid)
values (876, 225);
insert into PRACTICING (emdrid, teid)
values (876, 358);
insert into PRACTICING (emdrid, teid)
values (878, 36);
insert into PRACTICING (emdrid, teid)
values (878, 52);
insert into PRACTICING (emdrid, teid)
values (878, 78);
insert into PRACTICING (emdrid, teid)
values (878, 80);
insert into PRACTICING (emdrid, teid)
values (878, 110);
insert into PRACTICING (emdrid, teid)
values (878, 213);
insert into PRACTICING (emdrid, teid)
values (880, 73);
insert into PRACTICING (emdrid, teid)
values (880, 175);
insert into PRACTICING (emdrid, teid)
values (880, 225);
insert into PRACTICING (emdrid, teid)
values (880, 273);
insert into PRACTICING (emdrid, teid)
values (881, 105);
insert into PRACTICING (emdrid, teid)
values (881, 133);
insert into PRACTICING (emdrid, teid)
values (881, 215);
insert into PRACTICING (emdrid, teid)
values (881, 231);
insert into PRACTICING (emdrid, teid)
values (890, 181);
insert into PRACTICING (emdrid, teid)
values (890, 246);
insert into PRACTICING (emdrid, teid)
values (890, 251);
insert into PRACTICING (emdrid, teid)
values (890, 275);
insert into PRACTICING (emdrid, teid)
values (892, 35);
insert into PRACTICING (emdrid, teid)
values (892, 99);
insert into PRACTICING (emdrid, teid)
values (892, 106);
insert into PRACTICING (emdrid, teid)
values (892, 154);
insert into PRACTICING (emdrid, teid)
values (892, 249);
insert into PRACTICING (emdrid, teid)
values (892, 277);
insert into PRACTICING (emdrid, teid)
values (892, 335);
insert into PRACTICING (emdrid, teid)
values (895, 154);
insert into PRACTICING (emdrid, teid)
values (895, 166);
insert into PRACTICING (emdrid, teid)
values (895, 277);
insert into PRACTICING (emdrid, teid)
values (895, 337);
insert into PRACTICING (emdrid, teid)
values (897, 107);
commit;
prompt 1000 records committed...
insert into PRACTICING (emdrid, teid)
values (897, 108);
insert into PRACTICING (emdrid, teid)
values (897, 314);
insert into PRACTICING (emdrid, teid)
values (898, 6);
insert into PRACTICING (emdrid, teid)
values (898, 67);
insert into PRACTICING (emdrid, teid)
values (898, 119);
insert into PRACTICING (emdrid, teid)
values (899, 200);
insert into PRACTICING (emdrid, teid)
values (899, 283);
insert into PRACTICING (emdrid, teid)
values (899, 366);
insert into PRACTICING (emdrid, teid)
values (900, 173);
insert into PRACTICING (emdrid, teid)
values (900, 228);
insert into PRACTICING (emdrid, teid)
values (900, 363);
insert into PRACTICING (emdrid, teid)
values (903, 55);
insert into PRACTICING (emdrid, teid)
values (903, 249);
insert into PRACTICING (emdrid, teid)
values (903, 350);
insert into PRACTICING (emdrid, teid)
values (905, 27);
insert into PRACTICING (emdrid, teid)
values (905, 308);
insert into PRACTICING (emdrid, teid)
values (905, 316);
insert into PRACTICING (emdrid, teid)
values (915, 16);
insert into PRACTICING (emdrid, teid)
values (915, 88);
insert into PRACTICING (emdrid, teid)
values (915, 274);
insert into PRACTICING (emdrid, teid)
values (921, 68);
insert into PRACTICING (emdrid, teid)
values (921, 119);
insert into PRACTICING (emdrid, teid)
values (921, 154);
insert into PRACTICING (emdrid, teid)
values (921, 163);
insert into PRACTICING (emdrid, teid)
values (921, 236);
insert into PRACTICING (emdrid, teid)
values (921, 297);
insert into PRACTICING (emdrid, teid)
values (921, 315);
insert into PRACTICING (emdrid, teid)
values (930, 318);
insert into PRACTICING (emdrid, teid)
values (930, 336);
insert into PRACTICING (emdrid, teid)
values (930, 367);
insert into PRACTICING (emdrid, teid)
values (931, 189);
insert into PRACTICING (emdrid, teid)
values (931, 214);
insert into PRACTICING (emdrid, teid)
values (931, 380);
insert into PRACTICING (emdrid, teid)
values (932, 36);
insert into PRACTICING (emdrid, teid)
values (932, 207);
insert into PRACTICING (emdrid, teid)
values (932, 316);
insert into PRACTICING (emdrid, teid)
values (935, 108);
insert into PRACTICING (emdrid, teid)
values (935, 310);
insert into PRACTICING (emdrid, teid)
values (939, 223);
insert into PRACTICING (emdrid, teid)
values (939, 385);
insert into PRACTICING (emdrid, teid)
values (939, 386);
insert into PRACTICING (emdrid, teid)
values (940, 82);
insert into PRACTICING (emdrid, teid)
values (940, 118);
insert into PRACTICING (emdrid, teid)
values (940, 285);
insert into PRACTICING (emdrid, teid)
values (946, 39);
insert into PRACTICING (emdrid, teid)
values (946, 115);
insert into PRACTICING (emdrid, teid)
values (947, 70);
insert into PRACTICING (emdrid, teid)
values (947, 96);
insert into PRACTICING (emdrid, teid)
values (947, 111);
insert into PRACTICING (emdrid, teid)
values (949, 9);
insert into PRACTICING (emdrid, teid)
values (949, 248);
insert into PRACTICING (emdrid, teid)
values (949, 267);
insert into PRACTICING (emdrid, teid)
values (951, 397);
insert into PRACTICING (emdrid, teid)
values (954, 49);
insert into PRACTICING (emdrid, teid)
values (954, 69);
insert into PRACTICING (emdrid, teid)
values (954, 205);
insert into PRACTICING (emdrid, teid)
values (955, 117);
insert into PRACTICING (emdrid, teid)
values (955, 126);
insert into PRACTICING (emdrid, teid)
values (962, 62);
insert into PRACTICING (emdrid, teid)
values (962, 115);
insert into PRACTICING (emdrid, teid)
values (962, 173);
insert into PRACTICING (emdrid, teid)
values (962, 177);
insert into PRACTICING (emdrid, teid)
values (962, 325);
insert into PRACTICING (emdrid, teid)
values (971, 57);
insert into PRACTICING (emdrid, teid)
values (971, 228);
insert into PRACTICING (emdrid, teid)
values (971, 341);
insert into PRACTICING (emdrid, teid)
values (975, 211);
insert into PRACTICING (emdrid, teid)
values (975, 220);
insert into PRACTICING (emdrid, teid)
values (975, 253);
insert into PRACTICING (emdrid, teid)
values (975, 359);
insert into PRACTICING (emdrid, teid)
values (977, 4);
insert into PRACTICING (emdrid, teid)
values (977, 25);
insert into PRACTICING (emdrid, teid)
values (977, 168);
insert into PRACTICING (emdrid, teid)
values (977, 241);
insert into PRACTICING (emdrid, teid)
values (977, 399);
insert into PRACTICING (emdrid, teid)
values (983, 68);
insert into PRACTICING (emdrid, teid)
values (983, 158);
insert into PRACTICING (emdrid, teid)
values (983, 207);
insert into PRACTICING (emdrid, teid)
values (983, 220);
insert into PRACTICING (emdrid, teid)
values (983, 228);
insert into PRACTICING (emdrid, teid)
values (983, 237);
insert into PRACTICING (emdrid, teid)
values (983, 279);
insert into PRACTICING (emdrid, teid)
values (989, 28);
insert into PRACTICING (emdrid, teid)
values (989, 117);
insert into PRACTICING (emdrid, teid)
values (989, 160);
insert into PRACTICING (emdrid, teid)
values (989, 389);
insert into PRACTICING (emdrid, teid)
values (990, 79);
insert into PRACTICING (emdrid, teid)
values (990, 83);
insert into PRACTICING (emdrid, teid)
values (990, 157);
insert into PRACTICING (emdrid, teid)
values (990, 158);
insert into PRACTICING (emdrid, teid)
values (990, 266);
insert into PRACTICING (emdrid, teid)
values (990, 322);
insert into PRACTICING (emdrid, teid)
values (990, 394);
insert into PRACTICING (emdrid, teid)
values (994, 54);
insert into PRACTICING (emdrid, teid)
values (994, 173);
insert into PRACTICING (emdrid, teid)
values (994, 238);
insert into PRACTICING (emdrid, teid)
values (998, 43);
insert into PRACTICING (emdrid, teid)
values (998, 90);
insert into PRACTICING (emdrid, teid)
values (998, 243);
insert into PRACTICING (emdrid, teid)
values (998, 283);
commit;
prompt 1100 records committed...
insert into PRACTICING (emdrid, teid)
values (998, 296);
insert into PRACTICING (emdrid, teid)
values (998, 376);
insert into PRACTICING (emdrid, teid)
values (474, 84);
insert into PRACTICING (emdrid, teid)
values (474, 147);
insert into PRACTICING (emdrid, teid)
values (474, 229);
insert into PRACTICING (emdrid, teid)
values (474, 239);
insert into PRACTICING (emdrid, teid)
values (475, 180);
insert into PRACTICING (emdrid, teid)
values (475, 243);
insert into PRACTICING (emdrid, teid)
values (475, 306);
insert into PRACTICING (emdrid, teid)
values (477, 32);
insert into PRACTICING (emdrid, teid)
values (477, 106);
insert into PRACTICING (emdrid, teid)
values (477, 282);
insert into PRACTICING (emdrid, teid)
values (478, 42);
insert into PRACTICING (emdrid, teid)
values (478, 324);
insert into PRACTICING (emdrid, teid)
values (479, 228);
insert into PRACTICING (emdrid, teid)
values (480, 204);
insert into PRACTICING (emdrid, teid)
values (480, 215);
insert into PRACTICING (emdrid, teid)
values (480, 326);
insert into PRACTICING (emdrid, teid)
values (480, 336);
insert into PRACTICING (emdrid, teid)
values (480, 396);
insert into PRACTICING (emdrid, teid)
values (486, 6);
insert into PRACTICING (emdrid, teid)
values (486, 56);
insert into PRACTICING (emdrid, teid)
values (486, 163);
insert into PRACTICING (emdrid, teid)
values (486, 171);
insert into PRACTICING (emdrid, teid)
values (486, 256);
insert into PRACTICING (emdrid, teid)
values (486, 269);
insert into PRACTICING (emdrid, teid)
values (486, 296);
insert into PRACTICING (emdrid, teid)
values (486, 299);
insert into PRACTICING (emdrid, teid)
values (486, 327);
insert into PRACTICING (emdrid, teid)
values (490, 84);
insert into PRACTICING (emdrid, teid)
values (490, 121);
insert into PRACTICING (emdrid, teid)
values (490, 166);
insert into PRACTICING (emdrid, teid)
values (491, 127);
insert into PRACTICING (emdrid, teid)
values (491, 260);
insert into PRACTICING (emdrid, teid)
values (491, 301);
insert into PRACTICING (emdrid, teid)
values (491, 319);
insert into PRACTICING (emdrid, teid)
values (491, 354);
insert into PRACTICING (emdrid, teid)
values (492, 161);
insert into PRACTICING (emdrid, teid)
values (492, 191);
insert into PRACTICING (emdrid, teid)
values (492, 256);
insert into PRACTICING (emdrid, teid)
values (492, 357);
insert into PRACTICING (emdrid, teid)
values (503, 37);
insert into PRACTICING (emdrid, teid)
values (503, 89);
insert into PRACTICING (emdrid, teid)
values (503, 101);
insert into PRACTICING (emdrid, teid)
values (504, 107);
insert into PRACTICING (emdrid, teid)
values (504, 110);
insert into PRACTICING (emdrid, teid)
values (504, 172);
insert into PRACTICING (emdrid, teid)
values (504, 366);
insert into PRACTICING (emdrid, teid)
values (504, 377);
insert into PRACTICING (emdrid, teid)
values (504, 380);
insert into PRACTICING (emdrid, teid)
values (505, 70);
insert into PRACTICING (emdrid, teid)
values (505, 105);
insert into PRACTICING (emdrid, teid)
values (505, 209);
insert into PRACTICING (emdrid, teid)
values (505, 300);
insert into PRACTICING (emdrid, teid)
values (507, 104);
insert into PRACTICING (emdrid, teid)
values (507, 275);
insert into PRACTICING (emdrid, teid)
values (507, 348);
insert into PRACTICING (emdrid, teid)
values (512, 12);
insert into PRACTICING (emdrid, teid)
values (512, 305);
insert into PRACTICING (emdrid, teid)
values (512, 360);
insert into PRACTICING (emdrid, teid)
values (512, 374);
insert into PRACTICING (emdrid, teid)
values (519, 17);
insert into PRACTICING (emdrid, teid)
values (519, 103);
insert into PRACTICING (emdrid, teid)
values (519, 131);
insert into PRACTICING (emdrid, teid)
values (519, 300);
insert into PRACTICING (emdrid, teid)
values (519, 334);
insert into PRACTICING (emdrid, teid)
values (520, 289);
insert into PRACTICING (emdrid, teid)
values (521, 19);
insert into PRACTICING (emdrid, teid)
values (521, 267);
insert into PRACTICING (emdrid, teid)
values (523, 175);
insert into PRACTICING (emdrid, teid)
values (523, 204);
insert into PRACTICING (emdrid, teid)
values (523, 216);
insert into PRACTICING (emdrid, teid)
values (524, 92);
insert into PRACTICING (emdrid, teid)
values (524, 315);
insert into PRACTICING (emdrid, teid)
values (524, 347);
insert into PRACTICING (emdrid, teid)
values (526, 10);
insert into PRACTICING (emdrid, teid)
values (526, 138);
insert into PRACTICING (emdrid, teid)
values (526, 246);
insert into PRACTICING (emdrid, teid)
values (526, 330);
insert into PRACTICING (emdrid, teid)
values (526, 341);
insert into PRACTICING (emdrid, teid)
values (532, 71);
insert into PRACTICING (emdrid, teid)
values (532, 244);
insert into PRACTICING (emdrid, teid)
values (532, 347);
insert into PRACTICING (emdrid, teid)
values (534, 59);
insert into PRACTICING (emdrid, teid)
values (534, 275);
insert into PRACTICING (emdrid, teid)
values (535, 176);
insert into PRACTICING (emdrid, teid)
values (535, 206);
insert into PRACTICING (emdrid, teid)
values (535, 217);
insert into PRACTICING (emdrid, teid)
values (535, 365);
insert into PRACTICING (emdrid, teid)
values (538, 193);
insert into PRACTICING (emdrid, teid)
values (538, 324);
insert into PRACTICING (emdrid, teid)
values (538, 328);
insert into PRACTICING (emdrid, teid)
values (539, 1);
insert into PRACTICING (emdrid, teid)
values (539, 62);
insert into PRACTICING (emdrid, teid)
values (539, 63);
insert into PRACTICING (emdrid, teid)
values (539, 304);
insert into PRACTICING (emdrid, teid)
values (540, 85);
insert into PRACTICING (emdrid, teid)
values (540, 270);
insert into PRACTICING (emdrid, teid)
values (543, 131);
insert into PRACTICING (emdrid, teid)
values (543, 149);
commit;
prompt 1200 records committed...
insert into PRACTICING (emdrid, teid)
values (543, 298);
insert into PRACTICING (emdrid, teid)
values (554, 85);
insert into PRACTICING (emdrid, teid)
values (554, 121);
insert into PRACTICING (emdrid, teid)
values (554, 286);
insert into PRACTICING (emdrid, teid)
values (554, 327);
insert into PRACTICING (emdrid, teid)
values (555, 168);
insert into PRACTICING (emdrid, teid)
values (555, 224);
insert into PRACTICING (emdrid, teid)
values (555, 265);
insert into PRACTICING (emdrid, teid)
values (559, 114);
insert into PRACTICING (emdrid, teid)
values (559, 173);
insert into PRACTICING (emdrid, teid)
values (559, 219);
insert into PRACTICING (emdrid, teid)
values (559, 248);
insert into PRACTICING (emdrid, teid)
values (559, 292);
insert into PRACTICING (emdrid, teid)
values (559, 349);
insert into PRACTICING (emdrid, teid)
values (559, 353);
insert into PRACTICING (emdrid, teid)
values (563, 70);
insert into PRACTICING (emdrid, teid)
values (563, 115);
insert into PRACTICING (emdrid, teid)
values (563, 237);
insert into PRACTICING (emdrid, teid)
values (563, 398);
insert into PRACTICING (emdrid, teid)
values (570, 218);
insert into PRACTICING (emdrid, teid)
values (570, 360);
insert into PRACTICING (emdrid, teid)
values (580, 220);
insert into PRACTICING (emdrid, teid)
values (580, 338);
insert into PRACTICING (emdrid, teid)
values (580, 345);
insert into PRACTICING (emdrid, teid)
values (581, 49);
insert into PRACTICING (emdrid, teid)
values (582, 147);
insert into PRACTICING (emdrid, teid)
values (582, 161);
insert into PRACTICING (emdrid, teid)
values (582, 172);
insert into PRACTICING (emdrid, teid)
values (582, 283);
insert into PRACTICING (emdrid, teid)
values (585, 30);
insert into PRACTICING (emdrid, teid)
values (585, 99);
insert into PRACTICING (emdrid, teid)
values (585, 106);
insert into PRACTICING (emdrid, teid)
values (585, 169);
insert into PRACTICING (emdrid, teid)
values (585, 213);
insert into PRACTICING (emdrid, teid)
values (585, 262);
insert into PRACTICING (emdrid, teid)
values (585, 283);
insert into PRACTICING (emdrid, teid)
values (588, 84);
insert into PRACTICING (emdrid, teid)
values (588, 190);
insert into PRACTICING (emdrid, teid)
values (588, 364);
insert into PRACTICING (emdrid, teid)
values (590, 27);
insert into PRACTICING (emdrid, teid)
values (590, 374);
insert into PRACTICING (emdrid, teid)
values (592, 142);
insert into PRACTICING (emdrid, teid)
values (592, 160);
insert into PRACTICING (emdrid, teid)
values (592, 212);
insert into PRACTICING (emdrid, teid)
values (592, 234);
insert into PRACTICING (emdrid, teid)
values (593, 186);
insert into PRACTICING (emdrid, teid)
values (596, 55);
insert into PRACTICING (emdrid, teid)
values (596, 89);
insert into PRACTICING (emdrid, teid)
values (596, 208);
insert into PRACTICING (emdrid, teid)
values (600, 27);
insert into PRACTICING (emdrid, teid)
values (600, 74);
insert into PRACTICING (emdrid, teid)
values (600, 96);
insert into PRACTICING (emdrid, teid)
values (602, 35);
insert into PRACTICING (emdrid, teid)
values (602, 52);
insert into PRACTICING (emdrid, teid)
values (602, 288);
insert into PRACTICING (emdrid, teid)
values (602, 319);
insert into PRACTICING (emdrid, teid)
values (602, 399);
insert into PRACTICING (emdrid, teid)
values (603, 120);
insert into PRACTICING (emdrid, teid)
values (603, 141);
insert into PRACTICING (emdrid, teid)
values (603, 187);
insert into PRACTICING (emdrid, teid)
values (603, 348);
insert into PRACTICING (emdrid, teid)
values (603, 352);
insert into PRACTICING (emdrid, teid)
values (604, 92);
insert into PRACTICING (emdrid, teid)
values (604, 247);
insert into PRACTICING (emdrid, teid)
values (604, 260);
insert into PRACTICING (emdrid, teid)
values (604, 270);
insert into PRACTICING (emdrid, teid)
values (604, 300);
insert into PRACTICING (emdrid, teid)
values (604, 309);
insert into PRACTICING (emdrid, teid)
values (604, 333);
insert into PRACTICING (emdrid, teid)
values (604, 366);
insert into PRACTICING (emdrid, teid)
values (604, 398);
insert into PRACTICING (emdrid, teid)
values (608, 77);
insert into PRACTICING (emdrid, teid)
values (608, 360);
insert into PRACTICING (emdrid, teid)
values (609, 23);
insert into PRACTICING (emdrid, teid)
values (609, 26);
insert into PRACTICING (emdrid, teid)
values (609, 86);
insert into PRACTICING (emdrid, teid)
values (609, 133);
insert into PRACTICING (emdrid, teid)
values (609, 235);
insert into PRACTICING (emdrid, teid)
values (609, 236);
insert into PRACTICING (emdrid, teid)
values (617, 149);
insert into PRACTICING (emdrid, teid)
values (617, 185);
insert into PRACTICING (emdrid, teid)
values (617, 283);
insert into PRACTICING (emdrid, teid)
values (621, 37);
insert into PRACTICING (emdrid, teid)
values (621, 91);
insert into PRACTICING (emdrid, teid)
values (621, 234);
insert into PRACTICING (emdrid, teid)
values (621, 295);
insert into PRACTICING (emdrid, teid)
values (621, 370);
insert into PRACTICING (emdrid, teid)
values (630, 37);
insert into PRACTICING (emdrid, teid)
values (630, 201);
insert into PRACTICING (emdrid, teid)
values (630, 274);
insert into PRACTICING (emdrid, teid)
values (632, 3);
insert into PRACTICING (emdrid, teid)
values (632, 128);
insert into PRACTICING (emdrid, teid)
values (632, 134);
insert into PRACTICING (emdrid, teid)
values (632, 165);
insert into PRACTICING (emdrid, teid)
values (632, 176);
insert into PRACTICING (emdrid, teid)
values (632, 220);
insert into PRACTICING (emdrid, teid)
values (634, 2);
insert into PRACTICING (emdrid, teid)
values (634, 51);
insert into PRACTICING (emdrid, teid)
values (634, 107);
insert into PRACTICING (emdrid, teid)
values (634, 116);
commit;
prompt 1300 records committed...
insert into PRACTICING (emdrid, teid)
values (634, 289);
insert into PRACTICING (emdrid, teid)
values (639, 22);
insert into PRACTICING (emdrid, teid)
values (639, 110);
insert into PRACTICING (emdrid, teid)
values (639, 136);
insert into PRACTICING (emdrid, teid)
values (639, 148);
insert into PRACTICING (emdrid, teid)
values (639, 319);
insert into PRACTICING (emdrid, teid)
values (640, 161);
insert into PRACTICING (emdrid, teid)
values (644, 209);
insert into PRACTICING (emdrid, teid)
values (644, 261);
insert into PRACTICING (emdrid, teid)
values (645, 195);
insert into PRACTICING (emdrid, teid)
values (645, 305);
insert into PRACTICING (emdrid, teid)
values (647, 25);
insert into PRACTICING (emdrid, teid)
values (647, 144);
insert into PRACTICING (emdrid, teid)
values (647, 148);
insert into PRACTICING (emdrid, teid)
values (647, 193);
insert into PRACTICING (emdrid, teid)
values (647, 303);
insert into PRACTICING (emdrid, teid)
values (647, 366);
insert into PRACTICING (emdrid, teid)
values (649, 343);
insert into PRACTICING (emdrid, teid)
values (649, 362);
insert into PRACTICING (emdrid, teid)
values (649, 389);
insert into PRACTICING (emdrid, teid)
values (656, 120);
insert into PRACTICING (emdrid, teid)
values (656, 298);
insert into PRACTICING (emdrid, teid)
values (656, 328);
insert into PRACTICING (emdrid, teid)
values (657, 130);
insert into PRACTICING (emdrid, teid)
values (657, 244);
insert into PRACTICING (emdrid, teid)
values (277, 51);
insert into PRACTICING (emdrid, teid)
values (277, 130);
insert into PRACTICING (emdrid, teid)
values (277, 184);
insert into PRACTICING (emdrid, teid)
values (277, 350);
insert into PRACTICING (emdrid, teid)
values (281, 202);
insert into PRACTICING (emdrid, teid)
values (284, 104);
insert into PRACTICING (emdrid, teid)
values (284, 254);
insert into PRACTICING (emdrid, teid)
values (284, 351);
insert into PRACTICING (emdrid, teid)
values (284, 371);
insert into PRACTICING (emdrid, teid)
values (284, 373);
insert into PRACTICING (emdrid, teid)
values (284, 383);
insert into PRACTICING (emdrid, teid)
values (289, 32);
insert into PRACTICING (emdrid, teid)
values (289, 142);
insert into PRACTICING (emdrid, teid)
values (293, 53);
insert into PRACTICING (emdrid, teid)
values (293, 60);
insert into PRACTICING (emdrid, teid)
values (293, 128);
insert into PRACTICING (emdrid, teid)
values (293, 246);
insert into PRACTICING (emdrid, teid)
values (293, 287);
insert into PRACTICING (emdrid, teid)
values (293, 326);
insert into PRACTICING (emdrid, teid)
values (294, 209);
insert into PRACTICING (emdrid, teid)
values (294, 230);
insert into PRACTICING (emdrid, teid)
values (294, 241);
insert into PRACTICING (emdrid, teid)
values (294, 255);
insert into PRACTICING (emdrid, teid)
values (294, 259);
insert into PRACTICING (emdrid, teid)
values (294, 352);
insert into PRACTICING (emdrid, teid)
values (294, 370);
insert into PRACTICING (emdrid, teid)
values (296, 34);
insert into PRACTICING (emdrid, teid)
values (296, 63);
insert into PRACTICING (emdrid, teid)
values (296, 145);
insert into PRACTICING (emdrid, teid)
values (296, 146);
insert into PRACTICING (emdrid, teid)
values (296, 257);
insert into PRACTICING (emdrid, teid)
values (303, 40);
insert into PRACTICING (emdrid, teid)
values (303, 129);
insert into PRACTICING (emdrid, teid)
values (303, 195);
insert into PRACTICING (emdrid, teid)
values (303, 303);
insert into PRACTICING (emdrid, teid)
values (303, 397);
insert into PRACTICING (emdrid, teid)
values (304, 73);
insert into PRACTICING (emdrid, teid)
values (304, 206);
insert into PRACTICING (emdrid, teid)
values (304, 278);
insert into PRACTICING (emdrid, teid)
values (304, 304);
insert into PRACTICING (emdrid, teid)
values (304, 376);
insert into PRACTICING (emdrid, teid)
values (304, 400);
insert into PRACTICING (emdrid, teid)
values (312, 206);
insert into PRACTICING (emdrid, teid)
values (312, 323);
insert into PRACTICING (emdrid, teid)
values (312, 362);
insert into PRACTICING (emdrid, teid)
values (313, 83);
insert into PRACTICING (emdrid, teid)
values (313, 186);
insert into PRACTICING (emdrid, teid)
values (313, 365);
insert into PRACTICING (emdrid, teid)
values (313, 373);
insert into PRACTICING (emdrid, teid)
values (313, 394);
insert into PRACTICING (emdrid, teid)
values (314, 73);
insert into PRACTICING (emdrid, teid)
values (314, 186);
insert into PRACTICING (emdrid, teid)
values (314, 347);
insert into PRACTICING (emdrid, teid)
values (316, 100);
insert into PRACTICING (emdrid, teid)
values (317, 8);
insert into PRACTICING (emdrid, teid)
values (317, 200);
insert into PRACTICING (emdrid, teid)
values (317, 234);
insert into PRACTICING (emdrid, teid)
values (319, 53);
insert into PRACTICING (emdrid, teid)
values (319, 143);
insert into PRACTICING (emdrid, teid)
values (319, 235);
insert into PRACTICING (emdrid, teid)
values (319, 293);
insert into PRACTICING (emdrid, teid)
values (319, 336);
insert into PRACTICING (emdrid, teid)
values (320, 59);
insert into PRACTICING (emdrid, teid)
values (320, 67);
insert into PRACTICING (emdrid, teid)
values (320, 161);
insert into PRACTICING (emdrid, teid)
values (323, 57);
insert into PRACTICING (emdrid, teid)
values (323, 95);
insert into PRACTICING (emdrid, teid)
values (323, 142);
insert into PRACTICING (emdrid, teid)
values (323, 206);
insert into PRACTICING (emdrid, teid)
values (323, 208);
insert into PRACTICING (emdrid, teid)
values (323, 233);
insert into PRACTICING (emdrid, teid)
values (323, 289);
insert into PRACTICING (emdrid, teid)
values (323, 399);
insert into PRACTICING (emdrid, teid)
values (325, 18);
insert into PRACTICING (emdrid, teid)
values (326, 51);
commit;
prompt 1400 records committed...
insert into PRACTICING (emdrid, teid)
values (326, 60);
insert into PRACTICING (emdrid, teid)
values (326, 105);
insert into PRACTICING (emdrid, teid)
values (326, 158);
insert into PRACTICING (emdrid, teid)
values (326, 213);
insert into PRACTICING (emdrid, teid)
values (326, 245);
insert into PRACTICING (emdrid, teid)
values (326, 283);
insert into PRACTICING (emdrid, teid)
values (328, 113);
insert into PRACTICING (emdrid, teid)
values (328, 171);
insert into PRACTICING (emdrid, teid)
values (328, 196);
insert into PRACTICING (emdrid, teid)
values (328, 329);
insert into PRACTICING (emdrid, teid)
values (328, 359);
insert into PRACTICING (emdrid, teid)
values (342, 64);
insert into PRACTICING (emdrid, teid)
values (342, 129);
insert into PRACTICING (emdrid, teid)
values (342, 206);
insert into PRACTICING (emdrid, teid)
values (342, 302);
insert into PRACTICING (emdrid, teid)
values (342, 308);
insert into PRACTICING (emdrid, teid)
values (348, 7);
insert into PRACTICING (emdrid, teid)
values (348, 100);
insert into PRACTICING (emdrid, teid)
values (348, 119);
insert into PRACTICING (emdrid, teid)
values (348, 162);
insert into PRACTICING (emdrid, teid)
values (348, 332);
insert into PRACTICING (emdrid, teid)
values (348, 346);
insert into PRACTICING (emdrid, teid)
values (353, 54);
insert into PRACTICING (emdrid, teid)
values (353, 396);
insert into PRACTICING (emdrid, teid)
values (359, 57);
insert into PRACTICING (emdrid, teid)
values (359, 87);
insert into PRACTICING (emdrid, teid)
values (360, 137);
insert into PRACTICING (emdrid, teid)
values (360, 195);
insert into PRACTICING (emdrid, teid)
values (360, 213);
insert into PRACTICING (emdrid, teid)
values (360, 359);
insert into PRACTICING (emdrid, teid)
values (360, 365);
insert into PRACTICING (emdrid, teid)
values (369, 20);
insert into PRACTICING (emdrid, teid)
values (369, 38);
insert into PRACTICING (emdrid, teid)
values (369, 104);
insert into PRACTICING (emdrid, teid)
values (370, 23);
insert into PRACTICING (emdrid, teid)
values (370, 120);
insert into PRACTICING (emdrid, teid)
values (370, 149);
insert into PRACTICING (emdrid, teid)
values (370, 213);
insert into PRACTICING (emdrid, teid)
values (370, 255);
insert into PRACTICING (emdrid, teid)
values (375, 156);
insert into PRACTICING (emdrid, teid)
values (375, 289);
insert into PRACTICING (emdrid, teid)
values (375, 305);
insert into PRACTICING (emdrid, teid)
values (382, 159);
insert into PRACTICING (emdrid, teid)
values (382, 259);
insert into PRACTICING (emdrid, teid)
values (382, 269);
insert into PRACTICING (emdrid, teid)
values (384, 113);
insert into PRACTICING (emdrid, teid)
values (384, 133);
insert into PRACTICING (emdrid, teid)
values (384, 250);
insert into PRACTICING (emdrid, teid)
values (384, 327);
insert into PRACTICING (emdrid, teid)
values (385, 31);
insert into PRACTICING (emdrid, teid)
values (385, 140);
insert into PRACTICING (emdrid, teid)
values (386, 227);
insert into PRACTICING (emdrid, teid)
values (386, 258);
insert into PRACTICING (emdrid, teid)
values (389, 15);
insert into PRACTICING (emdrid, teid)
values (389, 312);
insert into PRACTICING (emdrid, teid)
values (389, 344);
insert into PRACTICING (emdrid, teid)
values (389, 345);
insert into PRACTICING (emdrid, teid)
values (390, 28);
insert into PRACTICING (emdrid, teid)
values (390, 243);
insert into PRACTICING (emdrid, teid)
values (395, 125);
insert into PRACTICING (emdrid, teid)
values (395, 219);
insert into PRACTICING (emdrid, teid)
values (395, 275);
insert into PRACTICING (emdrid, teid)
values (395, 379);
insert into PRACTICING (emdrid, teid)
values (400, 41);
insert into PRACTICING (emdrid, teid)
values (400, 65);
insert into PRACTICING (emdrid, teid)
values (400, 147);
insert into PRACTICING (emdrid, teid)
values (400, 241);
insert into PRACTICING (emdrid, teid)
values (400, 296);
insert into PRACTICING (emdrid, teid)
values (400, 400);
insert into PRACTICING (emdrid, teid)
values (403, 42);
insert into PRACTICING (emdrid, teid)
values (403, 132);
insert into PRACTICING (emdrid, teid)
values (407, 193);
insert into PRACTICING (emdrid, teid)
values (407, 214);
insert into PRACTICING (emdrid, teid)
values (407, 283);
insert into PRACTICING (emdrid, teid)
values (411, 20);
insert into PRACTICING (emdrid, teid)
values (411, 92);
insert into PRACTICING (emdrid, teid)
values (411, 248);
insert into PRACTICING (emdrid, teid)
values (412, 127);
insert into PRACTICING (emdrid, teid)
values (412, 367);
insert into PRACTICING (emdrid, teid)
values (413, 1);
insert into PRACTICING (emdrid, teid)
values (413, 37);
insert into PRACTICING (emdrid, teid)
values (413, 281);
insert into PRACTICING (emdrid, teid)
values (414, 181);
insert into PRACTICING (emdrid, teid)
values (416, 66);
insert into PRACTICING (emdrid, teid)
values (416, 120);
insert into PRACTICING (emdrid, teid)
values (416, 283);
insert into PRACTICING (emdrid, teid)
values (416, 289);
insert into PRACTICING (emdrid, teid)
values (425, 293);
insert into PRACTICING (emdrid, teid)
values (428, 316);
insert into PRACTICING (emdrid, teid)
values (428, 385);
insert into PRACTICING (emdrid, teid)
values (428, 400);
insert into PRACTICING (emdrid, teid)
values (430, 133);
insert into PRACTICING (emdrid, teid)
values (430, 144);
insert into PRACTICING (emdrid, teid)
values (430, 169);
insert into PRACTICING (emdrid, teid)
values (430, 170);
insert into PRACTICING (emdrid, teid)
values (430, 288);
insert into PRACTICING (emdrid, teid)
values (430, 323);
insert into PRACTICING (emdrid, teid)
values (430, 377);
insert into PRACTICING (emdrid, teid)
values (431, 361);
insert into PRACTICING (emdrid, teid)
values (434, 119);
commit;
prompt 1500 records committed...
insert into PRACTICING (emdrid, teid)
values (434, 356);
insert into PRACTICING (emdrid, teid)
values (435, 51);
insert into PRACTICING (emdrid, teid)
values (435, 65);
insert into PRACTICING (emdrid, teid)
values (435, 246);
insert into PRACTICING (emdrid, teid)
values (436, 172);
insert into PRACTICING (emdrid, teid)
values (436, 228);
insert into PRACTICING (emdrid, teid)
values (436, 287);
insert into PRACTICING (emdrid, teid)
values (441, 56);
insert into PRACTICING (emdrid, teid)
values (441, 141);
insert into PRACTICING (emdrid, teid)
values (441, 142);
insert into PRACTICING (emdrid, teid)
values (446, 40);
insert into PRACTICING (emdrid, teid)
values (446, 72);
insert into PRACTICING (emdrid, teid)
values (446, 95);
insert into PRACTICING (emdrid, teid)
values (446, 103);
insert into PRACTICING (emdrid, teid)
values (446, 145);
insert into PRACTICING (emdrid, teid)
values (446, 195);
insert into PRACTICING (emdrid, teid)
values (447, 20);
insert into PRACTICING (emdrid, teid)
values (447, 84);
insert into PRACTICING (emdrid, teid)
values (447, 160);
insert into PRACTICING (emdrid, teid)
values (447, 184);
insert into PRACTICING (emdrid, teid)
values (447, 192);
insert into PRACTICING (emdrid, teid)
values (447, 341);
insert into PRACTICING (emdrid, teid)
values (447, 375);
insert into PRACTICING (emdrid, teid)
values (450, 82);
insert into PRACTICING (emdrid, teid)
values (450, 86);
insert into PRACTICING (emdrid, teid)
values (450, 117);
insert into PRACTICING (emdrid, teid)
values (450, 131);
insert into PRACTICING (emdrid, teid)
values (450, 323);
insert into PRACTICING (emdrid, teid)
values (451, 185);
insert into PRACTICING (emdrid, teid)
values (451, 282);
insert into PRACTICING (emdrid, teid)
values (451, 293);
insert into PRACTICING (emdrid, teid)
values (451, 301);
insert into PRACTICING (emdrid, teid)
values (456, 27);
insert into PRACTICING (emdrid, teid)
values (456, 30);
insert into PRACTICING (emdrid, teid)
values (456, 184);
insert into PRACTICING (emdrid, teid)
values (456, 214);
insert into PRACTICING (emdrid, teid)
values (456, 234);
insert into PRACTICING (emdrid, teid)
values (456, 283);
insert into PRACTICING (emdrid, teid)
values (458, 158);
insert into PRACTICING (emdrid, teid)
values (458, 197);
insert into PRACTICING (emdrid, teid)
values (458, 203);
insert into PRACTICING (emdrid, teid)
values (458, 289);
insert into PRACTICING (emdrid, teid)
values (458, 341);
insert into PRACTICING (emdrid, teid)
values (460, 14);
insert into PRACTICING (emdrid, teid)
values (460, 44);
insert into PRACTICING (emdrid, teid)
values (460, 113);
insert into PRACTICING (emdrid, teid)
values (460, 327);
insert into PRACTICING (emdrid, teid)
values (461, 52);
insert into PRACTICING (emdrid, teid)
values (461, 69);
insert into PRACTICING (emdrid, teid)
values (461, 259);
insert into PRACTICING (emdrid, teid)
values (461, 368);
insert into PRACTICING (emdrid, teid)
values (465, 38);
insert into PRACTICING (emdrid, teid)
values (465, 64);
insert into PRACTICING (emdrid, teid)
values (465, 124);
insert into PRACTICING (emdrid, teid)
values (465, 167);
insert into PRACTICING (emdrid, teid)
values (465, 397);
insert into PRACTICING (emdrid, teid)
values (466, 20);
insert into PRACTICING (emdrid, teid)
values (466, 42);
insert into PRACTICING (emdrid, teid)
values (466, 204);
insert into PRACTICING (emdrid, teid)
values (466, 292);
insert into PRACTICING (emdrid, teid)
values (467, 99);
insert into PRACTICING (emdrid, teid)
values (467, 139);
insert into PRACTICING (emdrid, teid)
values (467, 190);
insert into PRACTICING (emdrid, teid)
values (467, 393);
insert into PRACTICING (emdrid, teid)
values (468, 17);
insert into PRACTICING (emdrid, teid)
values (468, 34);
insert into PRACTICING (emdrid, teid)
values (468, 125);
insert into PRACTICING (emdrid, teid)
values (468, 340);
insert into PRACTICING (emdrid, teid)
values (470, 299);
insert into PRACTICING (emdrid, teid)
values (470, 346);
insert into PRACTICING (emdrid, teid)
values (470, 380);
commit;
prompt 1571 records loaded
prompt Loading WORKER...
insert into WORKER (wosalary, teid)
values (11379, 74);
insert into WORKER (wosalary, teid)
values (17199, 49);
insert into WORKER (wosalary, teid)
values (6957, 300);
insert into WORKER (wosalary, teid)
values (3361, 136);
insert into WORKER (wosalary, teid)
values (10636, 157);
insert into WORKER (wosalary, teid)
values (21472, 319);
insert into WORKER (wosalary, teid)
values (20747, 390);
insert into WORKER (wosalary, teid)
values (21915, 52);
insert into WORKER (wosalary, teid)
values (4487, 123);
insert into WORKER (wosalary, teid)
values (16229, 368);
insert into WORKER (wosalary, teid)
values (16161, 42);
insert into WORKER (wosalary, teid)
values (13425, 349);
insert into WORKER (wosalary, teid)
values (819, 137);
insert into WORKER (wosalary, teid)
values (14565, 89);
insert into WORKER (wosalary, teid)
values (11544, 82);
insert into WORKER (wosalary, teid)
values (1965, 281);
insert into WORKER (wosalary, teid)
values (3512, 56);
insert into WORKER (wosalary, teid)
values (20669, 114);
insert into WORKER (wosalary, teid)
values (12849, 347);
insert into WORKER (wosalary, teid)
values (2552, 182);
insert into WORKER (wosalary, teid)
values (15365, 346);
insert into WORKER (wosalary, teid)
values (12847, 227);
insert into WORKER (wosalary, teid)
values (7568, 163);
insert into WORKER (wosalary, teid)
values (16365, 156);
insert into WORKER (wosalary, teid)
values (16682, 172);
insert into WORKER (wosalary, teid)
values (16748, 213);
insert into WORKER (wosalary, teid)
values (15602, 363);
insert into WORKER (wosalary, teid)
values (4943, 365);
insert into WORKER (wosalary, teid)
values (13825, 249);
insert into WORKER (wosalary, teid)
values (18306, 388);
insert into WORKER (wosalary, teid)
values (20758, 370);
insert into WORKER (wosalary, teid)
values (12375, 37);
insert into WORKER (wosalary, teid)
values (20413, 40);
insert into WORKER (wosalary, teid)
values (14085, 104);
insert into WORKER (wosalary, teid)
values (23457, 45);
insert into WORKER (wosalary, teid)
values (10976, 378);
insert into WORKER (wosalary, teid)
values (11229, 108);
insert into WORKER (wosalary, teid)
values (1036, 181);
insert into WORKER (wosalary, teid)
values (21127, 127);
insert into WORKER (wosalary, teid)
values (689, 25);
insert into WORKER (wosalary, teid)
values (1541, 389);
insert into WORKER (wosalary, teid)
values (23065, 242);
insert into WORKER (wosalary, teid)
values (24779, 2);
insert into WORKER (wosalary, teid)
values (23042, 145);
insert into WORKER (wosalary, teid)
values (10096, 328);
insert into WORKER (wosalary, teid)
values (8359, 183);
insert into WORKER (wosalary, teid)
values (22175, 63);
insert into WORKER (wosalary, teid)
values (12348, 176);
insert into WORKER (wosalary, teid)
values (15176, 75);
insert into WORKER (wosalary, teid)
values (22441, 173);
insert into WORKER (wosalary, teid)
values (10635, 230);
insert into WORKER (wosalary, teid)
values (21302, 219);
insert into WORKER (wosalary, teid)
values (10075, 274);
insert into WORKER (wosalary, teid)
values (24286, 66);
insert into WORKER (wosalary, teid)
values (21096, 216);
insert into WORKER (wosalary, teid)
values (18243, 305);
insert into WORKER (wosalary, teid)
values (7571, 186);
insert into WORKER (wosalary, teid)
values (4900, 277);
insert into WORKER (wosalary, teid)
values (3502, 124);
insert into WORKER (wosalary, teid)
values (21443, 142);
insert into WORKER (wosalary, teid)
values (2462, 312);
insert into WORKER (wosalary, teid)
values (20351, 80);
insert into WORKER (wosalary, teid)
values (17517, 43);
insert into WORKER (wosalary, teid)
values (19305, 60);
insert into WORKER (wosalary, teid)
values (20925, 22);
insert into WORKER (wosalary, teid)
values (2379, 206);
insert into WORKER (wosalary, teid)
values (17919, 16);
insert into WORKER (wosalary, teid)
values (21122, 342);
insert into WORKER (wosalary, teid)
values (4755, 189);
insert into WORKER (wosalary, teid)
values (7018, 144);
insert into WORKER (wosalary, teid)
values (9245, 306);
insert into WORKER (wosalary, teid)
values (3765, 131);
insert into WORKER (wosalary, teid)
values (8063, 91);
insert into WORKER (wosalary, teid)
values (9849, 130);
insert into WORKER (wosalary, teid)
values (22943, 224);
insert into WORKER (wosalary, teid)
values (8243, 263);
insert into WORKER (wosalary, teid)
values (6583, 102);
insert into WORKER (wosalary, teid)
values (19586, 38);
insert into WORKER (wosalary, teid)
values (5792, 26);
insert into WORKER (wosalary, teid)
values (15358, 332);
insert into WORKER (wosalary, teid)
values (3046, 132);
insert into WORKER (wosalary, teid)
values (16866, 309);
insert into WORKER (wosalary, teid)
values (24049, 285);
insert into WORKER (wosalary, teid)
values (14647, 140);
insert into WORKER (wosalary, teid)
values (8285, 221);
insert into WORKER (wosalary, teid)
values (7795, 159);
insert into WORKER (wosalary, teid)
values (19697, 324);
insert into WORKER (wosalary, teid)
values (9378, 23);
insert into WORKER (wosalary, teid)
values (12794, 233);
insert into WORKER (wosalary, teid)
values (4356, 371);
insert into WORKER (wosalary, teid)
values (6082, 259);
insert into WORKER (wosalary, teid)
values (10294, 177);
insert into WORKER (wosalary, teid)
values (19573, 269);
insert into WORKER (wosalary, teid)
values (11673, 243);
insert into WORKER (wosalary, teid)
values (19402, 166);
insert into WORKER (wosalary, teid)
values (11005, 13);
insert into WORKER (wosalary, teid)
values (23750, 280);
insert into WORKER (wosalary, teid)
values (11008, 107);
insert into WORKER (wosalary, teid)
values (15372, 118);
insert into WORKER (wosalary, teid)
values (12275, 70);
commit;
prompt 100 records committed...
insert into WORKER (wosalary, teid)
values (4277, 350);
insert into WORKER (wosalary, teid)
values (23499, 105);
insert into WORKER (wosalary, teid)
values (21882, 273);
insert into WORKER (wosalary, teid)
values (23063, 333);
insert into WORKER (wosalary, teid)
values (5450, 152);
insert into WORKER (wosalary, teid)
values (9308, 301);
insert into WORKER (wosalary, teid)
values (21655, 261);
insert into WORKER (wosalary, teid)
values (22282, 335);
insert into WORKER (wosalary, teid)
values (8765, 222);
insert into WORKER (wosalary, teid)
values (9914, 195);
insert into WORKER (wosalary, teid)
values (4600, 262);
insert into WORKER (wosalary, teid)
values (4437, 267);
insert into WORKER (wosalary, teid)
values (14004, 252);
insert into WORKER (wosalary, teid)
values (11284, 384);
insert into WORKER (wosalary, teid)
values (1771, 250);
insert into WORKER (wosalary, teid)
values (21113, 81);
insert into WORKER (wosalary, teid)
values (15450, 11);
insert into WORKER (wosalary, teid)
values (24993, 232);
insert into WORKER (wosalary, teid)
values (24183, 283);
insert into WORKER (wosalary, teid)
values (22636, 379);
insert into WORKER (wosalary, teid)
values (22796, 125);
insert into WORKER (wosalary, teid)
values (14367, 270);
insert into WORKER (wosalary, teid)
values (22382, 341);
insert into WORKER (wosalary, teid)
values (1408, 57);
insert into WORKER (wosalary, teid)
values (4993, 268);
insert into WORKER (wosalary, teid)
values (13921, 208);
insert into WORKER (wosalary, teid)
values (11075, 51);
insert into WORKER (wosalary, teid)
values (6413, 282);
insert into WORKER (wosalary, teid)
values (14594, 247);
insert into WORKER (wosalary, teid)
values (3466, 239);
insert into WORKER (wosalary, teid)
values (6411, 299);
insert into WORKER (wosalary, teid)
values (23365, 209);
insert into WORKER (wosalary, teid)
values (803, 367);
insert into WORKER (wosalary, teid)
values (5102, 67);
insert into WORKER (wosalary, teid)
values (15810, 128);
insert into WORKER (wosalary, teid)
values (12381, 54);
insert into WORKER (wosalary, teid)
values (20228, 293);
insert into WORKER (wosalary, teid)
values (2602, 322);
insert into WORKER (wosalary, teid)
values (24400, 146);
insert into WORKER (wosalary, teid)
values (16332, 4);
insert into WORKER (wosalary, teid)
values (5977, 72);
insert into WORKER (wosalary, teid)
values (8153, 58);
insert into WORKER (wosalary, teid)
values (24638, 210);
insert into WORKER (wosalary, teid)
values (13801, 317);
insert into WORKER (wosalary, teid)
values (9831, 29);
insert into WORKER (wosalary, teid)
values (19668, 53);
insert into WORKER (wosalary, teid)
values (8958, 287);
insert into WORKER (wosalary, teid)
values (1487, 400);
insert into WORKER (wosalary, teid)
values (7409, 362);
insert into WORKER (wosalary, teid)
values (5486, 366);
insert into WORKER (wosalary, teid)
values (7960, 383);
insert into WORKER (wosalary, teid)
values (1202, 337);
insert into WORKER (wosalary, teid)
values (6757, 352);
insert into WORKER (wosalary, teid)
values (9707, 375);
insert into WORKER (wosalary, teid)
values (4220, 240);
insert into WORKER (wosalary, teid)
values (22477, 198);
insert into WORKER (wosalary, teid)
values (15533, 73);
insert into WORKER (wosalary, teid)
values (14383, 298);
insert into WORKER (wosalary, teid)
values (3570, 248);
insert into WORKER (wosalary, teid)
values (4031, 115);
insert into WORKER (wosalary, teid)
values (19639, 255);
insert into WORKER (wosalary, teid)
values (2323, 71);
insert into WORKER (wosalary, teid)
values (16963, 223);
insert into WORKER (wosalary, teid)
values (5895, 329);
insert into WORKER (wosalary, teid)
values (3209, 391);
insert into WORKER (wosalary, teid)
values (13216, 94);
insert into WORKER (wosalary, teid)
values (7747, 204);
insert into WORKER (wosalary, teid)
values (13578, 122);
insert into WORKER (wosalary, teid)
values (11453, 292);
insert into WORKER (wosalary, teid)
values (6429, 180);
insert into WORKER (wosalary, teid)
values (906, 284);
insert into WORKER (wosalary, teid)
values (13967, 220);
insert into WORKER (wosalary, teid)
values (21084, 103);
insert into WORKER (wosalary, teid)
values (8492, 344);
insert into WORKER (wosalary, teid)
values (21452, 297);
insert into WORKER (wosalary, teid)
values (12530, 396);
insert into WORKER (wosalary, teid)
values (9941, 266);
insert into WORKER (wosalary, teid)
values (21708, 169);
insert into WORKER (wosalary, teid)
values (2449, 236);
insert into WORKER (wosalary, teid)
values (22641, 109);
insert into WORKER (wosalary, teid)
values (13380, 139);
insert into WORKER (wosalary, teid)
values (23049, 254);
insert into WORKER (wosalary, teid)
values (13736, 153);
insert into WORKER (wosalary, teid)
values (20056, 15);
insert into WORKER (wosalary, teid)
values (1936, 278);
insert into WORKER (wosalary, teid)
values (23237, 34);
insert into WORKER (wosalary, teid)
values (3384, 79);
insert into WORKER (wosalary, teid)
values (3904, 10);
insert into WORKER (wosalary, teid)
values (7516, 97);
insert into WORKER (wosalary, teid)
values (14278, 35);
insert into WORKER (wosalary, teid)
values (3630, 167);
insert into WORKER (wosalary, teid)
values (18628, 331);
insert into WORKER (wosalary, teid)
values (14445, 336);
insert into WORKER (wosalary, teid)
values (9446, 348);
insert into WORKER (wosalary, teid)
values (8063, 228);
insert into WORKER (wosalary, teid)
values (11723, 291);
insert into WORKER (wosalary, teid)
values (14315, 354);
insert into WORKER (wosalary, teid)
values (21137, 191);
insert into WORKER (wosalary, teid)
values (22416, 148);
insert into WORKER (wosalary, teid)
values (11613, 279);
commit;
prompt 200 records committed...
insert into WORKER (wosalary, teid)
values (18054, 95);
insert into WORKER (wosalary, teid)
values (18186, 126);
insert into WORKER (wosalary, teid)
values (13926, 129);
insert into WORKER (wosalary, teid)
values (12633, 372);
insert into WORKER (wosalary, teid)
values (19939, 318);
insert into WORKER (wosalary, teid)
values (16835, 330);
insert into WORKER (wosalary, teid)
values (3836, 106);
insert into WORKER (wosalary, teid)
values (14335, 68);
insert into WORKER (wosalary, teid)
values (16621, 214);
insert into WORKER (wosalary, teid)
values (9623, 160);
insert into WORKER (wosalary, teid)
values (5862, 85);
insert into WORKER (wosalary, teid)
values (18470, 215);
insert into WORKER (wosalary, teid)
values (2559, 193);
insert into WORKER (wosalary, teid)
values (7223, 150);
insert into WORKER (wosalary, teid)
values (20489, 196);
insert into WORKER (wosalary, teid)
values (10169, 32);
insert into WORKER (wosalary, teid)
values (21832, 256);
insert into WORKER (wosalary, teid)
values (16673, 275);
insert into WORKER (wosalary, teid)
values (19684, 1);
insert into WORKER (wosalary, teid)
values (19483, 62);
insert into WORKER (wosalary, teid)
values (5808, 235);
insert into WORKER (wosalary, teid)
values (5060, 373);
insert into WORKER (wosalary, teid)
values (13479, 92);
insert into WORKER (wosalary, teid)
values (14724, 188);
insert into WORKER (wosalary, teid)
values (6219, 6);
insert into WORKER (wosalary, teid)
values (5669, 340);
insert into WORKER (wosalary, teid)
values (22160, 351);
insert into WORKER (wosalary, teid)
values (18964, 343);
insert into WORKER (wosalary, teid)
values (4475, 260);
insert into WORKER (wosalary, teid)
values (11963, 24);
insert into WORKER (wosalary, teid)
values (5822, 151);
insert into WORKER (wosalary, teid)
values (15850, 316);
insert into WORKER (wosalary, teid)
values (4100, 205);
insert into WORKER (wosalary, teid)
values (3979, 237);
insert into WORKER (wosalary, teid)
values (19101, 294);
insert into WORKER (wosalary, teid)
values (19700, 380);
insert into WORKER (wosalary, teid)
values (19250, 28);
insert into WORKER (wosalary, teid)
values (10415, 325);
insert into WORKER (wosalary, teid)
values (6170, 314);
insert into WORKER (wosalary, teid)
values (4106, 87);
insert into WORKER (wosalary, teid)
values (20778, 369);
insert into WORKER (wosalary, teid)
values (13510, 78);
insert into WORKER (wosalary, teid)
values (22029, 376);
insert into WORKER (wosalary, teid)
values (2425, 321);
insert into WORKER (wosalary, teid)
values (21252, 327);
insert into WORKER (wosalary, teid)
values (22865, 99);
insert into WORKER (wosalary, teid)
values (7604, 96);
insert into WORKER (wosalary, teid)
values (14082, 65);
insert into WORKER (wosalary, teid)
values (23605, 229);
insert into WORKER (wosalary, teid)
values (14037, 50);
insert into WORKER (wosalary, teid)
values (4510, 141);
insert into WORKER (wosalary, teid)
values (9553, 20);
insert into WORKER (wosalary, teid)
values (7859, 59);
insert into WORKER (wosalary, teid)
values (7242, 93);
commit;
prompt 254 records loaded
prompt Loading REOPRTEV...
insert into REOPRTEV (teid, debid)
values (1, 658);
insert into REOPRTEV (teid, debid)
values (1, 725);
insert into REOPRTEV (teid, debid)
values (2, 807);
insert into REOPRTEV (teid, debid)
values (4, 653);
insert into REOPRTEV (teid, debid)
values (4, 658);
insert into REOPRTEV (teid, debid)
values (4, 691);
insert into REOPRTEV (teid, debid)
values (4, 955);
insert into REOPRTEV (teid, debid)
values (6, 783);
insert into REOPRTEV (teid, debid)
values (6, 810);
insert into REOPRTEV (teid, debid)
values (6, 952);
insert into REOPRTEV (teid, debid)
values (10, 915);
insert into REOPRTEV (teid, debid)
values (11, 700);
insert into REOPRTEV (teid, debid)
values (11, 826);
insert into REOPRTEV (teid, debid)
values (11, 828);
insert into REOPRTEV (teid, debid)
values (11, 943);
insert into REOPRTEV (teid, debid)
values (16, 882);
insert into REOPRTEV (teid, debid)
values (20, 956);
insert into REOPRTEV (teid, debid)
values (22, 769);
insert into REOPRTEV (teid, debid)
values (24, 725);
insert into REOPRTEV (teid, debid)
values (24, 925);
insert into REOPRTEV (teid, debid)
values (25, 642);
insert into REOPRTEV (teid, debid)
values (25, 741);
insert into REOPRTEV (teid, debid)
values (25, 835);
insert into REOPRTEV (teid, debid)
values (25, 904);
insert into REOPRTEV (teid, debid)
values (26, 711);
insert into REOPRTEV (teid, debid)
values (26, 876);
insert into REOPRTEV (teid, debid)
values (28, 870);
insert into REOPRTEV (teid, debid)
values (28, 962);
insert into REOPRTEV (teid, debid)
values (28, 979);
insert into REOPRTEV (teid, debid)
values (29, 706);
insert into REOPRTEV (teid, debid)
values (29, 767);
insert into REOPRTEV (teid, debid)
values (29, 941);
insert into REOPRTEV (teid, debid)
values (29, 984);
insert into REOPRTEV (teid, debid)
values (32, 762);
insert into REOPRTEV (teid, debid)
values (32, 887);
insert into REOPRTEV (teid, debid)
values (32, 924);
insert into REOPRTEV (teid, debid)
values (34, 712);
insert into REOPRTEV (teid, debid)
values (34, 746);
insert into REOPRTEV (teid, debid)
values (35, 622);
insert into REOPRTEV (teid, debid)
values (35, 812);
insert into REOPRTEV (teid, debid)
values (38, 633);
insert into REOPRTEV (teid, debid)
values (38, 706);
insert into REOPRTEV (teid, debid)
values (38, 709);
insert into REOPRTEV (teid, debid)
values (38, 778);
insert into REOPRTEV (teid, debid)
values (40, 726);
insert into REOPRTEV (teid, debid)
values (40, 729);
insert into REOPRTEV (teid, debid)
values (40, 800);
insert into REOPRTEV (teid, debid)
values (42, 626);
insert into REOPRTEV (teid, debid)
values (43, 643);
insert into REOPRTEV (teid, debid)
values (45, 667);
insert into REOPRTEV (teid, debid)
values (45, 735);
insert into REOPRTEV (teid, debid)
values (45, 876);
insert into REOPRTEV (teid, debid)
values (49, 955);
insert into REOPRTEV (teid, debid)
values (50, 726);
insert into REOPRTEV (teid, debid)
values (50, 878);
insert into REOPRTEV (teid, debid)
values (51, 755);
insert into REOPRTEV (teid, debid)
values (54, 639);
insert into REOPRTEV (teid, debid)
values (54, 853);
insert into REOPRTEV (teid, debid)
values (54, 866);
insert into REOPRTEV (teid, debid)
values (56, 928);
insert into REOPRTEV (teid, debid)
values (57, 882);
insert into REOPRTEV (teid, debid)
values (58, 690);
insert into REOPRTEV (teid, debid)
values (58, 956);
insert into REOPRTEV (teid, debid)
values (60, 711);
insert into REOPRTEV (teid, debid)
values (62, 897);
insert into REOPRTEV (teid, debid)
values (63, 763);
insert into REOPRTEV (teid, debid)
values (63, 819);
insert into REOPRTEV (teid, debid)
values (63, 924);
insert into REOPRTEV (teid, debid)
values (65, 682);
insert into REOPRTEV (teid, debid)
values (66, 719);
insert into REOPRTEV (teid, debid)
values (66, 747);
insert into REOPRTEV (teid, debid)
values (67, 608);
insert into REOPRTEV (teid, debid)
values (67, 669);
insert into REOPRTEV (teid, debid)
values (67, 781);
insert into REOPRTEV (teid, debid)
values (67, 815);
insert into REOPRTEV (teid, debid)
values (67, 957);
insert into REOPRTEV (teid, debid)
values (68, 813);
insert into REOPRTEV (teid, debid)
values (71, 670);
insert into REOPRTEV (teid, debid)
values (71, 903);
insert into REOPRTEV (teid, debid)
values (74, 693);
insert into REOPRTEV (teid, debid)
values (74, 822);
insert into REOPRTEV (teid, debid)
values (74, 838);
insert into REOPRTEV (teid, debid)
values (74, 951);
insert into REOPRTEV (teid, debid)
values (78, 623);
insert into REOPRTEV (teid, debid)
values (78, 711);
insert into REOPRTEV (teid, debid)
values (79, 766);
insert into REOPRTEV (teid, debid)
values (79, 957);
insert into REOPRTEV (teid, debid)
values (81, 751);
insert into REOPRTEV (teid, debid)
values (81, 955);
insert into REOPRTEV (teid, debid)
values (82, 626);
insert into REOPRTEV (teid, debid)
values (82, 852);
insert into REOPRTEV (teid, debid)
values (85, 623);
insert into REOPRTEV (teid, debid)
values (85, 651);
insert into REOPRTEV (teid, debid)
values (85, 896);
insert into REOPRTEV (teid, debid)
values (87, 611);
insert into REOPRTEV (teid, debid)
values (87, 920);
insert into REOPRTEV (teid, debid)
values (87, 985);
insert into REOPRTEV (teid, debid)
values (89, 683);
insert into REOPRTEV (teid, debid)
values (89, 975);
insert into REOPRTEV (teid, debid)
values (91, 633);
commit;
prompt 100 records committed...
insert into REOPRTEV (teid, debid)
values (91, 806);
insert into REOPRTEV (teid, debid)
values (91, 812);
insert into REOPRTEV (teid, debid)
values (91, 871);
insert into REOPRTEV (teid, debid)
values (92, 877);
insert into REOPRTEV (teid, debid)
values (93, 613);
insert into REOPRTEV (teid, debid)
values (94, 674);
insert into REOPRTEV (teid, debid)
values (95, 773);
insert into REOPRTEV (teid, debid)
values (96, 729);
insert into REOPRTEV (teid, debid)
values (96, 878);
insert into REOPRTEV (teid, debid)
values (99, 728);
insert into REOPRTEV (teid, debid)
values (99, 795);
insert into REOPRTEV (teid, debid)
values (99, 827);
insert into REOPRTEV (teid, debid)
values (102, 854);
insert into REOPRTEV (teid, debid)
values (104, 665);
insert into REOPRTEV (teid, debid)
values (105, 789);
insert into REOPRTEV (teid, debid)
values (106, 829);
insert into REOPRTEV (teid, debid)
values (106, 840);
insert into REOPRTEV (teid, debid)
values (106, 909);
insert into REOPRTEV (teid, debid)
values (107, 776);
insert into REOPRTEV (teid, debid)
values (109, 743);
insert into REOPRTEV (teid, debid)
values (109, 936);
insert into REOPRTEV (teid, debid)
values (115, 786);
insert into REOPRTEV (teid, debid)
values (118, 650);
insert into REOPRTEV (teid, debid)
values (118, 958);
insert into REOPRTEV (teid, debid)
values (122, 825);
insert into REOPRTEV (teid, debid)
values (123, 663);
insert into REOPRTEV (teid, debid)
values (123, 842);
insert into REOPRTEV (teid, debid)
values (123, 909);
insert into REOPRTEV (teid, debid)
values (124, 633);
insert into REOPRTEV (teid, debid)
values (125, 778);
insert into REOPRTEV (teid, debid)
values (125, 976);
insert into REOPRTEV (teid, debid)
values (126, 664);
insert into REOPRTEV (teid, debid)
values (126, 834);
insert into REOPRTEV (teid, debid)
values (127, 682);
insert into REOPRTEV (teid, debid)
values (127, 758);
insert into REOPRTEV (teid, debid)
values (127, 778);
insert into REOPRTEV (teid, debid)
values (128, 954);
insert into REOPRTEV (teid, debid)
values (129, 691);
insert into REOPRTEV (teid, debid)
values (129, 785);
insert into REOPRTEV (teid, debid)
values (130, 860);
insert into REOPRTEV (teid, debid)
values (130, 869);
insert into REOPRTEV (teid, debid)
values (131, 737);
insert into REOPRTEV (teid, debid)
values (131, 787);
insert into REOPRTEV (teid, debid)
values (136, 836);
insert into REOPRTEV (teid, debid)
values (137, 649);
insert into REOPRTEV (teid, debid)
values (139, 678);
insert into REOPRTEV (teid, debid)
values (140, 615);
insert into REOPRTEV (teid, debid)
values (140, 618);
insert into REOPRTEV (teid, debid)
values (140, 637);
insert into REOPRTEV (teid, debid)
values (140, 836);
insert into REOPRTEV (teid, debid)
values (141, 832);
insert into REOPRTEV (teid, debid)
values (144, 778);
insert into REOPRTEV (teid, debid)
values (145, 732);
insert into REOPRTEV (teid, debid)
values (145, 823);
insert into REOPRTEV (teid, debid)
values (145, 869);
insert into REOPRTEV (teid, debid)
values (146, 794);
insert into REOPRTEV (teid, debid)
values (146, 980);
insert into REOPRTEV (teid, debid)
values (151, 744);
insert into REOPRTEV (teid, debid)
values (151, 974);
insert into REOPRTEV (teid, debid)
values (152, 971);
insert into REOPRTEV (teid, debid)
values (153, 618);
insert into REOPRTEV (teid, debid)
values (153, 708);
insert into REOPRTEV (teid, debid)
values (153, 712);
insert into REOPRTEV (teid, debid)
values (153, 780);
insert into REOPRTEV (teid, debid)
values (153, 901);
insert into REOPRTEV (teid, debid)
values (156, 821);
insert into REOPRTEV (teid, debid)
values (156, 834);
insert into REOPRTEV (teid, debid)
values (156, 848);
insert into REOPRTEV (teid, debid)
values (156, 988);
insert into REOPRTEV (teid, debid)
values (157, 780);
insert into REOPRTEV (teid, debid)
values (159, 596);
insert into REOPRTEV (teid, debid)
values (159, 759);
insert into REOPRTEV (teid, debid)
values (159, 971);
insert into REOPRTEV (teid, debid)
values (160, 768);
insert into REOPRTEV (teid, debid)
values (160, 862);
insert into REOPRTEV (teid, debid)
values (160, 918);
insert into REOPRTEV (teid, debid)
values (160, 962);
insert into REOPRTEV (teid, debid)
values (163, 681);
insert into REOPRTEV (teid, debid)
values (163, 769);
insert into REOPRTEV (teid, debid)
values (163, 856);
insert into REOPRTEV (teid, debid)
values (166, 599);
insert into REOPRTEV (teid, debid)
values (166, 634);
insert into REOPRTEV (teid, debid)
values (167, 722);
insert into REOPRTEV (teid, debid)
values (169, 923);
insert into REOPRTEV (teid, debid)
values (172, 938);
insert into REOPRTEV (teid, debid)
values (177, 657);
insert into REOPRTEV (teid, debid)
values (177, 664);
insert into REOPRTEV (teid, debid)
values (181, 905);
insert into REOPRTEV (teid, debid)
values (182, 667);
insert into REOPRTEV (teid, debid)
values (182, 840);
insert into REOPRTEV (teid, debid)
values (183, 674);
insert into REOPRTEV (teid, debid)
values (183, 920);
insert into REOPRTEV (teid, debid)
values (186, 890);
insert into REOPRTEV (teid, debid)
values (191, 898);
insert into REOPRTEV (teid, debid)
values (193, 628);
insert into REOPRTEV (teid, debid)
values (193, 706);
insert into REOPRTEV (teid, debid)
values (193, 745);
insert into REOPRTEV (teid, debid)
values (193, 846);
insert into REOPRTEV (teid, debid)
values (195, 811);
insert into REOPRTEV (teid, debid)
values (195, 953);
commit;
prompt 200 records committed...
insert into REOPRTEV (teid, debid)
values (196, 879);
insert into REOPRTEV (teid, debid)
values (204, 721);
insert into REOPRTEV (teid, debid)
values (204, 861);
insert into REOPRTEV (teid, debid)
values (205, 950);
insert into REOPRTEV (teid, debid)
values (206, 912);
insert into REOPRTEV (teid, debid)
values (206, 986);
insert into REOPRTEV (teid, debid)
values (208, 819);
insert into REOPRTEV (teid, debid)
values (208, 919);
insert into REOPRTEV (teid, debid)
values (209, 609);
insert into REOPRTEV (teid, debid)
values (210, 688);
insert into REOPRTEV (teid, debid)
values (210, 742);
insert into REOPRTEV (teid, debid)
values (213, 647);
insert into REOPRTEV (teid, debid)
values (213, 798);
insert into REOPRTEV (teid, debid)
values (214, 660);
insert into REOPRTEV (teid, debid)
values (215, 725);
insert into REOPRTEV (teid, debid)
values (215, 817);
insert into REOPRTEV (teid, debid)
values (215, 881);
insert into REOPRTEV (teid, debid)
values (216, 878);
insert into REOPRTEV (teid, debid)
values (219, 900);
insert into REOPRTEV (teid, debid)
values (219, 907);
insert into REOPRTEV (teid, debid)
values (220, 646);
insert into REOPRTEV (teid, debid)
values (220, 714);
insert into REOPRTEV (teid, debid)
values (221, 692);
insert into REOPRTEV (teid, debid)
values (221, 932);
insert into REOPRTEV (teid, debid)
values (222, 781);
insert into REOPRTEV (teid, debid)
values (222, 841);
insert into REOPRTEV (teid, debid)
values (223, 747);
insert into REOPRTEV (teid, debid)
values (227, 603);
insert into REOPRTEV (teid, debid)
values (227, 651);
insert into REOPRTEV (teid, debid)
values (227, 692);
insert into REOPRTEV (teid, debid)
values (227, 785);
insert into REOPRTEV (teid, debid)
values (228, 623);
insert into REOPRTEV (teid, debid)
values (228, 897);
insert into REOPRTEV (teid, debid)
values (229, 773);
insert into REOPRTEV (teid, debid)
values (230, 771);
insert into REOPRTEV (teid, debid)
values (232, 685);
insert into REOPRTEV (teid, debid)
values (232, 826);
insert into REOPRTEV (teid, debid)
values (232, 858);
insert into REOPRTEV (teid, debid)
values (232, 909);
insert into REOPRTEV (teid, debid)
values (235, 876);
insert into REOPRTEV (teid, debid)
values (235, 983);
insert into REOPRTEV (teid, debid)
values (237, 769);
insert into REOPRTEV (teid, debid)
values (240, 641);
insert into REOPRTEV (teid, debid)
values (240, 840);
insert into REOPRTEV (teid, debid)
values (243, 974);
insert into REOPRTEV (teid, debid)
values (247, 837);
insert into REOPRTEV (teid, debid)
values (247, 906);
insert into REOPRTEV (teid, debid)
values (247, 951);
insert into REOPRTEV (teid, debid)
values (247, 985);
insert into REOPRTEV (teid, debid)
values (248, 782);
insert into REOPRTEV (teid, debid)
values (249, 779);
insert into REOPRTEV (teid, debid)
values (250, 887);
insert into REOPRTEV (teid, debid)
values (252, 596);
insert into REOPRTEV (teid, debid)
values (252, 608);
insert into REOPRTEV (teid, debid)
values (254, 627);
insert into REOPRTEV (teid, debid)
values (254, 657);
insert into REOPRTEV (teid, debid)
values (254, 779);
insert into REOPRTEV (teid, debid)
values (255, 787);
insert into REOPRTEV (teid, debid)
values (255, 814);
insert into REOPRTEV (teid, debid)
values (256, 967);
insert into REOPRTEV (teid, debid)
values (259, 631);
insert into REOPRTEV (teid, debid)
values (259, 691);
insert into REOPRTEV (teid, debid)
values (259, 865);
insert into REOPRTEV (teid, debid)
values (260, 948);
insert into REOPRTEV (teid, debid)
values (263, 827);
insert into REOPRTEV (teid, debid)
values (266, 598);
insert into REOPRTEV (teid, debid)
values (266, 624);
insert into REOPRTEV (teid, debid)
values (269, 758);
insert into REOPRTEV (teid, debid)
values (270, 885);
insert into REOPRTEV (teid, debid)
values (273, 695);
insert into REOPRTEV (teid, debid)
values (273, 773);
insert into REOPRTEV (teid, debid)
values (274, 772);
insert into REOPRTEV (teid, debid)
values (275, 888);
insert into REOPRTEV (teid, debid)
values (277, 880);
insert into REOPRTEV (teid, debid)
values (278, 738);
insert into REOPRTEV (teid, debid)
values (278, 822);
insert into REOPRTEV (teid, debid)
values (282, 614);
insert into REOPRTEV (teid, debid)
values (282, 656);
insert into REOPRTEV (teid, debid)
values (282, 862);
insert into REOPRTEV (teid, debid)
values (283, 638);
insert into REOPRTEV (teid, debid)
values (283, 881);
insert into REOPRTEV (teid, debid)
values (283, 919);
insert into REOPRTEV (teid, debid)
values (284, 755);
insert into REOPRTEV (teid, debid)
values (284, 878);
insert into REOPRTEV (teid, debid)
values (285, 886);
insert into REOPRTEV (teid, debid)
values (285, 980);
insert into REOPRTEV (teid, debid)
values (291, 651);
insert into REOPRTEV (teid, debid)
values (291, 657);
insert into REOPRTEV (teid, debid)
values (291, 678);
insert into REOPRTEV (teid, debid)
values (292, 691);
insert into REOPRTEV (teid, debid)
values (298, 694);
insert into REOPRTEV (teid, debid)
values (298, 695);
insert into REOPRTEV (teid, debid)
values (299, 717);
insert into REOPRTEV (teid, debid)
values (299, 944);
insert into REOPRTEV (teid, debid)
values (300, 592);
insert into REOPRTEV (teid, debid)
values (301, 603);
insert into REOPRTEV (teid, debid)
values (305, 711);
insert into REOPRTEV (teid, debid)
values (309, 708);
insert into REOPRTEV (teid, debid)
values (309, 849);
insert into REOPRTEV (teid, debid)
values (312, 912);
commit;
prompt 300 records committed...
insert into REOPRTEV (teid, debid)
values (316, 795);
insert into REOPRTEV (teid, debid)
values (317, 674);
insert into REOPRTEV (teid, debid)
values (317, 828);
insert into REOPRTEV (teid, debid)
values (318, 598);
insert into REOPRTEV (teid, debid)
values (318, 861);
insert into REOPRTEV (teid, debid)
values (318, 888);
insert into REOPRTEV (teid, debid)
values (319, 926);
insert into REOPRTEV (teid, debid)
values (321, 613);
insert into REOPRTEV (teid, debid)
values (321, 850);
insert into REOPRTEV (teid, debid)
values (322, 596);
insert into REOPRTEV (teid, debid)
values (322, 709);
insert into REOPRTEV (teid, debid)
values (324, 681);
insert into REOPRTEV (teid, debid)
values (324, 865);
insert into REOPRTEV (teid, debid)
values (325, 706);
insert into REOPRTEV (teid, debid)
values (325, 743);
insert into REOPRTEV (teid, debid)
values (327, 615);
insert into REOPRTEV (teid, debid)
values (327, 878);
insert into REOPRTEV (teid, debid)
values (328, 887);
insert into REOPRTEV (teid, debid)
values (329, 877);
insert into REOPRTEV (teid, debid)
values (330, 638);
insert into REOPRTEV (teid, debid)
values (330, 811);
insert into REOPRTEV (teid, debid)
values (331, 787);
insert into REOPRTEV (teid, debid)
values (331, 826);
insert into REOPRTEV (teid, debid)
values (332, 621);
insert into REOPRTEV (teid, debid)
values (332, 899);
insert into REOPRTEV (teid, debid)
values (332, 963);
insert into REOPRTEV (teid, debid)
values (333, 783);
insert into REOPRTEV (teid, debid)
values (333, 818);
insert into REOPRTEV (teid, debid)
values (333, 875);
insert into REOPRTEV (teid, debid)
values (333, 935);
insert into REOPRTEV (teid, debid)
values (336, 699);
insert into REOPRTEV (teid, debid)
values (337, 860);
insert into REOPRTEV (teid, debid)
values (340, 627);
insert into REOPRTEV (teid, debid)
values (340, 940);
insert into REOPRTEV (teid, debid)
values (341, 898);
insert into REOPRTEV (teid, debid)
values (341, 917);
insert into REOPRTEV (teid, debid)
values (342, 640);
insert into REOPRTEV (teid, debid)
values (346, 643);
insert into REOPRTEV (teid, debid)
values (346, 799);
insert into REOPRTEV (teid, debid)
values (346, 838);
insert into REOPRTEV (teid, debid)
values (347, 688);
insert into REOPRTEV (teid, debid)
values (347, 942);
insert into REOPRTEV (teid, debid)
values (348, 738);
insert into REOPRTEV (teid, debid)
values (348, 765);
insert into REOPRTEV (teid, debid)
values (348, 817);
insert into REOPRTEV (teid, debid)
values (350, 690);
insert into REOPRTEV (teid, debid)
values (351, 592);
insert into REOPRTEV (teid, debid)
values (351, 690);
insert into REOPRTEV (teid, debid)
values (351, 718);
insert into REOPRTEV (teid, debid)
values (351, 792);
insert into REOPRTEV (teid, debid)
values (351, 886);
insert into REOPRTEV (teid, debid)
values (352, 903);
insert into REOPRTEV (teid, debid)
values (354, 926);
insert into REOPRTEV (teid, debid)
values (363, 687);
insert into REOPRTEV (teid, debid)
values (363, 951);
insert into REOPRTEV (teid, debid)
values (365, 610);
insert into REOPRTEV (teid, debid)
values (365, 733);
insert into REOPRTEV (teid, debid)
values (366, 708);
insert into REOPRTEV (teid, debid)
values (366, 869);
insert into REOPRTEV (teid, debid)
values (366, 980);
insert into REOPRTEV (teid, debid)
values (367, 868);
insert into REOPRTEV (teid, debid)
values (368, 933);
insert into REOPRTEV (teid, debid)
values (369, 702);
insert into REOPRTEV (teid, debid)
values (369, 803);
insert into REOPRTEV (teid, debid)
values (369, 902);
insert into REOPRTEV (teid, debid)
values (370, 944);
insert into REOPRTEV (teid, debid)
values (371, 761);
insert into REOPRTEV (teid, debid)
values (373, 691);
insert into REOPRTEV (teid, debid)
values (375, 737);
insert into REOPRTEV (teid, debid)
values (375, 772);
insert into REOPRTEV (teid, debid)
values (379, 628);
insert into REOPRTEV (teid, debid)
values (379, 659);
insert into REOPRTEV (teid, debid)
values (379, 966);
insert into REOPRTEV (teid, debid)
values (380, 674);
insert into REOPRTEV (teid, debid)
values (383, 683);
insert into REOPRTEV (teid, debid)
values (383, 718);
insert into REOPRTEV (teid, debid)
values (383, 776);
insert into REOPRTEV (teid, debid)
values (383, 946);
insert into REOPRTEV (teid, debid)
values (384, 805);
insert into REOPRTEV (teid, debid)
values (384, 937);
insert into REOPRTEV (teid, debid)
values (388, 745);
insert into REOPRTEV (teid, debid)
values (388, 827);
insert into REOPRTEV (teid, debid)
values (388, 890);
insert into REOPRTEV (teid, debid)
values (389, 629);
insert into REOPRTEV (teid, debid)
values (389, 664);
insert into REOPRTEV (teid, debid)
values (389, 697);
insert into REOPRTEV (teid, debid)
values (390, 662);
insert into REOPRTEV (teid, debid)
values (390, 686);
insert into REOPRTEV (teid, debid)
values (391, 764);
insert into REOPRTEV (teid, debid)
values (391, 782);
insert into REOPRTEV (teid, debid)
values (391, 790);
insert into REOPRTEV (teid, debid)
values (396, 670);
insert into REOPRTEV (teid, debid)
values (396, 692);
insert into REOPRTEV (teid, debid)
values (396, 769);
insert into REOPRTEV (teid, debid)
values (396, 770);
insert into REOPRTEV (teid, debid)
values (396, 783);
insert into REOPRTEV (teid, debid)
values (396, 800);
insert into REOPRTEV (teid, debid)
values (396, 858);
insert into REOPRTEV (teid, debid)
values (400, 639);
insert into REOPRTEV (teid, debid)
values (400, 843);
commit;
prompt 400 records loaded
prompt Loading TAKINGPART...
insert into TAKINGPART (boid, emdrid)
values (890, 1);
insert into TAKINGPART (boid, emdrid)
values (890, 2);
insert into TAKINGPART (boid, emdrid)
values (890, 3);
insert into TAKINGPART (boid, emdrid)
values (890, 10);
insert into TAKINGPART (boid, emdrid)
values (891, 1);
insert into TAKINGPART (boid, emdrid)
values (891, 4);
insert into TAKINGPART (boid, emdrid)
values (891, 16);
insert into TAKINGPART (boid, emdrid)
values (892, 1);
insert into TAKINGPART (boid, emdrid)
values (892, 2);
insert into TAKINGPART (boid, emdrid)
values (892, 4);
insert into TAKINGPART (boid, emdrid)
values (892, 10);
insert into TAKINGPART (boid, emdrid)
values (893, 1);
insert into TAKINGPART (boid, emdrid)
values (893, 4);
insert into TAKINGPART (boid, emdrid)
values (893, 10);
insert into TAKINGPART (boid, emdrid)
values (895, 16);
insert into TAKINGPART (boid, emdrid)
values (896, 2);
insert into TAKINGPART (boid, emdrid)
values (896, 16);
insert into TAKINGPART (boid, emdrid)
values (897, 1);
insert into TAKINGPART (boid, emdrid)
values (897, 2);
insert into TAKINGPART (boid, emdrid)
values (897, 3);
insert into TAKINGPART (boid, emdrid)
values (897, 10);
insert into TAKINGPART (boid, emdrid)
values (898, 1);
insert into TAKINGPART (boid, emdrid)
values (898, 2);
insert into TAKINGPART (boid, emdrid)
values (898, 4);
insert into TAKINGPART (boid, emdrid)
values (898, 10);
insert into TAKINGPART (boid, emdrid)
values (898, 16);
insert into TAKINGPART (boid, emdrid)
values (899, 3);
insert into TAKINGPART (boid, emdrid)
values (899, 16);
insert into TAKINGPART (boid, emdrid)
values (900, 1);
insert into TAKINGPART (boid, emdrid)
values (900, 2);
insert into TAKINGPART (boid, emdrid)
values (900, 3);
insert into TAKINGPART (boid, emdrid)
values (901, 4);
insert into TAKINGPART (boid, emdrid)
values (901, 10);
insert into TAKINGPART (boid, emdrid)
values (901, 16);
insert into TAKINGPART (boid, emdrid)
values (902, 1);
insert into TAKINGPART (boid, emdrid)
values (902, 4);
insert into TAKINGPART (boid, emdrid)
values (903, 3);
insert into TAKINGPART (boid, emdrid)
values (903, 4);
insert into TAKINGPART (boid, emdrid)
values (903, 16);
insert into TAKINGPART (boid, emdrid)
values (904, 3);
insert into TAKINGPART (boid, emdrid)
values (904, 4);
insert into TAKINGPART (boid, emdrid)
values (905, 2);
insert into TAKINGPART (boid, emdrid)
values (905, 3);
insert into TAKINGPART (boid, emdrid)
values (905, 4);
insert into TAKINGPART (boid, emdrid)
values (905, 10);
insert into TAKINGPART (boid, emdrid)
values (905, 16);
insert into TAKINGPART (boid, emdrid)
values (906, 1);
insert into TAKINGPART (boid, emdrid)
values (906, 2);
insert into TAKINGPART (boid, emdrid)
values (906, 3);
insert into TAKINGPART (boid, emdrid)
values (906, 4);
insert into TAKINGPART (boid, emdrid)
values (906, 16);
insert into TAKINGPART (boid, emdrid)
values (907, 2);
insert into TAKINGPART (boid, emdrid)
values (907, 3);
insert into TAKINGPART (boid, emdrid)
values (907, 4);
insert into TAKINGPART (boid, emdrid)
values (907, 16);
insert into TAKINGPART (boid, emdrid)
values (908, 2);
insert into TAKINGPART (boid, emdrid)
values (908, 4);
insert into TAKINGPART (boid, emdrid)
values (908, 10);
commit;
prompt 58 records loaded
prompt Enabling foreign key constraints for TEAMP...
alter table TEAMP enable constraint SYS_C009114;
prompt Enabling foreign key constraints for ACTIN...
alter table ACTIN enable constraint SYS_C009118;
alter table ACTIN enable constraint SYS_C009119;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C009060;
prompt Enabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES enable constraint SYS_C009125;
prompt Enabling foreign key constraints for DONERTO...
alter table DONERTO enable constraint SYS_C009168;
alter table DONERTO enable constraint SYS_C009169;
prompt Enabling foreign key constraints for EMERGENCYDRILL...
alter table EMERGENCYDRILL enable constraint FK_EMERGENCYDRILL_CATEGORY;
prompt Enabling foreign key constraints for DRILLCATEGORYOF...
alter table DRILLCATEGORYOF enable constraint SYS_C009173;
alter table DRILLCATEGORYOF enable constraint SYS_C009174;
prompt Enabling foreign key constraints for ITEM...
alter table ITEM enable constraint SYS_C009081;
prompt Enabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE enable constraint SYS_C009089;
prompt Enabling foreign key constraints for MAINTENAN...
alter table MAINTENAN enable constraint SYS_C009185;
alter table MAINTENAN enable constraint SYS_C009186;
prompt Enabling foreign key constraints for PRACTICING...
alter table PRACTICING enable constraint SYS_C009142;
alter table PRACTICING enable constraint SYS_C009143;
prompt Enabling foreign key constraints for WORKER...
alter table WORKER enable constraint SYS_C009147;
prompt Enabling foreign key constraints for REOPRTEV...
alter table REOPRTEV enable constraint SYS_C009151;
alter table REOPRTEV enable constraint SYS_C009152;
prompt Enabling foreign key constraints for TAKINGPART...
alter table TAKINGPART enable constraint SYS_C009156;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for ROLESP...
alter table ROLESP enable all triggers;
prompt Enabling triggers for TEAMP...
alter table TEAMP enable all triggers;
prompt Enabling triggers for ACTIN...
alter table ACTIN enable all triggers;
prompt Enabling triggers for CATEGORY...
alter table CATEGORY enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for EMERGENBODIES...
alter table EMERGENBODIES enable all triggers;
prompt Enabling triggers for DONERTO...
alter table DONERTO enable all triggers;
prompt Enabling triggers for EMERGENCYDRILL...
alter table EMERGENCYDRILL enable all triggers;
prompt Enabling triggers for DRILLCATEGORYOF...
alter table DRILLCATEGORYOF enable all triggers;
prompt Enabling triggers for EVDEBRIEFING...
alter table EVDEBRIEFING enable all triggers;
prompt Enabling triggers for LOCATION...
alter table LOCATION enable all triggers;
prompt Enabling triggers for ITEM...
alter table ITEM enable all triggers;
prompt Enabling triggers for MAINTENANCE...
alter table MAINTENANCE enable all triggers;
prompt Enabling triggers for MAINTENAN...
alter table MAINTENAN enable all triggers;
prompt Enabling triggers for OPERATION...
alter table OPERATION enable all triggers;
prompt Enabling triggers for OPERATOR...
alter table OPERATOR enable all triggers;
prompt Enabling triggers for PRACTICING...
alter table PRACTICING enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for REOPRTEV...
alter table REOPRTEV enable all triggers;
prompt Enabling triggers for TAKINGPART...
alter table TAKINGPART enable all triggers;
set feedback on
set define on
prompt Done.
