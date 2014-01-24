:: Initially try to shut down cleanly, then force. Restart Explorer to update
:: QuickStart items on taskbar on desktop
cd "C:\Program Files (x86)\Nuance\NaturallySpeaking12\Program"
SET Uf="c:\Users\%USERNAME%\Desktop\tl1.txt"
SET Ud="c:\Users\%USERNAME%\Desktop\dbg.log"
del /F %Ud%

:START
tasklist > %Uf%
find /C "natspeak.exe" %Uf%
IF ERRORLEVEL==1 GOTO END    
taskkill /IM natspeak.exe /F >> %Ud%
choice /c yn /t 8 /d y >NUL		
GOTO START
:END

:: Once shutdown, restart 
start /B natspeak.exe
choice /c yn /t 5 /d y >NUL		

:: Remove the temporary file 
del /F %Uf%

:: Restart Explorer to update desktop context 
taskkill /F /IM explorer.exe 
choice /c yn /t 5 /d y >NUL		
cd "C:\Windows" 
start /B explorer.exe

:FIN