:: Initially tried to shut down cleanly, then force. Restart Explorer to update
:: QuickStart items on taskbar on desktop
cd "C:\Program Files (x86)\Nuance\NaturallySpeaking11\Program"
find /C "NatSpeak.exe" tl1.log
IF ERRORLEVEL==1 GOTO END    
taskkill /IM NatSpeak.exe /T > ppgtpg.txt
choice /c yn /t 8 /d y >NUL		
tasklist > tl1.log
find /C "NatSpeak.exe" tl1.log
IF ERRORLEVEL==1 GOTO END    
:Start 
taskkill /IM NatSpeak.exe /F > ppgtpg.txt
choice /c yn /t 8 /d y >NUL		
IF ERRORLEVEL==1 GOTO END    
GOTO Start
:END

:: Once shutdown, restart 
start /B NatSpeak.exe
choice /c yn /t 5 /d y >NUL		
:: start /B "C:\Program Files\Microsoft Office\Office12\OUTLOOK.EXE"
:: TODO: start applications as above :same with Windows live mail (find way to restart)

:: Restart Explorer to update desktop context 
taskkill /F /IM explorer.exe 
choice /c yn /t 5 /d y >NUL		
cd "C:\Windows" 
start /B explorer.exe
