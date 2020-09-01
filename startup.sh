#!/bin/bash

cd /opt/minecraft/
export LD_LIBRARY_PATH=.
exec ./bedrock_server
