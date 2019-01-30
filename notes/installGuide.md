I've decided to write the definitive guide to installing the bedrock server so you and your friends can all play together.


# Windows
1. Download the software [from here](https://minecraft.net/en-us/download/server/bedrock/).
2. Extract the archive to where you would like to run it from.
3. Edit your config files to your liking.
4. Double-click "bedrock_server.exe"

# Linux
Contrary to what it says on the website, the server will run on any version of Linux as long as you have the dependencies installed.

1. Make sure you have the correct packages installed:

    * Debian, Ubuntu, Mint, other deb based distros:
    ```
    sudo apt -y install unzip curl
    ```

    * Redhat, CentOS:
    ```
    yum -y install unzip curl
    ```

    * Fedora
    ```
    dnf -y install unzip curl
    ```

2. Dowload the file [from here](https://minecraft.net/en-us/download/server/bedrock/).
    ```
    curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.8.0.24.zip -o bedrock-server-1.8.0.24.zip
    ```

3. Extract the file to where you would like to run it from:
    ```
    unzip -d <folder of your choosing> bedrock-server-1.8.0.24.zip
    ```

4. Change into the directory where you extracted it.
5. Edit your config files to your liking.
6. Run the command to start the server:
    ```
    LD_LIBRARY_PATH=. ./bedrock_server
    ```

# Docker
I decided to write my own docker container and script to make it easy to get it going, but you need to already have a server up and running with Docker. You can head over to [my Githib repo](https://github.com/IMetZach/bedrock-server) and check it out if you like. Any feedback is appreciated.

1. Download the launcher script:
    ```
    curl https://github.com/IMetZach/bedrock-server/blob/master/minecraft_launcher.sh -o minecraft_launcher.sh
    ```

2.  Edit the file where it says "base_dir=" to point where you want your game files saved at and the save your changes. Currently it's set to /var/games
3. Make the file executable:
    ```
    chmod +x minecraft_launcher.sh
    ```

4. Run the file with your game name as the argument:
    ```
    ./minecraft_launcher.sh <game name>
    ```

5. Watch your game start. Once it's done you can immediately start playing or
6. Stop the new game server:
    ```
    sudo docker stop <game name>
    ```

7. Change to the directory you pointed "base_dir" to and you will see a new directory named after your game.
8. Edit your config files to your liking.
9. Start your game back up with:
    ```
    sudo docker start <game name>
    ```

The logs will appear as part of your docker logs so you can view them with:

    journalctl -u docker

or

    journalctl -f -u docker

to follow the logs in real time. Use "ctrl+c" leave the journal.

# AWS or Azure
If you are going to pay to have a server running in the cloud, then just realm server.