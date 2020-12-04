# OnPasteboardChange

A SwiftUI View modifier that triggers a callback whenever the pasteboard changes. Works with UIKit and AppKit - perfect for cross-platform SwiftUI projects.

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

All this modifier does is alert your code the pasteboard has changed. Your code can then check the pasteboard, read from it, write to it or do anything you like. This way, your code can control when to check the clipboard (and when to trigger the iOS 14 "X app pasted from Y app" alert).

The modifier will pick up changes to the pasteboard while the app is in the background. This works on iOS and macOS. 

### Custom pasteboards

By default, `.onPasteboardChange` will watch `UIPasteboard.general` or `NSPasteboard.general` for changes. However, if you have a custom pasteboard, you can track changes on that as well. 

```swift
import OnPasteboardChange

struct ContentView: View {
    @State private var text: String = ""
    
    let pb = UIPasteboard.withUniqueName()
    
    var body: some View {
        VStack {
            Button("Add to Custom Pasteboard") {
                pb.addItems([["newItem": "value"]])
            }
            TextEditor(text: $text)
                .padding()
                .onPasteboardChange(for: pb) {
                    // only triggered after pressing "Add to Custom Pasteboard"
                    print("custom pb changed")
                }
        }
    }
}
```

## Credits

Created by [Kyle Nazario](https://twitter.com/kbn_au).

<img align="middle" src="https://github.com/kyle-n/OnPasteboardChange/raw/main/Tests/clippy.png" alt="Clippy wants to help you read UIPasteboard">