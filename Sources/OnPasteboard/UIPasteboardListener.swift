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

public enum OnPasteboardValue {
    case string(matching: NSRegularExpression)
}

#if !os(macOS)
import UIKit
import SwiftUI
import Combine

public final class PasteboardListener: ObservableObject {
    
    private static let applicationActive = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    
    private var appActive: AnyCancellable? = nil
    
    init() {
        
    }
    
    
//    private func checkPasteboard(matching stringPattern: NSRegularExpression) {
//        if let pasteboardString = UIPasteboard.general.string,
//           let all = NSRange(pasteboardString),
//           let result = stringPattern.firstMatch(in: pasteboardString, options: [], range: all)
//        {
//            let range = Range(result.range, in: pasteboardString)
//        }
//    }
}
#endif
