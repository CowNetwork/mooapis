#!/bin/bash
VERSION=1.24.0
BIN=/usr/local/bin

sudo curl -sSL "https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/$VERSION/protoc-gen-grpc-java-$VERSION-linux-x86_64.exe" -o "$BIN/protoc-gen-java-grpc"
sudo chmod +x "$BIN/protoc-gen-java-grpc"