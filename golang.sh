#!/usr/bin/env bash
# Jump_start script helps to switch between projects faster
# https://github.com/gsempe/jump-start-project
#
# golang.sh defines a function to set up a Go project.

GO_VERSION="1.10.3"
GO_OS="darwin"
GO_ARCH="amd64"
GO_BIN_ARCHIVE=go${GO_VERSION}.${GO_OS}-${GO_ARCH}.tar.gz
GO_BIN_ARCHIVE_URL=https://dl.google.com/go/$GO_BIN_ARCHIVE

if [ ! -f /tmp/$GO_BIN_ARCHIVE ]; then
        step "Downloading go archive $GO_BIN_ARCHIVE_URL..."
        curl -L -s -o /tmp/$GO_BIN_ARCHIVE $GO_BIN_ARCHIVE_URL
fi
if [ ! -f $WDIR/go/bin/go ]; then
        step "Intalling go archive $GO_BIN_ARCHIVE..."
        tar xzf /tmp/$GO_BIN_ARCHIVE -C $WDIR
fi
step "Adding go to the PATH..."
export PATH=$WDIR/go/bin/:$PATH

step "Setting GOPATH to $WDIR..."
export GOPATH=$WDIR
