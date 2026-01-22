#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q tuxpuck | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/flathub/org.debian.TuxPuck/refs/heads/master/tuxpuck-128.png
export DESKTOP=/usr/share/applications/tuxpuck.desktop
export DEPLOY_PIPEWIRE=1
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun /usr/bin/tuxpuck \
             /usr/share/pixmaps/tuxpuck*

# Turn AppDir into AppImage
quick-sharun --make-appimage
