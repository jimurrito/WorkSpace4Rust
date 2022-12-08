#!/bin/sh
# Greeting
# Runs on each iteractive login
#
# Install default extensions on run time
# 1 == instal, 0 == no install
if [ $DEFAULT_VSC_EXT -eq 1 ] || [ "$DEFAULT_VSC_EXT" = "1" ]; then
    bash /buildscripts/ext.bash
    # ensure its only installed once
    export DEFAULT_VSC_EXT=0
fi
# install extentsions temp
bash /buildscripts/ext.bash
# FUTURE MSG(s)
# - Active Docker container count
# - size of images (GBs)