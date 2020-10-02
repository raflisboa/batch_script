:START
REM This test uses an Intel APP (PowerLog3.0.exe) to verify a specific CPU frequence.
REM This test occured into Windows 10 x64 Environment.

@echo off
REM This routine uses WMIC Windows function to return Intelดs CPU Name. Just for check.
SET TEST=CPU ID CHECK
	wmic cpu get name > cpu.log
	echo type cpu.log

:FREQ_TEST

REM This routine starts PowerLog3.0.exe app with correct parameters.
REM Results are save into .csv and .log files.
SET TEST=CPU FREQUENCY TEST
SET DIR="C:\Program Files\Intel\Power Gadget 3.5"
	call %DIR%\PowerLog3.0.exe -resolution 8000 -verbose -cmd start > %DIR%\cpu_freq.log
		if %errorlevel% == 1 goto fail

REM This routine, for example, wish to find 400 Mhz into .csv file. This value can be updated and adapted to your needed.		
:FREQ_CHECK
SET TEST=CPU FREQUENCY CHECK
	FIND /I " 400," %DIR%\PowerLog.csv
		if %errorlevel% == 0 goto fail
			
:pass
CLS
color 2f
echo            ษออออออออออออออออออออออออออออออออออออออออป
echo            บ   %name% TEST PASS          บ
echo            ศออออออออออออออออออออออออออออออออออออออออผ
goto end

:fail
TASKKILL /F /IM PowerLog3.0.exe
CLS
color 4f
echo            ษออออออออออออออออออออออออออออออออออออออออป
echo            บ   %name% TEST FAIL          บ
echo            ศออออออออออออออออออออออออออออออออออออออออผ
echo            STEP: %test%
ECHO.
ECHO.
GOTO END

:end