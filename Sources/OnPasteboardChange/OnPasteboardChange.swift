//
//  OnPasteboardChange.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

import SwiftUI

public extension View {
    func onPasteboardChange(do callback: @escaping PasteboardCallback) -> some View {
        PasteboardChangeListenerView(containing: self, do: callback)
    }
}

public typealias PasteboardCallback = () -> Void

struct PasteboardChangeListenerView<T>: View where T: View {
    private let containingView: T
    
    @StateObject private var store: PasteboardChangeStore
    
    init(containing view: T, do callback: @escaping PasteboardCallback) {
        self.containingView = view
        
        let store = PasteboardChangeStore(callback: callback)
        store.initializeSubscriptions()
        _store = StateObject<PasteboardChangeStore>(wrappedValue: store)
    }
    
    var body: some View {
        containingView
    }
}
