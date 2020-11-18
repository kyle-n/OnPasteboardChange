//
//  File.swift
//  
//
//  Created by Kyle Nazario on 11/17/20.
//

import SwiftUI
import Combine

final class PasteboardListener: ObservableObject {
    private var pasteboardTarget: PasteboardTarget
    private var pasteboardCancellable: AnyCancellable? = nil
    
    init(pasteboardTarget: PasteboardTarget) {
        self.pasteboardTarget = pasteboardTarget
    }
    
    func initializeSubscriptions() {
        self.pasteboardCancellable = PasteboardListener.pasteboardChangedPublisher
            .sink { [weak self] _ in
                switch self?.pasteboardTarget {
                case .regex(let stringPattern, let onMatch):
                    self?.checkPasteboard(matching: stringPattern, onMatch: onMatch)
                case .none:
                    print("none")
                }
            }
    }
}
