prompt PL/SQL Developer import file
prompt Created on יום ראשון 16 יוני 2024 by מוריה חדד
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
  add constraint UNQ_TEEMAIL unique (TEEMAIL)
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

prompt Creating EMERGENBODIES...
create table EMERGENBODIES
(
  boname  VARCHAR2(255) not null,
  boid    INTEGER not null,
  bophone VARCHAR2(15) not null,
  evid    INTEGER not null
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

prompt Creating EMERGENCYDRILL...
create table EMERGENCYDRILL
(
  emdrdate              DATE not null,
  emdrid                INTEGER not null,
  emdrdurationminutes   INTEGER not null,
  emdremergencytype     VARCHAR2(255) not null,
  emdrlocation          VARCHAR2(255) not null,
  emdrparticipantscount INTEGER not null,
  emdraddress           VARCHAR2(255) not null
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
  add constraint CHK_EMDRDURATIONMINUTES
  check (EmdrDurationMinutes > 0);

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

prompt Creating REOPRT...
create table REOPRT
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
alter table REOPRT
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

prompt Creating WORKER...
create table WORKER
(
  wosalary INTEGER default 3000 not null,
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
  add foreign key (BOID)
  references EMERGENBODIES (BOID);
alter table TAKINGPART
  add foreign key (EMDRID)
  references EMERGENCYDRILL (EMDRID);

prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for TEAMP...
alter table TEAMP disable all triggers;
prompt Disabling triggers for ACTIN...
alter table ACTIN disable all triggers;
prompt Disabling triggers for EMERGENBODIES...
alter table EMERGENBODIES disable all triggers;
prompt Disabling triggers for EMERGENCYDRILL...
alter table EMERGENCYDRILL disable all triggers;
prompt Disabling triggers for EVDEBRIEFING...
alter table EVDEBRIEFING disable all triggers;
prompt Disabling triggers for PRACTICING...
alter table PRACTICING disable all triggers;
prompt Disabling triggers for REOPRT...
alter table REOPRT disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for REOPRTEV...
alter table REOPRTEV disable all triggers;
prompt Disabling triggers for ROLESP...
alter table ROLESP disable all triggers;
prompt Disabling triggers for TAKINGPART...
alter table TAKINGPART disable all triggers;
prompt Disabling foreign key constraints for ACTIN...
alter table ACTIN disable constraint SYS_C008274;
alter table ACTIN disable constraint SYS_C008275;
prompt Disabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES disable constraint SYS_C008248;
prompt Disabling foreign key constraints for PRACTICING...
alter table PRACTICING disable constraint SYS_C008284;
alter table PRACTICING disable constraint SYS_C008285;
prompt Disabling foreign key constraints for WORKER...
alter table WORKER disable constraint SYS_C008270;
prompt Disabling foreign key constraints for REOPRTEV...
alter table REOPRTEV disable constraint SYS_C008279;
alter table REOPRTEV disable constraint SYS_C008280;
prompt Disabling foreign key constraints for TAKINGPART...
alter table TAKINGPART disable constraint SYS_C008257;
alter table TAKINGPART disable constraint SYS_C008258;
prompt Deleting TAKINGPART...
delete from TAKINGPART;
commit;
prompt Deleting ROLESP...
delete from ROLESP;
commit;
prompt Deleting REOPRTEV...
delete from REOPRTEV;
commit;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting REOPRT...
delete from REOPRT;
commit;
prompt Deleting PRACTICING...
delete from PRACTICING;
commit;
prompt Deleting EVDEBRIEFING...
delete from EVDEBRIEFING;
commit;
prompt Deleting EMERGENCYDRILL...
delete from EMERGENCYDRILL;
commit;
prompt Deleting EMERGENBODIES...
delete from EMERGENBODIES;
commit;
prompt Deleting ACTIN...
delete from ACTIN;
commit;
prompt Deleting TEAMP...
delete from TEAMP;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Loading EVENT...
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('28-12-2016', 'dd-mm-yyyy'), 'Nazareth', 'Wrennie', 'Health crisis', 53);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('21-12-2014', 'dd-mm-yyyy'), 'Kafr Qasim', 'Wrennie', 'Ground shaking', 380);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('16-04-2016', 'dd-mm-yyyy'), 'Or Akiva', 'Berne', 'Ground shaking', 731);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('20-04-2005', 'dd-mm-yyyy'), 'Ramat Gan', 'Wrennie', 'Health crisis', 694);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('04-05-2004', 'dd-mm-yyyy'), 'Modi''in Illit', 'Fanya', 'Severe cyclone', 472);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('16-05-2016', 'dd-mm-yyyy'), 'Kafr Qasim', 'Fanya', 'Ground shaking', 139);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('03-05-2023', 'dd-mm-yyyy'), 'Beitar Illit', 'Wrennie', 'Water inundation', 134);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('06-05-2008', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Wrennie', 'Toxic emission', 481);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('18-03-2006', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Wrennie', 'Ground shaking', 44);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('29-11-2003', 'dd-mm-yyyy'), 'Ariel', 'Wrennie', 'Toxic emission', 410);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('23-11-2024', 'dd-mm-yyyy'), 'Givatayim', 'Wrennie', 'Rotating storm', 333);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('11-06-2020', 'dd-mm-yyyy'), 'Nahariya', 'Fanya', 'Electricity failure', 504);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('13-11-2003', 'dd-mm-yyyy'), 'Beitar Illit', 'Wrennie', 'Rotating storm', 968);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('12-06-2006', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Wrennie', 'Rotating storm', 342);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('14-12-2002', 'dd-mm-yyyy'), 'Beit Shean', 'Wrennie', 'Armed assailant', 420);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('27-07-2007', 'dd-mm-yyyy'), 'Sderot', 'Fanya', 'Health crisis', 64);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('07-12-2022', 'dd-mm-yyyy'), 'Ashkelon', 'Berne', 'Health crisis', 499);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('21-11-2018', 'dd-mm-yyyy'), 'Ashdod', 'Fanya', 'Hazardous leak', 423);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('04-09-2018', 'dd-mm-yyyy'), 'Ramat Gan', 'Wrennie', 'Armed assailant', 882);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('08-05-2011', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Berne', 'Rotating storm', 516);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('29-10-2010', 'dd-mm-yyyy'), 'Baka al-Gharbiyye', 'Wrennie', 'Severe cyclone', 72);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('18-06-2001', 'dd-mm-yyyy'), 'Ramat Gan', 'Fanya', 'Hazardous leak', 347);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('04-05-2018', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Wrennie', 'Ground shaking', 394);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('21-09-2014', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Berne', 'Electricity failure', 129);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('30-04-2015', 'dd-mm-yyyy'), 'Shefa-Amr', 'Fanya', 'Severe cyclone', 300);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('15-04-2024', 'dd-mm-yyyy'), 'Nof HaGalil', 'Fanya', 'Health crisis', 86);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('15-01-2022', 'dd-mm-yyyy'), 'Netivot', 'Berne', 'Hazardous leak', 187);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('05-12-2002', 'dd-mm-yyyy'), 'Hadera', 'Wrennie', 'Armed assailant', 897);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('14-12-2020', 'dd-mm-yyyy'), 'Haifa', 'Fanya', 'Building blaze', 650);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('08-04-2007', 'dd-mm-yyyy'), 'Ra''anana', 'Berne', 'Toxic emission', 310);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('27-03-2020', 'dd-mm-yyyy'), 'Kiryat Ata', 'Fanya', 'Ground shaking', 468);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('24-02-2018', 'dd-mm-yyyy'), 'Bat Yam', 'Fanya', 'Hazardous leak', 863);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('21-04-2005', 'dd-mm-yyyy'), 'Giv''at Shmuel', 'Berne', 'Health crisis', 184);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('30-01-2003', 'dd-mm-yyyy'), 'Afula', 'Berne', 'Severe cyclone', 550);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('04-06-2019', 'dd-mm-yyyy'), 'Eilat', 'Wrennie', 'Electricity failure', 769);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('17-04-2005', 'dd-mm-yyyy'), 'Nof HaGalil', 'Wrennie', 'Hazardous leak', 258);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('23-10-2013', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Fanya', 'Electricity failure', 329);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('07-08-2022', 'dd-mm-yyyy'), 'Nof HaGalil', 'Fanya', 'Ground shaking', 726);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('17-12-2012', 'dd-mm-yyyy'), 'Nazareth', 'Fanya', 'Severe cyclone', 684);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('06-07-2023', 'dd-mm-yyyy'), 'Lod', 'Berne', 'Electricity failure', 742);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('03-12-2017', 'dd-mm-yyyy'), 'Or Akiva', 'Wrennie', 'Electricity failure', 611);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('17-02-2021', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Berne', 'Rotating storm', 702);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('17-10-2013', 'dd-mm-yyyy'), 'Tamra', 'Berne', 'Rotating storm', 814);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('06-11-2012', 'dd-mm-yyyy'), 'Ofakim', 'Fanya', 'Armed assailant', 78);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('12-10-2017', 'dd-mm-yyyy'), 'Kiryat Motzkin', 'Fanya', 'Water inundation', 404);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('04-05-2014', 'dd-mm-yyyy'), 'Rishon LeZion', 'Fanya', 'Severe cyclone', 368);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('07-08-2024', 'dd-mm-yyyy'), 'Tira', 'Fanya', 'Armed assailant', 411);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('10-08-2018', 'dd-mm-yyyy'), 'Tirat Carmel', 'Wrennie', 'Electricity failure', 831);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('25-02-2022', 'dd-mm-yyyy'), 'Elad', 'Fanya', 'Water inundation', 614);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('07-10-2016', 'dd-mm-yyyy'), 'Or Akiva', 'Berne', 'Ground shaking', 212);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('26-03-2013', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Fanya', 'Electricity failure', 451);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('28-09-2002', 'dd-mm-yyyy'), 'Kiryat Bialik', 'Wrennie', 'Armed assailant', 895);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('05-01-2002', 'dd-mm-yyyy'), 'Kfar Saba', 'Berne', 'Rotating storm', 890);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('02-02-2024', 'dd-mm-yyyy'), 'Haifa', 'Wrennie', 'Health crisis', 94);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('19-11-2001', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Wrennie', 'Building blaze', 439);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('23-11-2005', 'dd-mm-yyyy'), 'Ramat Gan', 'Wrennie', 'Electricity failure', 283);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('24-02-2007', 'dd-mm-yyyy'), 'Kfar Saba', 'Fanya', 'Water inundation', 649);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('17-12-2005', 'dd-mm-yyyy'), 'Nahariya', 'Fanya', 'Toxic emission', 509);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('21-06-2002', 'dd-mm-yyyy'), 'Herzliya', 'Wrennie', 'Water inundation', 806);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('05-09-2015', 'dd-mm-yyyy'), 'Netanya', 'Wrennie', 'Ground shaking', 303);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('31-01-2015', 'dd-mm-yyyy'), 'Herzliya', 'Fanya', 'Ground shaking', 569);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('16-05-2002', 'dd-mm-yyyy'), 'Haifa', 'Wrennie', 'Severe cyclone', 640);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('08-01-2020', 'dd-mm-yyyy'), 'Hod HaSharon', 'Wrennie', 'Rotating storm', 181);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('22-11-2023', 'dd-mm-yyyy'), 'Kfar Saba', 'Berne', 'Water inundation', 870);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('15-07-2021', 'dd-mm-yyyy'), 'Dimona', 'Wrennie', 'Health crisis', 838);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('07-01-2002', 'dd-mm-yyyy'), 'Bat Yam', 'Fanya', 'Rotating storm', 84);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('14-02-2012', 'dd-mm-yyyy'), 'Netanya', 'Fanya', 'Severe cyclone', 56);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('04-02-2009', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Berne', 'Rotating storm', 626);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('09-05-2014', 'dd-mm-yyyy'), 'Hod HaSharon', 'Berne', 'Health crisis', 798);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('09-08-2009', 'dd-mm-yyyy'), 'Haifa', 'Berne', 'Ground shaking', 958);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('10-12-2021', 'dd-mm-yyyy'), 'Kiryat Motzkin', 'Berne', 'Building blaze', 646);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('12-08-2019', 'dd-mm-yyyy'), 'Acre', 'Fanya', 'Armed assailant', 50);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('09-06-2000', 'dd-mm-yyyy'), 'Sderot', 'Fanya', 'Toxic emission', 218);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('08-10-2000', 'dd-mm-yyyy'), 'Ness Ziona', 'Wrennie', 'Rotating storm', 518);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('01-04-2024', 'dd-mm-yyyy'), 'Ariel', 'Fanya', 'Water inundation', 541);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('30-03-2010', 'dd-mm-yyyy'), 'Yokneam Illit', 'Fanya', 'Toxic emission', 346);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('09-09-2015', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Fanya', 'Water inundation', 808);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('21-11-2016', 'dd-mm-yyyy'), 'Tirat Carmel', 'Berne', 'Electricity failure', 905);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('01-11-2015', 'dd-mm-yyyy'), 'Beit Shean', 'Wrennie', 'Severe cyclone', 652);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('23-04-2021', 'dd-mm-yyyy'), 'Ofakim', 'Berne', 'Building blaze', 429);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('22-04-2014', 'dd-mm-yyyy'), 'Ariel', 'Fanya', 'Health crisis', 392);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('30-11-2003', 'dd-mm-yyyy'), 'Modi''in Illit', 'Wrennie', 'Severe cyclone', 691);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('29-05-2002', 'dd-mm-yyyy'), 'Kiryat Malakhi', 'Wrennie', 'Ground shaking', 880);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('08-12-2013', 'dd-mm-yyyy'), 'Beit Shean', 'Fanya', 'Hazardous leak', 200);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('27-11-2003', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Wrennie', 'Toxic emission', 479);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('10-02-2018', 'dd-mm-yyyy'), 'Netivot', 'Berne', 'Water inundation', 723);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('14-05-2016', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut', 'Berne', 'Armed assailant', 662);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('01-09-2008', 'dd-mm-yyyy'), 'Ness Ziona', 'Fanya', 'Health crisis', 228);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('31-05-2020', 'dd-mm-yyyy'), 'Dimona', 'Fanya', 'Electricity failure', 710);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('19-09-2004', 'dd-mm-yyyy'), 'Ramat Gan', 'Fanya', 'Water inundation', 415);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('08-09-2020', 'dd-mm-yyyy'), 'Kfar Saba', 'Wrennie', 'Health crisis', 470);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('28-11-2010', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Wrennie', 'Hazardous leak', 70);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('17-02-2022', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Fanya', 'Water inundation', 759);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('17-04-2015', 'dd-mm-yyyy'), 'Ariel', 'Berne', 'Armed assailant', 241);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('02-11-2012', 'dd-mm-yyyy'), 'Ma''alot-Tarshiha', 'Fanya', 'Armed assailant', 634);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('30-07-2002', 'dd-mm-yyyy'), 'Kafr Qasim', 'Berne', 'Ground shaking', 858);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('17-05-2016', 'dd-mm-yyyy'), 'Nof HaGalil', 'Berne', 'Hazardous leak', 402);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('21-09-2023', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Fanya', 'Ground shaking', 697);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('01-09-2007', 'dd-mm-yyyy'), 'Kiryat Gat', 'Fanya', 'Hazardous leak', 66);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('03-03-2019', 'dd-mm-yyyy'), 'Kiryat Ono', 'Wrennie', 'Severe cyclone', 230);
commit;
prompt 100 records committed...
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('28-11-2017', 'dd-mm-yyyy'), 'Ma''alot-Tarshiha', 'Berne', 'Toxic emission', 628);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('07-04-2024', 'dd-mm-yyyy'), 'Yokneam Illit', 'Fanya', 'Rotating storm', 325);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('31-01-2010', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Berne', 'Armed assailant', 377);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('26-07-2016', 'dd-mm-yyyy'), 'Shefa-Amr', 'Wrennie', 'Health crisis', 704);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('08-01-2013', 'dd-mm-yyyy'), 'Rosh HaAyin', 'Berne', 'Water inundation', 861);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('31-01-2021', 'dd-mm-yyyy'), 'Netivot', 'Berne', 'Severe cyclone', 357);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('03-02-2008', 'dd-mm-yyyy'), 'Kiryat Gat', 'Fanya', 'Health crisis', 585);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('22-12-2018', 'dd-mm-yyyy'), 'Ma''alot-Tarshiha', 'Fanya', 'Rotating storm', 375);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('08-07-2000', 'dd-mm-yyyy'), 'Sakhnin', 'Fanya', 'Ground shaking', 442);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('28-02-2010', 'dd-mm-yyyy'), 'Ness Ziona', 'Fanya', 'Severe cyclone', 79);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('21-09-2013', 'dd-mm-yyyy'), 'Yavne', 'Wrennie', 'Ground shaking', 979);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('01-04-2011', 'dd-mm-yyyy'), 'Afula', 'Berne', 'Armed assailant', 976);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('10-08-2008', 'dd-mm-yyyy'), 'Nahariya', 'Wrennie', 'Toxic emission', 758);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('24-02-2006', 'dd-mm-yyyy'), 'Ramla', 'Fanya', 'Electricity failure', 284);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('24-12-2010', 'dd-mm-yyyy'), 'Beersheba', 'Fanya', 'Hazardous leak', 301);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('15-03-2002', 'dd-mm-yyyy'), 'Kiryat Yam', 'Wrennie', 'Ground shaking', 414);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('07-02-2024', 'dd-mm-yyyy'), 'Kiryat Shmona', 'Fanya', 'Building blaze', 655);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('05-12-2020', 'dd-mm-yyyy'), 'Nesher', 'Fanya', 'Severe cyclone', 264);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('03-05-2018', 'dd-mm-yyyy'), 'Ma''ale Adumim', 'Wrennie', 'Armed assailant', 149);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('12-05-2014', 'dd-mm-yyyy'), 'Safed', 'Berne', 'Electricity failure', 588);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('15-07-2013', 'dd-mm-yyyy'), 'Kfar Saba', 'Wrennie', 'Hazardous leak', 579);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('01-02-2014', 'dd-mm-yyyy'), 'Kiryat Yam', 'Wrennie', 'Armed assailant', 297);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('13-01-2014', 'dd-mm-yyyy'), 'Givatayim', 'Berne', 'Rotating storm', 360);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('23-07-2003', 'dd-mm-yyyy'), 'Herzliya', 'Fanya', 'Building blaze', 671);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('03-12-2010', 'dd-mm-yyyy'), 'Qalansawe', 'Fanya', 'Building blaze', 648);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('28-03-2015', 'dd-mm-yyyy'), 'Kiryat Ono', 'Fanya', 'Severe cyclone', 282);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('10-07-2000', 'dd-mm-yyyy'), 'Bat Yam', 'Fanya', 'Severe cyclone', 921);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('29-08-2017', 'dd-mm-yyyy'), 'Ramat HaSharon', 'Berne', 'Armed assailant', 146);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('07-07-2009', 'dd-mm-yyyy'), 'Yavne', 'Fanya', 'Hazardous leak', 384);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('16-02-2012', 'dd-mm-yyyy'), 'Herzliya', 'Berne', 'Armed assailant', 376);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('11-03-2004', 'dd-mm-yyyy'), 'Rehovot', 'Berne', 'Building blaze', 237);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('02-12-2018', 'dd-mm-yyyy'), 'Kafr Qasim', 'Wrennie', 'Health crisis', 834);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Flood', to_date('29-12-2013', 'dd-mm-yyyy'), 'Sderot', 'Berne', 'Rotating storm', 625);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('22-08-2012', 'dd-mm-yyyy'), 'Ramat Gan', 'Wrennie', 'Health crisis', 891);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('20-11-2013', 'dd-mm-yyyy'), 'Netivot', 'Berne', 'Electricity failure', 119);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('31-12-2018', 'dd-mm-yyyy'), 'Ashkelon', 'Fanya', 'Rotating storm', 910);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('05-02-2016', 'dd-mm-yyyy'), 'Nazareth', 'Wrennie', 'Electricity failure', 295);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('14-07-2001', 'dd-mm-yyyy'), 'Eilat', 'Wrennie', 'Health crisis', 383);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('10-02-2023', 'dd-mm-yyyy'), 'Migdal HaEmek', 'Wrennie', 'Severe cyclone', 476);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('24-05-2012', 'dd-mm-yyyy'), 'Safed', 'Wrennie', 'Building blaze', 262);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('20-02-2023', 'dd-mm-yyyy'), 'Or Akiva', 'Wrennie', 'Toxic emission', 602);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('28-05-2024', 'dd-mm-yyyy'), 'Jerusalem', 'Fanya', 'Ground shaking', 416);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('20-10-2007', 'dd-mm-yyyy'), 'Kfar Yona', 'Berne', 'Ground shaking', 163);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('10-11-2016', 'dd-mm-yyyy'), 'Umm al-Fahm', 'Wrennie', 'Health crisis', 988);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('28-10-2006', 'dd-mm-yyyy'), 'Ashdod', 'Fanya', 'Toxic emission', 399);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('(''Fire''', to_date('06-05-2004', 'dd-mm-yyyy'), 'Or Yehuda', 'Berne', 'Severe cyclone', 244);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('17-07-2006', 'dd-mm-yyyy'), 'Kiryat Ono', 'Berne', 'Water inundation', 535);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Medical Emergency', to_date('14-09-2018', 'dd-mm-yyyy'), 'Rehovot', 'Wrennie', 'Health crisis', 485);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('30-03-2000', 'dd-mm-yyyy'), 'Petah Tikva', 'Berne', 'Armed assailant', 123);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Chemical Spill', to_date('07-10-2001', 'dd-mm-yyyy'), 'Yehud-Monosson', 'Fanya', 'Electricity failure', 712);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Active Shooter', to_date('28-07-2010', 'dd-mm-yyyy'), 'Ariel', 'Fanya', 'Toxic emission', 338);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('24-05-2010', 'dd-mm-yyyy'), 'Netanya', 'Berne', 'Health crisis', 985);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Tornado', to_date('09-08-2016', 'dd-mm-yyyy'), 'Herzliya', 'Berne', 'Armed assailant', 249);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('24-12-2007', 'dd-mm-yyyy'), 'Kafr Qasim', 'Wrennie', 'Rotating storm', 320);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Emergency Drill', to_date('01-05-2023', 'dd-mm-yyyy'), 'Location A', 'John Doe', 'Monthly drill', 1);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Accident', to_date('12-12-2000', 'dd-mm-yyyy'), 'Maale Adomim', 'Evyatar', 'Boommm', 127876);
commit;
prompt 156 records loaded
prompt Loading TEAMP...
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (2, '75 Cody Avenue', '498-380-2480', 'Wrennie', 'wquarrington1@washington.edu', 639);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (6, '9 Dryden Circle', '821-406-5190', 'Ezmeralda', 'ecovely5@ucla.edu', 590);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (10, '1 Westridge Drive', '395-572-4603', 'Dukie', 'djirus9@dell.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (12, '1784 Straubel Way', '725-648-6113', 'Mitchell', 'mfookesb@bluehost.com', 614);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (15, '45044 Crownhardt Road', '691-716-3924', 'Minette', 'mcoultharde@aol.com', 624);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (17, '38 Melody Drive', '689-234-3553', 'Clarie', 'cquartlyg@salon.com', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (19, '31 6th Center', '647-446-4499', 'Devina', 'dpiscoi@adobe.com', 567);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (23, '73 Arrowood Center', '125-190-7763', 'Ronalda', 'rfortunm@webnode.com', 657);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (27, '1809 Dovetail Avenue', '114-455-4622', 'Karyn', 'kalltimesq@theatlantic.com', 660);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (29, '52324 Autumn Leaf Way', '656-622-0015', 'Lyle', 'lraywoods@telegraph.co.uk', 610);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (30, '80758 Golf Course Center', '848-473-7222', 'Ashlin', 'ayewdallt@deliciousdays.com', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (33, '7057 Mallard Pass', '227-941-9324', 'Lusa', 'lcabralw@utexas.edu', 607);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (35, '8 La Follette Avenue', '982-354-0804', 'Agathe', 'aduffreey@apache.org', 615);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (37, '93 Drewry Way', '351-549-4371', 'Melony', 'msansbury10@wordpress.org', 563);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (39, '68 Everett Avenue', '331-885-8151', 'Shermie', 'spetegrew12@uiuc.edu', 583);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (41, '6224 Messerschmidt Street', '550-460-6023', 'Terrence', 'tcretney14@census.gov', 649);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (42, '97273 Memorial Point', '744-901-3116', 'Latashia', 'lcohani15@freewebs.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (43, '800 Bultman Terrace', '846-569-1204', 'Margaux', 'mhowen16@census.gov', 575);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (46, '78 Warner Center', '501-471-2037', 'Roberto', 'rverheyden19@sakura.ne.jp', 682);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (49, '73188 Bunker Hill Street', '195-136-6674', 'Danie', 'dmurrie1c@paypal.com', 683);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (55, '7 Oak Valley Place', '918-565-9720', 'Willyt', 'wyukhov1i@netscape.com', 613);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (56, '567 Sunfield Place', '904-917-8465', 'Irvin', 'igaiford1j@house.gov', 566);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (59, '63 Warbler Trail', '352-444-1177', 'Barbabra', 'btethcote1m@google.ru', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (61, '2 Vahlen Center', '382-852-4992', 'Timothee', 'tcottel1o@sohu.com', 692);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (62, '3777 Corscot Drive', '935-284-0470', 'Gloriane', 'gvials1p@tiny.cc', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (65, '896 Vera Parkway', '815-250-8455', 'Shaine', 'smccard1s@cpanel.net', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (66, '03577 Haas Trail', '296-702-9781', 'Kore', 'kglassford1t@soundcloud.com', 651);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (67, '8682 Cascade Street', '604-115-0956', 'Adelbert', 'atrenholm1u@scribd.com', 604);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (72, '055 Tennessee Lane', '166-483-1168', 'Lotta', 'lcomino1z@auda.org.au', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (75, '08870 Menomonie Court', '584-104-2820', 'Bibbie', 'bneve22@gravatar.com', 679);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (77, '8 Debra Point', '855-455-4818', 'Annalise', 'afrean24@tripadvisor.com', 623);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (83, '96 Ronald Regan Crossing', '884-946-8501', 'Stern', 'ssparkes2a@opensource.org', 608);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (85, '5 Laurel Street', '710-108-2109', 'Devinne', 'dvandevelde2c@ebay.co.uk', 667);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (86, '29 Merchant Street', '619-732-9382', 'Broderick', 'bculver2d@msu.edu', 620);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (87, '8128 Packers Center', '371-505-4096', 'Devi', 'dbanham2e@t.co', 678);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (93, '1791 Gerald Alley', '240-560-2245', 'Theodora', 'tscinelli2k@yahoo.co.jp', 573);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (94, '6443 Buell Street', '835-580-0159', 'Kial', 'kgamlyn2l@example.com', 593);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (99, '67174 Calypso Parkway', '115-559-0445', 'Shaine', 'sreal2q@businessinsider.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (100, '9553 Valley Edge Plaza', '718-865-6696', 'Teddie', 'tbattrum2r@google.cn', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (103, '7 Barnett Crossing', '660-832-5465', 'Daisie', 'ddakhov2u@addthis.com', 675);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (105, '76101 Aberg Lane', '506-877-8049', 'Dion', 'dfirbank2w@nps.gov', 691);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (106, '4769 Tennessee Avenue', '293-144-7719', 'Tod', 'tdannell2x@ucoz.ru', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (108, '11 Pine View Crossing', '854-612-0186', 'Vania', 'vscotfurth2z@indiegogo.com', 658);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (111, '2 Tony Place', '587-267-4970', 'Hyacintha', 'htry32@nifty.com', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (112, '2 Fieldstone Trail', '511-219-2628', 'Loreen', 'leatttok33@walmart.com', 650);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (117, '996 Lighthouse Bay Court', '431-729-8060', 'Anetta', 'abertenshaw38@bigcartel.com', 611);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (118, '0706 Russell Terrace', '450-664-3548', 'Rosie', 'rnelius39@odnoklassniki.ru', 597);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (134, '8 Rockefeller Way', '921-482-2346', 'Lita', 'ldick3p@latimes.com', 583);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (135, '0787 Garrison Court', '432-781-4899', 'Florenza', 'fwashbrook3q@state.gov', 655);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (136, '8 Debs Crossing', '111-456-3102', 'Junie', 'jevans3r@prweb.com', 664);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (137, '04815 Pine View Street', '963-561-1238', 'Biron', 'brollinson3s@pcworld.com', 591);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (142, '9 Clemons Crossing', '270-154-8770', 'Nowell', 'nwhiteland3x@indiegogo.com', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (143, '1708 Stoughton Lane', '472-539-2853', 'Andy', 'alaws3y@accuweather.com', 629);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (144, '966 Meadow Vale Way', '305-436-0805', 'Corey', 'cpopov3z@topsy.com', 571);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (145, '18 Kipling Hill', '138-606-4731', 'Laurie', 'lcaustic40@state.tx.us', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (148, '06104 Arapahoe Point', '390-627-1377', 'Dorrie', 'dmorcomb43@hibu.com', 680);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (152, '7254 Homewood Place', '957-858-1788', 'Bailey', 'bheeran47@comsenz.com', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (154, '56519 3rd Plaza', '189-219-0378', 'Nicole', 'npawfoot49@google.com.br', 594);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (155, '96040 Park Meadow Road', '852-381-9251', 'Francesco', 'fguinan4a@csmonitor.com', 690);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (159, '1440 Namekagon Trail', '755-809-0007', 'Roderigo', 'rblandamore4e@nba.com', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (161, '89752 Haas Drive', '983-654-4603', 'Yettie', 'ycowerd4g@virginia.edu', 683);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (163, '23 Killdeer Park', '327-334-4023', 'Dalia', 'ddigiorgio4i@naver.com', 694);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (164, '13320 Sachtjen Plaza', '903-953-8267', 'Anastassia', 'abaldi4j@trellian.com', 628);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (165, '38523 Del Mar Lane', '682-744-5844', 'Selig', 'shebborne4k@springer.com', 692);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (167, '997 Memorial Center', '443-293-5738', 'Winona', 'wfarmer4m@joomla.org', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (170, '3900 Havey Drive', '715-475-4127', 'Leslie', 'lheninghem4p@mtv.com', 570);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (171, '12694 Anzinger Trail', '562-209-0300', 'Roxine', 'rgudger4q@sciencedirect.com', 676);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (173, '96498 Del Sol Parkway', '468-632-0377', 'Bret', 'biacovozzo4s@edublogs.org', 589);
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
values (193, '38414 Hintze Crossing', '920-793-9000', 'Birgit', 'bsonschein5c@comsenz.com', 636);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (196, '135 Oriole Court', '926-453-7907', 'Robb', 'rradborne5f@china.com.cn', 675);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (197, '004 Moland Center', '556-351-6284', 'Haleigh', 'hsparkes5g@digg.com', 588);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (200, '13 Truax Court', '256-818-3719', 'Oren', 'oshoebrook5j@imageshack.us', 600);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (202, '6525 Anzinger Center', '108-538-5082', 'Nicolai', 'ncolaton5l@sakura.ne.jp', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (203, '2227 Butternut Point', '176-355-7854', 'Gwendolen', 'gtams5m@gnu.org', 641);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (204, '308 Golf Way', '985-649-4245', 'Barrie', 'bloosely5n@unblog.fr', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (208, '4 Maple Avenue', '951-208-8154', 'Jenni', 'jmarages5r@msn.com', 564);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (209, '878 Waubesa Junction', '999-661-3767', 'Court', 'cskeffington5s@oaic.gov.au', 595);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (215, '9 Upham Crossing', '153-496-1953', 'Althea', 'abelleny5y@live.com', 697);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (216, '2 Homewood Road', '104-389-3653', 'Shela', 'saxe5z@sakura.ne.jp', 677);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (217, '6278 Sachtjen Parkway', '319-478-8344', 'Florinda', 'fklauber60@myspace.com', 651);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (220, '76301 Armistice Center', '597-217-6754', 'Mireille', 'mmahaffey63@nytimes.com', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (225, '6514 Cody Alley', '976-952-0858', 'Lazaro', 'lcoakley68@dot.gov', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (227, '413 Eastwood Alley', '513-693-7325', 'Kipp', 'kcrosson6a@si.edu', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (230, '853 Dunning Center', '994-122-1166', 'Florina', 'fpease6d@yelp.com', 651);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (234, '0 Transport Pass', '389-375-6681', 'Gianna', 'gtremlett6h@facebook.com', 619);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (236, '9 Ryan Crossing', '413-205-7022', 'Haskel', 'hstitch6j@squarespace.com', 602);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (237, '4 Monument Way', '523-384-6140', 'Ebeneser', 'ecorain6k@zimbio.com', 598);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (240, '12 Waubesa Road', '181-638-0284', 'Brad', 'bleonardi6n@163.com', 609);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (243, '9359 South Court', '254-805-3691', 'Gunther', 'gseamarke6q@4shared.com', 620);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (246, '9 Bluestem Pass', '756-772-9083', 'Gusta', 'gchallens6t@google.com', 608);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (250, '892 Esker Plaza', '160-693-0410', 'Marcel', 'mdeek6x@ftc.gov', 595);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (251, '906 Iowa Avenue', '599-928-4394', 'Corrie', 'ccolquete6y@clickbank.net', 577);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (253, '7 Ramsey Place', '756-394-3018', 'Shelli', 'sslora70@dailymail.co.uk', 573);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (254, '055 Bowman Park', '300-915-9064', 'Francklyn', 'fguitel71@bloglovin.com', 668);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (255, '1431 West Plaza', '784-561-7125', 'Carlynne', 'chartmann72@thetimes.co.uk', 627);
commit;
prompt 100 records committed...
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (258, '6 Scott Road', '833-596-7734', 'Sidoney', 'spyzer75@prlog.org', 570);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (260, '50551 Katie Road', '372-156-0932', 'Chaddy', 'cchilcott77@plala.or.jp', 648);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (261, '90 Starling Lane', '385-202-3805', 'Silvano', 'scoolbear78@usnews.com', 623);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (264, '6280 Blaine Terrace', '602-701-8625', 'Freddy', 'fhinken7b@csmonitor.com', 618);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (266, '99 Fordem Avenue', '994-860-6293', 'Sebastien', 'sbreckin7d@smugmug.com', 689);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (267, '592 Comanche Center', '893-426-6834', 'Oran', 'oreims7e@istockphoto.com', 616);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (271, '46578 Harbort Crossing', '611-885-7041', 'Brooke', 'bglas7i@tripod.com', 689);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (278, '141 Lillian Drive', '360-462-4990', 'Way', 'wdagnan7p@hexun.com', 698);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (280, '48 Nelson Place', '489-564-4357', 'De', 'dsharples7r@naver.com', 681);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (286, '47 Forest Drive', '825-168-2058', 'Clayborn', 'canthony7x@va.gov', 659);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (288, '65704 Declaration Crossing', '168-181-7798', 'Dulcy', 'dgrevatt7z@examiner.com', 596);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (290, '39961 Cottonwood Trail', '166-149-4209', 'Harman', 'hgariff81@nasa.gov', 652);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (292, '7 Corben Place', '905-588-5458', 'Eberhard', 'echitson83@lulu.com', 665);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (298, '1 Dottie Alley', '278-268-0753', 'Irwin', 'ifullick89@blogger.com', 687);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (299, '5365 Stoughton Lane', '233-522-3867', 'Romonda', 'rharfoot8a@japanpost.jp', 698);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (302, '34 Emmet Alley', '478-319-0374', 'Fonz', 'fklassman8d@go.com', 611);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (306, '36939 Lakewood Plaza', '980-834-0989', 'Vaughan', 'vstart8h@zimbio.com', 633);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (310, '9408 South Lane', '948-884-2354', 'Ellette', 'esijmons8l@newyorker.com', 683);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (311, '60773 Dexter Street', '668-657-5350', 'Latisha', 'loffell8m@usgs.gov', 599);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (312, '2537 Golden Leaf Point', '711-711-3818', 'Polly', 'pcampkin8n@yandex.ru', 679);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (314, '511 Elmside Place', '149-395-8722', 'Konstantin', 'kguilaem8p@cisco.com', 655);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (318, '7094 Upham Road', '689-811-1457', 'Baryram', 'bbrodhead8t@mediafire.com', 662);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (321, '78 Hoffman Court', '401-159-2426', 'Genevieve', 'ghenaughan8w@biblegateway.com', 644);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (325, '85 Starling Pass', '988-870-6545', 'Ginni', 'gbenny90@taobao.com', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (329, '1080 Florence Street', '751-745-5885', 'Carlo', 'cspringtorp94@reverbnation.com', 650);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (330, '6 Mayfield Street', '214-313-8544', 'Betteanne', 'bspridgeon95@cargocollective.com', 617);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (332, '81157 Elmside Center', '618-390-7876', 'Beatrice', 'brobe97@newyorker.com', 604);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (338, '911 Summerview Circle', '685-919-8710', 'Carolina', 'cifill9d@sitemeter.com', 574);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (342, '720 Thierer Terrace', '816-107-9797', 'Cesaro', 'cwaine9h@usgs.gov', 564);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (345, '66 Jenna Park', '751-676-8287', 'Fitz', 'fbenley9k@bbc.co.uk', 669);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (350, '1 Weeping Birch Circle', '143-210-9152', 'Sean', 'sburroughes9p@timesonline.co.uk', 697);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (352, '70 Fair Oaks Center', '479-611-7629', 'Jorrie', 'jdwire9r@com.com', 668);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (355, '51375 Spohn Court', '610-844-2623', 'Nance', 'ndanslow9u@nationalgeographic.com', 625);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (359, '4 Scoville Alley', '126-435-8044', 'Sansone', 'sfidoe9y@ucoz.com', 645);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (361, '15 Summit Circle', '281-198-1761', 'Catherine', 'cwilcota0@qq.com', 580);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (363, '2145 Butternut Point', '142-220-1861', 'Tymon', 'tblunsena2@nba.com', 679);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (364, '836 Hoffman Way', '673-297-3533', 'Monroe', 'mguillouxa3@yolasite.com', 589);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (365, '550 Anniversary Crossing', '928-228-0382', 'Waylin', 'wdelorta4@wix.com', 635);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (367, '37 Randy Plaza', '936-559-1082', 'Enrico', 'egheorghea6@a8.net', 635);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (369, '1115 Cody Pass', '392-895-3079', 'Renae', 'rpfeiffera8@shutterfly.com', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (374, '29820 Clarendon Crossing', '859-652-7370', 'Kele', 'kshrievesad@google.com.hk', 699);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (375, '0719 Dayton Lane', '378-587-9474', 'Jacky', 'jcarruthersae@upenn.edu', 592);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (378, '28107 Dahle Point', '940-133-7213', 'Thibaut', 'tdietscheah@zdnet.com', 638);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (383, '22445 Londonderry Parkway', '423-736-7558', 'Nalani', 'ncalwayam@reddit.com', 684);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (387, '0 Kenwood Way', '198-281-5863', 'Jeramie', 'jstraineaq@indiegogo.com', 631);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (388, '03 Manley Street', '671-489-7748', 'Franklin', 'ffullbrookar@feedburner.com', 601);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (391, '07778 Nobel Trail', '502-841-9029', 'Albertina', 'aclappertonau@cbc.ca', 638);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (392, '3 Hovde Junction', '554-181-5972', 'Jarrett', 'jhavillav@com.com', 630);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (394, '3 Bartillon Park', '987-446-1376', 'Jayne', 'jchiechioax@altervista.org', 671);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (399, '52965 Monument Junction', '272-601-9799', 'Debbie', 'dbuglerb2@woothemes.com', 565);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (1, 'Address A', '1234567890', 'John Doe', 'john.doe@example.com', 1);
commit;
prompt 151 records loaded
prompt Loading ACTIN...
insert into ACTIN (teid, evid)
values (2, 516);
insert into ACTIN (teid, evid)
values (2, 890);
insert into ACTIN (teid, evid)
values (6, 798);
insert into ACTIN (teid, evid)
values (6, 985);
insert into ACTIN (teid, evid)
values (10, 139);
insert into ACTIN (teid, evid)
values (10, 579);
insert into ACTIN (teid, evid)
values (10, 958);
insert into ACTIN (teid, evid)
values (12, 655);
insert into ACTIN (teid, evid)
values (12, 882);
insert into ACTIN (teid, evid)
values (15, 200);
insert into ACTIN (teid, evid)
values (17, 320);
insert into ACTIN (teid, evid)
values (19, 70);
insert into ACTIN (teid, evid)
values (23, 891);
insert into ACTIN (teid, evid)
values (23, 979);
insert into ACTIN (teid, evid)
values (27, 415);
insert into ACTIN (teid, evid)
values (29, 423);
insert into ACTIN (teid, evid)
values (30, 910);
insert into ACTIN (teid, evid)
values (33, 249);
insert into ACTIN (teid, evid)
values (35, 858);
insert into ACTIN (teid, evid)
values (37, 297);
insert into ACTIN (teid, evid)
values (37, 368);
insert into ACTIN (teid, evid)
values (39, 985);
insert into ACTIN (teid, evid)
values (41, 44);
insert into ACTIN (teid, evid)
values (41, 228);
insert into ACTIN (teid, evid)
values (41, 380);
insert into ACTIN (teid, evid)
values (42, 628);
insert into ACTIN (teid, evid)
values (43, 402);
insert into ACTIN (teid, evid)
values (46, 262);
insert into ACTIN (teid, evid)
values (49, 831);
insert into ACTIN (teid, evid)
values (55, 264);
insert into ACTIN (teid, evid)
values (56, 297);
insert into ACTIN (teid, evid)
values (56, 831);
insert into ACTIN (teid, evid)
values (59, 485);
insert into ACTIN (teid, evid)
values (61, 652);
insert into ACTIN (teid, evid)
values (61, 694);
insert into ACTIN (teid, evid)
values (61, 870);
insert into ACTIN (teid, evid)
values (62, 861);
insert into ACTIN (teid, evid)
values (65, 66);
insert into ACTIN (teid, evid)
values (65, 380);
insert into ACTIN (teid, evid)
values (65, 550);
insert into ACTIN (teid, evid)
values (65, 684);
insert into ACTIN (teid, evid)
values (65, 769);
insert into ACTIN (teid, evid)
values (66, 44);
insert into ACTIN (teid, evid)
values (67, 550);
insert into ACTIN (teid, evid)
values (72, 119);
insert into ACTIN (teid, evid)
values (72, 228);
insert into ACTIN (teid, evid)
values (72, 702);
insert into ACTIN (teid, evid)
values (75, 282);
insert into ACTIN (teid, evid)
values (77, 691);
insert into ACTIN (teid, evid)
values (83, 742);
insert into ACTIN (teid, evid)
values (85, 70);
insert into ACTIN (teid, evid)
values (85, 890);
insert into ACTIN (teid, evid)
values (86, 671);
insert into ACTIN (teid, evid)
values (87, 472);
insert into ACTIN (teid, evid)
values (93, 163);
insert into ACTIN (teid, evid)
values (94, 468);
insert into ACTIN (teid, evid)
values (99, 697);
insert into ACTIN (teid, evid)
values (100, 284);
insert into ACTIN (teid, evid)
values (103, 416);
insert into ACTIN (teid, evid)
values (105, 66);
insert into ACTIN (teid, evid)
values (106, 301);
insert into ACTIN (teid, evid)
values (108, 808);
insert into ACTIN (teid, evid)
values (111, 84);
insert into ACTIN (teid, evid)
values (111, 184);
insert into ACTIN (teid, evid)
values (111, 187);
insert into ACTIN (teid, evid)
values (112, 134);
insert into ACTIN (teid, evid)
values (117, 264);
insert into ACTIN (teid, evid)
values (117, 297);
insert into ACTIN (teid, evid)
values (117, 415);
insert into ACTIN (teid, evid)
values (118, 758);
insert into ACTIN (teid, evid)
values (134, 53);
insert into ACTIN (teid, evid)
values (135, 64);
insert into ACTIN (teid, evid)
values (135, 262);
insert into ACTIN (teid, evid)
values (135, 411);
insert into ACTIN (teid, evid)
values (135, 649);
insert into ACTIN (teid, evid)
values (136, 129);
insert into ACTIN (teid, evid)
values (136, 357);
insert into ACTIN (teid, evid)
values (136, 404);
insert into ACTIN (teid, evid)
values (136, 504);
insert into ACTIN (teid, evid)
values (137, 72);
insert into ACTIN (teid, evid)
values (142, 550);
insert into ACTIN (teid, evid)
values (143, 895);
insert into ACTIN (teid, evid)
values (144, 56);
insert into ACTIN (teid, evid)
values (144, 626);
insert into ACTIN (teid, evid)
values (145, 78);
insert into ACTIN (teid, evid)
values (145, 650);
insert into ACTIN (teid, evid)
values (145, 652);
insert into ACTIN (teid, evid)
values (148, 585);
insert into ACTIN (teid, evid)
values (152, 53);
insert into ACTIN (teid, evid)
values (154, 325);
insert into ACTIN (teid, evid)
values (154, 758);
insert into ACTIN (teid, evid)
values (155, 798);
insert into ACTIN (teid, evid)
values (159, 535);
insert into ACTIN (teid, evid)
values (161, 535);
insert into ACTIN (teid, evid)
values (163, 392);
insert into ACTIN (teid, evid)
values (163, 602);
insert into ACTIN (teid, evid)
values (163, 921);
insert into ACTIN (teid, evid)
values (164, 399);
insert into ACTIN (teid, evid)
values (165, 472);
insert into ACTIN (teid, evid)
values (165, 476);
commit;
prompt 100 records committed...
insert into ACTIN (teid, evid)
values (165, 655);
insert into ACTIN (teid, evid)
values (167, 655);
insert into ACTIN (teid, evid)
values (170, 342);
insert into ACTIN (teid, evid)
values (170, 968);
insert into ACTIN (teid, evid)
values (171, 472);
insert into ACTIN (teid, evid)
values (171, 614);
insert into ACTIN (teid, evid)
values (171, 905);
insert into ACTIN (teid, evid)
values (173, 187);
insert into ACTIN (teid, evid)
values (173, 814);
insert into ACTIN (teid, evid)
values (181, 611);
insert into ACTIN (teid, evid)
values (181, 625);
insert into ACTIN (teid, evid)
values (182, 742);
insert into ACTIN (teid, evid)
values (183, 451);
insert into ACTIN (teid, evid)
values (183, 870);
insert into ACTIN (teid, evid)
values (184, 187);
insert into ACTIN (teid, evid)
values (185, 44);
insert into ACTIN (teid, evid)
values (185, 758);
insert into ACTIN (teid, evid)
values (193, 611);
insert into ACTIN (teid, evid)
values (193, 684);
insert into ACTIN (teid, evid)
values (196, 84);
insert into ACTIN (teid, evid)
values (196, 119);
insert into ACTIN (teid, evid)
values (196, 798);
insert into ACTIN (teid, evid)
values (196, 890);
insert into ACTIN (teid, evid)
values (197, 301);
insert into ACTIN (teid, evid)
values (200, 439);
insert into ACTIN (teid, evid)
values (200, 614);
insert into ACTIN (teid, evid)
values (202, 451);
insert into ACTIN (teid, evid)
values (203, 588);
insert into ACTIN (teid, evid)
values (204, 342);
insert into ACTIN (teid, evid)
values (204, 634);
insert into ACTIN (teid, evid)
values (204, 684);
insert into ACTIN (teid, evid)
values (204, 712);
insert into ACTIN (teid, evid)
values (208, 301);
insert into ACTIN (teid, evid)
values (208, 691);
insert into ACTIN (teid, evid)
values (209, 662);
insert into ACTIN (teid, evid)
values (215, 282);
insert into ACTIN (teid, evid)
values (215, 416);
insert into ACTIN (teid, evid)
values (216, 53);
insert into ACTIN (teid, evid)
values (217, 958);
insert into ACTIN (teid, evid)
values (220, 237);
insert into ACTIN (teid, evid)
values (220, 410);
insert into ACTIN (teid, evid)
values (225, 187);
insert into ACTIN (teid, evid)
values (225, 338);
insert into ACTIN (teid, evid)
values (227, 310);
insert into ACTIN (teid, evid)
values (227, 614);
insert into ACTIN (teid, evid)
values (227, 905);
insert into ACTIN (teid, evid)
values (230, 56);
insert into ACTIN (teid, evid)
values (230, 66);
insert into ACTIN (teid, evid)
values (230, 181);
insert into ACTIN (teid, evid)
values (234, 655);
insert into ACTIN (teid, evid)
values (236, 258);
insert into ACTIN (teid, evid)
values (236, 377);
insert into ACTIN (teid, evid)
values (237, 64);
insert into ACTIN (teid, evid)
values (237, 394);
insert into ACTIN (teid, evid)
values (240, 72);
insert into ACTIN (teid, evid)
values (240, 882);
insert into ACTIN (teid, evid)
values (243, 882);
insert into ACTIN (teid, evid)
values (246, 310);
insert into ACTIN (teid, evid)
values (250, 295);
insert into ACTIN (teid, evid)
values (250, 671);
insert into ACTIN (teid, evid)
values (251, 808);
insert into ACTIN (teid, evid)
values (253, 163);
insert into ACTIN (teid, evid)
values (253, 399);
insert into ACTIN (teid, evid)
values (253, 481);
insert into ACTIN (teid, evid)
values (254, 149);
insert into ACTIN (teid, evid)
values (255, 442);
insert into ACTIN (teid, evid)
values (258, 891);
insert into ACTIN (teid, evid)
values (260, 652);
insert into ACTIN (teid, evid)
values (261, 410);
insert into ACTIN (teid, evid)
values (264, 472);
insert into ACTIN (teid, evid)
values (264, 702);
insert into ACTIN (teid, evid)
values (266, 200);
insert into ACTIN (teid, evid)
values (267, 416);
insert into ACTIN (teid, evid)
values (267, 988);
insert into ACTIN (teid, evid)
values (271, 360);
insert into ACTIN (teid, evid)
values (271, 442);
insert into ACTIN (teid, evid)
values (271, 968);
insert into ACTIN (teid, evid)
values (278, 129);
insert into ACTIN (teid, evid)
values (278, 163);
insert into ACTIN (teid, evid)
values (280, 485);
insert into ACTIN (teid, evid)
values (280, 806);
insert into ACTIN (teid, evid)
values (286, 634);
insert into ACTIN (teid, evid)
values (288, 297);
insert into ACTIN (teid, evid)
values (290, 146);
insert into ACTIN (teid, evid)
values (290, 303);
insert into ACTIN (teid, evid)
values (290, 383);
insert into ACTIN (teid, evid)
values (292, 694);
insert into ACTIN (teid, evid)
values (298, 392);
insert into ACTIN (teid, evid)
values (298, 897);
insert into ACTIN (teid, evid)
values (298, 958);
insert into ACTIN (teid, evid)
values (299, 376);
insert into ACTIN (teid, evid)
values (302, 84);
insert into ACTIN (teid, evid)
values (306, 985);
insert into ACTIN (teid, evid)
values (310, 808);
insert into ACTIN (teid, evid)
values (310, 976);
insert into ACTIN (teid, evid)
values (311, 56);
insert into ACTIN (teid, evid)
values (311, 579);
insert into ACTIN (teid, evid)
values (312, 415);
insert into ACTIN (teid, evid)
values (314, 649);
insert into ACTIN (teid, evid)
values (318, 383);
commit;
prompt 200 records committed...
insert into ACTIN (teid, evid)
values (318, 416);
insert into ACTIN (teid, evid)
values (321, 368);
insert into ACTIN (teid, evid)
values (325, 84);
insert into ACTIN (teid, evid)
values (325, 710);
insert into ACTIN (teid, evid)
values (329, 655);
insert into ACTIN (teid, evid)
values (330, 579);
insert into ACTIN (teid, evid)
values (332, 470);
insert into ACTIN (teid, evid)
values (332, 694);
insert into ACTIN (teid, evid)
values (338, 333);
insert into ACTIN (teid, evid)
values (342, 380);
insert into ACTIN (teid, evid)
values (345, 134);
insert into ACTIN (teid, evid)
values (345, 476);
insert into ACTIN (teid, evid)
values (345, 509);
insert into ACTIN (teid, evid)
values (350, 420);
insert into ACTIN (teid, evid)
values (350, 905);
insert into ACTIN (teid, evid)
values (352, 84);
insert into ACTIN (teid, evid)
values (352, 402);
insert into ACTIN (teid, evid)
values (352, 662);
insert into ACTIN (teid, evid)
values (352, 861);
insert into ACTIN (teid, evid)
values (355, 712);
insert into ACTIN (teid, evid)
values (355, 861);
insert into ACTIN (teid, evid)
values (359, 187);
insert into ACTIN (teid, evid)
values (361, 184);
insert into ACTIN (teid, evid)
values (361, 368);
insert into ACTIN (teid, evid)
values (363, 416);
insert into ACTIN (teid, evid)
values (363, 731);
insert into ACTIN (teid, evid)
values (364, 652);
insert into ACTIN (teid, evid)
values (365, 181);
insert into ACTIN (teid, evid)
values (367, 333);
insert into ACTIN (teid, evid)
values (367, 634);
insert into ACTIN (teid, evid)
values (367, 662);
insert into ACTIN (teid, evid)
values (369, 78);
insert into ACTIN (teid, evid)
values (369, 710);
insert into ACTIN (teid, evid)
values (369, 880);
insert into ACTIN (teid, evid)
values (374, 710);
insert into ACTIN (teid, evid)
values (374, 742);
insert into ACTIN (teid, evid)
values (374, 882);
insert into ACTIN (teid, evid)
values (375, 78);
insert into ACTIN (teid, evid)
values (375, 244);
insert into ACTIN (teid, evid)
values (375, 704);
insert into ACTIN (teid, evid)
values (378, 569);
insert into ACTIN (teid, evid)
values (383, 297);
insert into ACTIN (teid, evid)
values (387, 476);
insert into ACTIN (teid, evid)
values (387, 742);
insert into ACTIN (teid, evid)
values (388, 640);
insert into ACTIN (teid, evid)
values (391, 79);
insert into ACTIN (teid, evid)
values (391, 295);
insert into ACTIN (teid, evid)
values (392, 399);
insert into ACTIN (teid, evid)
values (394, 134);
insert into ACTIN (teid, evid)
values (399, 295);
commit;
prompt 250 records loaded
prompt Loading EMERGENBODIES...
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Police', 890, ' 100', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Emergency Medical Services (EMS)', 892, ' 102', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Coast Guard', 893, ' 103', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Search and Rescue', 894, ' 104', 640);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Disaster Response Teams', 895, ' 105', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Mountain Rescue', 897, ' 107', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Water Rescue', 898, ' 108', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Civil Defense', 899, ' 109', 640);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' National Guard', 900, ' 110', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Hazardous Materials (HAZMAT) Teams', 902, ' 112', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Air Ambulance', 903, ' 113', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Wildlife Rescue', 904, ' 114', 640);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Anti-Terrorism Units', 905, ' 115', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Poison Control', 907, ' 117', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Crisis Intervention Teams', 908, ' 118', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Public Health Emergency Services', 909, ' 119', 640);
commit;
prompt 16 records loaded
prompt Loading EMERGENCYDRILL...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-11-2023', 'dd-mm-yyyy'), 1, 45, 'active shooter drill', '2556 Rusk Place', 431, 'Apt 680');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 2, 180, 'earthquake drill', '6640 Coolidge Pass', 255, 'Room 596');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-08-2023', 'dd-mm-yyyy'), 3, 120, 'tornado drill', '747 Fremont Pass', 338, '1st Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-08-2023', 'dd-mm-yyyy'), 4, 30, 'tornado drill', '1663 Independence Terrace', 467, 'PO Box 98289');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-09-2023', 'dd-mm-yyyy'), 5, 60, 'active shooter drill', '2794 Straubel Point', 350, 'PO Box 16378');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-04-2024', 'dd-mm-yyyy'), 6, 120, 'active shooter drill', '70628 Glendale Junction', 469, 'PO Box 29934');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-09-2023', 'dd-mm-yyyy'), 7, 60, 'fire drill', '18 North Way', 297, 'Apt 73');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-09-2023', 'dd-mm-yyyy'), 8, 120, 'active shooter drill', '17 Service Alley', 112, '8th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-09-2023', 'dd-mm-yyyy'), 9, 180, 'earthquake drill', '0 Northridge Park', 466, 'Suite 98');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-12-2023', 'dd-mm-yyyy'), 10, 60, 'tornado drill', '00 Oakridge Avenue', 279, 'Room 953');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 11, 45, 'fire drill', '298 Hayes Crossing', 186, 'Room 2');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-03-2024', 'dd-mm-yyyy'), 12, 120, 'tornado drill', '264 Thierer Plaza', 178, 'Suite 34');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 13, 30, 'tornado drill', '1003 Shopko Drive', 101, 'Suite 80');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 14, 180, 'fire drill', '72055 Sachtjen Place', 137, 'Apt 787');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-08-2023', 'dd-mm-yyyy'), 28, 180, 'earthquake drill', '166 Merrick Park', 211, '2nd Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 17, 30, 'earthquake drill', '39700 Drewry Street', 91, 'PO Box 67900');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-01-2024', 'dd-mm-yyyy'), 18, 30, 'fire drill', '3 Westport Center', 286, 'Room 1885');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-11-2023', 'dd-mm-yyyy'), 19, 30, 'active shooter drill', '7856 Cody Center', 233, 'Apt 1625');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-12-2023', 'dd-mm-yyyy'), 20, 45, 'fire drill', '1275 Parkside Pass', 483, 'Room 1678');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-12-2023', 'dd-mm-yyyy'), 21, 30, 'active shooter drill', '529 Buhler Trail', 16, '6th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-03-2024', 'dd-mm-yyyy'), 22, 45, 'earthquake drill', '735 Oriole Plaza', 77, '14th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-12-2023', 'dd-mm-yyyy'), 23, 120, 'fire drill', '72 Logan Plaza', 85, '14th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-03-2024', 'dd-mm-yyyy'), 24, 45, 'earthquake drill', '58 Mallard Plaza', 271, 'PO Box 41251');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-12-2023', 'dd-mm-yyyy'), 25, 180, 'fire drill', '6929 1st Park', 424, 'PO Box 42968');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 27, 120, 'earthquake drill', '163 Bunting Point', 53, 'Room 1613');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-09-2023', 'dd-mm-yyyy'), 29, 45, 'evacuation drill', '94932 Nancy Pass', 199, 'Room 1814');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 30, 45, 'earthquake drill', '28 Petterle Road', 50, 'Apt 832');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-09-2023', 'dd-mm-yyyy'), 31, 120, 'evacuation drill', '1708 Roxbury Point', 296, 'PO Box 16782');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-09-2023', 'dd-mm-yyyy'), 32, 30, 'fire drill', '1779 Sutherland Court', 59, '4th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 33, 180, 'tornado drill', '1 Glacier Hill Circle', 95, 'Room 1119');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-04-2024', 'dd-mm-yyyy'), 34, 45, 'evacuation drill', '50 Schlimgen Park', 399, '9th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-09-2023', 'dd-mm-yyyy'), 35, 120, 'earthquake drill', '95 Kedzie Way', 251, '17th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-12-2023', 'dd-mm-yyyy'), 36, 120, 'earthquake drill', '58 Johnson Point', 248, '18th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 37, 180, 'evacuation drill', '621 Graceland Avenue', 188, 'Suite 36');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-03-2024', 'dd-mm-yyyy'), 38, 180, 'tornado drill', '739 Chive Place', 291, 'Suite 38');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-08-2023', 'dd-mm-yyyy'), 39, 120, 'earthquake drill', '07698 Swallow Junction', 299, 'Apt 1123');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 40, 180, 'fire drill', '330 Walton Road', 268, 'Suite 97');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-08-2023', 'dd-mm-yyyy'), 41, 180, 'fire drill', '7426 Mcbride Street', 34, 'Apt 1216');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-10-2023', 'dd-mm-yyyy'), 43, 30, 'tornado drill', '5316 Northwestern Avenue', 301, 'PO Box 36453');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 44, 120, 'evacuation drill', '3 Lake View Center', 106, 'PO Box 45142');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-01-2024', 'dd-mm-yyyy'), 45, 120, 'earthquake drill', '35 Burning Wood Way', 337, '4th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 46, 45, 'tornado drill', '2 Burrows Center', 466, 'PO Box 57279');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-10-2023', 'dd-mm-yyyy'), 48, 30, 'evacuation drill', '7 Butterfield Court', 452, '19th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 49, 180, 'active shooter drill', '9074 Forest Dale Parkway', 483, 'Apt 401');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-08-2023', 'dd-mm-yyyy'), 51, 30, 'fire drill', '6 Kings Alley', 11, 'PO Box 38348');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-05-2024', 'dd-mm-yyyy'), 53, 30, 'evacuation drill', '45 Kinsman Lane', 286, 'Suite 81');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 54, 120, 'evacuation drill', '9465 Ilene Road', 236, '14th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 57, 45, 'earthquake drill', '499 Grayhawk Trail', 344, 'PO Box 53810');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-08-2023', 'dd-mm-yyyy'), 58, 45, 'active shooter drill', '8565 International Alley', 11, 'Apt 1247');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-06-2023', 'dd-mm-yyyy'), 59, 30, 'active shooter drill', '12526 Sommers Plaza', 300, 'PO Box 55076');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-03-2024', 'dd-mm-yyyy'), 60, 45, 'active shooter drill', '3 Westerfield Court', 44, 'PO Box 50202');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-03-2024', 'dd-mm-yyyy'), 61, 45, 'fire drill', '2 Nelson Way', 11, 'PO Box 65783');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 62, 30, 'fire drill', '22145 Southridge Point', 211, 'Room 1952');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-06-2023', 'dd-mm-yyyy'), 63, 180, 'tornado drill', '376 Brentwood Circle', 74, 'Suite 98');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-08-2023', 'dd-mm-yyyy'), 64, 120, 'earthquake drill', '979 Loeprich Street', 184, 'PO Box 15030');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-02-2024', 'dd-mm-yyyy'), 65, 45, 'active shooter drill', '9 Oxford Court', 8, '18th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-11-2023', 'dd-mm-yyyy'), 66, 45, 'earthquake drill', '8081 Surrey Crossing', 163, '17th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 68, 120, 'tornado drill', '0 Sachtjen Circle', 187, 'Apt 240');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-05-2024', 'dd-mm-yyyy'), 69, 45, 'tornado drill', '8 Lakewood Gardens Court', 195, 'PO Box 70585');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 71, 45, 'active shooter drill', '1268 Roth Hill', 416, 'Room 268');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-03-2024', 'dd-mm-yyyy'), 72, 45, 'active shooter drill', '442 Kipling Drive', 314, 'Suite 65');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-11-2023', 'dd-mm-yyyy'), 74, 45, 'active shooter drill', '7375 Del Sol Alley', 375, 'Suite 66');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 75, 180, 'fire drill', '17 Victoria Parkway', 267, 'Suite 97');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-11-2023', 'dd-mm-yyyy'), 76, 120, 'fire drill', '425 Bunting Road', 486, '17th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 77, 180, 'active shooter drill', '8157 Lakeland Court', 451, 'Suite 17');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-03-2024', 'dd-mm-yyyy'), 78, 30, 'earthquake drill', '73276 Rieder Trail', 306, 'Apt 1435');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-07-2023', 'dd-mm-yyyy'), 79, 30, 'fire drill', '714 Hanson Park', 363, 'Room 359');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-08-2023', 'dd-mm-yyyy'), 80, 120, 'active shooter drill', '2480 Laurel Road', 29, 'Room 620');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-08-2023', 'dd-mm-yyyy'), 81, 30, 'fire drill', '33 Vahlen Pass', 241, 'Room 1122');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-07-2023', 'dd-mm-yyyy'), 15, 1, 'fire drill', '1876 Crescent Oaks Center', 156, 'Apt 1204');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-01-2024', 'dd-mm-yyyy'), 16, 1, 'fire drill', '050 Old Shore Parkway', 152, 'Room 1240');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-06-2023', 'dd-mm-yyyy'), 26, 1, 'earthquake drill', '59837 Bellgrove Hill', 315, 'PO Box 62763');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-03-2024', 'dd-mm-yyyy'), 42, 1, 'evacuation drill', '42387 Bluestem Avenue', 282, 'Room 173');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 47, 1, 'fire drill', '099 Forest Crossing', 188, 'PO Box 42783');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-07-2023', 'dd-mm-yyyy'), 50, 1, 'earthquake drill', '3 Toban Park', 175, 'Room 1449');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-05-2024', 'dd-mm-yyyy'), 52, 1, 'tornado drill', '6 Dahle Lane', 252, 'Apt 956');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-05-2024', 'dd-mm-yyyy'), 55, 1, 'active shooter drill', '1008 Ludington Point', 415, 'PO Box 64735');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-09-2023', 'dd-mm-yyyy'), 56, 1, 'evacuation drill', '1330 Cascade Terrace', 296, 'PO Box 97780');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 67, 1, 'earthquake drill', '67 4th Court', 108, 'Suite 24');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 70, 1, 'evacuation drill', '05 Anderson Street', 60, 'Apt 1312');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-12-2023', 'dd-mm-yyyy'), 73, 1, 'active shooter drill', '5 Macpherson Plaza', 336, 'Suite 18');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-07-2023', 'dd-mm-yyyy'), 82, 1, 'active shooter drill', '57790 New Castle Terrace', 19, 'Suite 13');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-05-2023', 'dd-mm-yyyy'), 83, 45, 'evacuation drill', '986 Sachs Terrace', 194, 'Apt 474');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-01-2024', 'dd-mm-yyyy'), 84, 45, 'earthquake drill', '4438 Darwin Street', 179, 'Suite 7');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 85, 45, 'evacuation drill', '2167 Northport Junction', 216, 'Suite 84');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 86, 120, 'fire drill', '96 John Wall Place', 249, 'PO Box 10675');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 87, 1, 'earthquake drill', '43068 Badeau Hill', 231, 'Suite 76');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 88, 1, 'evacuation drill', '8595 Melody Plaza', 375, 'Apt 1448');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-02-2024', 'dd-mm-yyyy'), 89, 1, 'evacuation drill', '68253 John Wall Circle', 232, 'Apt 1964');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-07-2023', 'dd-mm-yyyy'), 90, 120, 'active shooter drill', '60 Mitchell Court', 271, 'Room 1358');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 91, 1, 'active shooter drill', '75206 Knutson Junction', 419, 'Room 1816');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-05-2024', 'dd-mm-yyyy'), 92, 30, 'evacuation drill', '550 Thierer Parkway', 130, 'Suite 91');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-06-2023', 'dd-mm-yyyy'), 93, 180, 'fire drill', '56532 Mallard Trail', 153, 'Room 243');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 94, 30, 'active shooter drill', '9 Sunbrook Place', 350, 'PO Box 52197');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-05-2024', 'dd-mm-yyyy'), 95, 1, 'tornado drill', '8 Bunting Alley', 14, 'Suite 66');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-09-2023', 'dd-mm-yyyy'), 96, 120, 'tornado drill', '44086 Fulton Point', 455, 'Apt 1659');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-02-2024', 'dd-mm-yyyy'), 97, 120, 'evacuation drill', '7 Pond Avenue', 156, 'PO Box 32698');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-03-2024', 'dd-mm-yyyy'), 98, 45, 'tornado drill', '2434 Holmberg Park', 166, 'Apt 394');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-11-2023', 'dd-mm-yyyy'), 99, 1, 'evacuation drill', '41 Westridge Pass', 198, 'PO Box 18507');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-06-2023', 'dd-mm-yyyy'), 100, 45, 'evacuation drill', '4824 Moulton Crossing', 57, '19th Floor');
commit;
prompt 100 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 101, 30, 'evacuation drill', '78 Macpherson Terrace', 127, 'Suite 33');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 102, 1, 'earthquake drill', '41581 Fairfield Terrace', 125, 'Room 742');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-10-2023', 'dd-mm-yyyy'), 103, 180, 'earthquake drill', '5003 Fairview Junction', 251, 'PO Box 57145');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-09-2023', 'dd-mm-yyyy'), 104, 30, 'fire drill', '90814 Reindahl Lane', 165, 'Suite 11');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-07-2023', 'dd-mm-yyyy'), 105, 45, 'fire drill', '84114 Park Meadow Place', 467, 'PO Box 408');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-09-2023', 'dd-mm-yyyy'), 106, 45, 'active shooter drill', '682 Twin Pines Road', 261, '12th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-05-2024', 'dd-mm-yyyy'), 107, 180, 'fire drill', '471 Shoshone Way', 402, 'Room 1076');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-05-2024', 'dd-mm-yyyy'), 108, 120, 'active shooter drill', '84818 Nevada Terrace', 160, 'Apt 1495');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 109, 30, 'tornado drill', '1 Bunting Junction', 300, '6th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-06-2023', 'dd-mm-yyyy'), 110, 45, 'fire drill', '38 Gale Junction', 456, 'PO Box 30432');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-09-2023', 'dd-mm-yyyy'), 111, 30, 'active shooter drill', '4251 Birchwood Point', 481, 'Room 861');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-01-2024', 'dd-mm-yyyy'), 112, 30, 'tornado drill', '7 Londonderry Crossing', 245, 'PO Box 78751');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-12-2023', 'dd-mm-yyyy'), 113, 180, 'fire drill', '33520 Nova Avenue', 438, 'PO Box 13997');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-05-2024', 'dd-mm-yyyy'), 114, 45, 'earthquake drill', '28 Village Park', 186, 'Suite 63');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 115, 180, 'earthquake drill', '69 Calypso Plaza', 60, 'Room 940');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 116, 180, 'tornado drill', '27 Fairview Terrace', 320, 'Apt 1640');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 117, 45, 'fire drill', '44 Gerald Center', 429, '4th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-05-2024', 'dd-mm-yyyy'), 118, 45, 'evacuation drill', '56 Montana Drive', 446, 'Suite 64');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 119, 1, 'fire drill', '488 Browning Lane', 187, 'Suite 29');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-01-2024', 'dd-mm-yyyy'), 120, 180, 'tornado drill', '19 Blue Bill Park Circle', 427, 'Apt 1090');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 121, 180, 'fire drill', '940 Kings Point', 261, '17th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 122, 30, 'fire drill', '7429 Bunting Trail', 251, 'PO Box 95681');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 123, 30, 'fire drill', '7 Texas Pass', 256, 'Apt 1761');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-04-2024', 'dd-mm-yyyy'), 124, 180, 'fire drill', '64 Clyde Gallagher Trail', 457, 'Room 728');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 125, 180, 'earthquake drill', '35 Pennsylvania Hill', 330, 'Room 1890');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 126, 30, 'evacuation drill', '09 Mifflin Crossing', 402, '9th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 127, 120, 'earthquake drill', '52 Jenifer Place', 465, 'PO Box 30930');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-03-2024', 'dd-mm-yyyy'), 128, 1, 'fire drill', '55297 Macpherson Parkway', 320, 'Room 664');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 129, 120, 'tornado drill', '330 Victoria Plaza', 51, 'Suite 73');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 130, 120, 'earthquake drill', '245 Killdeer Point', 365, '15th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 131, 120, 'active shooter drill', '4 Milwaukee Junction', 38, 'PO Box 73104');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-04-2024', 'dd-mm-yyyy'), 132, 1, 'fire drill', '85 Monica Avenue', 421, '20th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-04-2024', 'dd-mm-yyyy'), 133, 1, 'tornado drill', '7665 Oak Hill', 215, '4th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-08-2023', 'dd-mm-yyyy'), 134, 45, 'evacuation drill', '4091 Warbler Lane', 258, '8th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-07-2023', 'dd-mm-yyyy'), 135, 45, 'evacuation drill', '1697 Daystar Hill', 329, 'PO Box 78390');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-11-2023', 'dd-mm-yyyy'), 136, 1, 'fire drill', '33 Blackbird Way', 376, 'Suite 57');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-05-2024', 'dd-mm-yyyy'), 137, 180, 'evacuation drill', '7 Anhalt Alley', 90, 'Apt 217');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 138, 30, 'tornado drill', '014 Lotheville Trail', 168, 'Room 11');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 139, 45, 'active shooter drill', '68313 Bowman Drive', 447, '15th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 140, 45, 'tornado drill', '572 Victoria Place', 140, 'Suite 99');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-06-2023', 'dd-mm-yyyy'), 141, 45, 'earthquake drill', '0 Mayer Pass', 187, 'PO Box 35615');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 142, 45, 'tornado drill', '1613 Derek Way', 208, 'PO Box 83620');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-12-2023', 'dd-mm-yyyy'), 143, 120, 'tornado drill', '59849 Burrows Pass', 458, 'Room 466');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-06-2023', 'dd-mm-yyyy'), 144, 180, 'earthquake drill', '354 Anderson Avenue', 379, 'Room 441');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-11-2023', 'dd-mm-yyyy'), 145, 180, 'fire drill', '5872 Nova Hill', 288, 'Room 1029');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-10-2023', 'dd-mm-yyyy'), 146, 45, 'fire drill', '2 Pleasure Alley', 341, 'PO Box 80988');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-06-2023', 'dd-mm-yyyy'), 147, 45, 'earthquake drill', '34730 Fuller Avenue', 278, 'Suite 22');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 148, 120, 'fire drill', '1164 Artisan Street', 38, 'Suite 53');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-12-2023', 'dd-mm-yyyy'), 149, 180, 'fire drill', '144 Arizona Alley', 434, 'Apt 422');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 150, 180, 'active shooter drill', '12149 Rutledge Trail', 402, 'Room 913');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-09-2023', 'dd-mm-yyyy'), 151, 180, 'tornado drill', '4 Mifflin Trail', 368, 'Apt 146');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-08-2023', 'dd-mm-yyyy'), 152, 120, 'fire drill', '7 Pankratz Place', 348, 'PO Box 88040');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-02-2024', 'dd-mm-yyyy'), 153, 45, 'active shooter drill', '0 Bashford Place', 19, '5th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 154, 180, 'earthquake drill', '5007 West Crossing', 476, '18th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 155, 30, 'earthquake drill', '9 Jenifer Park', 316, 'Apt 95');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-10-2023', 'dd-mm-yyyy'), 156, 1, 'active shooter drill', '252 Delaware Hill', 116, '11th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-09-2023', 'dd-mm-yyyy'), 157, 45, 'evacuation drill', '49 Bashford Park', 143, 'Apt 1037');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-09-2023', 'dd-mm-yyyy'), 158, 180, 'active shooter drill', '1 Little Fleur Park', 97, 'Room 1988');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 159, 180, 'earthquake drill', '3398 Myrtle Pass', 238, 'Apt 980');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 160, 120, 'evacuation drill', '296 Oakridge Pass', 416, 'Apt 1074');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-07-2023', 'dd-mm-yyyy'), 161, 180, 'evacuation drill', '88 Tony Plaza', 18, 'Apt 669');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-10-2023', 'dd-mm-yyyy'), 162, 1, 'evacuation drill', '4 Schlimgen Parkway', 368, 'PO Box 21276');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 163, 120, 'fire drill', '97053 Oxford Road', 349, '7th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-04-2024', 'dd-mm-yyyy'), 164, 120, 'fire drill', '77 Corben Park', 258, '11th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 165, 1, 'fire drill', '35 Toban Pass', 398, 'Room 1049');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-06-2023', 'dd-mm-yyyy'), 166, 45, 'tornado drill', '50992 Vidon Center', 343, '6th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-01-2024', 'dd-mm-yyyy'), 167, 180, 'evacuation drill', '674 Linden Trail', 481, '17th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-05-2024', 'dd-mm-yyyy'), 168, 180, 'earthquake drill', '4596 Clyde Gallagher Trail', 495, 'Room 743');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-11-2023', 'dd-mm-yyyy'), 169, 120, 'fire drill', '442 Springs Point', 101, 'Room 1914');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-06-2023', 'dd-mm-yyyy'), 170, 180, 'tornado drill', '24 Eastlawn Plaza', 305, 'Apt 1986');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-10-2023', 'dd-mm-yyyy'), 171, 180, 'active shooter drill', '297 Dawn Junction', 202, 'Apt 1265');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-09-2023', 'dd-mm-yyyy'), 172, 180, 'active shooter drill', '49023 Arrowood Street', 485, 'Apt 190');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 173, 1, 'evacuation drill', '71323 Nova Hill', 387, 'Room 1278');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 174, 45, 'earthquake drill', '12638 Blackbird Drive', 53, 'Suite 41');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-05-2024', 'dd-mm-yyyy'), 175, 180, 'fire drill', '81449 2nd Avenue', 168, '16th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-12-2023', 'dd-mm-yyyy'), 176, 1, 'active shooter drill', '5661 Susan Lane', 138, 'Room 373');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-05-2024', 'dd-mm-yyyy'), 177, 120, 'earthquake drill', '0 Kensington Pass', 82, 'Apt 865');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 178, 180, 'earthquake drill', '8550 Garrison Street', 380, 'Suite 29');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 179, 120, 'evacuation drill', '58 Burrows Road', 55, 'PO Box 70771');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 180, 1, 'active shooter drill', '4 Hovde Court', 16, 'Room 1783');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-09-2023', 'dd-mm-yyyy'), 181, 120, 'evacuation drill', '5493 Sullivan Plaza', 229, 'Suite 49');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 182, 180, 'fire drill', '20 Anniversary Circle', 192, 'Suite 9');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 183, 180, 'earthquake drill', '55246 Dahle Park', 461, 'Suite 79');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-08-2023', 'dd-mm-yyyy'), 184, 120, 'earthquake drill', '5156 Buena Vista Court', 235, '1st Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-07-2023', 'dd-mm-yyyy'), 185, 30, 'evacuation drill', '59 Nelson Junction', 289, 'Apt 1741');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-07-2023', 'dd-mm-yyyy'), 186, 30, 'tornado drill', '202 Dunning Road', 268, '7th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 187, 45, 'fire drill', '37 Nelson Lane', 290, 'Room 1877');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-01-2024', 'dd-mm-yyyy'), 188, 180, 'fire drill', '1932 Doe Crossing Junction', 152, '9th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 189, 1, 'active shooter drill', '2 Prentice Alley', 210, 'Suite 42');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-06-2023', 'dd-mm-yyyy'), 190, 180, 'evacuation drill', '4 Troy Parkway', 296, 'Apt 370');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-05-2024', 'dd-mm-yyyy'), 191, 45, 'tornado drill', '8697 Dorton Terrace', 194, 'Room 224');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 192, 180, 'evacuation drill', '354 Merchant Trail', 483, 'Apt 884');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 193, 1, 'earthquake drill', '301 Londonderry Lane', 426, '14th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-01-2024', 'dd-mm-yyyy'), 194, 45, 'fire drill', '15350 Vernon Alley', 384, '14th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-07-2023', 'dd-mm-yyyy'), 195, 45, 'earthquake drill', '81710 Mayer Terrace', 344, 'PO Box 57469');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-03-2024', 'dd-mm-yyyy'), 196, 180, 'tornado drill', '467 Knutson Alley', 332, 'Apt 1934');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 197, 45, 'active shooter drill', '09 Fair Oaks Crossing', 419, 'Suite 55');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 198, 1, 'active shooter drill', '7 Sage Terrace', 83, 'Suite 100');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-09-2023', 'dd-mm-yyyy'), 199, 30, 'earthquake drill', '4008 Gerald Parkway', 233, '15th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-04-2024', 'dd-mm-yyyy'), 200, 45, 'active shooter drill', '53379 Knutson Junction', 492, 'Suite 54');
commit;
prompt 200 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-02-2024', 'dd-mm-yyyy'), 201, 1, 'evacuation drill', '4536 Tomscot Trail', 181, 'Room 549');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 202, 45, 'earthquake drill', '1012 Goodland Road', 54, 'Suite 10');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-03-2024', 'dd-mm-yyyy'), 203, 30, 'active shooter drill', '8 Mesta Pass', 269, '15th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 204, 45, 'fire drill', '6 Dwight Junction', 230, 'PO Box 94333');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-11-2023', 'dd-mm-yyyy'), 205, 120, 'active shooter drill', '5424 Trailsway Crossing', 386, '9th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 206, 180, 'fire drill', '390 Blue Bill Park Place', 270, 'Apt 981');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 207, 30, 'tornado drill', '66 Brentwood Drive', 193, 'Apt 1097');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-05-2024', 'dd-mm-yyyy'), 208, 120, 'tornado drill', '02 Thompson Terrace', 126, 'PO Box 82261');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 209, 1, 'tornado drill', '31949 Glacier Hill Drive', 295, 'Apt 528');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 210, 30, 'fire drill', '425 Arizona Junction', 48, 'PO Box 42907');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 211, 180, 'active shooter drill', '39119 Lillian Terrace', 66, 'Room 1548');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-08-2023', 'dd-mm-yyyy'), 212, 120, 'tornado drill', '4935 Westport Trail', 183, '3rd Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-10-2023', 'dd-mm-yyyy'), 213, 120, 'active shooter drill', '19461 Melvin Parkway', 111, '14th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-04-2024', 'dd-mm-yyyy'), 214, 120, 'earthquake drill', '83775 Scoville Street', 64, '1st Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-05-2024', 'dd-mm-yyyy'), 215, 45, 'evacuation drill', '75549 4th Parkway', 291, 'PO Box 23204');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-10-2023', 'dd-mm-yyyy'), 216, 180, 'earthquake drill', '67926 Shasta Lane', 424, 'Room 1716');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-02-2024', 'dd-mm-yyyy'), 217, 1, 'earthquake drill', '66 Mifflin Avenue', 499, '19th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-12-2023', 'dd-mm-yyyy'), 218, 1, 'evacuation drill', '6128 Buena Vista Hill', 483, 'PO Box 32092');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 219, 180, 'tornado drill', '8212 Sherman Point', 326, 'Apt 1475');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 220, 45, 'fire drill', '0616 Fordem Point', 121, 'PO Box 22377');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 221, 180, 'active shooter drill', '8 Crownhardt Junction', 24, 'Room 1819');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 222, 45, 'earthquake drill', '3 Merchant Lane', 116, '14th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 223, 45, 'earthquake drill', '23993 Loomis Park', 21, 'Suite 27');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-07-2023', 'dd-mm-yyyy'), 224, 45, 'evacuation drill', '63 Caliangt Terrace', 137, 'PO Box 20283');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-12-2023', 'dd-mm-yyyy'), 225, 45, 'fire drill', '813 Porter Circle', 317, '19th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-08-2023', 'dd-mm-yyyy'), 226, 180, 'tornado drill', '40552 Namekagon Circle', 284, 'Apt 365');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 227, 120, 'evacuation drill', '92 Crownhardt Road', 131, 'Suite 49');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-04-2024', 'dd-mm-yyyy'), 228, 120, 'tornado drill', '0 Bultman Hill', 393, '20th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 229, 1, 'evacuation drill', '96687 Menomonie Crossing', 328, '1st Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-03-2024', 'dd-mm-yyyy'), 230, 120, 'active shooter drill', '57665 Fordem Parkway', 370, '2nd Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-08-2023', 'dd-mm-yyyy'), 231, 45, 'active shooter drill', '926 Moose Point', 256, '16th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-07-2023', 'dd-mm-yyyy'), 232, 180, 'active shooter drill', '45 Prairieview Parkway', 8, 'Apt 1462');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-03-2024', 'dd-mm-yyyy'), 233, 45, 'earthquake drill', '430 Kenwood Pass', 428, 'Suite 68');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-04-2024', 'dd-mm-yyyy'), 234, 120, 'fire drill', '4415 Lakewood Gardens Plaza', 301, 'PO Box 40409');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 235, 120, 'earthquake drill', '8555 Jenna Street', 285, 'Suite 27');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-04-2024', 'dd-mm-yyyy'), 236, 45, 'earthquake drill', '46700 Carey Road', 258, 'Suite 57');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 237, 45, 'earthquake drill', '78669 Hazelcrest Crossing', 311, 'Apt 1684');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 238, 30, 'evacuation drill', '94 Anthes Crossing', 489, 'Room 1460');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 239, 120, 'earthquake drill', '868 2nd Trail', 365, '15th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 240, 45, 'active shooter drill', '8509 Melby Point', 134, 'Room 1194');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-11-2023', 'dd-mm-yyyy'), 241, 30, 'tornado drill', '6000 Valley Edge Way', 362, '2nd Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 242, 180, 'evacuation drill', '05 John Wall Parkway', 61, 'PO Box 86676');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-08-2023', 'dd-mm-yyyy'), 243, 180, 'tornado drill', '50911 Debra Place', 295, '11th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-05-2024', 'dd-mm-yyyy'), 244, 180, 'tornado drill', '557 Namekagon Circle', 318, '8th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 245, 45, 'tornado drill', '010 Carpenter Point', 83, '11th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-03-2024', 'dd-mm-yyyy'), 246, 120, 'tornado drill', '6 Reinke Drive', 321, 'Suite 10');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-09-2023', 'dd-mm-yyyy'), 247, 45, 'tornado drill', '84086 Meadow Ridge Parkway', 151, 'Room 1870');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-02-2024', 'dd-mm-yyyy'), 248, 30, 'evacuation drill', '5326 Hayes Street', 38, 'Room 1197');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 249, 120, 'active shooter drill', '540 Oneill Center', 500, 'PO Box 90673');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 250, 120, 'fire drill', '61326 4th Lane', 454, 'Suite 25');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 251, 30, 'earthquake drill', '9 Truax Road', 264, 'Apt 452');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 252, 180, 'earthquake drill', '7 Troy Street', 107, 'PO Box 93841');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-05-2024', 'dd-mm-yyyy'), 253, 1, 'fire drill', '4 Morning Avenue', 98, 'Suite 58');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-07-2023', 'dd-mm-yyyy'), 254, 30, 'active shooter drill', '85 Sunbrook Park', 329, 'PO Box 39300');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-05-2024', 'dd-mm-yyyy'), 255, 1, 'evacuation drill', '5 Bellgrove Junction', 52, '3rd Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 256, 120, 'earthquake drill', '0 Randy Avenue', 324, '13th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-07-2023', 'dd-mm-yyyy'), 257, 180, 'active shooter drill', '44321 Susan Drive', 179, 'PO Box 84436');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 258, 45, 'evacuation drill', '12 Lillian Road', 27, 'Room 977');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 259, 1, 'evacuation drill', '8771 Karstens Pass', 490, 'Suite 71');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-10-2023', 'dd-mm-yyyy'), 260, 30, 'fire drill', '99762 Eliot Point', 392, 'Suite 33');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-10-2023', 'dd-mm-yyyy'), 261, 1, 'earthquake drill', '19969 Aberg Way', 480, 'Suite 26');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-01-2024', 'dd-mm-yyyy'), 262, 120, 'tornado drill', '87 Nancy Circle', 229, 'Room 1650');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-09-2023', 'dd-mm-yyyy'), 263, 30, 'tornado drill', '891 Blackbird Street', 473, 'Room 1435');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 264, 1, 'active shooter drill', '48 Lillian Alley', 147, 'PO Box 3418');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-03-2024', 'dd-mm-yyyy'), 265, 120, 'earthquake drill', '87 Nelson Court', 300, 'Apt 1853');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-09-2023', 'dd-mm-yyyy'), 266, 180, 'tornado drill', '43 Havey Pass', 397, 'Suite 77');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-05-2024', 'dd-mm-yyyy'), 267, 180, 'earthquake drill', '64 Shelley Place', 292, 'Apt 1728');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 268, 1, 'earthquake drill', '4 Forster Alley', 118, 'Room 557');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-10-2023', 'dd-mm-yyyy'), 269, 120, 'active shooter drill', '942 Quincy Pass', 441, 'Suite 83');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-04-2024', 'dd-mm-yyyy'), 270, 1, 'fire drill', '0452 Schlimgen Park', 431, '15th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 271, 120, 'active shooter drill', '40483 Barby Avenue', 235, 'PO Box 71525');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-09-2023', 'dd-mm-yyyy'), 272, 30, 'fire drill', '6973 Hooker Trail', 203, '5th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 273, 30, 'tornado drill', '50 Gateway Park', 7, 'PO Box 89256');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-05-2024', 'dd-mm-yyyy'), 274, 30, 'tornado drill', '49703 Welch Avenue', 302, 'Apt 879');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-03-2024', 'dd-mm-yyyy'), 275, 120, 'evacuation drill', '94 Granby Alley', 255, 'Room 237');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-01-2024', 'dd-mm-yyyy'), 276, 1, 'tornado drill', '07136 Hanover Point', 221, '13th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-10-2023', 'dd-mm-yyyy'), 277, 120, 'fire drill', '69 Waxwing Center', 410, 'Suite 98');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-08-2023', 'dd-mm-yyyy'), 278, 180, 'tornado drill', '56670 Bonner Circle', 401, 'Suite 20');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-05-2024', 'dd-mm-yyyy'), 279, 1, 'fire drill', '52 Novick Road', 3, 'PO Box 2689');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-03-2024', 'dd-mm-yyyy'), 280, 1, 'fire drill', '56247 Atwood Terrace', 457, 'Suite 65');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 281, 1, 'earthquake drill', '39 Dayton Point', 266, '9th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-09-2023', 'dd-mm-yyyy'), 282, 30, 'active shooter drill', '45 Portage Court', 295, 'Suite 28');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 283, 180, 'active shooter drill', '75199 Lakeland Plaza', 320, 'Room 1452');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 284, 120, 'evacuation drill', '633 Kinsman Road', 429, 'PO Box 29587');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 285, 1, 'tornado drill', '9 Jenifer Terrace', 262, 'Suite 24');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-01-2024', 'dd-mm-yyyy'), 286, 30, 'evacuation drill', '7667 Maple Junction', 154, '6th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 287, 1, 'evacuation drill', '56253 Warbler Avenue', 79, 'Apt 1065');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-11-2023', 'dd-mm-yyyy'), 288, 30, 'active shooter drill', '61 Garrison Terrace', 193, 'Room 1332');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-11-2023', 'dd-mm-yyyy'), 289, 45, 'active shooter drill', '6038 Anzinger Road', 397, 'Suite 80');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 290, 30, 'earthquake drill', '31702 New Castle Terrace', 77, '9th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 291, 45, 'active shooter drill', '26289 Stang Alley', 173, 'PO Box 49963');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 292, 1, 'earthquake drill', '009 Memorial Pass', 189, 'Room 1563');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-11-2023', 'dd-mm-yyyy'), 293, 45, 'evacuation drill', '5 Luster Street', 119, 'PO Box 21558');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-05-2024', 'dd-mm-yyyy'), 294, 180, 'evacuation drill', '2964 Golden Leaf Court', 56, 'Suite 56');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 295, 180, 'active shooter drill', '9664 Gerald Parkway', 167, 'Room 753');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-06-2023', 'dd-mm-yyyy'), 296, 120, 'earthquake drill', '105 Mifflin Place', 457, 'Room 901');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-03-2024', 'dd-mm-yyyy'), 297, 1, 'evacuation drill', '5 Lakewood Gardens Way', 67, 'Apt 90');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 298, 1, 'active shooter drill', '92 Grayhawk Way', 483, 'Apt 887');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 299, 45, 'earthquake drill', '5 Sutherland Place', 96, '4th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 300, 30, 'tornado drill', '9665 Harper Plaza', 296, 'Apt 1886');
commit;
prompt 300 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 301, 30, 'tornado drill', '8 Holmberg Street', 373, 'Suite 47');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 302, 120, 'tornado drill', '73 Sachs Way', 445, 'Suite 75');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-08-2023', 'dd-mm-yyyy'), 303, 30, 'tornado drill', '87435 Northview Street', 282, 'PO Box 36473');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-02-2024', 'dd-mm-yyyy'), 304, 1, 'active shooter drill', '06 Golf View Alley', 261, 'Room 551');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-06-2023', 'dd-mm-yyyy'), 305, 1, 'evacuation drill', '65670 Knutson Avenue', 252, 'Apt 1518');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-07-2023', 'dd-mm-yyyy'), 306, 180, 'fire drill', '407 Calypso Trail', 431, 'Room 391');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 307, 30, 'earthquake drill', '84 Sundown Junction', 52, 'Apt 527');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 308, 180, 'tornado drill', '93 Shasta Drive', 345, 'Apt 322');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-12-2023', 'dd-mm-yyyy'), 309, 45, 'fire drill', '9 Sunfield Drive', 488, 'Suite 34');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-03-2024', 'dd-mm-yyyy'), 310, 45, 'fire drill', '6212 Summerview Hill', 67, 'Suite 14');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-04-2024', 'dd-mm-yyyy'), 311, 1, 'evacuation drill', '52 Hagan Terrace', 465, 'Suite 20');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-02-2024', 'dd-mm-yyyy'), 312, 1, 'active shooter drill', '5749 Village Place', 85, 'Room 581');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-11-2023', 'dd-mm-yyyy'), 313, 30, 'tornado drill', '7449 Waubesa Court', 73, 'Room 558');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-08-2023', 'dd-mm-yyyy'), 314, 180, 'earthquake drill', '3497 Twin Pines Center', 230, 'Suite 79');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-08-2023', 'dd-mm-yyyy'), 315, 1, 'fire drill', '07 Algoma Avenue', 106, 'Suite 21');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-12-2023', 'dd-mm-yyyy'), 316, 120, 'fire drill', '2969 Pankratz Court', 168, '4th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-05-2024', 'dd-mm-yyyy'), 317, 30, 'evacuation drill', '60 Montana Trail', 419, 'PO Box 22899');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-02-2024', 'dd-mm-yyyy'), 318, 1, 'fire drill', '94232 Sutherland Street', 426, 'Suite 6');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 319, 45, 'fire drill', '99 Sutherland Center', 438, 'Suite 3');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 320, 30, 'evacuation drill', '57 Farwell Way', 58, '8th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-10-2023', 'dd-mm-yyyy'), 321, 120, 'active shooter drill', '853 Warner Plaza', 147, 'Apt 362');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-12-2023', 'dd-mm-yyyy'), 322, 30, 'tornado drill', '7 Pleasure Way', 156, 'Suite 6');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-08-2023', 'dd-mm-yyyy'), 323, 120, 'fire drill', '9756 Trailsway Way', 433, '17th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-01-2024', 'dd-mm-yyyy'), 324, 120, 'evacuation drill', '587 Donald Point', 169, 'Apt 1920');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-10-2023', 'dd-mm-yyyy'), 325, 30, 'active shooter drill', '91095 Eastwood Alley', 459, 'Suite 80');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 326, 30, 'fire drill', '791 Esker Trail', 237, '12th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 327, 30, 'evacuation drill', '127 Pine View Lane', 283, 'Room 1313');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 328, 120, 'tornado drill', '9 Moulton Road', 355, 'Suite 3');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-08-2023', 'dd-mm-yyyy'), 329, 45, 'earthquake drill', '67205 Forest Dale Terrace', 393, 'Suite 28');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 330, 120, 'tornado drill', '14430 Butterfield Pass', 196, '19th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 331, 1, 'active shooter drill', '92 Stoughton Place', 37, 'Apt 1134');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 332, 45, 'tornado drill', '45 Hazelcrest Road', 309, '7th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 333, 180, 'active shooter drill', '6302 Towne Alley', 81, 'Suite 66');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 334, 180, 'fire drill', '890 Heffernan Parkway', 339, '20th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-05-2023', 'dd-mm-yyyy'), 335, 45, 'active shooter drill', '8 Morrow Park', 344, 'Room 559');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-07-2023', 'dd-mm-yyyy'), 336, 1, 'active shooter drill', '0 Northport Drive', 279, 'Room 1746');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 337, 120, 'tornado drill', '7 Twin Pines Terrace', 16, 'Room 624');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-03-2024', 'dd-mm-yyyy'), 338, 45, 'earthquake drill', '2671 Westridge Park', 295, 'Room 1937');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-11-2023', 'dd-mm-yyyy'), 339, 180, 'evacuation drill', '2 Old Shore Road', 277, 'Room 930');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-08-2023', 'dd-mm-yyyy'), 340, 180, 'fire drill', '88919 Grover Street', 5, 'PO Box 85197');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-02-2024', 'dd-mm-yyyy'), 341, 180, 'earthquake drill', '4 Rusk Pass', 227, 'Apt 311');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 342, 120, 'evacuation drill', '1386 Jay Park', 327, 'Suite 10');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-07-2023', 'dd-mm-yyyy'), 343, 180, 'earthquake drill', '582 Aberg Place', 75, 'Suite 41');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-11-2023', 'dd-mm-yyyy'), 344, 1, 'earthquake drill', '3625 Monica Hill', 220, 'Room 1701');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 345, 120, 'fire drill', '5290 Park Meadow Drive', 305, 'Apt 377');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-07-2023', 'dd-mm-yyyy'), 346, 120, 'earthquake drill', '4 Scott Junction', 12, 'Apt 225');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-08-2023', 'dd-mm-yyyy'), 347, 1, 'earthquake drill', '786 Pepper Wood Point', 334, 'Suite 13');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 348, 120, 'tornado drill', '5 Wayridge Junction', 73, 'Room 1974');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 349, 180, 'evacuation drill', '61 Westridge Road', 323, 'PO Box 58970');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-07-2023', 'dd-mm-yyyy'), 350, 180, 'fire drill', '925 Warrior Parkway', 122, 'Suite 37');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 351, 45, 'active shooter drill', '1 Vera Point', 221, 'Room 631');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 352, 1, 'tornado drill', '705 Veith Plaza', 442, 'Suite 48');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-03-2024', 'dd-mm-yyyy'), 353, 30, 'fire drill', '7 Messerschmidt Terrace', 461, 'Apt 714');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-11-2023', 'dd-mm-yyyy'), 354, 180, 'fire drill', '6 Eagan Road', 323, 'Apt 359');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 355, 180, 'active shooter drill', '114 Ridgeway Junction', 85, 'Room 860');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 356, 45, 'tornado drill', '8 Mayfield Trail', 111, 'Room 302');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 357, 45, 'active shooter drill', '8465 Sachs Street', 183, 'Apt 1098');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-11-2023', 'dd-mm-yyyy'), 358, 30, 'active shooter drill', '10 Texas Alley', 104, 'Room 1557');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 359, 45, 'tornado drill', '22 Village Green Drive', 251, 'PO Box 55002');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-04-2024', 'dd-mm-yyyy'), 360, 180, 'active shooter drill', '67716 Bluestem Crossing', 132, 'Room 1367');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-04-2024', 'dd-mm-yyyy'), 361, 120, 'evacuation drill', '1 Donald Hill', 140, 'Apt 1293');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-10-2023', 'dd-mm-yyyy'), 362, 180, 'tornado drill', '51007 Valley Edge Trail', 144, 'Room 179');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-05-2024', 'dd-mm-yyyy'), 363, 1, 'active shooter drill', '0 Del Mar Drive', 464, 'Apt 1846');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 364, 45, 'evacuation drill', '78 Nova Street', 31, 'Suite 10');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-01-2024', 'dd-mm-yyyy'), 365, 120, 'earthquake drill', '29652 Coolidge Terrace', 180, 'PO Box 93482');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-10-2023', 'dd-mm-yyyy'), 366, 180, 'tornado drill', '840 Barby Point', 443, 'Suite 53');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-10-2023', 'dd-mm-yyyy'), 367, 180, 'active shooter drill', '798 Manitowish Terrace', 13, 'Suite 94');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 368, 45, 'fire drill', '17 Kinsman Road', 325, 'Suite 36');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-12-2023', 'dd-mm-yyyy'), 369, 30, 'earthquake drill', '77424 Stephen Hill', 398, 'Room 983');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-02-2024', 'dd-mm-yyyy'), 370, 120, 'earthquake drill', '12 Parkside Terrace', 18, 'Apt 1050');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 371, 30, 'tornado drill', '759 Bluestem Point', 443, 'Room 126');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-05-2024', 'dd-mm-yyyy'), 372, 1, 'fire drill', '19130 Surrey Drive', 92, 'Room 584');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-04-2024', 'dd-mm-yyyy'), 373, 1, 'active shooter drill', '8 Eliot Way', 385, 'Room 1180');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-10-2023', 'dd-mm-yyyy'), 374, 1, 'fire drill', '001 Cherokee Point', 438, 'PO Box 67759');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-01-2024', 'dd-mm-yyyy'), 375, 180, 'evacuation drill', '7 Nobel Crossing', 163, 'Apt 1998');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-09-2023', 'dd-mm-yyyy'), 376, 30, 'earthquake drill', '09304 Eggendart Parkway', 427, 'Apt 1366');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 377, 45, 'active shooter drill', '40930 Old Shore Parkway', 447, 'Apt 51');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-04-2024', 'dd-mm-yyyy'), 378, 120, 'tornado drill', '370 Loomis Drive', 375, 'Suite 52');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-09-2023', 'dd-mm-yyyy'), 379, 1, 'tornado drill', '27 Roth Point', 350, 'Room 165');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-07-2023', 'dd-mm-yyyy'), 380, 180, 'fire drill', '6 Marcy Parkway', 172, 'Suite 68');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-02-2024', 'dd-mm-yyyy'), 381, 1, 'evacuation drill', '958 Sugar Pass', 498, 'Suite 30');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 382, 180, 'active shooter drill', '534 Myrtle Point', 424, 'Room 237');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-11-2023', 'dd-mm-yyyy'), 383, 45, 'earthquake drill', '513 Green Ridge Pass', 487, 'PO Box 64271');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-08-2023', 'dd-mm-yyyy'), 384, 1, 'evacuation drill', '94 Menomonie Street', 216, '6th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 385, 180, 'fire drill', '0242 Grim Plaza', 124, '12th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-06-2023', 'dd-mm-yyyy'), 386, 45, 'tornado drill', '1 Hayes Lane', 102, '11th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-04-2024', 'dd-mm-yyyy'), 387, 120, 'evacuation drill', '1 Novick Pass', 76, '20th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 388, 1, 'fire drill', '82 Hazelcrest Point', 158, '12th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-12-2023', 'dd-mm-yyyy'), 389, 1, 'earthquake drill', '45 Longview Junction', 208, 'Apt 924');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-07-2023', 'dd-mm-yyyy'), 390, 120, 'tornado drill', '684 Ruskin Street', 214, 'PO Box 92873');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-07-2023', 'dd-mm-yyyy'), 391, 1, 'evacuation drill', '79902 West Center', 6, 'Apt 1715');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 392, 45, 'earthquake drill', '4311 Erie Lane', 212, 'Apt 1985');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 393, 45, 'tornado drill', '03394 Westend Drive', 310, 'Suite 74');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-02-2024', 'dd-mm-yyyy'), 394, 1, 'evacuation drill', '9051 Waubesa Way', 136, 'Apt 329');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 395, 180, 'earthquake drill', '82 Dixon Hill', 68, 'Room 1746');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-06-2023', 'dd-mm-yyyy'), 396, 180, 'active shooter drill', '701 Rowland Street', 100, 'PO Box 81315');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 397, 120, 'tornado drill', '13609 Redwing Avenue', 68, '2nd Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-11-2023', 'dd-mm-yyyy'), 398, 30, 'earthquake drill', '888 Golf View Center', 361, '6th Floor');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 399, 120, 'tornado drill', '95953 Stoughton Circle', 280, 'Room 1206');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-09-2023', 'dd-mm-yyyy'), 400, 180, 'earthquake drill', '74 Rigney Parkway', 41, 'Apt 678');
commit;
prompt 400 records loaded
prompt Loading EVDEBRIEFING...
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
values (979, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (980, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (981, ' Nadav Shalem', 0, ' Well Done');
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
values (889, ' Nadav Shalem', 0, ' Improvement required');
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
values (895, ' Nadav Shalem', 0, ' Well Done');
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
values (924, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (925, ' Nitai Gal', 0, ' Well Done');
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
values (931, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (932, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (933, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (934, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (935, ' Nitai Gal', 0, ' Medium operation');
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
commit;
prompt 100 records committed...
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
values (956, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (957, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (958, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (959, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (960, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (961, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (590, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (591, ' Nitai Gal', 0, ' Improvement required');
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
values (607, ' Nitai Gal', 0, ' Well Done');
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
values (617, ' Nitai Gal', 0, ' Well Done');
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
values (625, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (626, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (627, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (628, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (629, ' Nitai Gal', 0, ' Well Done');
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
values (647, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (648, ' Nitai Gal', 0, ' Well Done');
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
values (669, ' Nitai Gal', 0, ' Well Done');
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
commit;
prompt 200 records committed...
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
values (686, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (687, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (688, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (689, ' Nitai Gal', 0, ' Medium operation');
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
values (805, ' Nadav Shalem', 0, ' Well Done');
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
values (690, ' Nitai Gal', 1, ' Medium operation');
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
values (699, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (700, ' Nitai Gal', 0, ' Failure');
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
values (707, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (708, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (709, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (710, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (711, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (712, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (713, ' Nitai Gal', 0, ' Well Done');
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
values (750, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (751, ' Nadav Shalem', 1, ' Well Done');
commit;
prompt 300 records committed...
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
values (776, ' Nadav Shalem', 0, ' Failure');
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
values (831, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (832, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (833, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (834, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (835, ' Nitai Gal', 0, ' Failure');
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
values (850, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (851, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (852, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (853, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (854, ' Nadav Shalem', 0, ' Medium operation');
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
values (866, ' Nadav Shalem', 0, ' Well Done');
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
commit;
prompt 400 records loaded
prompt Loading PRACTICING...
insert into PRACTICING (emdrid, teid)
values (4, 311);
insert into PRACTICING (emdrid, teid)
values (5, 46);
insert into PRACTICING (emdrid, teid)
values (7, 93);
insert into PRACTICING (emdrid, teid)
values (9, 56);
insert into PRACTICING (emdrid, teid)
values (9, 234);
insert into PRACTICING (emdrid, teid)
values (9, 237);
insert into PRACTICING (emdrid, teid)
values (10, 37);
insert into PRACTICING (emdrid, teid)
values (10, 144);
insert into PRACTICING (emdrid, teid)
values (10, 217);
insert into PRACTICING (emdrid, teid)
values (11, 350);
insert into PRACTICING (emdrid, teid)
values (13, 134);
insert into PRACTICING (emdrid, teid)
values (16, 145);
insert into PRACTICING (emdrid, teid)
values (17, 86);
insert into PRACTICING (emdrid, teid)
values (20, 203);
insert into PRACTICING (emdrid, teid)
values (21, 378);
insert into PRACTICING (emdrid, teid)
values (23, 237);
insert into PRACTICING (emdrid, teid)
values (25, 66);
insert into PRACTICING (emdrid, teid)
values (26, 208);
insert into PRACTICING (emdrid, teid)
values (26, 261);
insert into PRACTICING (emdrid, teid)
values (27, 352);
insert into PRACTICING (emdrid, teid)
values (28, 75);
insert into PRACTICING (emdrid, teid)
values (30, 23);
insert into PRACTICING (emdrid, teid)
values (30, 100);
insert into PRACTICING (emdrid, teid)
values (31, 2);
insert into PRACTICING (emdrid, teid)
values (33, 237);
insert into PRACTICING (emdrid, teid)
values (34, 227);
insert into PRACTICING (emdrid, teid)
values (36, 12);
insert into PRACTICING (emdrid, teid)
values (37, 217);
insert into PRACTICING (emdrid, teid)
values (37, 314);
insert into PRACTICING (emdrid, teid)
values (39, 182);
insert into PRACTICING (emdrid, teid)
values (40, 182);
insert into PRACTICING (emdrid, teid)
values (40, 203);
insert into PRACTICING (emdrid, teid)
values (42, 10);
insert into PRACTICING (emdrid, teid)
values (42, 19);
insert into PRACTICING (emdrid, teid)
values (46, 374);
insert into PRACTICING (emdrid, teid)
values (47, 266);
insert into PRACTICING (emdrid, teid)
values (50, 94);
insert into PRACTICING (emdrid, teid)
values (51, 165);
insert into PRACTICING (emdrid, teid)
values (57, 59);
insert into PRACTICING (emdrid, teid)
values (65, 288);
insert into PRACTICING (emdrid, teid)
values (66, 375);
insert into PRACTICING (emdrid, teid)
values (68, 299);
insert into PRACTICING (emdrid, teid)
values (68, 329);
insert into PRACTICING (emdrid, teid)
values (69, 161);
insert into PRACTICING (emdrid, teid)
values (73, 332);
insert into PRACTICING (emdrid, teid)
values (75, 106);
insert into PRACTICING (emdrid, teid)
values (76, 266);
insert into PRACTICING (emdrid, teid)
values (77, 136);
insert into PRACTICING (emdrid, teid)
values (77, 243);
insert into PRACTICING (emdrid, teid)
values (80, 181);
insert into PRACTICING (emdrid, teid)
values (81, 43);
insert into PRACTICING (emdrid, teid)
values (82, 261);
insert into PRACTICING (emdrid, teid)
values (83, 105);
insert into PRACTICING (emdrid, teid)
values (85, 311);
insert into PRACTICING (emdrid, teid)
values (88, 255);
insert into PRACTICING (emdrid, teid)
values (92, 310);
insert into PRACTICING (emdrid, teid)
values (94, 49);
insert into PRACTICING (emdrid, teid)
values (96, 240);
insert into PRACTICING (emdrid, teid)
values (98, 208);
insert into PRACTICING (emdrid, teid)
values (100, 17);
insert into PRACTICING (emdrid, teid)
values (100, 253);
insert into PRACTICING (emdrid, teid)
values (103, 35);
insert into PRACTICING (emdrid, teid)
values (104, 143);
insert into PRACTICING (emdrid, teid)
values (105, 209);
insert into PRACTICING (emdrid, teid)
values (106, 391);
insert into PRACTICING (emdrid, teid)
values (107, 41);
insert into PRACTICING (emdrid, teid)
values (107, 321);
insert into PRACTICING (emdrid, teid)
values (109, 155);
insert into PRACTICING (emdrid, teid)
values (110, 197);
insert into PRACTICING (emdrid, teid)
values (112, 251);
insert into PRACTICING (emdrid, teid)
values (112, 267);
insert into PRACTICING (emdrid, teid)
values (112, 292);
insert into PRACTICING (emdrid, teid)
values (119, 27);
insert into PRACTICING (emdrid, teid)
values (119, 93);
insert into PRACTICING (emdrid, teid)
values (119, 173);
insert into PRACTICING (emdrid, teid)
values (124, 167);
insert into PRACTICING (emdrid, teid)
values (125, 184);
insert into PRACTICING (emdrid, teid)
values (125, 193);
insert into PRACTICING (emdrid, teid)
values (127, 108);
insert into PRACTICING (emdrid, teid)
values (127, 217);
insert into PRACTICING (emdrid, teid)
values (129, 193);
insert into PRACTICING (emdrid, teid)
values (135, 15);
insert into PRACTICING (emdrid, teid)
values (135, 152);
insert into PRACTICING (emdrid, teid)
values (136, 6);
insert into PRACTICING (emdrid, teid)
values (137, 298);
insert into PRACTICING (emdrid, teid)
values (139, 200);
insert into PRACTICING (emdrid, teid)
values (139, 399);
insert into PRACTICING (emdrid, teid)
values (140, 118);
insert into PRACTICING (emdrid, teid)
values (140, 260);
insert into PRACTICING (emdrid, teid)
values (141, 306);
insert into PRACTICING (emdrid, teid)
values (146, 183);
insert into PRACTICING (emdrid, teid)
values (150, 75);
insert into PRACTICING (emdrid, teid)
values (150, 170);
insert into PRACTICING (emdrid, teid)
values (150, 298);
insert into PRACTICING (emdrid, teid)
values (152, 374);
insert into PRACTICING (emdrid, teid)
values (154, 253);
insert into PRACTICING (emdrid, teid)
values (156, 365);
insert into PRACTICING (emdrid, teid)
values (157, 106);
insert into PRACTICING (emdrid, teid)
values (161, 105);
insert into PRACTICING (emdrid, teid)
values (164, 42);
commit;
prompt 100 records committed...
insert into PRACTICING (emdrid, teid)
values (165, 298);
insert into PRACTICING (emdrid, teid)
values (166, 77);
insert into PRACTICING (emdrid, teid)
values (166, 365);
insert into PRACTICING (emdrid, teid)
values (169, 302);
insert into PRACTICING (emdrid, teid)
values (171, 136);
insert into PRACTICING (emdrid, teid)
values (173, 387);
insert into PRACTICING (emdrid, teid)
values (174, 134);
insert into PRACTICING (emdrid, teid)
values (174, 243);
insert into PRACTICING (emdrid, teid)
values (175, 159);
insert into PRACTICING (emdrid, teid)
values (176, 314);
insert into PRACTICING (emdrid, teid)
values (177, 62);
insert into PRACTICING (emdrid, teid)
values (177, 161);
insert into PRACTICING (emdrid, teid)
values (179, 290);
insert into PRACTICING (emdrid, teid)
values (179, 359);
insert into PRACTICING (emdrid, teid)
values (181, 2);
insert into PRACTICING (emdrid, teid)
values (182, 77);
insert into PRACTICING (emdrid, teid)
values (182, 342);
insert into PRACTICING (emdrid, teid)
values (183, 6);
insert into PRACTICING (emdrid, teid)
values (184, 35);
insert into PRACTICING (emdrid, teid)
values (184, 310);
insert into PRACTICING (emdrid, teid)
values (185, 15);
insert into PRACTICING (emdrid, teid)
values (185, 243);
insert into PRACTICING (emdrid, teid)
values (185, 253);
insert into PRACTICING (emdrid, teid)
values (187, 111);
insert into PRACTICING (emdrid, teid)
values (191, 39);
insert into PRACTICING (emdrid, teid)
values (193, 364);
insert into PRACTICING (emdrid, teid)
values (195, 260);
insert into PRACTICING (emdrid, teid)
values (200, 208);
insert into PRACTICING (emdrid, teid)
values (202, 56);
insert into PRACTICING (emdrid, teid)
values (202, 87);
insert into PRACTICING (emdrid, teid)
values (203, 83);
insert into PRACTICING (emdrid, teid)
values (207, 243);
insert into PRACTICING (emdrid, teid)
values (209, 367);
insert into PRACTICING (emdrid, teid)
values (210, 29);
insert into PRACTICING (emdrid, teid)
values (211, 27);
insert into PRACTICING (emdrid, teid)
values (212, 72);
insert into PRACTICING (emdrid, teid)
values (212, 164);
insert into PRACTICING (emdrid, teid)
values (214, 184);
insert into PRACTICING (emdrid, teid)
values (214, 369);
insert into PRACTICING (emdrid, teid)
values (224, 392);
insert into PRACTICING (emdrid, teid)
values (225, 41);
insert into PRACTICING (emdrid, teid)
values (225, 171);
insert into PRACTICING (emdrid, teid)
values (227, 85);
insert into PRACTICING (emdrid, teid)
values (231, 143);
insert into PRACTICING (emdrid, teid)
values (232, 145);
insert into PRACTICING (emdrid, teid)
values (234, 142);
insert into PRACTICING (emdrid, teid)
values (234, 243);
insert into PRACTICING (emdrid, teid)
values (235, 137);
insert into PRACTICING (emdrid, teid)
values (235, 383);
insert into PRACTICING (emdrid, teid)
values (236, 181);
insert into PRACTICING (emdrid, teid)
values (238, 250);
insert into PRACTICING (emdrid, teid)
values (242, 215);
insert into PRACTICING (emdrid, teid)
values (247, 135);
insert into PRACTICING (emdrid, teid)
values (247, 383);
insert into PRACTICING (emdrid, teid)
values (248, 236);
insert into PRACTICING (emdrid, teid)
values (248, 254);
insert into PRACTICING (emdrid, teid)
values (249, 215);
insert into PRACTICING (emdrid, teid)
values (249, 312);
insert into PRACTICING (emdrid, teid)
values (250, 112);
insert into PRACTICING (emdrid, teid)
values (251, 136);
insert into PRACTICING (emdrid, teid)
values (253, 30);
insert into PRACTICING (emdrid, teid)
values (253, 345);
insert into PRACTICING (emdrid, teid)
values (255, 135);
insert into PRACTICING (emdrid, teid)
values (255, 266);
insert into PRACTICING (emdrid, teid)
values (256, 266);
insert into PRACTICING (emdrid, teid)
values (258, 338);
insert into PRACTICING (emdrid, teid)
values (259, 330);
insert into PRACTICING (emdrid, teid)
values (261, 355);
insert into PRACTICING (emdrid, teid)
values (263, 49);
insert into PRACTICING (emdrid, teid)
values (267, 163);
insert into PRACTICING (emdrid, teid)
values (270, 185);
insert into PRACTICING (emdrid, teid)
values (270, 196);
insert into PRACTICING (emdrid, teid)
values (270, 260);
insert into PRACTICING (emdrid, teid)
values (272, 135);
insert into PRACTICING (emdrid, teid)
values (272, 204);
insert into PRACTICING (emdrid, teid)
values (275, 49);
insert into PRACTICING (emdrid, teid)
values (277, 85);
insert into PRACTICING (emdrid, teid)
values (277, 321);
insert into PRACTICING (emdrid, teid)
values (280, 196);
insert into PRACTICING (emdrid, teid)
values (281, 388);
insert into PRACTICING (emdrid, teid)
values (286, 106);
insert into PRACTICING (emdrid, teid)
values (286, 216);
insert into PRACTICING (emdrid, teid)
values (286, 361);
insert into PRACTICING (emdrid, teid)
values (290, 117);
insert into PRACTICING (emdrid, teid)
values (291, 292);
insert into PRACTICING (emdrid, teid)
values (292, 286);
insert into PRACTICING (emdrid, teid)
values (293, 267);
insert into PRACTICING (emdrid, teid)
values (301, 12);
insert into PRACTICING (emdrid, teid)
values (307, 253);
insert into PRACTICING (emdrid, teid)
values (312, 33);
insert into PRACTICING (emdrid, teid)
values (312, 39);
insert into PRACTICING (emdrid, teid)
values (312, 134);
insert into PRACTICING (emdrid, teid)
values (319, 67);
insert into PRACTICING (emdrid, teid)
values (321, 264);
insert into PRACTICING (emdrid, teid)
values (321, 363);
insert into PRACTICING (emdrid, teid)
values (322, 310);
insert into PRACTICING (emdrid, teid)
values (322, 391);
insert into PRACTICING (emdrid, teid)
values (324, 230);
insert into PRACTICING (emdrid, teid)
values (331, 87);
insert into PRACTICING (emdrid, teid)
values (332, 171);
commit;
prompt 200 records committed...
insert into PRACTICING (emdrid, teid)
values (334, 280);
insert into PRACTICING (emdrid, teid)
values (334, 394);
insert into PRACTICING (emdrid, teid)
values (338, 55);
insert into PRACTICING (emdrid, teid)
values (338, 202);
insert into PRACTICING (emdrid, teid)
values (339, 271);
insert into PRACTICING (emdrid, teid)
values (345, 27);
insert into PRACTICING (emdrid, teid)
values (349, 94);
insert into PRACTICING (emdrid, teid)
values (350, 345);
insert into PRACTICING (emdrid, teid)
values (353, 290);
insert into PRACTICING (emdrid, teid)
values (354, 6);
insert into PRACTICING (emdrid, teid)
values (354, 288);
insert into PRACTICING (emdrid, teid)
values (356, 311);
insert into PRACTICING (emdrid, teid)
values (357, 103);
insert into PRACTICING (emdrid, teid)
values (358, 19);
insert into PRACTICING (emdrid, teid)
values (358, 30);
insert into PRACTICING (emdrid, teid)
values (364, 65);
insert into PRACTICING (emdrid, teid)
values (367, 154);
insert into PRACTICING (emdrid, teid)
values (373, 136);
insert into PRACTICING (emdrid, teid)
values (374, 246);
insert into PRACTICING (emdrid, teid)
values (374, 260);
insert into PRACTICING (emdrid, teid)
values (375, 99);
insert into PRACTICING (emdrid, teid)
values (375, 225);
insert into PRACTICING (emdrid, teid)
values (381, 325);
insert into PRACTICING (emdrid, teid)
values (381, 374);
insert into PRACTICING (emdrid, teid)
values (382, 318);
insert into PRACTICING (emdrid, teid)
values (383, 61);
insert into PRACTICING (emdrid, teid)
values (383, 399);
insert into PRACTICING (emdrid, teid)
values (384, 278);
insert into PRACTICING (emdrid, teid)
values (385, 148);
insert into PRACTICING (emdrid, teid)
values (391, 148);
insert into PRACTICING (emdrid, teid)
values (392, 220);
insert into PRACTICING (emdrid, teid)
values (395, 246);
insert into PRACTICING (emdrid, teid)
values (396, 135);
insert into PRACTICING (emdrid, teid)
values (397, 2);
insert into PRACTICING (emdrid, teid)
values (399, 258);
commit;
prompt 235 records loaded
prompt Loading REOPRT...
prompt Table is empty
prompt Loading WORKER...
insert into WORKER (wosalary, teid)
values (3000, 1);
insert into WORKER (wosalary, teid)
values (10118, 2);
insert into WORKER (wosalary, teid)
values (14977, 237);
insert into WORKER (wosalary, teid)
values (23061, 298);
insert into WORKER (wosalary, teid)
values (11655, 19);
insert into WORKER (wosalary, teid)
values (17696, 10);
insert into WORKER (wosalary, teid)
values (8313, 143);
insert into WORKER (wosalary, teid)
values (19489, 12);
insert into WORKER (wosalary, teid)
values (4928, 266);
insert into WORKER (wosalary, teid)
values (21971, 173);
insert into WORKER (wosalary, teid)
values (22770, 30);
insert into WORKER (wosalary, teid)
values (6671, 62);
insert into WORKER (wosalary, teid)
values (15812, 375);
insert into WORKER (wosalary, teid)
values (2831, 23);
insert into WORKER (wosalary, teid)
values (10075, 56);
insert into WORKER (wosalary, teid)
values (24673, 290);
insert into WORKER (wosalary, teid)
values (2720, 86);
insert into WORKER (wosalary, teid)
values (23489, 332);
insert into WORKER (wosalary, teid)
values (13933, 100);
insert into WORKER (wosalary, teid)
values (17714, 136);
insert into WORKER (wosalary, teid)
values (10445, 350);
insert into WORKER (wosalary, teid)
values (24155, 67);
insert into WORKER (wosalary, teid)
values (11808, 184);
insert into WORKER (wosalary, teid)
values (16332, 209);
insert into WORKER (wosalary, teid)
values (24707, 170);
insert into WORKER (wosalary, teid)
values (24084, 185);
insert into WORKER (wosalary, teid)
values (21350, 260);
insert into WORKER (wosalary, teid)
values (3273, 46);
insert into WORKER (wosalary, teid)
values (12545, 83);
insert into WORKER (wosalary, teid)
values (2411, 155);
insert into WORKER (wosalary, teid)
values (7252, 345);
insert into WORKER (wosalary, teid)
values (19946, 261);
insert into WORKER (wosalary, teid)
values (24183, 311);
insert into WORKER (wosalary, teid)
values (4315, 215);
insert into WORKER (wosalary, teid)
values (21592, 355);
insert into WORKER (wosalary, teid)
values (21522, 342);
insert into WORKER (wosalary, teid)
values (12263, 39);
insert into WORKER (wosalary, teid)
values (17552, 6);
insert into WORKER (wosalary, teid)
values (5930, 264);
insert into WORKER (wosalary, teid)
values (6227, 85);
insert into WORKER (wosalary, teid)
values (1347, 61);
insert into WORKER (wosalary, teid)
values (19401, 318);
insert into WORKER (wosalary, teid)
values (9845, 365);
insert into WORKER (wosalary, teid)
values (1861, 111);
insert into WORKER (wosalary, teid)
values (24563, 378);
insert into WORKER (wosalary, teid)
values (1069, 118);
insert into WORKER (wosalary, teid)
values (2125, 286);
insert into WORKER (wosalary, teid)
values (23247, 164);
insert into WORKER (wosalary, teid)
values (21337, 99);
insert into WORKER (wosalary, teid)
values (20938, 216);
insert into WORKER (wosalary, teid)
values (3576, 55);
insert into WORKER (wosalary, teid)
values (791, 329);
insert into WORKER (wosalary, teid)
values (17118, 183);
insert into WORKER (wosalary, teid)
values (6631, 94);
insert into WORKER (wosalary, teid)
values (2898, 66);
insert into WORKER (wosalary, teid)
values (23795, 325);
insert into WORKER (wosalary, teid)
values (16241, 299);
insert into WORKER (wosalary, teid)
values (1513, 391);
insert into WORKER (wosalary, teid)
values (20630, 42);
insert into WORKER (wosalary, teid)
values (15208, 363);
insert into WORKER (wosalary, teid)
values (18135, 227);
insert into WORKER (wosalary, teid)
values (14051, 236);
insert into WORKER (wosalary, teid)
values (10137, 75);
insert into WORKER (wosalary, teid)
values (19785, 202);
insert into WORKER (wosalary, teid)
values (20173, 208);
insert into WORKER (wosalary, teid)
values (16326, 310);
insert into WORKER (wosalary, teid)
values (22639, 59);
insert into WORKER (wosalary, teid)
values (2476, 254);
insert into WORKER (wosalary, teid)
values (24509, 35);
insert into WORKER (wosalary, teid)
values (9691, 267);
insert into WORKER (wosalary, teid)
values (13703, 246);
insert into WORKER (wosalary, teid)
values (1084, 171);
insert into WORKER (wosalary, teid)
values (24889, 388);
insert into WORKER (wosalary, teid)
values (4487, 234);
insert into WORKER (wosalary, teid)
values (2681, 361);
insert into WORKER (wosalary, teid)
values (24354, 49);
insert into WORKER (wosalary, teid)
values (15250, 230);
insert into WORKER (wosalary, teid)
values (5403, 225);
insert into WORKER (wosalary, teid)
values (17554, 369);
insert into WORKER (wosalary, teid)
values (17027, 250);
insert into WORKER (wosalary, teid)
values (12703, 152);
insert into WORKER (wosalary, teid)
values (15816, 359);
insert into WORKER (wosalary, teid)
values (10834, 41);
commit;
prompt 83 records loaded
prompt Loading REOPRTEV...
insert into REOPRTEV (teid, debid)
values (2, 617);
insert into REOPRTEV (teid, debid)
values (2, 625);
insert into REOPRTEV (teid, debid)
values (6, 636);
insert into REOPRTEV (teid, debid)
values (6, 698);
insert into REOPRTEV (teid, debid)
values (6, 763);
insert into REOPRTEV (teid, debid)
values (6, 872);
insert into REOPRTEV (teid, debid)
values (10, 600);
insert into REOPRTEV (teid, debid)
values (10, 805);
insert into REOPRTEV (teid, debid)
values (10, 819);
insert into REOPRTEV (teid, debid)
values (12, 620);
insert into REOPRTEV (teid, debid)
values (23, 986);
insert into REOPRTEV (teid, debid)
values (30, 680);
insert into REOPRTEV (teid, debid)
values (30, 798);
insert into REOPRTEV (teid, debid)
values (30, 804);
insert into REOPRTEV (teid, debid)
values (35, 804);
insert into REOPRTEV (teid, debid)
values (39, 966);
insert into REOPRTEV (teid, debid)
values (41, 617);
insert into REOPRTEV (teid, debid)
values (41, 628);
insert into REOPRTEV (teid, debid)
values (41, 708);
insert into REOPRTEV (teid, debid)
values (41, 792);
insert into REOPRTEV (teid, debid)
values (41, 961);
insert into REOPRTEV (teid, debid)
values (46, 820);
insert into REOPRTEV (teid, debid)
values (46, 885);
insert into REOPRTEV (teid, debid)
values (55, 949);
insert into REOPRTEV (teid, debid)
values (56, 610);
insert into REOPRTEV (teid, debid)
values (56, 894);
insert into REOPRTEV (teid, debid)
values (59, 842);
insert into REOPRTEV (teid, debid)
values (59, 883);
insert into REOPRTEV (teid, debid)
values (61, 678);
insert into REOPRTEV (teid, debid)
values (61, 972);
insert into REOPRTEV (teid, debid)
values (61, 976);
insert into REOPRTEV (teid, debid)
values (62, 665);
insert into REOPRTEV (teid, debid)
values (62, 862);
insert into REOPRTEV (teid, debid)
values (62, 952);
insert into REOPRTEV (teid, debid)
values (66, 597);
insert into REOPRTEV (teid, debid)
values (66, 775);
insert into REOPRTEV (teid, debid)
values (66, 894);
insert into REOPRTEV (teid, debid)
values (67, 750);
insert into REOPRTEV (teid, debid)
values (67, 776);
insert into REOPRTEV (teid, debid)
values (67, 784);
insert into REOPRTEV (teid, debid)
values (67, 987);
insert into REOPRTEV (teid, debid)
values (75, 666);
insert into REOPRTEV (teid, debid)
values (83, 778);
insert into REOPRTEV (teid, debid)
values (86, 854);
insert into REOPRTEV (teid, debid)
values (99, 774);
insert into REOPRTEV (teid, debid)
values (100, 694);
insert into REOPRTEV (teid, debid)
values (100, 903);
insert into REOPRTEV (teid, debid)
values (111, 642);
insert into REOPRTEV (teid, debid)
values (111, 710);
insert into REOPRTEV (teid, debid)
values (111, 835);
insert into REOPRTEV (teid, debid)
values (118, 595);
insert into REOPRTEV (teid, debid)
values (118, 604);
insert into REOPRTEV (teid, debid)
values (118, 902);
insert into REOPRTEV (teid, debid)
values (143, 822);
insert into REOPRTEV (teid, debid)
values (143, 961);
insert into REOPRTEV (teid, debid)
values (152, 705);
insert into REOPRTEV (teid, debid)
values (152, 845);
insert into REOPRTEV (teid, debid)
values (170, 878);
insert into REOPRTEV (teid, debid)
values (170, 935);
insert into REOPRTEV (teid, debid)
values (171, 605);
insert into REOPRTEV (teid, debid)
values (171, 699);
insert into REOPRTEV (teid, debid)
values (171, 866);
insert into REOPRTEV (teid, debid)
values (171, 936);
insert into REOPRTEV (teid, debid)
values (173, 661);
insert into REOPRTEV (teid, debid)
values (173, 834);
insert into REOPRTEV (teid, debid)
values (173, 914);
insert into REOPRTEV (teid, debid)
values (183, 938);
insert into REOPRTEV (teid, debid)
values (184, 761);
insert into REOPRTEV (teid, debid)
values (184, 944);
insert into REOPRTEV (teid, debid)
values (185, 710);
insert into REOPRTEV (teid, debid)
values (185, 757);
insert into REOPRTEV (teid, debid)
values (185, 930);
insert into REOPRTEV (teid, debid)
values (202, 778);
insert into REOPRTEV (teid, debid)
values (202, 972);
insert into REOPRTEV (teid, debid)
values (209, 595);
insert into REOPRTEV (teid, debid)
values (215, 636);
insert into REOPRTEV (teid, debid)
values (215, 728);
insert into REOPRTEV (teid, debid)
values (225, 883);
insert into REOPRTEV (teid, debid)
values (227, 929);
insert into REOPRTEV (teid, debid)
values (230, 760);
insert into REOPRTEV (teid, debid)
values (230, 771);
insert into REOPRTEV (teid, debid)
values (230, 934);
insert into REOPRTEV (teid, debid)
values (230, 981);
insert into REOPRTEV (teid, debid)
values (234, 626);
insert into REOPRTEV (teid, debid)
values (234, 666);
insert into REOPRTEV (teid, debid)
values (234, 683);
insert into REOPRTEV (teid, debid)
values (234, 744);
insert into REOPRTEV (teid, debid)
values (234, 884);
insert into REOPRTEV (teid, debid)
values (236, 698);
insert into REOPRTEV (teid, debid)
values (236, 734);
insert into REOPRTEV (teid, debid)
values (236, 946);
insert into REOPRTEV (teid, debid)
values (246, 687);
insert into REOPRTEV (teid, debid)
values (250, 629);
insert into REOPRTEV (teid, debid)
values (250, 803);
insert into REOPRTEV (teid, debid)
values (254, 824);
insert into REOPRTEV (teid, debid)
values (254, 983);
insert into REOPRTEV (teid, debid)
values (260, 732);
insert into REOPRTEV (teid, debid)
values (260, 983);
insert into REOPRTEV (teid, debid)
values (264, 596);
insert into REOPRTEV (teid, debid)
values (264, 648);
commit;
prompt 100 records committed...
insert into REOPRTEV (teid, debid)
values (264, 761);
insert into REOPRTEV (teid, debid)
values (264, 805);
insert into REOPRTEV (teid, debid)
values (264, 858);
insert into REOPRTEV (teid, debid)
values (266, 621);
insert into REOPRTEV (teid, debid)
values (266, 687);
insert into REOPRTEV (teid, debid)
values (266, 807);
insert into REOPRTEV (teid, debid)
values (267, 631);
insert into REOPRTEV (teid, debid)
values (267, 849);
insert into REOPRTEV (teid, debid)
values (290, 925);
insert into REOPRTEV (teid, debid)
values (298, 614);
insert into REOPRTEV (teid, debid)
values (298, 663);
insert into REOPRTEV (teid, debid)
values (298, 669);
insert into REOPRTEV (teid, debid)
values (299, 880);
insert into REOPRTEV (teid, debid)
values (310, 742);
insert into REOPRTEV (teid, debid)
values (310, 827);
insert into REOPRTEV (teid, debid)
values (310, 989);
insert into REOPRTEV (teid, debid)
values (325, 591);
insert into REOPRTEV (teid, debid)
values (325, 894);
insert into REOPRTEV (teid, debid)
values (329, 876);
insert into REOPRTEV (teid, debid)
values (332, 620);
insert into REOPRTEV (teid, debid)
values (332, 649);
insert into REOPRTEV (teid, debid)
values (332, 750);
insert into REOPRTEV (teid, debid)
values (332, 755);
insert into REOPRTEV (teid, debid)
values (332, 767);
insert into REOPRTEV (teid, debid)
values (332, 850);
insert into REOPRTEV (teid, debid)
values (342, 652);
insert into REOPRTEV (teid, debid)
values (345, 787);
insert into REOPRTEV (teid, debid)
values (350, 889);
insert into REOPRTEV (teid, debid)
values (350, 895);
insert into REOPRTEV (teid, debid)
values (350, 938);
insert into REOPRTEV (teid, debid)
values (350, 964);
insert into REOPRTEV (teid, debid)
values (355, 700);
insert into REOPRTEV (teid, debid)
values (355, 938);
insert into REOPRTEV (teid, debid)
values (355, 946);
insert into REOPRTEV (teid, debid)
values (355, 974);
insert into REOPRTEV (teid, debid)
values (359, 842);
insert into REOPRTEV (teid, debid)
values (361, 675);
insert into REOPRTEV (teid, debid)
values (361, 778);
insert into REOPRTEV (teid, debid)
values (363, 764);
insert into REOPRTEV (teid, debid)
values (363, 781);
insert into REOPRTEV (teid, debid)
values (365, 714);
insert into REOPRTEV (teid, debid)
values (369, 607);
insert into REOPRTEV (teid, debid)
values (369, 749);
insert into REOPRTEV (teid, debid)
values (375, 591);
insert into REOPRTEV (teid, debid)
values (375, 686);
insert into REOPRTEV (teid, debid)
values (378, 688);
insert into REOPRTEV (teid, debid)
values (378, 835);
insert into REOPRTEV (teid, debid)
values (388, 685);
insert into REOPRTEV (teid, debid)
values (388, 820);
insert into REOPRTEV (teid, debid)
values (391, 693);
insert into REOPRTEV (teid, debid)
values (391, 925);
commit;
prompt 151 records loaded
prompt Loading ROLESP...
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
commit;
prompt 100 records committed...
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Continuity of Operations (COOP) Planner', 661, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Environmental Agencies', 662, ' voluntary');
insert into ROLESP (roname, roid, rodescribe)
values (' Emergency Services Coordinator', 663, ' computerized');
insert into ROLESP (roname, roid, rodescribe)
values (' Operational Infrastructure Security Manager', 664, ' administrative');
insert into ROLESP (roname, roid, rodescribe)
values (' Operations Liaison with Federal Emergency Management Agency (FEMA)', 665, ' logistic');
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
commit;
prompt 200 records committed...
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
commit;
prompt 216 records loaded
prompt Loading TAKINGPART...
insert into TAKINGPART (boid, emdrid)
values (890, 7);
insert into TAKINGPART (boid, emdrid)
values (890, 13);
insert into TAKINGPART (boid, emdrid)
values (890, 37);
insert into TAKINGPART (boid, emdrid)
values (890, 93);
insert into TAKINGPART (boid, emdrid)
values (890, 109);
insert into TAKINGPART (boid, emdrid)
values (890, 129);
insert into TAKINGPART (boid, emdrid)
values (890, 138);
insert into TAKINGPART (boid, emdrid)
values (890, 140);
insert into TAKINGPART (boid, emdrid)
values (890, 163);
insert into TAKINGPART (boid, emdrid)
values (890, 195);
insert into TAKINGPART (boid, emdrid)
values (890, 212);
insert into TAKINGPART (boid, emdrid)
values (890, 219);
insert into TAKINGPART (boid, emdrid)
values (890, 227);
insert into TAKINGPART (boid, emdrid)
values (890, 244);
insert into TAKINGPART (boid, emdrid)
values (890, 253);
insert into TAKINGPART (boid, emdrid)
values (890, 265);
insert into TAKINGPART (boid, emdrid)
values (890, 276);
insert into TAKINGPART (boid, emdrid)
values (890, 284);
insert into TAKINGPART (boid, emdrid)
values (890, 300);
insert into TAKINGPART (boid, emdrid)
values (890, 320);
insert into TAKINGPART (boid, emdrid)
values (890, 326);
insert into TAKINGPART (boid, emdrid)
values (892, 17);
insert into TAKINGPART (boid, emdrid)
values (892, 45);
insert into TAKINGPART (boid, emdrid)
values (892, 90);
insert into TAKINGPART (boid, emdrid)
values (892, 96);
insert into TAKINGPART (boid, emdrid)
values (892, 128);
insert into TAKINGPART (boid, emdrid)
values (892, 142);
insert into TAKINGPART (boid, emdrid)
values (892, 165);
insert into TAKINGPART (boid, emdrid)
values (892, 189);
insert into TAKINGPART (boid, emdrid)
values (892, 207);
insert into TAKINGPART (boid, emdrid)
values (892, 208);
insert into TAKINGPART (boid, emdrid)
values (892, 228);
insert into TAKINGPART (boid, emdrid)
values (892, 234);
insert into TAKINGPART (boid, emdrid)
values (892, 241);
insert into TAKINGPART (boid, emdrid)
values (892, 262);
insert into TAKINGPART (boid, emdrid)
values (892, 308);
insert into TAKINGPART (boid, emdrid)
values (892, 337);
insert into TAKINGPART (boid, emdrid)
values (892, 340);
insert into TAKINGPART (boid, emdrid)
values (892, 369);
insert into TAKINGPART (boid, emdrid)
values (892, 373);
insert into TAKINGPART (boid, emdrid)
values (892, 400);
insert into TAKINGPART (boid, emdrid)
values (893, 42);
insert into TAKINGPART (boid, emdrid)
values (893, 56);
insert into TAKINGPART (boid, emdrid)
values (893, 71);
insert into TAKINGPART (boid, emdrid)
values (893, 89);
insert into TAKINGPART (boid, emdrid)
values (893, 92);
insert into TAKINGPART (boid, emdrid)
values (893, 121);
insert into TAKINGPART (boid, emdrid)
values (893, 136);
insert into TAKINGPART (boid, emdrid)
values (893, 156);
insert into TAKINGPART (boid, emdrid)
values (893, 182);
insert into TAKINGPART (boid, emdrid)
values (893, 200);
insert into TAKINGPART (boid, emdrid)
values (893, 209);
insert into TAKINGPART (boid, emdrid)
values (893, 210);
insert into TAKINGPART (boid, emdrid)
values (893, 229);
insert into TAKINGPART (boid, emdrid)
values (893, 244);
insert into TAKINGPART (boid, emdrid)
values (893, 253);
insert into TAKINGPART (boid, emdrid)
values (893, 321);
insert into TAKINGPART (boid, emdrid)
values (893, 381);
insert into TAKINGPART (boid, emdrid)
values (894, 12);
insert into TAKINGPART (boid, emdrid)
values (894, 38);
insert into TAKINGPART (boid, emdrid)
values (894, 42);
insert into TAKINGPART (boid, emdrid)
values (894, 71);
insert into TAKINGPART (boid, emdrid)
values (894, 90);
insert into TAKINGPART (boid, emdrid)
values (894, 124);
insert into TAKINGPART (boid, emdrid)
values (894, 148);
insert into TAKINGPART (boid, emdrid)
values (894, 169);
insert into TAKINGPART (boid, emdrid)
values (894, 172);
insert into TAKINGPART (boid, emdrid)
values (894, 215);
insert into TAKINGPART (boid, emdrid)
values (894, 240);
insert into TAKINGPART (boid, emdrid)
values (894, 244);
insert into TAKINGPART (boid, emdrid)
values (894, 247);
insert into TAKINGPART (boid, emdrid)
values (894, 274);
insert into TAKINGPART (boid, emdrid)
values (894, 291);
insert into TAKINGPART (boid, emdrid)
values (894, 313);
insert into TAKINGPART (boid, emdrid)
values (894, 337);
insert into TAKINGPART (boid, emdrid)
values (894, 338);
insert into TAKINGPART (boid, emdrid)
values (894, 348);
insert into TAKINGPART (boid, emdrid)
values (894, 382);
insert into TAKINGPART (boid, emdrid)
values (894, 385);
insert into TAKINGPART (boid, emdrid)
values (895, 19);
insert into TAKINGPART (boid, emdrid)
values (895, 22);
insert into TAKINGPART (boid, emdrid)
values (895, 38);
insert into TAKINGPART (boid, emdrid)
values (895, 56);
insert into TAKINGPART (boid, emdrid)
values (895, 74);
insert into TAKINGPART (boid, emdrid)
values (895, 81);
insert into TAKINGPART (boid, emdrid)
values (895, 106);
insert into TAKINGPART (boid, emdrid)
values (895, 107);
insert into TAKINGPART (boid, emdrid)
values (895, 166);
insert into TAKINGPART (boid, emdrid)
values (895, 184);
insert into TAKINGPART (boid, emdrid)
values (895, 185);
insert into TAKINGPART (boid, emdrid)
values (895, 193);
insert into TAKINGPART (boid, emdrid)
values (895, 207);
insert into TAKINGPART (boid, emdrid)
values (895, 291);
insert into TAKINGPART (boid, emdrid)
values (895, 302);
insert into TAKINGPART (boid, emdrid)
values (895, 309);
insert into TAKINGPART (boid, emdrid)
values (895, 325);
insert into TAKINGPART (boid, emdrid)
values (895, 350);
insert into TAKINGPART (boid, emdrid)
values (895, 367);
insert into TAKINGPART (boid, emdrid)
values (895, 378);
insert into TAKINGPART (boid, emdrid)
values (897, 43);
commit;
prompt 100 records committed...
insert into TAKINGPART (boid, emdrid)
values (897, 59);
insert into TAKINGPART (boid, emdrid)
values (897, 68);
insert into TAKINGPART (boid, emdrid)
values (897, 82);
insert into TAKINGPART (boid, emdrid)
values (897, 93);
insert into TAKINGPART (boid, emdrid)
values (897, 99);
insert into TAKINGPART (boid, emdrid)
values (897, 124);
insert into TAKINGPART (boid, emdrid)
values (897, 135);
insert into TAKINGPART (boid, emdrid)
values (897, 140);
insert into TAKINGPART (boid, emdrid)
values (897, 148);
insert into TAKINGPART (boid, emdrid)
values (897, 151);
insert into TAKINGPART (boid, emdrid)
values (897, 180);
insert into TAKINGPART (boid, emdrid)
values (897, 233);
insert into TAKINGPART (boid, emdrid)
values (897, 252);
insert into TAKINGPART (boid, emdrid)
values (897, 258);
insert into TAKINGPART (boid, emdrid)
values (897, 288);
insert into TAKINGPART (boid, emdrid)
values (897, 295);
insert into TAKINGPART (boid, emdrid)
values (897, 303);
insert into TAKINGPART (boid, emdrid)
values (897, 310);
insert into TAKINGPART (boid, emdrid)
values (897, 317);
insert into TAKINGPART (boid, emdrid)
values (897, 348);
insert into TAKINGPART (boid, emdrid)
values (897, 385);
insert into TAKINGPART (boid, emdrid)
values (898, 41);
insert into TAKINGPART (boid, emdrid)
values (898, 50);
insert into TAKINGPART (boid, emdrid)
values (898, 58);
insert into TAKINGPART (boid, emdrid)
values (898, 85);
insert into TAKINGPART (boid, emdrid)
values (898, 147);
insert into TAKINGPART (boid, emdrid)
values (898, 149);
insert into TAKINGPART (boid, emdrid)
values (898, 164);
insert into TAKINGPART (boid, emdrid)
values (898, 174);
insert into TAKINGPART (boid, emdrid)
values (898, 178);
insert into TAKINGPART (boid, emdrid)
values (898, 190);
insert into TAKINGPART (boid, emdrid)
values (898, 203);
insert into TAKINGPART (boid, emdrid)
values (898, 204);
insert into TAKINGPART (boid, emdrid)
values (898, 231);
insert into TAKINGPART (boid, emdrid)
values (898, 239);
insert into TAKINGPART (boid, emdrid)
values (898, 256);
insert into TAKINGPART (boid, emdrid)
values (898, 260);
insert into TAKINGPART (boid, emdrid)
values (898, 277);
insert into TAKINGPART (boid, emdrid)
values (898, 350);
insert into TAKINGPART (boid, emdrid)
values (898, 380);
insert into TAKINGPART (boid, emdrid)
values (898, 389);
insert into TAKINGPART (boid, emdrid)
values (898, 400);
insert into TAKINGPART (boid, emdrid)
values (899, 7);
insert into TAKINGPART (boid, emdrid)
values (899, 31);
insert into TAKINGPART (boid, emdrid)
values (899, 61);
insert into TAKINGPART (boid, emdrid)
values (899, 69);
insert into TAKINGPART (boid, emdrid)
values (899, 72);
insert into TAKINGPART (boid, emdrid)
values (899, 84);
insert into TAKINGPART (boid, emdrid)
values (899, 88);
insert into TAKINGPART (boid, emdrid)
values (899, 117);
insert into TAKINGPART (boid, emdrid)
values (899, 139);
insert into TAKINGPART (boid, emdrid)
values (899, 171);
insert into TAKINGPART (boid, emdrid)
values (899, 178);
insert into TAKINGPART (boid, emdrid)
values (899, 240);
insert into TAKINGPART (boid, emdrid)
values (899, 272);
insert into TAKINGPART (boid, emdrid)
values (899, 276);
insert into TAKINGPART (boid, emdrid)
values (899, 286);
insert into TAKINGPART (boid, emdrid)
values (899, 295);
insert into TAKINGPART (boid, emdrid)
values (899, 313);
insert into TAKINGPART (boid, emdrid)
values (899, 321);
insert into TAKINGPART (boid, emdrid)
values (899, 331);
insert into TAKINGPART (boid, emdrid)
values (899, 348);
insert into TAKINGPART (boid, emdrid)
values (899, 355);
insert into TAKINGPART (boid, emdrid)
values (899, 359);
insert into TAKINGPART (boid, emdrid)
values (899, 374);
insert into TAKINGPART (boid, emdrid)
values (900, 26);
insert into TAKINGPART (boid, emdrid)
values (900, 48);
insert into TAKINGPART (boid, emdrid)
values (900, 100);
insert into TAKINGPART (boid, emdrid)
values (900, 109);
insert into TAKINGPART (boid, emdrid)
values (900, 114);
insert into TAKINGPART (boid, emdrid)
values (900, 116);
insert into TAKINGPART (boid, emdrid)
values (900, 177);
insert into TAKINGPART (boid, emdrid)
values (900, 198);
insert into TAKINGPART (boid, emdrid)
values (900, 200);
insert into TAKINGPART (boid, emdrid)
values (900, 203);
insert into TAKINGPART (boid, emdrid)
values (900, 223);
insert into TAKINGPART (boid, emdrid)
values (900, 259);
insert into TAKINGPART (boid, emdrid)
values (900, 303);
insert into TAKINGPART (boid, emdrid)
values (900, 307);
insert into TAKINGPART (boid, emdrid)
values (900, 331);
insert into TAKINGPART (boid, emdrid)
values (900, 333);
insert into TAKINGPART (boid, emdrid)
values (900, 344);
insert into TAKINGPART (boid, emdrid)
values (900, 351);
insert into TAKINGPART (boid, emdrid)
values (900, 357);
insert into TAKINGPART (boid, emdrid)
values (900, 372);
insert into TAKINGPART (boid, emdrid)
values (900, 377);
insert into TAKINGPART (boid, emdrid)
values (902, 12);
insert into TAKINGPART (boid, emdrid)
values (902, 20);
insert into TAKINGPART (boid, emdrid)
values (902, 64);
insert into TAKINGPART (boid, emdrid)
values (902, 65);
insert into TAKINGPART (boid, emdrid)
values (902, 80);
insert into TAKINGPART (boid, emdrid)
values (902, 106);
insert into TAKINGPART (boid, emdrid)
values (902, 121);
insert into TAKINGPART (boid, emdrid)
values (902, 124);
insert into TAKINGPART (boid, emdrid)
values (902, 161);
insert into TAKINGPART (boid, emdrid)
values (902, 164);
insert into TAKINGPART (boid, emdrid)
values (902, 165);
insert into TAKINGPART (boid, emdrid)
values (902, 179);
insert into TAKINGPART (boid, emdrid)
values (902, 228);
insert into TAKINGPART (boid, emdrid)
values (902, 234);
commit;
prompt 200 records committed...
insert into TAKINGPART (boid, emdrid)
values (902, 260);
insert into TAKINGPART (boid, emdrid)
values (902, 268);
insert into TAKINGPART (boid, emdrid)
values (902, 292);
insert into TAKINGPART (boid, emdrid)
values (902, 304);
insert into TAKINGPART (boid, emdrid)
values (902, 323);
insert into TAKINGPART (boid, emdrid)
values (902, 334);
insert into TAKINGPART (boid, emdrid)
values (902, 369);
insert into TAKINGPART (boid, emdrid)
values (903, 1);
insert into TAKINGPART (boid, emdrid)
values (903, 45);
insert into TAKINGPART (boid, emdrid)
values (903, 49);
insert into TAKINGPART (boid, emdrid)
values (903, 145);
insert into TAKINGPART (boid, emdrid)
values (903, 151);
insert into TAKINGPART (boid, emdrid)
values (903, 188);
insert into TAKINGPART (boid, emdrid)
values (903, 193);
insert into TAKINGPART (boid, emdrid)
values (903, 196);
insert into TAKINGPART (boid, emdrid)
values (903, 215);
insert into TAKINGPART (boid, emdrid)
values (903, 223);
insert into TAKINGPART (boid, emdrid)
values (903, 227);
insert into TAKINGPART (boid, emdrid)
values (903, 229);
insert into TAKINGPART (boid, emdrid)
values (903, 239);
insert into TAKINGPART (boid, emdrid)
values (903, 249);
insert into TAKINGPART (boid, emdrid)
values (903, 262);
insert into TAKINGPART (boid, emdrid)
values (903, 271);
insert into TAKINGPART (boid, emdrid)
values (903, 317);
insert into TAKINGPART (boid, emdrid)
values (903, 351);
insert into TAKINGPART (boid, emdrid)
values (903, 397);
insert into TAKINGPART (boid, emdrid)
values (904, 38);
insert into TAKINGPART (boid, emdrid)
values (904, 52);
insert into TAKINGPART (boid, emdrid)
values (904, 70);
insert into TAKINGPART (boid, emdrid)
values (904, 88);
insert into TAKINGPART (boid, emdrid)
values (904, 94);
insert into TAKINGPART (boid, emdrid)
values (904, 107);
insert into TAKINGPART (boid, emdrid)
values (904, 113);
insert into TAKINGPART (boid, emdrid)
values (904, 147);
insert into TAKINGPART (boid, emdrid)
values (904, 207);
insert into TAKINGPART (boid, emdrid)
values (904, 223);
insert into TAKINGPART (boid, emdrid)
values (904, 232);
insert into TAKINGPART (boid, emdrid)
values (904, 285);
insert into TAKINGPART (boid, emdrid)
values (904, 290);
insert into TAKINGPART (boid, emdrid)
values (904, 292);
insert into TAKINGPART (boid, emdrid)
values (904, 302);
insert into TAKINGPART (boid, emdrid)
values (904, 329);
insert into TAKINGPART (boid, emdrid)
values (904, 344);
insert into TAKINGPART (boid, emdrid)
values (904, 360);
insert into TAKINGPART (boid, emdrid)
values (904, 370);
insert into TAKINGPART (boid, emdrid)
values (904, 384);
insert into TAKINGPART (boid, emdrid)
values (905, 6);
insert into TAKINGPART (boid, emdrid)
values (905, 9);
insert into TAKINGPART (boid, emdrid)
values (905, 32);
insert into TAKINGPART (boid, emdrid)
values (905, 45);
insert into TAKINGPART (boid, emdrid)
values (905, 50);
insert into TAKINGPART (boid, emdrid)
values (905, 54);
insert into TAKINGPART (boid, emdrid)
values (905, 98);
insert into TAKINGPART (boid, emdrid)
values (905, 108);
insert into TAKINGPART (boid, emdrid)
values (905, 147);
insert into TAKINGPART (boid, emdrid)
values (905, 180);
insert into TAKINGPART (boid, emdrid)
values (905, 201);
insert into TAKINGPART (boid, emdrid)
values (905, 277);
insert into TAKINGPART (boid, emdrid)
values (905, 279);
insert into TAKINGPART (boid, emdrid)
values (905, 282);
insert into TAKINGPART (boid, emdrid)
values (905, 295);
insert into TAKINGPART (boid, emdrid)
values (905, 310);
insert into TAKINGPART (boid, emdrid)
values (905, 312);
insert into TAKINGPART (boid, emdrid)
values (905, 350);
insert into TAKINGPART (boid, emdrid)
values (905, 356);
insert into TAKINGPART (boid, emdrid)
values (905, 378);
insert into TAKINGPART (boid, emdrid)
values (907, 37);
insert into TAKINGPART (boid, emdrid)
values (907, 78);
insert into TAKINGPART (boid, emdrid)
values (907, 88);
insert into TAKINGPART (boid, emdrid)
values (907, 136);
insert into TAKINGPART (boid, emdrid)
values (907, 155);
insert into TAKINGPART (boid, emdrid)
values (907, 187);
insert into TAKINGPART (boid, emdrid)
values (907, 226);
insert into TAKINGPART (boid, emdrid)
values (907, 232);
insert into TAKINGPART (boid, emdrid)
values (907, 249);
insert into TAKINGPART (boid, emdrid)
values (907, 259);
insert into TAKINGPART (boid, emdrid)
values (907, 289);
insert into TAKINGPART (boid, emdrid)
values (907, 325);
insert into TAKINGPART (boid, emdrid)
values (907, 345);
insert into TAKINGPART (boid, emdrid)
values (907, 367);
insert into TAKINGPART (boid, emdrid)
values (907, 386);
insert into TAKINGPART (boid, emdrid)
values (907, 393);
insert into TAKINGPART (boid, emdrid)
values (908, 19);
insert into TAKINGPART (boid, emdrid)
values (908, 22);
insert into TAKINGPART (boid, emdrid)
values (908, 49);
insert into TAKINGPART (boid, emdrid)
values (908, 66);
insert into TAKINGPART (boid, emdrid)
values (908, 68);
insert into TAKINGPART (boid, emdrid)
values (908, 71);
insert into TAKINGPART (boid, emdrid)
values (908, 92);
insert into TAKINGPART (boid, emdrid)
values (908, 107);
insert into TAKINGPART (boid, emdrid)
values (908, 109);
insert into TAKINGPART (boid, emdrid)
values (908, 111);
insert into TAKINGPART (boid, emdrid)
values (908, 115);
insert into TAKINGPART (boid, emdrid)
values (908, 129);
insert into TAKINGPART (boid, emdrid)
values (908, 143);
insert into TAKINGPART (boid, emdrid)
values (908, 176);
insert into TAKINGPART (boid, emdrid)
values (908, 192);
insert into TAKINGPART (boid, emdrid)
values (908, 213);
insert into TAKINGPART (boid, emdrid)
values (908, 225);
insert into TAKINGPART (boid, emdrid)
values (908, 226);
commit;
prompt 300 records committed...
insert into TAKINGPART (boid, emdrid)
values (908, 231);
insert into TAKINGPART (boid, emdrid)
values (908, 235);
insert into TAKINGPART (boid, emdrid)
values (908, 266);
insert into TAKINGPART (boid, emdrid)
values (908, 277);
insert into TAKINGPART (boid, emdrid)
values (908, 283);
insert into TAKINGPART (boid, emdrid)
values (908, 300);
insert into TAKINGPART (boid, emdrid)
values (908, 314);
insert into TAKINGPART (boid, emdrid)
values (908, 325);
insert into TAKINGPART (boid, emdrid)
values (908, 327);
insert into TAKINGPART (boid, emdrid)
values (908, 371);
insert into TAKINGPART (boid, emdrid)
values (908, 379);
insert into TAKINGPART (boid, emdrid)
values (908, 386);
insert into TAKINGPART (boid, emdrid)
values (909, 52);
insert into TAKINGPART (boid, emdrid)
values (909, 106);
insert into TAKINGPART (boid, emdrid)
values (909, 120);
insert into TAKINGPART (boid, emdrid)
values (909, 122);
insert into TAKINGPART (boid, emdrid)
values (909, 128);
insert into TAKINGPART (boid, emdrid)
values (909, 147);
insert into TAKINGPART (boid, emdrid)
values (909, 167);
insert into TAKINGPART (boid, emdrid)
values (909, 185);
insert into TAKINGPART (boid, emdrid)
values (909, 199);
insert into TAKINGPART (boid, emdrid)
values (909, 214);
insert into TAKINGPART (boid, emdrid)
values (909, 228);
insert into TAKINGPART (boid, emdrid)
values (909, 242);
insert into TAKINGPART (boid, emdrid)
values (909, 247);
insert into TAKINGPART (boid, emdrid)
values (909, 259);
insert into TAKINGPART (boid, emdrid)
values (909, 272);
insert into TAKINGPART (boid, emdrid)
values (909, 286);
insert into TAKINGPART (boid, emdrid)
values (909, 300);
insert into TAKINGPART (boid, emdrid)
values (909, 326);
insert into TAKINGPART (boid, emdrid)
values (909, 327);
insert into TAKINGPART (boid, emdrid)
values (909, 334);
insert into TAKINGPART (boid, emdrid)
values (909, 398);
commit;
prompt 333 records loaded
prompt Enabling foreign key constraints for ACTIN...
alter table ACTIN enable constraint SYS_C008274;
alter table ACTIN enable constraint SYS_C008275;
prompt Enabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES enable constraint SYS_C008248;
prompt Enabling foreign key constraints for PRACTICING...
alter table PRACTICING enable constraint SYS_C008284;
alter table PRACTICING enable constraint SYS_C008285;
prompt Enabling foreign key constraints for WORKER...
alter table WORKER enable constraint SYS_C008270;
prompt Enabling foreign key constraints for REOPRTEV...
alter table REOPRTEV enable constraint SYS_C008279;
alter table REOPRTEV enable constraint SYS_C008280;
prompt Enabling foreign key constraints for TAKINGPART...
alter table TAKINGPART enable constraint SYS_C008257;
alter table TAKINGPART enable constraint SYS_C008258;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for TEAMP...
alter table TEAMP enable all triggers;
prompt Enabling triggers for ACTIN...
alter table ACTIN enable all triggers;
prompt Enabling triggers for EMERGENBODIES...
alter table EMERGENBODIES enable all triggers;
prompt Enabling triggers for EMERGENCYDRILL...
alter table EMERGENCYDRILL enable all triggers;
prompt Enabling triggers for EVDEBRIEFING...
alter table EVDEBRIEFING enable all triggers;
prompt Enabling triggers for PRACTICING...
alter table PRACTICING enable all triggers;
prompt Enabling triggers for REOPRT...
alter table REOPRT enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for REOPRTEV...
alter table REOPRTEV enable all triggers;
prompt Enabling triggers for ROLESP...
alter table ROLESP enable all triggers;
prompt Enabling triggers for TAKINGPART...
alter table TAKINGPART enable all triggers;
set feedback on
set define on
prompt Done.
