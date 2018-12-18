# MineCraft Bedrock Server

This is a docker container to launch and run the Official [Minecraft Bedrock Edition Server](https://minecraft.net/en-us/download/server/bedrock/) released my Microsoft and Mojang. It's vanilla and contains no add-ons or special server tools.

You can either do:

```
git clone https://github.com/IMetZach/bedrock-server
docker build -t <image name> .
```

Of you can just install directly to Docker with:

```
sudo docker run -d imetzach/minecraft-bedrockserver
```

The Dockerfile contains volumes for:

* permissions.json
* server.properties
* whitelist.json
* worlds