# OnPasteboardChange

A SwiftUI View modifier for UIKit and AppKit that runs whenever the pasteboard changes.

## Installation

Supports iOS 14.0+ and macOS 11.0+.

### Swift Package Manager

In Xcode, File -> Swift Packages -> Add Package Dependency... and paste `https://github.com/kyle-n/OnPasteboardChange`.

### CocoaPods

Add `pod OnPasteboardChange` to your `Podfile` and run `pod install` in your project directory.

## Usage

```swift
import OnPasteboardChange

struct ContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .padding()
                .onPasteboardChange {
                    print("The clipboard was changed!")
                    let latestItem = UIPasteboard.general.items.first
                }
        }
    }
}
```

The idea with this modifier is only to alert your code the pasteboard has changed. Your code can then check the pasteboard, read from it, write to it or do anything you like. 

The callback function passed into `.onPasteboardChange` does not pass any information about the contents of the clipboard. This avoids triggering the iOS 14+ clipboard alert.

The modifier will pick up changes to the pasteboard while the app is in the background. This works on iOS and macOS. 

## Credits

Created by [Kyle Nazario](https://twitter.com/kbn_au).
