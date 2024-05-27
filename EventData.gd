
[General]
Version=1

[Preferences]
Username=
Password=2430
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MORIYA11
Name=EVENT
Count=400

[Record]
Name=EVID
Type=NUMBER
Size=
Data=Random(30, 999)
Master=

[Record]
Name=EVENAME
Type=VARCHAR2
Size=255
Data=List('Fire', 'Earthquake', 'Active Shooter', 'Tornado', 'Flood', 'Hurricane', 'Chemical Spill', 'Power Outage', 'Gas Leak', 'Medical Emergency')
Master=

[Record]
Name=EVEDATE
Type=DATE
Size=
Data=Random(01/01/2000, 01/01/2025)
Master=

[Record]
Name=EVELOCATION
Type=VARCHAR2
Size=255
Data=List('Acre', 'Afula', 'Arad', 'Ariel', 'Ashdod', 'Ashkelon', 'Baka al-Gharbiyye', 'Bat Yam', 'Beersheba', 'Beit Shean', 'Beit Shemesh', 'Beitar Illit', 'Bnei Brak', 'Dimona', 'Eilat', 'Elad', 'Givatayim', 'Giv'at Shmuel', 'Hadera', 'Haifa', 'Herzliya', 'Hod HaSharon', 'Holon', 'Jerusalem', 'Karmiel', 'Kafr Qasim', 'Kfar Saba', 'Kfar Yona', 'Kiryat Ata', 'Kiryat Bialik', 'Kiryat Gat', 'Kiryat Malakhi', 'Kiryat Motzkin', 'Kiryat Ono', 'Kiryat Shmona', 'Kiryat Yam', 'Lod', 'Ma'alot-Tarshiha', 'Ma'ale Adumim', 'Migdal HaEmek', 'Modi'in-Maccabim-Re'ut', 'Modi'in Illit', 'Nahariya', 'Nazareth', 'Nesher', 'Ness Ziona', 'Netanya', 'Netivot', 'Nof HaGalil', 'Ofakim', 'Or Akiva', 'Or Yehuda', 'Petah Tikva', 'Qalansawe', 'Ra'anana', 'Ramat Gan', 'Ramat HaSharon', 'Ramla', 'Rehovot', 'Rishon LeZion', 'Rosh HaAyin', 'Safed', 'Sakhnin', 'Sderot', 'Shefa-Amr', 'Tamra', 'Tayibe', 'Tel Aviv', 'Tiberias', 'Tirat Carmel', 'Tira', 'Umm al-Fahm', 'Yehud-Monosson', 'Yokneam Illit', 'Yavne')
Master=

[Record]
Name=EVRESPONSIBILLITY
Type=VARCHAR2
Size=255
Data=List('Berne','Wrennie', 'Fanya')
Master=

[Record]
Name=EVEDESCRIBE
Type=VARCHAR2
Size=255
Data=List('Building blaze', 'Ground shaking', 'Armed assailant', 'Rotating storm', 'Water inundation', 'Severe cyclone', 'Hazardous leak', 'Electricity failure', 'Toxic emission', 'Health crisis')
Master=

