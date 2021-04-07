#!/bin/bash
# Simply install some tools that we need in the pipelines.

BUF_VERSION=0.41.0
BUF_URL="https://github.com/bufbuild/buf/releases/download/v$BUF_VERSION/buf-Linux-x86_64"
PROTOC_GEN_GO_URL="google.golang.org/protobuf/cmd/protoc-gen-go"
PROTOC_GEN_GO_GRPC_URL="google.golang.org/grpc/cmd/protoc-gen-go-grpc"
JAVA_GRPC_VERSION=1.24.0
JAVA_GRPC_URL="https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/$JAVA_GRPC_VERSION/protoc-gen-grpc-java-$JAVA_GRPC_VERSION-linux-x86_64.exe"
GOMPLATE_VERSION=3.9.0
GOMPLATE_URL="https://github.com/hairyhenderson/gomplate/releases/download/v$GOMPLATE_VERSION/gomplate_linux-amd64"

BIN=/usr/local/bin

urls=( "$BUF_URL" "$JAVA_GRPC_URL" "$GOMPLATE_URL" )
binaries=( buf protoc-gen-java-grpc gomplate )

# Loop through all external URLs and install the binaries
for i in "${!urls[@]}"; do 
  echo "Install ${binaries[$i]} ..."
  sudo curl -sSL "${urls[$i]}" -o "$BIN/${binaries[$i]}"
  sudo chmod +x "$BIN/${binaries[$i]}"
done

# Install protoc-gen-go via Go
echo "Install protoc-gen-go and protoc-gen-go-grpc ..."
export GO111MODULE=on
go get "$PROTOC_GEN_GO_URL" "$PROTOC_GEN_GO_GRPC_URL"
echo "$(go env GOPATH)/bin" >> $GITHUB_PATH