#!/usr/bin/env bash

testerino_project='Tests/OnPasteboardChangeTests/testerino-crossplatform/testerino-crossplatform.xcodeproj'

killall Simulator
defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool false
open -a Simulator.app
sleep 2
osascript -e 'tell application "Simulator" to activate'
osascript -e 'tell application "System Events" to keystroke "k" using {command down, shift down}'
osascript -e 'tell application "System Events" to keystroke "k" using {command down, shift down}'
xcodebuild test -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11' -scheme 'testerino-crossplatform (iOS)' -project $testerino_project
killall Simulator
defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool true

xcodebuild test -sdk macosx11.0 -destination 'platform=OS X,arch=x86_64' -scheme 'testerino-crossplatform (macOS)' -project $testerino_project
