#!/bin/bash
BUF_VERSION=0.41.0
BIN=/usr/local/bin

mkdir -p "$CACHE"

curl -sSL "https://github.com/bufbuild/buf/releases/download/v$BUF_VERSION/buf-Linux-x86_64" -o "$BIN/buf"
chmod +x "$BIN/buf"
