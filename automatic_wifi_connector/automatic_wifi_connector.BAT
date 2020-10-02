:START
  color 1F
  
REM This code consist into automatize a wi-fi connection, with password. 
REM Tested into Windows 10 x64 OS.

:SET_VARIABLES
REM INSERT HERE YOUR LOCAL DEVCON64.EXE PATH. FOLLOW MY PERSONAL EXAMPLE -->>
SET DEVCON=D:\WIN\TOOLS\devcon64.exe
REM INSERT HERE YOUR LOCAL DELAY APP PATH. FOLLOW MY PERSONAL EXAMPLE -->>
SET DELAY=D:\WIN\TOOLS\xwdelay.exe
REM INSERT HERE YOUR LOCAL WLAN PID IDENTIFICATION. FOLLOW MY PERSONAL EXAMPLE -->>
SET WLAN=PCI\VEN_168C

:RESTART_NETWORK_CARD
REM THIS SEQUENCE RESET WITH SAFETY NETWORK CARD. FOLLOW MY PERSONAL EXAMPLE -->>
	ipconfig /flushdns
	%DELAY% 500 |cls
	ipconfig /release
	%DELAY% 500 |cls
	ipconfig /renew
	%DELAY% 500 |cls
	%DEVCON% disable *%WLAN%*
		%DELAY% 1000 |cls
	%DEVCON% enable *%WLAN%*
		%DELAY% 1000 |cls
	%DEVCON% rescan *%WLAN%*
		%DELAY% 1000 |cls

:WIFI_AUTOMATIC_LOGIN
REM THIS FUNCTION ADD A NEW NETWOK PROFILE INTO YOUR SYSTEM. FOLLOW MY PERSONAL EXAMPLE -->>
	netsh wlan add profile filename="C:\WIN\LAN\GENERIC_NETWORK_PROFILE.xml"
cls	

:CONFIRM_AUTOMATIC_LOGIN
%DEVCON% enable *%WLAN%*
	%DELAY% 1000 |cls
		ping 10.8.14.7 > NETWORK.log
	%DELAY% 500
		find "Reply from 10.8.14.7: bytes=32 time" NETWORK.log
	if not %errorlevel% == 1 goto END

:FORCE_NETWORK_RESET
ipconfig /flushdns
ipconfig /release
ipconfig /renew
%DEVCON% enable *%WLAN%*
	%DELAY% 1500
		ping 10.8.14.7 > NETWORK.log
			find "Reply from 10.8.14.7: bytes=32 time<1ms TTL=127" NETWORK.log
	if NOT %errorlevel% == 1 goto END

:END