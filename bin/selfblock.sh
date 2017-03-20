#!/bin/bash

BLOCKLIST=("eu.lolsports.com" "www.lolsports.com" "na.lolsports.com" "lolsports.com" "m.twitter.com" "techcrunch.com" "www.techcrunch.com" "theverge.com" "www.theverge.com" "www.twitter.com" "twitter.com" "twitch.tv" "www.twitch.tv" "www.facebook.com" "m.facebook.com" "m.reddit.com" "reddit.com" "www.reddit.com" "m.youtube.com" "www.youtube.com" "youtube.com" "linkedin.com" "www.linkedin.com")
BLOCK_BASE="127.0.0.1"
ETC_FILE="/etc/hosts"
DELAY_IN_SEC=300

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
            sudo echo "$ITEM" >> $ETC_FILE && if [ "$QUITE" != "yes" ]; then echo "Added $i"; fi
        fi
    done
}

function stop_blocking()
{
    for i in "${BLOCKLIST[@]}"
    do
        ITEM="$BLOCK_BASE $i"
        if grep -q "$ITEM" "$ETC_FILE"; then
            sudo sed -i "/^$ITEM$/d" "$ETC_FILE" && if [ "$QUITE" != "yes" ]; then echo "Deleted $i"; fi
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
            echo "Option unknown"
            shift
            exit 1;
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

