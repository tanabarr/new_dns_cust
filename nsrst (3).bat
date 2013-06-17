:Start
tasklist > tl1.log
find /C "OUTLOOK.EXE" tl1.log
IF ERRORLEVEL==1 GOTO NextApp1
:Start1
taskkill /IM OUTLOOK.EXE /T > ppgtpg.txt
choice /c yn /t 7 /d y >NUL		
tasklist > tl1.log
find /C "OUTLOOK.EXE" tl1.log
IF ERRORLEVEL==1 GOTO NextApp1
GOTO Start1
:NextApp1
find /C "wlmail.exe" tl1.log
IF ERRORLEVEL==1 GOTO NextApp2    
:Start2
taskkill /IM wlmail.exe /T >> ppgtpg.txt
choice /c yn /t 7 /d y >NUL		
tasklist > tl1.log
find /C "wlmail.exe" tl1.log
IF ERRORLEVEL==1 GOTO NextApp2
GOTO Start2
:NextApp2
find /C "NatSpeak.exe" tl1.log
IF ERRORLEVEL==1 GOTO END    
taskkill /IM NatSpeak.exe /T > ppgtpg.txt
:Start3
choice /c yn /t 7 /d y >NUL		
tasklist > tl1.log
find /C "NatSpeak.exe" tl1.log
IF ERRORLEVEL==1 GOTO END    
GOTO Start3
:END
start /B NatSpeak.exe
choice /c yn /t 5 /d y >NUL		
:: start /B "C:\Program Files\Microsoft Office\Office12\OUTLOOK.EXE"
:: TODO: start applications as above :same with Windows live mail (find way to restart)