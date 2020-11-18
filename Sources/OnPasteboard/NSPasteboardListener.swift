//
//  File.swift
//  
//
//  Created by Kyle Nazario on 11/17/20.
//

#if os(macOS)
import SwiftUI
import AppKit
import Combine

extension PasteboardListener {
    static var pasteboardChangedPublisher = Timer.publish(every: 2, on: .main, in: .common)
        .autoconnect()
        .compactMap { _ in NSPasteboard.general.pasteboardItems?.first }
        .removeDuplicates()
        .eraseToAnyPublisher()
    
    func checkPasteboard(matching stringPattern: NSRegularExpression, onMatch: PasteboardTarget.RegexCallback) {
        guard let pasteboardStringData = NSPasteboard.general.pasteboardItems?.first?.data(forType: .string),
           let pasteboardString = String(data: pasteboardStringData, encoding: .utf8)
        else { return }
        
        let all = NSRange(location: 0, length: pasteboardString.count)
        
        guard let result = stringPattern.firstMatch(in: pasteboardString, options: [], range: all),
           let range = Range(result.range, in: pasteboardString)
        else { return }
        
        onMatch(pasteboardString, pasteboardString[range])
    }
}
#endif
