#!/bin/sh

# print message
echo "[macOS]: enabling screen capture drop shadow..."
# disable drop shadows in screen capture
defaults write com.apple.screencapture disable-shadow -bool false

# print message
echo "[macOS]: restarting system UI server..."
# restart UI server
killall SystemUIServer
