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

public final class PasteboardListener: ObservableObject {
    
    private static let applicationActive = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    
    private var pasteboardTarget: PasteboardTarget
    private var pasteboardCancellable: AnyCancellable? = nil
    
    init(pasteboardTarget: PasteboardTarget) {
        self.pasteboardTarget = pasteboardTarget
    }
    
    func initializeSubscriptions() {
        self.pasteboardCancellable = NotificationCenter.default.publisher(for: UIPasteboard.changedNotification)
            .sink { [weak self] _ in
                switch self?.pasteboardTarget {
                case .string(let stringPattern, let onMatch):
                    self?.checkPasteboard(matching: stringPattern, onMatch: onMatch)
                case .none:
                    print("none")
                }
            }
    }
    
    
    private func checkPasteboard(matching stringPattern: NSRegularExpression, onMatch: PasteboardTarget.StringCallback) {
        if let pasteboardString = UIPasteboard.general.string,
           let all = NSRange(pasteboardString),
           let result = stringPattern.firstMatch(in: pasteboardString, options: [], range: all),
           let range = Range(result.range, in: pasteboardString)
        {
            onMatch(pasteboardString, pasteboardString[range])
        }
    }
}
#endif
