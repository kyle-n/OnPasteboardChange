testerino_project='Tests/OnPasteboardChangeTests/testerino-crossplatform/testerino-crossplatform.xcodeproj'

killall Simulator
# iphone_id=$(xcrun simctl list | grep "iPhone 11 (" | head -n 2 | tail -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
# xcrun simctl erase $iphone_id

defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool false
open -a Simulator.app
sleep 2
osascript -e 'tell application "System Events" to keystroke "k" using {command down, shift down}'
osascript -e 'tell application "System Events" to keystroke "k" using {command down, shift down}'
xcodebuild test -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 12' -scheme 'testerino-crossplatform (iOS)' -project $testerino_project
killall Simulator
defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool true
