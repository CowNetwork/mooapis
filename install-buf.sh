#!/bin/bash
BUF_VERSION=0.41.0
CACHE=$HOME/.cache/bin

export PATH=$PATH:$CACHE
export GOBIN=$CACHE

mkdir -p "$CACHE"

curl -sSL "https://github.com/bufbuild/buf/releases/download/v$BUF_VERSION/buf-Linux-x86_64" -o "$CACHE/buf"
ls -al "$CACHE/buf"
echo $PATH

chmod +x "$CACHE/buf"
