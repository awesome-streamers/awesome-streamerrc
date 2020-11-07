#!/usr/bin/env bash

PERSONAL_SESSION="vimdeathmatch"
DEATHMATCH="~/personal/VimDeathmatch/server"
VWM="~/personal/vim-with-me/v3"
TVUI="~/work/tvui"
TVUI_AUTOMATION="~/work/tvui-automation"
MILO="~/work/milo"
NRDP_BUILD="~/work/builds"
NRDP="~/work/nrdp"

createWindow() {
    session=$1
    window=$2
    shift
    shift
    hasWindow=$(tmux list-windows -t $session | grep "$window")
    if [ -z "$hasWindow" ]; then
        cmd="tmux neww -t $session: -n $window -d"
        if [ $# -gt 0 ]; then
            cmd="$cmd $@"
        fi
        echo "Creating Window(\"$hasWindow\"): $cmd"
        eval $cmd
    fi
}

createSession() {
    session=$1
    window=$2
    shift
    shift
    cmd="tmux new -s $session -d -n $window $@ > /dev/null 2>&1"

    echo "Creating Session: $cmd"
    eval $cmd
}

while [ "$#" -gt 0 ]; do
    curr=$1
    shift

    case "$curr" in
    "-m")
        createSession tvui primary
        createWindow tvui milo_dta -c $MILO/dist "dtalocal"
        createWindow tvui milo -c $MILO
        ;;
    "-n")
        createSession tvui primary
        version=$1
        if [ -z $version ]; then
            echo "-n should have the next argument contain a number"
            exit 1
        fi

        shift
        createWindow tvui build_nrdp -c $NRDP_BUILD/$version
        createWindow tvui vim_nrdp -c $NRDP
        ;;

    "-ta")
        createSession tvui primary -c $TVUI_AUTOMATION
        createWindow tvui tvui_automation -c $TVUI_AUTOMATION
        createWindow tvui tvui_automation_vim -c $TVUI_AUTOMATION
        ;;

    "-t")
        createSession tvui primary -c $TVUI
        createWindow tvui tvui_server -c $TVUI "./tvui server"
        createWindow tvui tvui_client -c $TVUI "./tvui client"
        ;;

    "--vwm")
        createSession $PERSONAL_SESSION primary -c $VWM
        createWindow $PERSONAL_SESSION vwm -c $VWM "NVIM_LISTEN_ADDRESS=/tmp/nvim2 go run main.go"
        ;;

    "--deathmatch")
        createSession $PERSONAL_SESSION primary -c $DEATHMATCH
        createWindow $PERSONAL_SESSION server -c $DEATHMATCH/server "docker-compose up --build"
        tmux next-window -t $PERSONAL_SESSION:primary
        ;;

    "--dm-logging")
        createSession $PERSONAL_SESSION primary -c $DEATHMATCH
        tmux split-window -t $PERSONAL_SESSION:primary -p 35 -h tail -F ~/.local/share/nvim/VimDeathmatch.log
        ;;

    *) echo "Unavailable command... $curr"
    esac
done

