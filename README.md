# MineCraft Bedrock Server

This is a docker container to launch and run the Official [Minecraft Bedrock Edition Server](https://minecraft.net/en-us/download/server/bedrock/) released my Microsoft and Mojang. It's vanilla and contains no add-ons or special server tools.

Getting started (TLDR):

Simply download the file minecraft_launcher.sh, edit the "base_dir" to where you'd like your server info stored, and the run it:

```
sudo ./minecraft_launcher.sh <server name>
```

Then on your server navigate to where ever you pointed the base_dir to and you'll see a folder named after your games and your cofig files in it. You can then do:

```
sudo docker ps
```

to get the container name, which should be your server name and then do:

```
sudo docker stop <container name>
```

Edit your config files and then start the server back up with:

```
sudo docker start <container name>
```