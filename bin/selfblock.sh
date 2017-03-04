#!/bin/bash

BLOCKLIST=("m.wikipedia.org" "www.wikipedia.org" "wikipedia.org" "www.facebook.com" "m.facebook.com" "m.youtube.com" "www.youtube.com" "youtube.com" "netflix.com" "www.netflix.com")
BLOCK_BASE="0.0.0.0"
ETC_FILE="/etc/hosts"
DELAY_IN_SEC=300

PUNISH="no"

function resume_block()
{
    for i in "${BLOCKLIST[@]}"
    do
        ITEM="$BLOCK_BASE $i"
        if grep -q "$ITEM" "$ETC_FILE"; then
            if [ "$QUITE" != "yes" ]; then
                echo "$i is already there"
            fi
        else
            sudo echo "$ITEM" >> $ETC_FILE && PUNISH="yes" && if [ "$QUITE" != "yes" ]; then echo "Added $i"; fi
        fi
        if [ "$PUNISH" != "no" ]; then
            killall chrome &
            kill -9 $(pgrep 'term') &
            PUNISH="no"
        fi
    done
}

function stop_blocking()
{
    for i in "${BLOCKLIST[@]}"
    do
        ITEM="$BLOCK_BASE $i"
        if grep -q "$ITEM" "$ETC_FILE"; then
            sudo sed -i.bak "/^$ITEM$/d" "$ETC_FILE" && if [ "$QUITE" != "yes" ]; then echo "Deleted $i"; fi
        fi
    done
    (sleep $DELAY_IN_SEC; resume_block) &
}

while [[ $# > 0 ]]
do
    key="$1"
    case $key in
        -s|--stop)
            to_stop_blocking=yes
            shift
            ;;
        -t|--time)
            DELAY_IN_SEC="$2";
            shift
            shift
            ;;
        -r|--resume)
            to_start_blocking=yes
            shift
            ;;
        -q|--quite)
            QUITE=yes
            shift
            ;;
        -h|--help)
            display_help_message=yes
            shift
            ;;
        *)
            BLOCKLIST+=("$1")
            shift
            ;;
    esac
done

if [ "$to_start_blocking" = "yes" ]
then
    resume_block;
elif [ "$to_stop_blocking" = "yes" ]
then
    stop_blocking;
else
    echo "Doing nothing"
fi
