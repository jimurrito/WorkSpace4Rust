# Workspace 4 Rust Development

### VS Code-Server pre-configured for Rust development

This is a remote VS Code server, that has tools pre-installed, that can assist in the development of Rust or Non-Rust applications. 🦀

<br>

> ### Table of Contents
>
> - [Components](https://github.com/jimurrito/workspace4rs#components)
> - [Workspace Shortcuts (wksp)](https://github.com/jimurrito/workspace4rs#-workspace-shortcuts-wksp)
> - [SSH-Key dump](https://github.com/jimurrito/workspace4rs#ssh-key-dump)
> - [Docker CLI](https://github.com/jimurrito/workspace4rs#docker-cli-setup)
> - [How to connect](https://github.com/jimurrito/workspace4rs#how-to-connect)
> - [Default Extensions](https://github.com/jimurrito/workspace4rs#default-extensions--wkps--i-)
> - [Creating custom wksp commands](https://github.com/jimurrito/workspace4rs#creating-custom-wksp-commands)
> - [Links](https://github.com/jimurrito/workspace4rs#links)

## Components

- Rust (cargo, rustup, etc)
- Python3 & Pip
- Docker
- Custom shortcuts [*](<https://github.com/jimurrito/workspace4rs#-workspace-shortcuts-wksp>)
- Optional set of default VS Code extensions [*](<https://github.com/jimurrito/workspace4rs#-workspace-shortcuts-wksp>)

## * WorkSpace Shortcuts (wksp)

Custom shortcuts for a combination of common tasks to help the lifecyle of app developement.
A primary case being: `wksp -C`; When used, it removes all containers, and images from docker. Helping clear up a workspace mid-project.
The default set of extensions can be installed with: `wksp -I`.

## SSH-Key dump

By default, the container will generate an SSH key pair. When the user session starts, i.e the user signs into the server via SSH or VS Code, the server will copy the private key, into the `/keys` directory. If `/keys` is bound to the host via `-v`. This key can be added to your desktop to allow for seamless signon into the workspace. As of now, the password of the SSH key, is the same one set for the user.

---

## [Docker CLI Setup](https://hub.docker.com/repository/docker/jimurrito/workspace4rs)

```docker
docker run -itd \
    # *Required*
    # Port for SSH
    -p <hostport>:22 \
    # Pull mounted cgroups from host (4 Docker)
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    # *OPTIONAL*
    # SSH Private-key dump location (Recommended)
    -v <dir-2-keys>:/keys \
    # Workspaces location
    -v <dir-2-wksp>:/workspaces \
    # Password for remote connection and root user
    -e PSWD="<password>" \
    jimurrito/ionupdate_rs:latest

```

---

## How to connect

1. Install the [Remote Explorer Extension](<https://marketplace.visualstudio.com/items?itemName=ms-VS> Code-remote.remote-ssh) in VS Code
2. Select the Remote Explorer tab on the left-side bar
3. Create a new host, using the IP and Port combination chosen for the conatiner
4. Connect to the container and enter the password chosen in the docker run command issues. Default: `password`

   (OPTIONAL) Attach a filesystem to the /keys volume to get access to the generated SSH key.

---

## Default Extensions [ `wkps -I` ]

- [Rust Analyzer](<https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer>)
- [Docker Tools](<https://marketplace.visualstudio.com/items?itemName=ms-azuretools.VSCode-docker>)
- [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml>)
- [Markdown Lint](<https://marketplace.visualstudio.com/items?itemName=DavidAnson.VSCode-markdownlint>)
- [Shellcheck](<https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck>)
- [Pylance](<https://marketplace.visualstudio.com/items?itemName=ms-python.VSCode-pylance>)
- [Python-tools](<https://marketplace.visualstudio.com/items?itemName=ms-python.python>)
- [VS Code Counter](<https://marketplace.visualstudio.com/items?itemName=uctakeoff.VSCode-counter>)

---

## Creating custom wksp commands

   Open the `/wksp/root.sh` file via your chosen IDE

   ```sh
   nano /wksp/root.sh
   ```

   or

   By using this command built into wksp

   ```sh
   wksp -N "<(Opt)IDE>" # Default IDE is nano
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
    (46)     <COMMAND>
    (47) #
    (48) # ---------------------------------
    (50) #
    (51) ......
   ```

   ```sh
   elif [ "$1" = "--<long-arg>" ] || [ "$1" = "-<short-arg>" ]; then
       <COMMAND>
   ```

- It's recommended to save the Command script to the `/wksp` directory.
- Try and follow the cmd template above.
- Recommend to add your new cmd to `/wksp/help.info`
- If you create anything cool, please create a pull request. Always looking for more ways to improve the development of most applications. ❤️

#

## Links

- [Github repo](https://github.com/jimurrito/workspace4rs)
- [Docker Hub](https://hub.docker.com/repository/docker/jimurrito/workspace4rs)

#

If you run into any problems, or just have a question. Please submit an issue @ <https://github.com/jimurrito/workspace4rs/issues>
