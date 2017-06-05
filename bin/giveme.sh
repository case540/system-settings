#!/bin/bash

function quota()
{
    day=$(date | cut -f1 -d ' ')
    if [[ ( $day == "Sun" ) || ( $day == "Sat" ) ]]
    then
        QUOTA=120
    else
        QUOTA=30
    fi
}

function give_me()
{
    let SPENT=$(head -n 1 ~/.config/giveme/spent.log)
    let ASKING=$(($SPENT + $1))
    quota
    if [[ $ASKING -gt $QUOTA ]]
    then
        echo "Rejected, you have already spent $SPENT minutes"
        exit 1
    else
        kill -9 $2
        chattr -i ~/.config/giveme/spent.log
        chmod 740 ~/.config/giveme/spent.log
        echo $ASKING > ~/.config/giveme/spent.log
        chmod 440 ~/.config/giveme/spent.log
        chattr +i ~/.config/giveme/spent.log
        sleep $(($1 * 60))
        google-chrome chrome-extension://laankejkbhbdhmipfmgcngdelahlfoji/options.html &> /dev/null
    fi
}

(give_me $1 $2 &> /dev/null)&
