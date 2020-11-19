scheme_name='OnPasteboardChange-Package'
testerino_project='Tests/OnPasteboardChangeTests/testerino-crossplatform/testerino-crossplatform.xcodeproj'

#xcodebuild build -sdk iphoneos -scheme $scheme_name

# Build testerino app
# xcodebuild build -sdk iphonesimulator -scheme 'testerino-crossplatform (iOS)' -project $testerino_project
killall Simulator
defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool false
open -a Simulator.app
sleep 5
osascript -e 'tell application "System Events" to keystroke "k" using {command down, shift down}'
osascript -e 'tell application "System Events" to keystroke "k" using {command down, shift down}'
xcodebuild test -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11' -scheme 'testerino-crossplatform (iOS)' -project $testerino_project
killall Simulator
defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool true

# xcodebuild test -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11' -scheme $scheme_name
