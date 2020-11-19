scheme_name='OnPasteboardChange-Package'

#xcodebuild build -sdk iphoneos -scheme $scheme_name
xcodebuild test -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11' -scheme $scheme_name
