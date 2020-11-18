//
//  PasteboardChangeStore.UIKit.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

import Combine
#if os(macOS)
import AppKit
#else
import UIKit
#endif

final class PasteboardChangeStore: ObservableObject {
    
    private var pasteboardChangedSubscription: AnyCancellable? = nil
    
    private let callback: PasteboardCallback
    
    init(for pasteboard: UIOrNSPasteboard, callback: @escaping PasteboardCallback) {
        self.callback = callback
        self.pasteboardChangedSubscription = getPasteboardChangedPublisher(pasteboard: pasteboard)
            .sink { [weak self] _ in self?.callback() }
    }
    
    #if os(macOS)
    private func getPasteboardChangedPublisher(pasteboard: UIOrNSPasteboard) -> AnyPublisher<Void, Never> {
        // AppKit has no pasteboard changed notification, so we poll changeCount
        // https://stackoverflow.com/questions/5033266/can-i-receive-a-callback-whenever-an-nspasteboard-is-written-to#comment107052280_5033480
        Timer.publish(every: 2, on: .current, in: .common)
            .autoconnect()
            .map { _ in
                let count = pasteboard.changeCount
                return count
            }
            .merge(with: Just(pasteboard.changeCount))
            .removeDuplicates()
            .dropFirst()
            .void()
            .eraseToAnyPublisher()
    }
    #else
    private func getPasteboardChangedPublisher(pasteboard: UIOrNSPasteboard) -> AnyPublisher<Void, Never> {
        let pasteboardChangedInApp = NotificationCenter.default.publisher(for: UIPasteboard.changedNotification)
        let applicationActived = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
        return pasteboardChangedInApp
            .merge(with: applicationActived)
            .map { _ -> Int in
                // clone value for removeDuplicates
                let count = pasteboard.changeCount
                return count
            }
            .merge(with: Just(pasteboard.changeCount))
            .print()
            .removeDuplicates()
            .dropFirst()
            .print()
            .void()
            .eraseToAnyPublisher()
    }
    #endif
}
