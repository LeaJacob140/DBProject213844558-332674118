--prompt PL/SQL Developer import file
--prompt Created on יום ראשון 07 יולי 2024 by מוריה חדד
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
;
alter table EVENT
  add primary key (EVID)
  ;

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
alter table TEAMP
  add foreign key (ROID)
  references ROLESP (ROID);

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
  boname         VARCHAR2(255) not null,
  boid           INTEGER not null,
  bophone        VARCHAR2(15) not null,
  evid           INTEGER not null,
  readinesslevel VARCHAR2(50)
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
;
alter table PRACTICING
  add primary key (EMDRID, TEID)
  ;
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
prompt Disabling triggers for TAKINGPART...
alter table TAKINGPART disable all triggers;
prompt Disabling foreign key constraints for TEAMP...
alter table TEAMP disable constraint SYS_C008866;
prompt Disabling foreign key constraints for ACTIN...
alter table ACTIN disable constraint SYS_C008874;
alter table ACTIN disable constraint SYS_C008875;
prompt Disabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES disable constraint SYS_C008891;
prompt Disabling foreign key constraints for PRACTICING...
alter table PRACTICING disable constraint SYS_C008884;
alter table PRACTICING disable constraint SYS_C008885;
prompt Disabling foreign key constraints for WORKER...
alter table WORKER disable constraint SYS_C008870;
prompt Disabling foreign key constraints for REOPRTEV...
alter table REOPRTEV disable constraint SYS_C008879;
alter table REOPRTEV disable constraint SYS_C008880;
prompt Disabling foreign key constraints for TAKINGPART...
alter table TAKINGPART disable constraint SYS_C008858;
prompt Deleting TAKINGPART...
delete from TAKINGPART;
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
prompt Deleting ROLESP...
delete from ROLESP;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Loading EVENT...
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Gas Leak', to_date('15-01-2017', 'dd-mm-yyyy'), 'Nesher', 'Fanya', 'Rotating storm', 182);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Power Outage', to_date('26-06-2009', 'dd-mm-yyyy'), 'Tayibe', 'Berne', 'Armed assailant', 62);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Hurricane', to_date('26-03-2012', 'dd-mm-yyyy'), 'Ashdod', 'Berne', 'Ground shaking', 269);
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
commit;
prompt 100 records committed...
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
values ('Hurricane', to_date('12-02-2009', 'dd-mm-yyyy'), 'Rehovot', 'Wrennie', 'Electricity failure', 256);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('28-05-2009', 'dd-mm-yyyy'), 'Modi''in Illit', 'Wrennie', 'Hazardous leak', 294);
insert into EVENT (evename, evedate, evelocation, evresponsibillity, evedescribe, evid)
values ('Earthquake', to_date('06-08-2019', 'dd-mm-yyyy'), 'Lod', 'Wrennie', 'Electricity failure', 172);
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
commit;
prompt 200 records committed...
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
commit;
prompt 300 records committed...
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
commit;
prompt 329 records loaded
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
prompt Loading EMERGENCYDRILL...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 2, 30, 'tornado drill', '2902 Clemons Crossing', 364, 'PO Box 37418');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 1, 45, 'tornado drill', '48 Erie Circle', 435, 'Room 970');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 3, 180, 'active shooter drill', '87528 Oneill Crossing', 24, 'PO Box 24972');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 4, 45, 'earthquake drill', '54 Mariners Cove Junction', 158, 'PO Box 49321');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-12-2024', 'dd-mm-yyyy'), 10, 45, 'active shooter drill', '2437 Commercial Court', 322, 'Room 1419');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 16, 180, 'fire drill', '43604 Village Road', 497, 'Room 1017');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-01-2004', 'dd-mm-yyyy'), 136, 120, 'tornado drill', 'Nahariya', 537, 'Dimona''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-02-2010', 'dd-mm-yyyy'), 247, 535, 'tornado drill', 'Arad', 504, 'Karmiel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-04-2019', 'dd-mm-yyyy'), 103, 750, 'evacuation drill', 'Giv''atayim', 990, '''24 HaTikva St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-03-2009', 'dd-mm-yyyy'), 96, 287, 'tornado drill', 'Eilat', 13, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-09-2022', 'dd-mm-yyyy'), 413, 437, 'evacuation drill', 'Petah Tikva', 338, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-09-2017', 'dd-mm-yyyy'), 813, 179, 'active shooter drill', 'Arad', 506, 'Nahariya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-02-2020', 'dd-mm-yyyy'), 312, 449, 'active shooter drill', 'Sakhnin', 276, '''29 HaNegev Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-09-2001', 'dd-mm-yyyy'), 766, 651, 'earthquake drill', 'Safed', 566, '''21 Jaffa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-03-2005', 'dd-mm-yyyy'), 132, 389, 'evacuation drill', 'Qalansawe', 917, 'Nahariya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-07-2005', 'dd-mm-yyyy'), 317, 222, 'fire drill', 'Umm al-Fahm', 222, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-11-2007', 'dd-mm-yyyy'), 644, 136, 'evacuation drill', 'Netanya', 334, 'Arad''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-12-2002', 'dd-mm-yyyy'), 681, 710, 'evacuation drill', 'Beit Shemesh', 786, 'Bat Yam''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-02-2006', 'dd-mm-yyyy'), 342, 603, 'earthquake drill', 'Rehovot', 103, '''19 HaRav Kook St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 366, 20, 'evacuation drill', 'Dimona', 364, 'Giv''atayim''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-06-2005', 'dd-mm-yyyy'), 22, 157, 'evacuation drill', 'Ramat Gan', 971, '''2 Jabotinsky St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-01-2002', 'dd-mm-yyyy'), 470, 45, 'evacuation drill', 'Giv''atayim', 845, 'Netanya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-01-2014', 'dd-mm-yyyy'), 876, 48, 'active shooter drill', 'Rishon LeZion', 410, 'Rishon LeZion''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-11-2014', 'dd-mm-yyyy'), 990, 717, 'active shooter drill', 'Dimona', 72, '''13 Weizmann Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-03-2022', 'dd-mm-yyyy'), 555, 690, 'earthquake drill', 'Umm al-Fahm', 408, 'Bat Yam''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-06-2024', 'dd-mm-yyyy'), 760, 492, 'fire drill', 'Qalansawe', 899, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-01-2016', 'dd-mm-yyyy'), 856, 715, 'evacuation drill', 'Nazareth', 818, '''17 HaEmek St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-09-2021', 'dd-mm-yyyy'), 656, 46, 'fire drill', 'Afula', 138, 'Ashkelon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-10-2000', 'dd-mm-yyyy'), 76, 252, 'fire drill', 'Umm al-Fahm', 65, 'Karmiel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-11-2008', 'dd-mm-yyyy'), 535, 745, 'evacuation drill', 'Beit Shemesh', 35, 'Be''er Sheva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-05-2003', 'dd-mm-yyyy'), 236, 461, 'earthquake drill', 'Yavne', 888, 'Umm al-Fahm''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-05-2009', 'dd-mm-yyyy'), 57, 546, 'tornado drill', 'Netanya', 17, '''24 HaTikva St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-11-2009', 'dd-mm-yyyy'), 395, 323, 'earthquake drill', 'Hadera', 766, 'Karmiel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-11-2024', 'dd-mm-yyyy'), 14, 772, 'tornado drill', 'Raanana', 316, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-06-2022', 'dd-mm-yyyy'), 203, 417, 'active shooter drill', 'Safed', 950, 'Qalansawe''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-05-2010', 'dd-mm-yyyy'), 559, 540, 'earthquake drill', 'Beit Shemesh', 131, '''14 HaNassi St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-05-2018', 'dd-mm-yyyy'), 689, 804, 'active shooter drill', 'Bnei Brak', 493, '''34 HaGilboa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-08-2021', 'dd-mm-yyyy'), 853, 424, 'fire drill', 'Afula', 187, '''1 Rothschild Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-06-2004', 'dd-mm-yyyy'), 890, 824, 'active shooter drill', 'Umm al-Fahm', 788, '''34 HaGilboa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-08-2017', 'dd-mm-yyyy'), 951, 778, 'tornado drill', 'Karmiel', 1000, '''13 Weizmann Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-02-2005', 'dd-mm-yyyy'), 602, 366, 'earthquake drill', 'Lod', 591, '''15 HaMelacha St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-10-2004', 'dd-mm-yyyy'), 875, 712, 'fire drill', 'Lod', 520, 'Qalansawe''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-04-2004', 'dd-mm-yyyy'), 69, 231, 'fire drill', 'Raanana', 484, 'Qalansawe''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-10-2006', 'dd-mm-yyyy'), 776, 221, 'active shooter drill', 'Sderot', 405, '''17 HaEmek St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-05-2002', 'dd-mm-yyyy'), 108, 884, 'earthquake drill', 'Holon', 222, 'Giv''atayim''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 117, 677, 'evacuation drill', 'Lod', 419, 'Hadera''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-02-2015', 'dd-mm-yyyy'), 303, 414, 'earthquake drill', 'Karmiel', 881, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-10-2014', 'dd-mm-yyyy'), 77, 413, 'earthquake drill', 'Tel Aviv', 739, 'Be''er Sheva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-04-2020', 'dd-mm-yyyy'), 126, 801, 'earthquake drill', 'Umm al-Fahm', 178, '''17 HaEmek St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-08-2007', 'dd-mm-yyyy'), 187, 305, 'evacuation drill', 'Haifa', 480, '''1 Rothschild Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-04-2017', 'dd-mm-yyyy'), 932, 732, 'tornado drill', 'Modi''in', 134, 'Afula''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-05-2020', 'dd-mm-yyyy'), 538, 848, 'evacuation drill', 'Kiryat Shmona', 800, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-03-2008', 'dd-mm-yyyy'), 940, 812, 'tornado drill', 'Raanana', 834, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-01-2012', 'dd-mm-yyyy'), 785, 353, 'evacuation drill', 'Modi''in', 700, 'Rehovot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-10-2005', 'dd-mm-yyyy'), 930, 228, 'earthquake drill', 'Lod', 984, '''14 HaNassi St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-08-2002', 'dd-mm-yyyy'), 63, 713, 'fire drill', 'Eilat', 967, '''20 HaAri St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-07-2004', 'dd-mm-yyyy'), 744, 745, 'earthquake drill', 'Raanana', 468, 'Safed''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-06-2004', 'dd-mm-yyyy'), 897, 150, 'earthquake drill', 'Tirat Carmel', 367, 'Sakhnin''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-10-2008', 'dd-mm-yyyy'), 645, 299, 'earthquake drill', 'Karmiel', 126, 'Beit Shemesh''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-11-2002', 'dd-mm-yyyy'), 880, 320, 'evacuation drill', 'Giv''atayim', 16, 'Sakhnin''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-08-2012', 'dd-mm-yyyy'), 389, 48, 'active shooter drill', 'Bnei Brak', 709, '''21 Jaffa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-12-2016', 'dd-mm-yyyy'), 253, 159, 'tornado drill', 'Tirat Carmel', 685, 'Holon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-06-2020', 'dd-mm-yyyy'), 412, 583, 'active shooter drill', 'Bnei Brak', 280, '''19 HaRav Kook St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-05-2018', 'dd-mm-yyyy'), 197, 513, 'fire drill', 'Nazareth', 347, 'Dimona''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-03-2006', 'dd-mm-yyyy'), 28, 552, 'evacuation drill', 'Dimona', 553, '''12 Moshe Dayan Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-11-2011', 'dd-mm-yyyy'), 685, 480, 'fire drill', 'Dimona', 536, 'Arad''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-12-2016', 'dd-mm-yyyy'), 915, 815, 'earthquake drill', 'Acre', 521, '''34 HaGilboa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-01-2016', 'dd-mm-yyyy'), 667, 321, 'fire drill', 'Rishon LeZion', 623, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 629, 459, 'tornado drill', 'Rishon LeZion', 663, '''33 HaTzafon St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-05-2021', 'dd-mm-yyyy'), 272, 219, 'fire drill', 'Ramat Gan', 14, 'Karmiel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-07-2007', 'dd-mm-yyyy'), 326, 888, 'active shooter drill', 'Dimona', 719, 'Or Yehuda''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-02-2007', 'dd-mm-yyyy'), 189, 609, 'fire drill', 'Yavne', 112, 'Kfar Saba''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-07-2020', 'dd-mm-yyyy'), 532, 337, 'active shooter drill', 'Raanana', 896, '''35 HaAlon St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-10-2005', 'dd-mm-yyyy'), 414, 138, 'evacuation drill', 'Be''er Sheva', 630, '''11 Sokolov St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-02-2000', 'dd-mm-yyyy'), 593, 593, 'earthquake drill', 'Modi''in', 148, '''31 HaPalmach St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-09-2007', 'dd-mm-yyyy'), 796, 39, 'fire drill', 'Bnei Brak', 225, '''5 Weizmann St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-03-2017', 'dd-mm-yyyy'), 534, 588, 'fire drill', 'Bnei Brak', 268, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-05-2009', 'dd-mm-yyyy'), 235, 451, 'earthquake drill', 'Eilat', 312, '''27 HaNarkis St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-01-2021', 'dd-mm-yyyy'), 428, 753, 'earthquake drill', 'Jerusalem', 606, '''33 HaTzafon St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-08-2014', 'dd-mm-yyyy'), 659, 544, 'tornado drill', 'Safed', 22, '''24 HaTikva St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-03-2012', 'dd-mm-yyyy'), 180, 807, 'evacuation drill', 'Nahariya', 807, 'Arad''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-06-2020', 'dd-mm-yyyy'), 939, 249, 'active shooter drill', 'Modi''in', 613, '''25 Sheshet HaYamim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-09-2007', 'dd-mm-yyyy'), 827, 459, 'fire drill', 'Hadera', 607, 'Giv''atayim''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-04-2008', 'dd-mm-yyyy'), 465, 74, 'tornado drill', 'Acre', 708, '''12 Moshe Dayan Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-07-2004', 'dd-mm-yyyy'), 222, 795, 'active shooter drill', 'Umm al-Fahm', 990, '''8 Aluf Sadeh St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-10-2000', 'dd-mm-yyyy'), 24, 766, 'evacuation drill', 'Ashdod', 748, 'Qalansawe''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 215, 685, 'evacuation drill', 'Nahariya', 502, '''3 Herzl St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-07-2000', 'dd-mm-yyyy'), 461, 545, 'earthquake drill', 'Ashkelon', 736, 'Dimona''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-06-2005', 'dd-mm-yyyy'), 486, 508, 'evacuation drill', 'Ashdod', 363, 'Beit Shemesh''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-11-2002', 'dd-mm-yyyy'), 521, 428, 'evacuation drill', 'Safed', 570, '''16 Keren HaYesod St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-02-2022', 'dd-mm-yyyy'), 504, 320, 'active shooter drill', 'Qalansawe', 528, 'Acre''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 401, 347, 'earthquake drill', 'Qalansawe', 134, '''23 HaShalom St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-10-2014', 'dd-mm-yyyy'), 788, 604, 'tornado drill', 'Sakhnin', 438, 'Dimona''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-01-2018', 'dd-mm-yyyy'), 416, 641, 'tornado drill', 'Kfar Saba', 103, 'Umm al-Fahm''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-03-2010', 'dd-mm-yyyy'), 441, 562, 'tornado drill', 'Yavne', 378, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-06-2015', 'dd-mm-yyyy'), 592, 716, 'earthquake drill', 'Ashkelon', 838, 'Tirat Carmel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-01-2011', 'dd-mm-yyyy'), 115, 501, 'earthquake drill', 'Raanana', 399, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-09-2014', 'dd-mm-yyyy'), 765, 833, 'earthquake drill', 'Arad', 82, '''7 Begin Rd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-10-2014', 'dd-mm-yyyy'), 543, 868, 'evacuation drill', 'Bnei Brak', 605, '''15 HaMelacha St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-03-2013', 'dd-mm-yyyy'), 43, 439, 'fire drill', 'Rishon LeZion', 790, 'Rehovot''');
commit;
prompt 100 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-09-2013', 'dd-mm-yyyy'), 39, 661, 'earthquake drill', 'Be''er Sheva', 440, 'Sderot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 740, 162, 'active shooter drill', 'Netanya', 890, 'Acre''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-09-2009', 'dd-mm-yyyy'), 585, 788, 'evacuation drill', 'Afula', 585, '''29 HaNegev Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-06-2007', 'dd-mm-yyyy'), 603, 329, 'tornado drill', 'Or Yehuda', 785, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-11-2019', 'dd-mm-yyyy'), 581, 279, 'active shooter drill', 'Modi''in', 125, '''7 Begin Rd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-06-2006', 'dd-mm-yyyy'), 857, 835, 'fire drill', 'Nahariya', 478, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-09-2020', 'dd-mm-yyyy'), 955, 899, 'earthquake drill', 'Kiryat Shmona', 435, 'Yavne''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-04-2015', 'dd-mm-yyyy'), 140, 755, 'evacuation drill', 'Tiberias', 365, 'Holon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-01-2021', 'dd-mm-yyyy'), 29, 86, 'active shooter drill', 'Kfar Saba', 397, '''2 Jabotinsky St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-05-2015', 'dd-mm-yyyy'), 390, 235, 'earthquake drill', 'Or Yehuda', 96, '''3 Herzl St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-05-2021', 'dd-mm-yyyy'), 746, 561, 'evacuation drill', 'Umm al-Fahm', 34, 'Kfar Saba''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-08-2008', 'dd-mm-yyyy'), 259, 142, 'earthquake drill', 'Umm al-Fahm', 487, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-03-2017', 'dd-mm-yyyy'), 277, 64, 'active shooter drill', 'Arad', 259, 'Or Yehuda''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 84, 41, 'tornado drill', 'Modi''in', 387, '''19 HaRav Kook St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-12-2002', 'dd-mm-yyyy'), 684, 172, 'evacuation drill', 'Kiryat Shmona', 366, '''20 HaAri St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 353, 572, 'evacuation drill', 'Acre', 53, 'Safed''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-07-2004', 'dd-mm-yyyy'), 931, 367, 'earthquake drill', 'Qalansawe', 527, '''7 Begin Rd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-08-2007', 'dd-mm-yyyy'), 833, 809, 'tornado drill', 'Eilat', 81, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-02-2018', 'dd-mm-yyyy'), 749, 892, 'tornado drill', 'Bat Yam', 341, 'Jerusalem''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-05-2022', 'dd-mm-yyyy'), 708, 309, 'earthquake drill', 'Acre', 885, 'Or Yehuda''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-05-2005', 'dd-mm-yyyy'), 759, 643, 'evacuation drill', 'Jerusalem', 483, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-09-2003', 'dd-mm-yyyy'), 98, 517, 'fire drill', 'Karmiel', 718, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-02-2021', 'dd-mm-yyyy'), 917, 741, 'evacuation drill', 'Yavne', 650, 'Beit Shemesh''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-06-2016', 'dd-mm-yyyy'), 149, 113, 'active shooter drill', 'Acre', 791, 'Acre''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-10-2001', 'dd-mm-yyyy'), 234, 741, 'tornado drill', 'Sakhnin', 746, 'Haifa''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-03-2013', 'dd-mm-yyyy'), 632, 373, 'active shooter drill', 'Hadera', 490, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-06-2000', 'dd-mm-yyyy'), 32, 829, 'earthquake drill', 'Bat Yam', 789, 'Tirat Carmel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-05-2006', 'dd-mm-yyyy'), 590, 601, 'evacuation drill', 'Eilat', 857, 'Petah Tikva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-11-2019', 'dd-mm-yyyy'), 148, 810, 'evacuation drill', 'Or Yehuda', 802, 'Or Yehuda''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-04-2004', 'dd-mm-yyyy'), 320, 293, 'tornado drill', 'Eilat', 621, '''19 HaRav Kook St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-09-2016', 'dd-mm-yyyy'), 715, 66, 'active shooter drill', 'Hadera', 103, 'Rishon LeZion''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-06-2000', 'dd-mm-yyyy'), 639, 745, 'earthquake drill', 'Kiryat Shmona', 83, 'Beit Shemesh''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-03-2006', 'dd-mm-yyyy'), 791, 390, 'active shooter drill', 'Tel Aviv', 483, '''25 Sheshet HaYamim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-08-2010', 'dd-mm-yyyy'), 580, 783, 'tornado drill', 'Herzliya', 453, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-10-2021', 'dd-mm-yyyy'), 491, 875, 'tornado drill', 'Sderot', 900, '''26 HaDekel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 954, 736, 'active shooter drill', 'Hadera', 831, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-03-2000', 'dd-mm-yyyy'), 298, 429, 'active shooter drill', 'Giv''atayim', 792, 'Rishon LeZion''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-05-2007', 'dd-mm-yyyy'), 503, 574, 'evacuation drill', 'Giv''atayim', 584, '''5 Weizmann St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-10-2010', 'dd-mm-yyyy'), 114, 354, 'earthquake drill', 'Nazareth', 98, 'Tirat Carmel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-08-2022', 'dd-mm-yyyy'), 663, 701, 'fire drill', 'Ashdod', 502, '''7 Begin Rd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 100, 672, 'tornado drill', 'Bat Yam', 700, '''33 HaTzafon St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-10-2006', 'dd-mm-yyyy'), 526, 714, 'active shooter drill', 'Sakhnin', 880, 'Bat Yam''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-12-2011', 'dd-mm-yyyy'), 19, 425, 'active shooter drill', 'Sakhnin', 303, 'Or Yehuda''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 384, 572, 'tornado drill', 'Lod', 92, 'Arad''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-07-2001', 'dd-mm-yyyy'), 118, 332, 'fire drill', 'Bat Yam', 308, 'Arad''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-05-2016', 'dd-mm-yyyy'), 369, 355, 'earthquake drill', 'Hadera', 826, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2000', 'dd-mm-yyyy'), 898, 582, 'tornado drill', 'Safed', 152, 'Kfar Saba''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-12-2006', 'dd-mm-yyyy'), 284, 865, 'earthquake drill', 'Holon', 393, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-10-2008', 'dd-mm-yyyy'), 513, 809, 'tornado drill', 'Ramat Gan', 60, 'Ashkelon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-03-2019', 'dd-mm-yyyy'), 208, 803, 'evacuation drill', 'Afula', 665, 'Acre''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-03-2008', 'dd-mm-yyyy'), 107, 694, 'tornado drill', 'Sakhnin', 326, '''12 Moshe Dayan Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-09-2013', 'dd-mm-yyyy'), 434, 696, 'active shooter drill', 'Or Yehuda', 789, '''3 Herzl St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-04-2011', 'dd-mm-yyyy'), 505, 483, 'tornado drill', 'Acre', 465, 'Ashkelon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-11-2024', 'dd-mm-yyyy'), 124, 858, 'active shooter drill', 'Eilat', 839, '''14 HaNassi St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-09-2009', 'dd-mm-yyyy'), 554, 165, 'evacuation drill', 'Rishon LeZion', 464, '''24 HaTikva St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-08-2009', 'dd-mm-yyyy'), 478, 66, 'earthquake drill', 'Rishon LeZion', 944, '''11 Sokolov St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-04-2014', 'dd-mm-yyyy'), 563, 69, 'fire drill', 'Afula', 356, 'Sderot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-10-2002', 'dd-mm-yyyy'), 794, 741, 'evacuation drill', 'Tel Aviv', 63, 'Beit Shemesh''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2017', 'dd-mm-yyyy'), 701, 203, 'active shooter drill', 'Acre', 234, '''24 HaTikva St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-12-2009', 'dd-mm-yyyy'), 403, 480, 'active shooter drill', 'Ashkelon', 610, '''8 Aluf Sadeh St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-12-2013', 'dd-mm-yyyy'), 905, 316, 'earthquake drill', 'Be''er Sheva', 254, 'Sderot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-09-2010', 'dd-mm-yyyy'), 425, 785, 'earthquake drill', 'Giv''atayim', 277, '''13 Weizmann Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-01-2010', 'dd-mm-yyyy'), 166, 393, 'evacuation drill', 'Hadera', 418, 'Netanya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-01-2021', 'dd-mm-yyyy'), 161, 685, 'active shooter drill', 'Qalansawe', 817, 'Ashdod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-02-2002', 'dd-mm-yyyy'), 159, 865, 'evacuation drill', 'Nahariya', 64, 'Ashkelon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-04-2013', 'dd-mm-yyyy'), 135, 84, 'earthquake drill', 'Karmiel', 912, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-05-2019', 'dd-mm-yyyy'), 800, 138, 'fire drill', 'Kfar Saba', 497, '''29 HaNegev Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-09-2016', 'dd-mm-yyyy'), 780, 189, 'earthquake drill', 'Giv''atayim', 758, '''24 HaTikva St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-03-2020', 'dd-mm-yyyy'), 219, 680, 'evacuation drill', 'Petah Tikva', 470, 'Tirat Carmel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-03-2000', 'dd-mm-yyyy'), 385, 545, 'tornado drill', 'Sakhnin', 857, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-07-2017', 'dd-mm-yyyy'), 111, 533, 'fire drill', 'Yavne', 514, '''28 HaBesor St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-05-2021', 'dd-mm-yyyy'), 835, 412, 'earthquake drill', 'Afula', 702, 'Safed''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-10-2024', 'dd-mm-yyyy'), 42, 164, 'earthquake drill', 'Arad', 293, 'Petah Tikva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-10-2021', 'dd-mm-yyyy'), 407, 665, 'tornado drill', 'Bat Yam', 243, 'Umm al-Fahm''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-02-2006', 'dd-mm-yyyy'), 150, 858, 'evacuation drill', 'Or Yehuda', 705, '''30 HaZayit St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-10-2004', 'dd-mm-yyyy'), 664, 561, 'active shooter drill', 'Kfar Saba', 130, 'Nahariya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-01-2009', 'dd-mm-yyyy'), 466, 556, 'tornado drill', 'Rehovot', 287, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-03-2022', 'dd-mm-yyyy'), 325, 289, 'fire drill', 'Yavne', 661, 'Herzliya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-09-2011', 'dd-mm-yyyy'), 231, 227, 'tornado drill', 'Hadera', 118, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-08-2007', 'dd-mm-yyyy'), 133, 677, 'earthquake drill', 'Giv''atayim', 380, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-04-2019', 'dd-mm-yyyy'), 903, 198, 'fire drill', 'Sderot', 85, 'Hadera''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-03-2003', 'dd-mm-yyyy'), 20, 754, 'earthquake drill', 'Afula', 16, 'Safed''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-02-2002', 'dd-mm-yyyy'), 539, 575, 'evacuation drill', 'Safed', 344, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 467, 56, 'evacuation drill', 'Rehovot', 814, '''25 Sheshet HaYamim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-09-2014', 'dd-mm-yyyy'), 802, 385, 'evacuation drill', 'Jerusalem', 89, '''27 HaNarkis St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-12-2022', 'dd-mm-yyyy'), 709, 71, 'tornado drill', 'Ramat Gan', 583, '''14 HaNassi St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-12-2012', 'dd-mm-yyyy'), 994, 517, 'active shooter drill', 'Dimona', 634, 'Modi''in''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-06-2010', 'dd-mm-yyyy'), 640, 743, 'active shooter drill', 'Karmiel', 677, 'Sderot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-01-2008', 'dd-mm-yyyy'), 850, 741, 'fire drill', 'Nahariya', 847, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-11-2014', 'dd-mm-yyyy'), 790, 811, 'earthquake drill', 'Eilat', 451, 'Rishon LeZion''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-04-2009', 'dd-mm-yyyy'), 998, 787, 'active shooter drill', 'Modi''in', 300, 'Umm al-Fahm''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-09-2016', 'dd-mm-yyyy'), 621, 327, 'fire drill', 'Rehovot', 852, 'Yavne''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-01-2002', 'dd-mm-yyyy'), 582, 4, 'fire drill', 'Bat Yam', 71, '''31 HaPalmach St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-12-2004', 'dd-mm-yyyy'), 588, 657, 'active shooter drill', 'Tiberias', 982, 'Safed''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-11-2003', 'dd-mm-yyyy'), 762, 68, 'evacuation drill', 'Rehovot', 497, '''5 Weizmann St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-12-2016', 'dd-mm-yyyy'), 430, 205, 'earthquake drill', 'Or Yehuda', 597, 'Karmiel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-10-2001', 'dd-mm-yyyy'), 475, 31, 'evacuation drill', 'Karmiel', 725, '''2 Jabotinsky St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-02-2003', 'dd-mm-yyyy'), 174, 636, 'fire drill', 'Umm al-Fahm', 897, 'Safed''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-08-2007', 'dd-mm-yyyy'), 313, 436, 'tornado drill', 'Ashdod', 409, '''24 HaTikva St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-10-2013', 'dd-mm-yyyy'), 570, 450, 'evacuation drill', 'Giv''atayim', 125, 'Jerusalem''');
commit;
prompt 200 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-08-2023', 'dd-mm-yyyy'), 617, 545, 'fire drill', 'Rehovot', 513, '''8 Aluf Sadeh St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-10-2007', 'dd-mm-yyyy'), 710, 143, 'earthquake drill', 'Rishon LeZion', 165, '''5 Weizmann St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-10-2022', 'dd-mm-yyyy'), 507, 455, 'tornado drill', 'Yavne', 6, '''5 Weizmann St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-12-2003', 'dd-mm-yyyy'), 677, 43, 'tornado drill', 'Lod', 732, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-07-2008', 'dd-mm-yyyy'), 175, 345, 'active shooter drill', 'Raanana', 925, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-10-2005', 'dd-mm-yyyy'), 273, 278, 'tornado drill', 'Arad', 920, '''34 HaGilboa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-03-2017', 'dd-mm-yyyy'), 793, 175, 'fire drill', 'Bnei Brak', 937, 'Afula''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-11-2017', 'dd-mm-yyyy'), 431, 664, 'evacuation drill', 'Dimona', 961, 'Jerusalem''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-09-2001', 'dd-mm-yyyy'), 604, 869, 'active shooter drill', 'Nazareth', 121, '''8 Aluf Sadeh St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-03-2017', 'dd-mm-yyyy'), 436, 662, 'fire drill', 'Giv''atayim', 111, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-05-2017', 'dd-mm-yyyy'), 316, 245, 'active shooter drill', 'Modi''in', 414, 'Petah Tikva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-09-2003', 'dd-mm-yyyy'), 386, 610, 'earthquake drill', 'Holon', 667, '''8 Aluf Sadeh St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 348, 76, 'active shooter drill', 'Tirat Carmel', 675, 'Tirat Carmel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-04-2013', 'dd-mm-yyyy'), 184, 10, 'tornado drill', 'Kiryat Shmona', 942, 'Kfar Saba''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-01-2022', 'dd-mm-yyyy'), 720, 374, 'tornado drill', 'Sakhnin', 916, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-11-2003', 'dd-mm-yyyy'), 480, 340, 'fire drill', 'Tirat Carmel', 847, '''28 HaBesor St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-04-2009', 'dd-mm-yyyy'), 474, 356, 'earthquake drill', 'Bat Yam', 504, '''5 Weizmann St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-10-2006', 'dd-mm-yyyy'), 649, 335, 'tornado drill', 'Netanya', 883, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-03-2011', 'dd-mm-yyyy'), 328, 661, 'evacuation drill', 'Holon', 660, '''19 HaRav Kook St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-11-2011', 'dd-mm-yyyy'), 519, 594, 'earthquake drill', 'Rishon LeZion', 970, 'Jerusalem''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-07-2008', 'dd-mm-yyyy'), 824, 346, 'evacuation drill', 'Holon', 37, 'Or Yehuda''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-08-2011', 'dd-mm-yyyy'), 183, 700, 'active shooter drill', 'Lod', 740, 'Rehovot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-10-2015', 'dd-mm-yyyy'), 188, 667, 'tornado drill', 'Nahariya', 298, 'Ashdod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-05-2002', 'dd-mm-yyyy'), 360, 498, 'tornado drill', 'Or Yehuda', 14, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-10-2022', 'dd-mm-yyyy'), 323, 609, 'earthquake drill', 'Yavne', 877, '''1 Rothschild Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-11-2016', 'dd-mm-yyyy'), 962, 656, 'tornado drill', 'Eilat', 472, '''27 HaNarkis St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-12-2021', 'dd-mm-yyyy'), 989, 789, 'earthquake drill', 'Lod', 726, '''34 HaGilboa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-09-2022', 'dd-mm-yyyy'), 152, 667, 'active shooter drill', 'Karmiel', 178, 'Bat Yam''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-06-2024', 'dd-mm-yyyy'), 947, 448, 'fire drill', 'Yavne', 919, '''16 Keren HaYesod St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 460, 298, 'fire drill', 'Herzliya', 306, '''8 Aluf Sadeh St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-10-2001', 'dd-mm-yyyy'), 814, 304, 'fire drill', 'Giv''atayim', 315, '''34 HaGilboa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-12-2020', 'dd-mm-yyyy'), 74, 885, 'earthquake drill', 'Safed', 711, 'Lod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-02-2003', 'dd-mm-yyyy'), 492, 220, 'tornado drill', 'Beit Shemesh', 53, 'Tel Aviv''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-04-2000', 'dd-mm-yyyy'), 147, 749, 'active shooter drill', 'Bat Yam', 59, 'Rehovot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-06-2004', 'dd-mm-yyyy'), 177, 702, 'earthquake drill', 'Tel Aviv', 317, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-03-2017', 'dd-mm-yyyy'), 647, 315, 'fire drill', 'Eilat', 959, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-02-2010', 'dd-mm-yyyy'), 738, 306, 'tornado drill', 'Dimona', 558, 'Beit Shemesh''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-02-2015', 'dd-mm-yyyy'), 248, 426, 'evacuation drill', 'Umm al-Fahm', 814, 'Hadera''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-02-2024', 'dd-mm-yyyy'), 735, 271, 'earthquake drill', 'Yavne', 984, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-09-2005', 'dd-mm-yyyy'), 540, 309, 'earthquake drill', 'Dimona', 884, '''5 Weizmann St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-10-2018', 'dd-mm-yyyy'), 119, 876, 'fire drill', 'Karmiel', 321, 'Be''er Sheva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-10-2016', 'dd-mm-yyyy'), 196, 737, 'earthquake drill', 'Beit Shemesh', 868, 'Modi''in''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-02-2001', 'dd-mm-yyyy'), 240, 396, 'active shooter drill', 'Qalansawe', 861, '''19 HaRav Kook St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-10-2016', 'dd-mm-yyyy'), 477, 389, 'evacuation drill', 'Karmiel', 337, 'Safed''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-11-2019', 'dd-mm-yyyy'), 900, 386, 'tornado drill', 'Nazareth', 580, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-08-2024', 'dd-mm-yyyy'), 400, 873, 'tornado drill', 'Rishon LeZion', 541, 'Yavne''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-04-2009', 'dd-mm-yyyy'), 895, 557, 'tornado drill', 'Giv''atayim', 986, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-06-2015', 'dd-mm-yyyy'), 270, 518, 'fire drill', 'Kiryat Shmona', 273, '''13 Weizmann Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-01-2016', 'dd-mm-yyyy'), 846, 366, 'fire drill', 'Afula', 238, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-11-2005', 'dd-mm-yyyy'), 809, 46, 'evacuation drill', 'Hadera', 739, 'Herzliya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-08-2013', 'dd-mm-yyyy'), 935, 409, 'evacuation drill', 'Ramat Gan', 465, 'Kfar Saba''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-06-2012', 'dd-mm-yyyy'), 479, 362, 'earthquake drill', 'Yavne', 511, '''25 Sheshet HaYamim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-09-2022', 'dd-mm-yyyy'), 490, 432, 'fire drill', 'Sakhnin', 139, '''17 HaEmek St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 458, 330, 'active shooter drill', 'Rehovot', 372, '''29 HaNegev Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-07-2021', 'dd-mm-yyyy'), 319, 229, 'evacuation drill', 'Ashdod', 276, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-05-2016', 'dd-mm-yyyy'), 264, 847, 'tornado drill', 'Qalansawe', 991, 'Acre''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 411, 693, 'earthquake drill', 'Raanana', 883, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-04-2016', 'dd-mm-yyyy'), 243, 646, 'active shooter drill', 'Lod', 181, '''1 Rothschild Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-07-2016', 'dd-mm-yyyy'), 228, 701, 'active shooter drill', 'Bnei Brak', 151, 'Herzliya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-01-2012', 'dd-mm-yyyy'), 668, 856, 'active shooter drill', 'Ramat Gan', 174, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-05-2021', 'dd-mm-yyyy'), 304, 162, 'evacuation drill', 'Afula', 445, 'Nahariya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-02-2008', 'dd-mm-yyyy'), 816, 616, 'earthquake drill', 'Holon', 351, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-12-2021', 'dd-mm-yyyy'), 382, 237, 'fire drill', 'Umm al-Fahm', 153, '''30 HaZayit St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-01-2010', 'dd-mm-yyyy'), 977, 44, 'fire drill', 'Karmiel', 635, 'Rehovot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-04-2015', 'dd-mm-yyyy'), 949, 868, 'earthquake drill', 'Netanya', 573, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-10-2002', 'dd-mm-yyyy'), 61, 594, 'earthquake drill', 'Kiryat Shmona', 971, '''28 HaBesor St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('05-10-2022', 'dd-mm-yyyy'), 608, 277, 'fire drill', 'Bat Yam', 732, 'Herzliya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-02-2020', 'dd-mm-yyyy'), 156, 322, 'evacuation drill', 'Holon', 824, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 450, 655, 'tornado drill', 'Tiberias', 99, 'Rehovot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-10-2006', 'dd-mm-yyyy'), 737, 738, 'earthquake drill', 'Rishon LeZion', 469, '''17 HaEmek St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-01-2006', 'dd-mm-yyyy'), 165, 361, 'fire drill', 'Rehovot', 121, 'Haifa''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 15, 319, 'evacuation drill', 'Ramat Gan', 571, 'Tel Aviv''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-02-2012', 'dd-mm-yyyy'), 375, 831, 'fire drill', 'Nazareth', 34, 'Hadera''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-11-2015', 'dd-mm-yyyy'), 975, 882, 'earthquake drill', 'Eilat', 56, '''16 Keren HaYesod St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-09-2021', 'dd-mm-yyyy'), 831, 55, 'evacuation drill', 'Hadera', 449, 'Petah Tikva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-06-2001', 'dd-mm-yyyy'), 261, 391, 'fire drill', 'Modi''in', 995, 'Ashkelon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-04-2001', 'dd-mm-yyyy'), 256, 899, 'earthquake drill', 'Raanana', 133, '''19 HaRav Kook St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-11-2013', 'dd-mm-yyyy'), 704, 870, 'tornado drill', 'Acre', 686, '''31 HaPalmach St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-06-2024', 'dd-mm-yyyy'), 359, 610, 'evacuation drill', 'Be''er Sheva', 529, '''3 Herzl St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('31-01-2018', 'dd-mm-yyyy'), 227, 521, 'fire drill', 'Nazareth', 256, '''4 Hillel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-03-2003', 'dd-mm-yyyy'), 751, 555, 'earthquake drill', 'Giv''atayim', 722, 'Qalansawe''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-01-2006', 'dd-mm-yyyy'), 512, 483, 'fire drill', 'Be''er Sheva', 231, '''11 Sokolov St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-12-2014', 'dd-mm-yyyy'), 128, 55, 'fire drill', 'Eilat', 814, 'Tirat Carmel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-01-2009', 'dd-mm-yyyy'), 314, 805, 'fire drill', 'Arad', 436, 'Rehovot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-07-2008', 'dd-mm-yyyy'), 142, 484, 'tornado drill', 'Eilat', 915, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-11-2017', 'dd-mm-yyyy'), 812, 546, 'tornado drill', 'Sakhnin', 746, '''8 Aluf Sadeh St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-01-2022', 'dd-mm-yyyy'), 520, 701, 'fire drill', 'Be''er Sheva', 732, '''12 Moshe Dayan Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-04-2020', 'dd-mm-yyyy'), 356, 539, 'earthquake drill', 'Netanya', 295, 'Dimona''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-07-2018', 'dd-mm-yyyy'), 697, 562, 'earthquake drill', 'Jerusalem', 854, 'Dimona''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-12-2020', 'dd-mm-yyyy'), 657, 571, 'evacuation drill', 'Sderot', 14, '''23 HaShalom St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 262, 376, 'active shooter drill', 'Beit Shemesh', 417, '''12 Moshe Dayan Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-08-2012', 'dd-mm-yyyy'), 758, 104, 'active shooter drill', 'Eilat', 314, 'Ashdod''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 446, 529, 'fire drill', 'Sakhnin', 112, 'Haifa''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('17-11-2016', 'dd-mm-yyyy'), 72, 798, 'active shooter drill', 'Modi''in', 296, 'Or Yehuda''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-06-2016', 'dd-mm-yyyy'), 213, 845, 'active shooter drill', 'Dimona', 365, '''28 HaBesor St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('16-03-2017', 'dd-mm-yyyy'), 839, 392, 'earthquake drill', 'Ramat Gan', 147, 'Tel Aviv''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-11-2012', 'dd-mm-yyyy'), 596, 630, 'tornado drill', 'Ramat Gan', 928, '''29 HaNegev Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-10-2020', 'dd-mm-yyyy'), 983, 550, 'earthquake drill', 'Sakhnin', 462, 'Tel Aviv''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-05-2019', 'dd-mm-yyyy'), 524, 345, 'evacuation drill', 'Bat Yam', 861, '''13 Weizmann Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-01-2014', 'dd-mm-yyyy'), 899, 829, 'fire drill', 'Beit Shemesh', 167, 'Ashdod''');
commit;
prompt 300 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-12-2013', 'dd-mm-yyyy'), 798, 401, 'fire drill', 'Beit Shemesh', 572, '''22 David Remez St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-04-2000', 'dd-mm-yyyy'), 281, 583, 'fire drill', 'Arad', 767, 'Herzliya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 764, 452, 'fire drill', 'Qalansawe', 437, '''33 HaTzafon St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('28-10-2018', 'dd-mm-yyyy'), 296, 511, 'earthquake drill', 'Giv''atayim', 264, 'Sderot''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('01-07-2013', 'dd-mm-yyyy'), 289, 409, 'earthquake drill', 'Giv''atayim', 352, 'Ramat Gan''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('20-02-2013', 'dd-mm-yyyy'), 600, 894, 'fire drill', 'Safed', 692, 'Be''er Sheva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-01-2010', 'dd-mm-yyyy'), 232, 71, 'evacuation drill', 'Or Yehuda', 947, 'Qalansawe''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-10-2015', 'dd-mm-yyyy'), 878, 510, 'earthquake drill', 'Kfar Saba', 144, 'Afula''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-02-2002', 'dd-mm-yyyy'), 946, 874, 'active shooter drill', 'Petah Tikva', 454, '''10 HaTayasim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-02-2017', 'dd-mm-yyyy'), 294, 84, 'earthquake drill', 'Holon', 605, 'Modi''in''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('10-04-2008', 'dd-mm-yyyy'), 609, 511, 'tornado drill', 'Giv''atayim', 848, '''25 Sheshet HaYamim Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-12-2020', 'dd-mm-yyyy'), 146, 220, 'evacuation drill', 'Eilat', 123, '''3 Herzl St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-08-2022', 'dd-mm-yyyy'), 456, 658, 'evacuation drill', 'Kiryat Shmona', 761, '''7 Begin Rd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-10-2004', 'dd-mm-yyyy'), 447, 567, 'tornado drill', 'Be''er Sheva', 942, 'Kfar Saba''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('14-10-2004', 'dd-mm-yyyy'), 892, 515, 'earthquake drill', 'Giv''atayim', 436, '''2 Jabotinsky St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('22-04-2013', 'dd-mm-yyyy'), 468, 644, 'tornado drill', 'Modi''in', 714, 'Herzliya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('13-07-2017', 'dd-mm-yyyy'), 523, 334, 'active shooter drill', 'Eilat', 178, 'Yavne''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-10-2019', 'dd-mm-yyyy'), 971, 504, 'active shooter drill', 'Bat Yam', 412, 'Karmiel''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 807, 245, 'active shooter drill', 'Afula', 475, 'Qalansawe''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('21-09-2019', 'dd-mm-yyyy'), 121, 160, 'fire drill', 'Qalansawe', 975, '''34 HaGilboa St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-11-2019', 'dd-mm-yyyy'), 881, 479, 'active shooter drill', 'Kiryat Shmona', 628, 'Netanya''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('02-07-2017', 'dd-mm-yyyy'), 370, 577, 'earthquake drill', 'Kfar Saba', 93, '''22 David Remez St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-01-2001', 'dd-mm-yyyy'), 806, 413, 'tornado drill', 'Nahariya', 243, 'Petah Tikva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('18-12-2024', 'dd-mm-yyyy'), 733, 757, 'evacuation drill', 'Netanya', 829, '''12 Moshe Dayan Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('07-03-2006', 'dd-mm-yyyy'), 756, 298, 'tornado drill', 'Afula', 726, '''14 HaNassi St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-05-2021', 'dd-mm-yyyy'), 669, 756, 'tornado drill', 'Holon', 822, 'Hadera''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-06-2014', 'dd-mm-yyyy'), 773, 464, 'fire drill', 'Safed', 834, 'Jerusalem''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-10-2014', 'dd-mm-yyyy'), 714, 499, 'evacuation drill', 'Ramat Gan', 757, 'Giv''atayim''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('03-07-2011', 'dd-mm-yyyy'), 921, 725, 'active shooter drill', 'Modi''in', 537, 'Holon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('30-05-2013', 'dd-mm-yyyy'), 451, 566, 'earthquake drill', 'Tirat Carmel', 467, 'Kfar Saba''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('25-11-2021', 'dd-mm-yyyy'), 198, 371, 'earthquake drill', 'Lod', 491, 'Holon''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('24-02-2011', 'dd-mm-yyyy'), 630, 260, 'fire drill', 'Hadera', 697, '''11 Sokolov St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('27-05-2020', 'dd-mm-yyyy'), 435, 470, 'evacuation drill', 'Giv''atayim', 0, '''20 HaAri St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('08-08-2005', 'dd-mm-yyyy'), 50, 731, 'evacuation drill', 'Arad', 682, '''18 HaTamar St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('04-02-2008', 'dd-mm-yyyy'), 634, 778, 'tornado drill', 'Beit Shemesh', 943, '''35 HaAlon St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 170, 417, 'evacuation drill', 'Bat Yam', 427, '''28 HaBesor St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('23-06-2000', 'dd-mm-yyyy'), 862, 359, 'tornado drill', 'Dimona', 792, 'Jerusalem''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('09-02-2008', 'dd-mm-yyyy'), 271, 446, 'active shooter drill', 'Tel Aviv', 552, '''26 HaDekel St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('12-11-2014', 'dd-mm-yyyy'), 757, 562, 'active shooter drill', 'Bat Yam', 530, 'Hadera''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('29-07-2005', 'dd-mm-yyyy'), 252, 506, 'evacuation drill', 'Lod', 77, 'Be''er Sheva''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('15-09-2008', 'dd-mm-yyyy'), 871, 764, 'tornado drill', 'Nahariya', 195, '''6 Ben Gurion Blvd');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-10-2008', 'dd-mm-yyyy'), 767, 499, 'active shooter drill', 'Acre', 585, 'Bat Yam''');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('19-08-2020', 'dd-mm-yyyy'), 293, 486, 'fire drill', 'Kiryat Shmona', 596, '''31 HaPalmach St');
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress)
values (to_date('26-11-2016', 'dd-mm-yyyy'), 742, 705, 'fire drill', 'Petah Tikva', 155, '''35 HaAlon St');
commit;
prompt 344 records loaded
prompt Loading EVDEBRIEFING...
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
commit;
prompt 100 records committed...
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
commit;
prompt 200 records committed...
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
commit;
prompt 300 records committed...
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
commit;
prompt 500 records committed...
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
commit;
prompt 600 records committed...
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
commit;
prompt 700 records committed...
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
commit;
prompt 800 records committed...
insert into PRACTICING (emdrid, teid)
values (540, 85);
insert into PRACTICING (emdrid, teid)
values (540, 270);
insert into PRACTICING (emdrid, teid)
values (543, 131);
insert into PRACTICING (emdrid, teid)
values (543, 149);
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
commit;
prompt 900 records committed...
insert into PRACTICING (emdrid, teid)
values (634, 2);
insert into PRACTICING (emdrid, teid)
values (634, 51);
insert into PRACTICING (emdrid, teid)
values (634, 107);
insert into PRACTICING (emdrid, teid)
values (634, 116);
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
commit;
prompt 1000 records committed...
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
commit;
prompt 1100 records committed...
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
commit;
prompt 1200 records committed...
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
commit;
prompt 1300 records committed...
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
insert into PRACTICING (emdrid, teid)
values (998, 296);
insert into PRACTICING (emdrid, teid)
values (998, 376);
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
commit;
prompt 1400 records committed...
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
commit;
prompt 1500 records committed...
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
commit;
prompt 1571 records loaded
prompt Loading REOPRT...
insert into REOPRT (teid, debid)
values (1, 1);
insert into REOPRT (teid, debid)
values (2, 2);
commit;
prompt 2 records loaded
prompt Loading WORKER...
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
commit;
prompt 100 records committed...
insert into WORKER (wosalary, teid)
values (7242, 93);
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
commit;
prompt 200 records committed...
insert into WORKER (wosalary, teid)
values (12275, 70);
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
alter table TEAMP enable constraint SYS_C008866;
prompt Enabling foreign key constraints for ACTIN...
alter table ACTIN enable constraint SYS_C008874;
alter table ACTIN enable constraint SYS_C008875;
prompt Enabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES enable constraint SYS_C008891;
prompt Enabling foreign key constraints for PRACTICING...
alter table PRACTICING enable constraint SYS_C008884;
alter table PRACTICING enable constraint SYS_C008885;
prompt Enabling foreign key constraints for WORKER...
alter table WORKER enable constraint SYS_C008870;
prompt Enabling foreign key constraints for REOPRTEV...
alter table REOPRTEV enable constraint SYS_C008879;
alter table REOPRTEV enable constraint SYS_C008880;
prompt Enabling foreign key constraints for TAKINGPART...
alter table TAKINGPART enable constraint SYS_C008858;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for ROLESP...
alter table ROLESP enable all triggers;
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
prompt Enabling triggers for TAKINGPART...
alter table TAKINGPART enable all triggers;
set feedback on
set define on
prompt Done.
