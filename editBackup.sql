prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by מוריה חדד
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
  ;

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
;
alter table TEAMP
  add primary key (TEID)
  ;

prompt Creating ACTIN...
create table ACTIN
(
  teid INTEGER not null,
  evid INTEGER not null
)
;
alter table ACTIN
  add primary key (TEID, EVID)
  ;
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
;
alter table EMERGENBODIES
  add primary key (BOID)
  ;
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
;
alter table EMERGENCYDRILL
  add primary key (EMDRID)
  ;

prompt Creating EVDEBRIEFING...
create table EVDEBRIEFING
(
  debid            INTEGER not null,
  deresponsibility VARCHAR2(255) not null,
  destatus         INTEGER not null,
  deconclusion     VARCHAR2(255) not null
)
;
alter table EVDEBRIEFING
  add primary key (DEBID)
  ;

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
;
alter table REOPRT
  add primary key (TEID, DEBID)
  ;

prompt Creating WORKER...
create table WORKER
(
  wosalary INTEGER not null,
  teid     INTEGER not null
)
;
alter table WORKER
  add primary key (TEID)
  using index 
  ;
alter table WORKER
  add foreign key (TEID)
  references TEAMP (TEID);

prompt Creating REOPRTEV...
create table REOPRTEV
(
  teid  INTEGER not null,
  debid INTEGER not null
)
;
alter table REOPRTEV
  add primary key (TEID, DEBID)
  ;
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
;
alter table ROLESP
  add primary key (ROID)
  ;

prompt Creating TAKINGPART...
create table TAKINGPART
(
  boid   INTEGER not null,
  emdrid INTEGER not null
)
;
alter table TAKINGPART
  add primary key (BOID, EMDRID)
  ;
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
commit;
prompt 154 records loaded
prompt Loading TEAMP...
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
values (100, '9553 Valley Edge Plaza', '718-865-6696', 'Teddie', 'tbattrum2r@google.cn', 662);
commit;
prompt 100 records committed...
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
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (196, '135 Oriole Court', '926-453-7907', 'Robb', 'rradborne5f@china.com.cn', 675);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (197, '004 Moland Center', '556-351-6284', 'Haleigh', 'hsparkes5g@digg.com', 588);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (198, '13 Bayside Plaza', '444-532-4734', 'Natalie', 'ntremayle5h@google.com', 632);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (199, '2476 Nancy Avenue', '338-840-1260', 'Deeyn', 'dtoler5i@nytimes.com', 641);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (200, '13 Truax Court', '256-818-3719', 'Oren', 'oshoebrook5j@imageshack.us', 600);
commit;
prompt 200 records committed...
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
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (292, '7 Corben Place', '905-588-5458', 'Eberhard', 'echitson83@lulu.com', 665);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (293, '92 Goodland Junction', '346-832-5840', 'Rik', 'rverbrugge84@exblog.jp', 637);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (294, '18291 Fremont Avenue', '153-338-6883', 'Ozzie', 'onaisbit85@bloglovin.com', 598);
insert into TEAMP (teid, teaddress, tephone, tename, teemail, roid)
values (295, '6 Nobel Park', '874-618-4557', 'Farrel', 'fdingsdale86@issuu.com', 669);
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
commit;
prompt 300 records committed...
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
commit;
prompt 400 records loaded
prompt Loading ACTIN...
prompt Table is empty
prompt Loading EMERGENBODIES...
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Police', 890, ' 100', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Fire Department', 891, ' 101', 212);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Emergency Medical Services (EMS)', 892, ' 102', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Coast Guard', 893, ' 103', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Search and Rescue', 894, ' 104', 640);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Disaster Response Teams', 895, ' 105', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Ambulance Services', 896, ' 106', 212);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Mountain Rescue', 897, ' 107', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Water Rescue', 898, ' 108', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Civil Defense', 899, ' 109', 640);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' National Guard', 900, ' 110', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Bomb Squad', 901, ' 111', 212);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Hazardous Materials (HAZMAT) Teams', 902, ' 112', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Air Ambulance', 903, ' 113', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Wildlife Rescue', 904, ' 114', 640);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Anti-Terrorism Units', 905, ' 115', 614);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Red Cross', 906, ' 116', 212);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Poison Control', 907, ' 117', 451);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Crisis Intervention Teams', 908, ' 118', 181);
insert into EMERGENBODIES (boname, boid, bophone, evid)
values (' Public Health Emergency Services', 909, ' 119', 640);
commit;
prompt 20 records loaded
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
values (956, ' Nadav Shalem', 1, ' Failure');
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
values (686, ' Nitai Gal', 1, ' Well Done');
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
commit;
prompt 400 records loaded
prompt Loading PRACTICING...
prompt Table is empty
prompt Loading REOPRT...
prompt Table is empty
prompt Loading WORKER...
insert into WORKER (wosalary, teid)
values (2874, 328);
insert into WORKER (wosalary, teid)
values (11352, 265);
insert into WORKER (wosalary, teid)
values (20447, 229);
insert into WORKER (wosalary, teid)
values (10118, 2);
insert into WORKER (wosalary, teid)
values (23610, 239);
insert into WORKER (wosalary, teid)
values (17793, 16);
insert into WORKER (wosalary, teid)
values (1313, 213);
insert into WORKER (wosalary, teid)
values (17943, 336);
insert into WORKER (wosalary, teid)
values (9307, 92);
insert into WORKER (wosalary, teid)
values (14977, 237);
insert into WORKER (wosalary, teid)
values (1636, 360);
insert into WORKER (wosalary, teid)
values (6387, 341);
insert into WORKER (wosalary, teid)
values (24175, 76);
insert into WORKER (wosalary, teid)
values (23061, 298);
insert into WORKER (wosalary, teid)
values (11655, 19);
insert into WORKER (wosalary, teid)
values (17696, 10);
insert into WORKER (wosalary, teid)
values (8313, 143);
insert into WORKER (wosalary, teid)
values (21824, 84);
insert into WORKER (wosalary, teid)
values (3479, 279);
insert into WORKER (wosalary, teid)
values (22070, 57);
insert into WORKER (wosalary, teid)
values (19205, 291);
insert into WORKER (wosalary, teid)
values (12766, 287);
insert into WORKER (wosalary, teid)
values (19489, 12);
insert into WORKER (wosalary, teid)
values (4928, 266);
insert into WORKER (wosalary, teid)
values (21971, 173);
insert into WORKER (wosalary, teid)
values (21732, 219);
insert into WORKER (wosalary, teid)
values (18260, 47);
insert into WORKER (wosalary, teid)
values (19087, 172);
insert into WORKER (wosalary, teid)
values (22770, 30);
insert into WORKER (wosalary, teid)
values (17650, 349);
insert into WORKER (wosalary, teid)
values (6671, 62);
insert into WORKER (wosalary, teid)
values (8506, 151);
insert into WORKER (wosalary, teid)
values (15812, 375);
insert into WORKER (wosalary, teid)
values (2831, 23);
insert into WORKER (wosalary, teid)
values (746, 301);
insert into WORKER (wosalary, teid)
values (10075, 56);
insert into WORKER (wosalary, teid)
values (24062, 7);
insert into WORKER (wosalary, teid)
values (24673, 290);
insert into WORKER (wosalary, teid)
values (23480, 187);
insert into WORKER (wosalary, teid)
values (20723, 201);
insert into WORKER (wosalary, teid)
values (2720, 86);
insert into WORKER (wosalary, teid)
values (23489, 332);
insert into WORKER (wosalary, teid)
values (22422, 326);
insert into WORKER (wosalary, teid)
values (13540, 218);
insert into WORKER (wosalary, teid)
values (9033, 22);
insert into WORKER (wosalary, teid)
values (13933, 100);
insert into WORKER (wosalary, teid)
values (15714, 136);
insert into WORKER (wosalary, teid)
values (9273, 70);
insert into WORKER (wosalary, teid)
values (10445, 350);
insert into WORKER (wosalary, teid)
values (7024, 73);
insert into WORKER (wosalary, teid)
values (23668, 133);
insert into WORKER (wosalary, teid)
values (24155, 67);
insert into WORKER (wosalary, teid)
values (5854, 95);
insert into WORKER (wosalary, teid)
values (11808, 184);
insert into WORKER (wosalary, teid)
values (16332, 209);
insert into WORKER (wosalary, teid)
values (1428, 153);
insert into WORKER (wosalary, teid)
values (24707, 170);
insert into WORKER (wosalary, teid)
values (24084, 185);
insert into WORKER (wosalary, teid)
values (11925, 256);
insert into WORKER (wosalary, teid)
values (21350, 260);
insert into WORKER (wosalary, teid)
values (3273, 46);
insert into WORKER (wosalary, teid)
values (21143, 45);
insert into WORKER (wosalary, teid)
values (12545, 83);
insert into WORKER (wosalary, teid)
values (7614, 195);
insert into WORKER (wosalary, teid)
values (2411, 155);
insert into WORKER (wosalary, teid)
values (7252, 345);
insert into WORKER (wosalary, teid)
values (7304, 205);
insert into WORKER (wosalary, teid)
values (21354, 24);
insert into WORKER (wosalary, teid)
values (19946, 261);
insert into WORKER (wosalary, teid)
values (22069, 315);
insert into WORKER (wosalary, teid)
values (23578, 48);
insert into WORKER (wosalary, teid)
values (21542, 389);
insert into WORKER (wosalary, teid)
values (10475, 354);
insert into WORKER (wosalary, teid)
values (24183, 311);
insert into WORKER (wosalary, teid)
values (15737, 141);
insert into WORKER (wosalary, teid)
values (4315, 215);
insert into WORKER (wosalary, teid)
values (14038, 372);
insert into WORKER (wosalary, teid)
values (23316, 382);
insert into WORKER (wosalary, teid)
values (6572, 331);
insert into WORKER (wosalary, teid)
values (21592, 355);
insert into WORKER (wosalary, teid)
values (18694, 53);
insert into WORKER (wosalary, teid)
values (21522, 342);
insert into WORKER (wosalary, teid)
values (9792, 297);
insert into WORKER (wosalary, teid)
values (15810, 125);
insert into WORKER (wosalary, teid)
values (2623, 308);
insert into WORKER (wosalary, teid)
values (6664, 366);
insert into WORKER (wosalary, teid)
values (16710, 123);
insert into WORKER (wosalary, teid)
values (12263, 39);
insert into WORKER (wosalary, teid)
values (22120, 180);
insert into WORKER (wosalary, teid)
values (5170, 109);
insert into WORKER (wosalary, teid)
values (7944, 357);
insert into WORKER (wosalary, teid)
values (12091, 313);
insert into WORKER (wosalary, teid)
values (22026, 305);
insert into WORKER (wosalary, teid)
values (16750, 323);
insert into WORKER (wosalary, teid)
values (1040, 8);
insert into WORKER (wosalary, teid)
values (17552, 6);
insert into WORKER (wosalary, teid)
values (23369, 276);
insert into WORKER (wosalary, teid)
values (5930, 264);
insert into WORKER (wosalary, teid)
values (6227, 85);
insert into WORKER (wosalary, teid)
values (1347, 61);
commit;
prompt 100 records committed...
insert into WORKER (wosalary, teid)
values (608, 348);
insert into WORKER (wosalary, teid)
values (23392, 285);
insert into WORKER (wosalary, teid)
values (819, 189);
insert into WORKER (wosalary, teid)
values (10302, 44);
insert into WORKER (wosalary, teid)
values (10186, 149);
insert into WORKER (wosalary, teid)
values (19574, 113);
insert into WORKER (wosalary, teid)
values (1098, 101);
insert into WORKER (wosalary, teid)
values (19401, 318);
insert into WORKER (wosalary, teid)
values (14250, 211);
insert into WORKER (wosalary, teid)
values (22105, 192);
insert into WORKER (wosalary, teid)
values (4589, 21);
insert into WORKER (wosalary, teid)
values (2541, 270);
insert into WORKER (wosalary, teid)
values (17362, 50);
insert into WORKER (wosalary, teid)
values (4601, 393);
insert into WORKER (wosalary, teid)
values (24017, 268);
insert into WORKER (wosalary, teid)
values (17656, 386);
insert into WORKER (wosalary, teid)
values (9163, 81);
insert into WORKER (wosalary, teid)
values (9845, 365);
insert into WORKER (wosalary, teid)
values (23950, 74);
insert into WORKER (wosalary, teid)
values (4371, 244);
insert into WORKER (wosalary, teid)
values (1861, 111);
insert into WORKER (wosalary, teid)
values (14686, 343);
insert into WORKER (wosalary, teid)
values (15128, 339);
insert into WORKER (wosalary, teid)
values (7482, 177);
insert into WORKER (wosalary, teid)
values (12646, 20);
insert into WORKER (wosalary, teid)
values (9483, 132);
insert into WORKER (wosalary, teid)
values (20267, 293);
insert into WORKER (wosalary, teid)
values (3694, 179);
insert into WORKER (wosalary, teid)
values (13773, 4);
insert into WORKER (wosalary, teid)
values (24563, 378);
insert into WORKER (wosalary, teid)
values (8113, 269);
insert into WORKER (wosalary, teid)
values (1069, 118);
insert into WORKER (wosalary, teid)
values (2125, 286);
insert into WORKER (wosalary, teid)
values (4242, 129);
insert into WORKER (wosalary, teid)
values (23247, 164);
insert into WORKER (wosalary, teid)
values (21337, 99);
insert into WORKER (wosalary, teid)
values (17458, 379);
insert into WORKER (wosalary, teid)
values (4163, 224);
insert into WORKER (wosalary, teid)
values (6505, 126);
insert into WORKER (wosalary, teid)
values (13713, 337);
insert into WORKER (wosalary, teid)
values (4630, 157);
insert into WORKER (wosalary, teid)
values (20938, 216);
insert into WORKER (wosalary, teid)
values (3576, 55);
insert into WORKER (wosalary, teid)
values (21386, 89);
insert into WORKER (wosalary, teid)
values (791, 329);
insert into WORKER (wosalary, teid)
values (14380, 353);
insert into WORKER (wosalary, teid)
values (17118, 183);
insert into WORKER (wosalary, teid)
values (13062, 190);
insert into WORKER (wosalary, teid)
values (11316, 317);
insert into WORKER (wosalary, teid)
values (7514, 79);
insert into WORKER (wosalary, teid)
values (6631, 94);
insert into WORKER (wosalary, teid)
values (19090, 26);
insert into WORKER (wosalary, teid)
values (2898, 66);
insert into WORKER (wosalary, teid)
values (11825, 304);
insert into WORKER (wosalary, teid)
values (23795, 325);
insert into WORKER (wosalary, teid)
values (19345, 324);
insert into WORKER (wosalary, teid)
values (2319, 395);
insert into WORKER (wosalary, teid)
values (1312, 36);
insert into WORKER (wosalary, teid)
values (17334, 281);
insert into WORKER (wosalary, teid)
values (19469, 235);
insert into WORKER (wosalary, teid)
values (16241, 299);
insert into WORKER (wosalary, teid)
values (3690, 207);
insert into WORKER (wosalary, teid)
values (13741, 25);
insert into WORKER (wosalary, teid)
values (6527, 274);
insert into WORKER (wosalary, teid)
values (11750, 340);
insert into WORKER (wosalary, teid)
values (1095, 91);
insert into WORKER (wosalary, teid)
values (23751, 9);
insert into WORKER (wosalary, teid)
values (23176, 295);
insert into WORKER (wosalary, teid)
values (12802, 156);
insert into WORKER (wosalary, teid)
values (1513, 391);
insert into WORKER (wosalary, teid)
values (19848, 114);
insert into WORKER (wosalary, teid)
values (20630, 42);
insert into WORKER (wosalary, teid)
values (13033, 162);
insert into WORKER (wosalary, teid)
values (14869, 31);
insert into WORKER (wosalary, teid)
values (3955, 96);
insert into WORKER (wosalary, teid)
values (2781, 18);
insert into WORKER (wosalary, teid)
values (10147, 248);
insert into WORKER (wosalary, teid)
values (15208, 363);
insert into WORKER (wosalary, teid)
values (11801, 110);
insert into WORKER (wosalary, teid)
values (3171, 390);
insert into WORKER (wosalary, teid)
values (22373, 169);
insert into WORKER (wosalary, teid)
values (11452, 194);
insert into WORKER (wosalary, teid)
values (18135, 227);
insert into WORKER (wosalary, teid)
values (14051, 236);
insert into WORKER (wosalary, teid)
values (7740, 221);
insert into WORKER (wosalary, teid)
values (10137, 75);
insert into WORKER (wosalary, teid)
values (4488, 242);
insert into WORKER (wosalary, teid)
values (15301, 233);
insert into WORKER (wosalary, teid)
values (9468, 11);
insert into WORKER (wosalary, teid)
values (8538, 104);
insert into WORKER (wosalary, teid)
values (19785, 202);
insert into WORKER (wosalary, teid)
values (6470, 168);
insert into WORKER (wosalary, teid)
values (20173, 208);
insert into WORKER (wosalary, teid)
values (20220, 78);
insert into WORKER (wosalary, teid)
values (939, 257);
insert into WORKER (wosalary, teid)
values (16910, 146);
insert into WORKER (wosalary, teid)
values (13532, 347);
insert into WORKER (wosalary, teid)
values (16326, 310);
insert into WORKER (wosalary, teid)
values (22639, 59);
insert into WORKER (wosalary, teid)
values (2476, 254);
commit;
prompt 200 records committed...
insert into WORKER (wosalary, teid)
values (24509, 35);
insert into WORKER (wosalary, teid)
values (9691, 267);
insert into WORKER (wosalary, teid)
values (19638, 296);
insert into WORKER (wosalary, teid)
values (4658, 38);
insert into WORKER (wosalary, teid)
values (13703, 246);
insert into WORKER (wosalary, teid)
values (9620, 128);
insert into WORKER (wosalary, teid)
values (15230, 63);
insert into WORKER (wosalary, teid)
values (12358, 376);
insert into WORKER (wosalary, teid)
values (1084, 171);
insert into WORKER (wosalary, teid)
values (24889, 388);
insert into WORKER (wosalary, teid)
values (5642, 263);
insert into WORKER (wosalary, teid)
values (24294, 52);
insert into WORKER (wosalary, teid)
values (4487, 234);
insert into WORKER (wosalary, teid)
values (10379, 28);
insert into WORKER (wosalary, teid)
values (905, 232);
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
values (19679, 98);
insert into WORKER (wosalary, teid)
values (19951, 107);
insert into WORKER (wosalary, teid)
values (17027, 250);
insert into WORKER (wosalary, teid)
values (12703, 152);
insert into WORKER (wosalary, teid)
values (7239, 1);
insert into WORKER (wosalary, teid)
values (15816, 359);
insert into WORKER (wosalary, teid)
values (10817, 175);
insert into WORKER (wosalary, teid)
values (15053, 385);
insert into WORKER (wosalary, teid)
values (23471, 188);
insert into WORKER (wosalary, teid)
values (1102, 283);
insert into WORKER (wosalary, teid)
values (14280, 191);
insert into WORKER (wosalary, teid)
values (10834, 41);
commit;
prompt 232 records loaded
prompt Loading REOPRTEV...
prompt Table is empty
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
prompt Table is empty
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
