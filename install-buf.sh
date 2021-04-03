#!/bin/bash
BUF_VERSION=0.41.0
CACHE=$HOME/.cache/bin

export PATH=$PATH:$CACHE
export GOBIN=$CACHE

mkdir -p "$CACHE_BIN"

curl -sSL "https://github.com/bufbuild/buf/releases/download/v$BUF_VERSION/buf-Linux-x86_64" -o "$CACHE_BIN/buf"
chmod +x "$CACHE_BIN/buf"
