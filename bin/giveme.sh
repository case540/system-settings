#!/bin/bash

function give_me()
{
    SPENT=$(head -n 1 ~/.config/giveme/spent.log)
    ASKING=$(($SPENT + $1))

