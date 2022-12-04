# Code-Server 4 Rust Development

This is a remote VSCode server, that has tools pre-installed, that can assist in the development of Rust or Non-Rust applications. 🦀


### Components
- Rust (cargo, rustup, etc)
- Python3 + Pip
- Docker
- Custom shortcuts *
- Optional set of default VSCode extensions *

<br>

### [*] WorkSpace Shortcuts (wksp)
Custom shortcuts for a combination of common tasks to help the lifecyle of app developement. 
A primary case being: ' ```wksp -C``` '; When used, it removes all containers, and images from docker. Helping clear up a workspace mid-project.
The default set of extensions can be installed with: ' ```wksp -I``` '.

---
<br>

## Docker CLI Setup
```docker
docker run -it \
    # *Required*
    -p <hostport>:22
    # *OPTIONAL*
    # Workspaces location
    -v <dir-2-wksp>:/workspaces
    # SSH Private key dump location
    -v <dir-2-keys>:/keys
    # Password for remote connection and root
    -e PSWD="<password>"
    # Enables session greeting
    -e SHOW_GREETING=1 \
    jimurrito/ionupdate_rs:latest

```


---
<br>

## Setup

- Install the Remote Explorer Extension in VSCode
- Select the Remote Explorer tab on the left-side bar 
- Create a new host, using the IP and Port combination chosen for the conatiner
- Connect to the container and enter the password chosen in the docker run command issues. Default: ***password***
- Attach a filesystem to the /keys volume to get access to the SSH key. Allowing for access without the password.

---
<br>

## Default Extensions
- "rust-lang.rust-analyzer" 
- "ms-azuretools.vscode-docker" 
- "davidanson.vscode-markdownlint"
- "bungcip.better-toml" 
- "ms-python.vscode-pylance" 
- "ms-python.python" 
- "timonwong.shellcheck" 
- "uctakeoff.vscode-counter" 
