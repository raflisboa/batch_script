:START
@echo off
REM This is a project to join powershell aplications into an batchfile script. 
REM It will be usefull to aplications that needs hardware access, like this. Enjoy!

:TEST_TOOL
SET TEST=SET TOOLS
REM This is direct way to invoke a powershell script inside a batchfile script.
REM In this case, it will return touchpad (pointing Device) return (from a Laptop).
	powershell -command Get-CimInstance Win32_PointingDevice > C:\WIN\touchpad_status.LOG

:PRESENCE_TEST
SET TEST=CHECK TOUCHPAD
REM Using Batchfile�s FIND function, it possible check if a touchpad is connected or not.
	FIND /I "Mouse" C:\WIN\touchpad_status.LOG
		IF %errorlevel% == 1 GOTO FAIL
		
:pass
CLS
color 2f
echo            ����������������������������������������ͻ
echo            �   %name% TEST PASS          �
echo            ����������������������������������������ͼ
goto end

:fail
color 4f
echo            ����������������������������������������ͻ
echo            �   %name% TEST FAIL          �
echo            ����������������������������������������ͼ
echo            STEP: %test%
ECHO.
ECHO.
GOTO END

:end