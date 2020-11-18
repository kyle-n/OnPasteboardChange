//
//  OnPasteboardChange.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

import SwiftUI

#if os(macOS)
import AppKit
public typealias UIOrNSPasteboard = NSPasteboard
#else
import UIKit
public typealias UIOrNSPasteboard = UIPasteboard
#endif

public extension View {
    func onPasteboardChange(for pasteboard: UIOrNSPasteboard = .general, do callback: @escaping PasteboardCallback) -> some View {
        PasteboardChangeListenerView(containing: self, for: pasteboard, do: callback)
    }
}

public typealias PasteboardCallback = () -> Void

struct PasteboardChangeListenerView<T>: View where T: View {
    private let containingView: T
    
    @StateObject private var store: PasteboardChangeStore
    
    init(containing view: T, for pasteboard: UIOrNSPasteboard, do callback: @escaping PasteboardCallback) {
        self.containingView = view
        
        let store = PasteboardChangeStore(for: pasteboard, callback: callback)
        _store = StateObject<PasteboardChangeStore>(wrappedValue: store)
    }
    
    var body: some View {
        containingView
    }
}
