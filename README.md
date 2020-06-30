# MineCraft Bedrock Server

This is a docker container to launch and run the Official [Minecraft Bedrock Edition Server](https://minecraft.net/en-us/download/server/bedrock/) released my Microsoft and Mojang. It's vanilla and contains no add-ons or special server tools.

## Getting started (TLDR):

Simply download the file minecraft_launcher.sh, edit the "base_dir" to where you'd like your server info stored, and the run it:

```
./minecraft_launcher.sh --start <server name>
```

Then on your server navigate to where ever you pointed the base_dir to and you'll see a folder named after your games and your config files in it. You can then do:

```
sudo docker ps
```

to get the container name, which should be your server name and then do:

```
docker stop <container name>
```

Edit your config files and then start the server back up with:

```
docker start <container name>
```

## Upgrading to a newer version:
```
./minecraft_launcher.sh --upgrade <server name>
```

## Related Links
* [Docker Hub](https://hub.docker.com/repository/docker/imetzach/bedrock-server/general) - This container image on Docker Hub.
* [GitLab](https://gitlab.com/imetzach/bedrock-server) - My GitLab Repo.
* [GitHub](https://github.com/IMetZach/bedrock-server) - My GitHub Repo.
* [Minecraft Bedrock Server](https://www.minecraft.net/en-us/download/server/bedrock/) - Official page from MicroSoft and Mojang for the Bedrock Server.
* [Server Properties](https://minecraft.gamepedia.com/Server.properties#Bedrock_Edition_3) - Wiki page to help you configure your server.
