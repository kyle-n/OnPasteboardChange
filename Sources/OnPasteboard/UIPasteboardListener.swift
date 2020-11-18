//
//  UIPasteboardListener.swift
//  
//
//  Created by Kyle Nazario on 11/17/20.
//

/**
 .onPasteboard(.string(matching: myRegex)) { strResult in
    print(strResult)
 }
 */

#if !os(macOS)
import UIKit
import SwiftUI
import Combine

extension PasteboardListener {
    
    private static let applicationActive = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    
    private func checkPasteboard(matching stringPattern: NSRegularExpression, onMatch: PasteboardTarget.RegexCallback) {
        if let pasteboardString = UIPasteboard.general.regex,
           let all = NSRange(pasteboardString),
           let result = stringPattern.firstMatch(in: pasteboardString, options: [], range: all),
           let range = Range(result.range, in: pasteboardString)
        {
            onMatch(pasteboardString, pasteboardString[range])
        }
    }
}
#endif
