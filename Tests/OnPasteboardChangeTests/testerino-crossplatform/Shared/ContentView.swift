//
//  TestApp.swift
//
//
//  Created by Kyle Nazario on 11/19/20.
//

import SwiftUI
import OnPasteboardChange

#if os(macOS)
import AppKit
#else
import UIKit
#endif

struct ContentView: View {
    @State var text: String = ""
    @State var counter: Int = 0
    @State var pbMode: PBMode = .usingDefault
    
    let customPb = UIOrNSPasteboard.withUniqueName()
    
    var body: some View {
        VStack {
            Button("Toggle Custom") { pbMode.toggle() }
            Button("Add to Custom Pasteboard") {
                #if os(macOS)
                customPb.setString("added to custom", forType: .string)
                #else
                let mockItem = ["mock": "item"]
                customPb.addItems([mockItem])
                #endif
            }
            
            if pbMode == .usingDefault {
                TextEditor(text: $text)
                    .onPasteboardChange {
                        counter += 1
                    }
            }
            if pbMode == .usingCustom {
                TextEditor(text: $text)
                    .onPasteboardChange(for: customPb) {
                        counter += 1
                    }
            }
        }
        .navigationTitle(changeCount)
    }
    
    private var changeCount: String {
        "Changes: " + String(counter)
    }
    
    enum PBMode {
        case usingDefault
        case usingCustom
        
        mutating func toggle() {
            if self == .usingDefault {
                self = .usingCustom
            } else {
                self = .usingDefault
            }
        }
    }
}
