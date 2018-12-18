FROM fedora:28

ENV NAME Bedrock-Server
ENV arc=bedrock-server-1.8.0.24.zip
ENV dlarc=https://minecraft.azureedge.net/bin-linux/${arc}
WORKDIR /opt/minecraft
VOLUME ["/opt/minecraft/permissions.json", "/opt/minecraft/server.properties", "/opt/minecraft/whitelist.json", "/opt/minecraft/worlds"]

RUN ["dnf", "-y", "upgrade"]
RUN ["dnf", "-y", "install", "unzip", "libstdc++"]
RUN ["dnf", "clean", "all"]
RUN ["rm", "-rf", "/var/cache/dnf"]
ADD ${dlarc} ${arc}
RUN unzip -n ${arc}

ADD ./startup.sh /opt/minecraft/
RUN ["chmod", "+x", "/opt/minecraft/startup.sh"]

EXPOSE 19132/udp

# ENV LD_LIBRARY_PATH=.
ENTRYPOINT ["/opt/minecraft/startup.sh", "/bin/bash"]