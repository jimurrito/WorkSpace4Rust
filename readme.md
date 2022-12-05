# Workspace 4 Rust Development
### VS Code-Server pre-configured for Rust development
#
This is a remote VSCode server, that has tools pre-installed, that can assist in the development of Rust or Non-Rust applications. 🦀

<br>

> ### Table of Contents
> - [Components]()
> - [Workspace Shortcuts (wksp)]()
> - [Docker CLI]()
> - [How to connect]()
> - [Default Extensions]()
> - [How to connect]()
> - [Creating custom wksp commands]()
> - [Links]()

#

## Components
- Rust (cargo, rustup, etc)
- Python3 & Pip
- Docker
- Custom shortcuts *
- Optional set of default VSCode extensions *

## [*] WorkSpace Shortcuts (wksp)
Custom shortcuts for a combination of common tasks to help the lifecyle of app developement. 
A primary case being: ' `wksp -C` '; When used, it removes all containers, and images from docker. Helping clear up a workspace mid-project.
The default set of extensions can be installed with: ' `wksp -I` '.

---

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

## How to connect

1. Install the [Remote Explorer Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) in VSCode
2. Select the Remote Explorer tab on the left-side bar
3. Create a new host, using the IP and Port combination chosen for the conatiner
4. Connect to the container and enter the password chosen in the docker run command issues. Default: `***password***`
   
   (OPTIONAL) Attach a filesystem to the /keys volume to get access to the generated SSH key.

---

## Default Extensions [ `wkps -I` ] 
- [Rust Analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
- [Docker Tools](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml)
- [Markdown Lint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [Shellcheck](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck)
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- [Python-tools](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [VS Code Counter]([Python-tools](https://marketplace.visualstudio.com/items?itemName=ms-python.python))

---

## Creating custom wksp commands
   Open the `/wksp/root.sh` file via your chosen IDE
   ```sh
   nano /wksp/root.sh
   ```
   or
   
   By using this command built into wksp
   ```sh
   wksp -N <(Opt)IDE> # Default IDE is nano
   ```
   Then navigate down to line '45', and create your new commands.
   ```sh
    (39) ......
    (40) #
    (41) # ---------------------------------
    (42) # [[[ CUSTOM COMMANDS ]]]
    (43) #
    (44) # <Command description>
    (45) elif [ "$1" = "--<long-arg>" ] || [ "$1" = "-<short-arg>" ]; then
    (46)     <EXECUTION_COMMAND>
    (47) #
    (48) # ---------------------------------
    (50) #
    (51) ......
   ```
   ```sh
   elif [ "$1" = "--<long-arg>" ] || [ "$1" = "-<short-arg>" ]; then
       <EXECUTION_COMMAND>
   ```
   - It's recommended to save the Command script to the `/wksp` directory.
   - Try and follow the cmd template above.
   - Recommend to add your new cmd to `/wksp/help.info`
   - If you create anything cool, please create a pull request. Always looking for more ways to improve the development of most applications. ❤️

#

## Links
- [Github repo]()
- [Docker Hub]()

#

If you run into any problems, or just have a question. Please submit an issue @ https://github.com/jimurrito/code-server4rs/issues
