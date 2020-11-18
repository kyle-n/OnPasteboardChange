//
//  OPCPasteboardItem.UIKit.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

#if !os(macOS)
import UIKit
import Combine

public typealias PasteboardCallback = () -> Void

public final class PasteboardChangeStore: ObservableObject {
    private static let pasteboardChanged = NotificationCenter.default.publisher(for: UIPasteboard.changedNotification)
    
    private var pasteboardChangedSubscription: AnyCancellable? = nil
    private let callback: PasteboardCallback
    
    init(callback: @escaping PasteboardCallback) {
        self.callback = callback
    }
    
    func initializeSubscriptions() {
        pasteboardChangedSubscription = PasteboardChangeStore.pasteboardChanged
            .sink { _ in
                self.callback()
            }
    }
}

#endif
