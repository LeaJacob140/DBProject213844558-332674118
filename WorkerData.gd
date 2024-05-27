
[General]
Version=1

[Preferences]
Username=
Password=2724
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MORIYA11
Name=WORKER
Count=400

[Record]
Name=WOSALARY
Type=NUMBER
Size=
Data=Random(600, 25000)
Master=

[Record]
Name=TEID
Type=NUMBER
Size=
Data=List(select TeId from TeamP)
Master=

