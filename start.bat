@echo off
set serverName="Arab DayZ FPP PVE|PVP|PVAI"
set serverLocation="D:\steamcmd\steamapps\common\DayZServer"
set serverPort=2302
set serverConfig=serverDZ.cfg
set profile=Server1
set serverCPU=2
title %serverName% batch
cd "%serverLocation%"
echo (%time%) %serverName% started.
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% "-mod=@CF;@VPPAdminTools;@Dabs Framework;@DayZ-Expansion-Licensed;@DayZ-Expansion-Bundle;@SNAFU Weapons" -port=%serverPort% "-profiles=%profile%" -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck
timeout 14390
taskkill /im DayZServer_x64.exe /F
goto start


