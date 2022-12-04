#!/bin/sh

EXTS=("rust-lang.rust-analyzer" 
"ms-azuretools.vscode-docker" 
"bungcip.better-toml" 
"ms-python.vscode-pylance" 
"ms-python.python" 
"timonwong.shellcheck" 
"uctakeoff.vscode-counter" 
"davidanson.vscode-markdownlint")

echo "Installing Default Server-side VSCode extensions"

for i in "${EXTS[@]}"; do
    code --force --install-extension "$i"
done
