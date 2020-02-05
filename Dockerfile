FROM fedora:30

LABEL version="1.14.21.0"
LABEL description="The MineCraft Bedrock Server"
LABEL maintainer="@IMetZach"

ENV NAME Bedrock-Server
ENV arc=bedrock-server-1.14.21.0.zip
ENV dlarc=https://minecraft.azureedge.net/bin-linux/${arc}

WORKDIR /opt/minecraft

RUN dnf -y upgrade && dnf -y install unzip && dnf clean all && rm -rf /var/cache/dnf
RUN ["mkdir", "/opt/minecraft/worlds"]

ADD ${dlarc} ${arc}
RUN unzip -n ${arc}

ADD ./startup.sh /opt/minecraft/
RUN ["chmod", "+x", "/opt/minecraft/startup.sh"]

EXPOSE 19132
EXPOSE 19133

ENTRYPOINT ["/opt/minecraft/startup.sh", "/bin/bash"]
