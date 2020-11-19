scheme_name='OnPasteboardChange-Package'

xcodebuild build -sdk iphoneos -scheme $scheme_name
xcodebuild test -destination 'name=iPhone 11' -scheme $scheme_name
