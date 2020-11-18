//
//  OPCPasteboardItem.UIKit.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

#if !os(macOS)
import UIKit
import Combine

final class PasteboardChangeStore: ObservableObject {
    
    // UIKit hooks
    private static let pasteboardChangedInApp = NotificationCenter.default.publisher(for: UIPasteboard.changedNotification)
    private static let applicationActived = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    private static var systemPasteboardChangeCount: Int { UIPasteboard.general.changeCount }
    
    private static let pasteboardChanged: AnyPublisher<Void, Never> = { () -> AnyPublisher<Void, Never> in
        pasteboardChangedInApp
            .merge(with: applicationActived)
            .map { _ -> Int in
                let count = systemPasteboardChangeCount
                return count
            }
            .merge(with: Just(systemPasteboardChangeCount))
            .print()
            .removeDuplicates()
            .dropFirst()
            .print()
            .map { _ in Void() }
            .eraseToAnyPublisher()
    }()
    
    private var pasteboardChangedSubscription: AnyCancellable? = nil
    private let callback: PasteboardCallback
    
    init(callback: @escaping PasteboardCallback) {
        self.callback = callback
    }
    
    func initializeSubscriptions() {
        pasteboardChangedSubscription = PasteboardChangeStore.pasteboardChanged
            .sink { _ in self.callback() }
    }
}

#endif
