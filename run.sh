#!/bin/bash

docker run --name dnscrypt.eu-nl-proxy \
	-d -p 127.0.0.1:53:53/udp -p 172.17.0.0:53:53/udp dnscrypt-proxy

