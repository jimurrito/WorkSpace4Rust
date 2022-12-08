#!/bin/bash
#
EXTS=("rust-lang.rust-analyzer" 
"ms-azuretools.vscode-docker" 
"bungcip.better-toml" 
"ms-python.vscode-pylance" 
"ms-python.python" 
"timonwong.shellcheck" 
"uctakeoff.vscode-counter" 
"davidanson.vscode-markdownlint")
#
echo "Installing Default Server-side VSCode extensions"
#
for i in "${EXTS[@]}"; do
    code --force --install-extension "$i" 0>&1 1> /dev/null # pass both info and success output to null. Only errors will be provided
done
