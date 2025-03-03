{pkgs, ...}: {
  home.packages = with pkgs; [
    (
      writeShellScriptBin "protonhax"
      ''
        phd=''${XDG_RUNTIME_DIR:-/run/user/$UID}/protonhax
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

        # Function to check if a variable points to a valid path

        # If arguments are missing, show usage
        if [[ $# -lt 1 ]]; then
            usage
            exit 1
        fi

        c=$1
        shift

        if [[ "$c" == "init" ]]; then
            mkdir -p $phd/$SteamAppId
            printf "%s\n" "''${@}" | grep -m 1 "/proton" > $phd/$SteamAppId/exe
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
  ];
}
