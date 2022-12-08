#!/bin/sh
# Greeting
# Runs on each new session
#
# first session
if [ ! "$WELCOME" ]; then
    # Initial login message
    echo "Welcome to Workspace for Rust (workspace4rs) by Jimurrito v""$VER"
    echo "export WELCOME=1" >> ~/.bashrc
    export WELCOME=1
fi
#
# wksp reminder
echo "Type 'wksp' to view the shortcuts built into this workspace"
#
