SET TEST=FIND CPU COMPLETE NAME
	wmic cpu get name > %HOMEPATH%wmic_cpu.log
		
SET TEST=FIND DIMM1
	wmic memorychip where (DeviceLocator = "DIMM 1") get Capacity, Speed, DeviceLocator > %HOMEPATH%memA_WMIC.LOG

SET TEST=FIND TOUCHPAD 		
	powershell -command Get-CimInstance Win32_PointingDevice > %HOMEPATH%TPAD_POWERSHELL.LOG
	
set TEST=FIND NETWORK 
	wmic nic where (True=PhysicalAdapter) get Name > %HOMEPATH%WLAN_WMIC.LOG