#!/bin/bash

serverName="Arab DayZ EXP PVE|PVP|PVAI"
serverLocation="/home/gamer/.steam/SteamApps/common/DayZServer"
serverPort=2302
serverConfig="serverDZ.cfg"
profile="Server1"
serverCPU=2
mods="@CF;@VPPAdminTools;@Dabs Framework;@DayZ-Expansion-Licensed;@DayZ-Expansion-Bundle;@SNAFU Weapons"

cd "$serverLocation" || exit

echo "$(date '+%H:%M:%S') $serverName started."

./DayZServer -config="$serverConfig" \
  -mod="$mods" \
  -port=$serverPort \
  -profiles="$profile" \
  -cpuCount=$serverCPU \
  -dologs -adminlog -netlog -freezecheck

# Optional auto-restart after 4 hours (14390 sec ≈ 4h)
sleep 14390
pkill -f DayZServer
exec "$0"