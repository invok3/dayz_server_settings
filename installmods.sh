#!/bin/bash

STEAMCMD_DIR="$HOME/steamcmd"
STEAM_USER="anonymous"
STEAM_PASS=""
DAYZ_WORKSHOP_ID="221100"
MODS_TARGET="$HOME/.steam/steam/SteamApps/common/DayZServer"

# List of mod IDs with desired final folder names
declare -A MODS
MODS=(
    ["1559212036"]="@CF"
    ["1828439124"]="@VPPAdminTools"
    ["2709913010"]="@SNAFU_Weapons"
    ["2887981730"]="@Dabs_Framework"
    ["2116157322"]="@DayZ-Expansion-Licensed"
    ["2116154102"]="@DayZ-Expansion-Bundle"
)

cd "$MODS_TARGET"

for MOD_ID in "${!MODS[@]}"; do
    "$STEAMCMD_DIR/steamcmd.sh" +login $STEAM_USER $STEAM_PASS \
        +force_install_dir "$MODS_TARGET" \
        +workshop_download_item $DAYZ_WORKSHOP_ID $MOD_ID validate +quit
done

# Rename folders after download
for MOD_ID in "${!MODS[@]}"; do
    [ -d "$MODS_TARGET/$MOD_ID" ] && mv -f "$MODS_TARGET/$MOD_ID" "$MODS_TARGET/${MODS[$MOD_ID]}"
done

echo "Done. Mods are downloaded directly into DayZServer and renamed."