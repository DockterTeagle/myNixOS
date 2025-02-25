{pkgs, ...}: {
  home.packages = with pkgs; [
    (
      writeShellScriptBin "protonhax"
      ''
        export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus
        phd=$${XDG_RUNTIME_DIR:-/run/user/$UID}/protonhax
        notify-send "ScriptStart" "protonhaxscriptstart"
        # Function to print usage
        usage() {
            echo "Usage:"
            echo "protonhax init <cmd>"
            printf "\tShould only be called by Steam with \"protonhax init %%COMMAND%%\"\n"
            echo "protonhax ls"
            printf "\tLists all currently running games\n"
            echo "protonhax run <appid> <cmd>"
            printf "\tRuns <cmd> in the context of <appid> with proton\n"
            echo "protonhax cmd <appid>"
            printf "\tRuns cmd.exe in the context of <appid>\n"
            echo "protonhax exec <appid> <cmd>"
            printf "\tRuns <cmd> in the context of <appid>\n"
        }

        # List of all variables in the script that could contain paths
        path_vars=(
          "phd"
          "XDG_RUNTIME_DIR"
          "STEAM_COMPAT_DATA_PATH"
          "STEAM_COMPAT_CLIENT_INSTALL_PATH"
          "STEAM_COMPAT_INSTALL_PATH"
          "STEAM_COMPAT_LIBRARY_PATHS"
          "STEAM_RUNTIME_LIBRARY_PATH"
          "STEAM_COMPAT_TOOL_PATHS"
          "STEAM_EXTRA_COMPAT_TOOLS_PATHS"
        )

        # Function to check if a variable points to a valid path
        check_path_var() {
          local var_name="$1"
          local var_value="$${!var_name}"

          if [[ -n "$var_value" && "$var_value" =~ ^/ ]]; then
            if [[ ! -e "$var_value" ]]; then
              notify-send "ProtonHax Warning" "Invalid path: $var_name ($var_value) does not exist." --urgency=critical
            fi
          fi
        }

        # Loop through all predefined path variables
        for var in "''${path_vars[@]}"; do
          check_path_var "$var"
        done

        # If arguments are missing, show usage
        if [[ $# -lt 1 ]]; then
            usage
            exit 1
        fi

        c=$1
        shift

        if [[ "$c" == "init" ]]; then
            mkdir -p $phd/$SteamAppId
            printf "%s\n" "$${@}" | grep -m 1 "/proton" > $phd/$SteamAppId/exe
            printf "%s" "$STEAM_COMPAT_DATA_PATH/pfx" > $phd/$SteamAppId/pfx
            declare -px > $phd/$SteamAppId/env
            "$@"
            ec=$?
            rm -r $phd/$SteamAppId
            exit $ec
        elif [[ "$c" == "ls" ]]; then
            if [[ -d $phd ]]; then
                ls -1 $phd
            fi
        elif [[ "$c" == "run" ]] || [[ "$c" == "cmd" ]] || [[ "$c" == "exec" ]]; then
            if [[ $# -lt 1 ]]; then
                usage
                exit 1
            fi
            if [[ ! -d $phd ]]; then
                printf "No app running with appid \"%s\"\n" "$1"
                exit 2
            fi
            if [[ ! -d $phd/$1 ]]; then
                printf "No app running with appid \"%s\"\n" "$1"
                exit 2
            fi
            SteamAppId=$1
            shift

            if [[ ! -f "$phd/$SteamAppId/env" ]]; then
              notify-send "ProtonHax Error" "No environment file found for AppID $SteamAppId." --urgency=critical
              exit 2
            fi

            source $phd/$SteamAppId/env

            if [[ "$c" == "run" ]]; then
                if [[ $# -lt 1 ]]; then
                    usage
                    exit 1
                fi
                exec "$(cat $phd/$SteamAppId/exe)" run "$@"
            elif [[ "$c" == "cmd" ]]; then
                exec "$(cat $phd/$SteamAppId/exe)" run "$(cat $phd/$SteamAppId/pfx)/drive_c/windows/system32/cmd.exe"
            elif [[ "$c" == "exec" ]]; then
                if [[ $# -lt 1 ]]; then
                    usage
                    exit 1
                fi
                exec "$@"
            fi
        else
            printf "Unknown command %s\n" "$c"
            usage
            exit 1
        fi
      ''
    )

    (
      writeShellScriptBin "home-manager-rollback"
      #bash
      ''
        GENERATION=$(home-manager generations | fzf | awk -F '-> ' '{print $2 "/activate"}')

        if [[ -n "$GENERATION" && -f "$GENERATION" ]]; then
            source "$GENERATION"
        else
            echo "No generation selected or invalid selection."
            exit 1
        fi
      ''
    )
    (
      writeShellScriptBin "file-search"
      #bash
      ''
        fd --type f --hidden --exclude .git --color=always . | rofi -dmenu -i -p "Search Files:" -markup-rows
      ''
    )
  ];
}
