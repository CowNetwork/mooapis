#!/bin/bash
BUF_VERSION=0.41.0
UNAME_OS=$(shell uname -s)
UNAME_ARCH=$(shell uname -m)
CACHE_BASE=$HOME/.cache
CACHE_BIN=$CACHE/bin

export PATH=$PATH:$CACHE_BIN
export GOBIN=$CACHE_BIN

curl -sSL "https://github.com/bufbuild/buf/releases/download/v$BUF_VERSION/buf-$UNAME_OS-$UNAME_ARCH" -o "$CACHE_BIN/buf"
chmod +x "$CACHE_BIN/buf"
