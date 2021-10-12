# MineCraft Bedrock Server

This is a docker container to launch and run the Official [Minecraft Bedrock Edition Server](https://minecraft.net/en-us/download/server/bedrock/) released my Microsoft and Mojang. It's vanilla and contains no add-ons or special server tools.

## Getting started (TLDR):

* Download the file minecraft_launcher.sh  
* Edit the "base_dir" to where you'd like your server info stored
* Edit the server properties to your liking  
* Run the following:

```
./minecraft_launcher.sh --start <server name>
```


## Upgrading to a newer version:
Simply run to upgrade to a newer version:

```
./minecraft_launcher.sh --upgrade <server name>
```

## Notes
- There are many forks of this project but this is the original. 
- This repo is fully automated.
- When there is a new release, this repo will auto update and rebuild the image within 30 minutes.

## Related Links
* [Docker Hub](https://hub.docker.com/repository/docker/imetzach/bedrock-server/general) - This container image on Docker Hub.
* [GitLab](https://gitlab.com/imetzach/bedrock-server) - My GitLab Repo.
* [GitHub](https://github.com/IMetZach/bedrock-server) - My GitHub Repo.
* [Minecraft Bedrock Server](https://www.minecraft.net/en-us/download/server/bedrock/) - Official page from MicroSoft and Mojang for the Bedrock Server.
* [Server Properties](https://minecraft.gamepedia.com/Server.properties#Bedrock_Edition_3) - Wiki page to help you configure your server.

"I fell into a burning ring of fire"
