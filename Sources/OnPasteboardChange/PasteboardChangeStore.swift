//
//  PasteboardChangeStore.UIKit.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

import Combine

final class PasteboardChangeStore: ObservableObject {
    
    private var pasteboardChangedSubscription: AnyCancellable? = nil
    private let callback: PasteboardCallback
    
    init(callback: @escaping PasteboardCallback) {
        self.callback = callback
        self.pasteboardChangedSubscription = PasteboardChangeStore.pasteboardChanged
            .sink { [weak self] _ in self?.callback() }
    }
}

#if os(macOS)

import AppKit
extension PasteboardChangeStore {
    // AppKit has no pasteboard changed notification, so we poll changeCount
    // https://stackoverflow.com/questions/5033266/can-i-receive-a-callback-whenever-an-nspasteboard-is-written-to#comment107052280_5033480
    private static let pasteboardChanged = Timer.publish(every: 2, on: .current, in: .common)
        .autoconnect()
        .map { _ in
            let count = NSPasteboard.general.changeCount
            return count
        }
        .merge(with: Just(NSPasteboard.general.changeCount))
        .removeDuplicates()
        .dropFirst()
        .void()
        .eraseToAnyPublisher()
}

#else

import UIKit
extension PasteboardChangeStore {
    private static let pasteboardChangedInApp = NotificationCenter.default.publisher(for: UIPasteboard.changedNotification)
    private static let applicationActived = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    private static var systemPasteboardChangeCount: Int { UIPasteboard.general.changeCount }
    
    private static let pasteboardChanged: AnyPublisher<Void, Never> = { () -> AnyPublisher<Void, Never> in
        pasteboardChangedInApp
            .merge(with: applicationActived)
            .map { _ -> Int in
                // clone value for removeDuplicates
                let count = systemPasteboardChangeCount
                return count
            }
            .merge(with: Just(systemPasteboardChangeCount))
            .print()
            .removeDuplicates()
            .dropFirst()
            .print()
            .void()
            .eraseToAnyPublisher()
    }()
}
#endif
