FROM fedora:30

LABEL version="1.11.2.1"

ENV NAME Bedrock-Server
ENV arc=bedrock-server-1.11.2.1.zip
ENV dlarc=https://minecraft.azureedge.net/bin-linux/${arc}

WORKDIR /opt/minecraft

RUN dnf -y upgrade && dnf -y install unzip && dnf clean all && rm -rf /var/cache/dnf
# RUN ["dnf", "-y", "install", "unzip"]
# RUN ["dnf", "clean", "all"]
# RUN ["rm", "-rf", "/var/cache/dnf"]
RUN ["mkdir", "/opt/minecraft/worlds"]

# VOLUME ["/opt/minecraft/permissions.json"]
# VOLUME ["/opt/minecraft/server.properties"]
# VOLUME ["/opt/minecraft/whitelist.json"]
# VOLUME ["/opt/minecraft/worlds"]

ADD ${dlarc} ${arc}
RUN unzip -n ${arc}

ADD ./startup.sh /opt/minecraft/
RUN ["chmod", "+x", "/opt/minecraft/startup.sh"]

EXPOSE 19132
EXPOSE 19133

ENTRYPOINT ["/opt/minecraft/startup.sh", "/bin/bash"]