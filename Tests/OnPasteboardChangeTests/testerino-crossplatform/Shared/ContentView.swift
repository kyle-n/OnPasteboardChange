//
//  ContentView.swift
//  Shared
//
//  Created by Kyle Nazario on 11/18/20.
//

import SwiftUI
import OnPasteboardChange

struct ContentView: View {
    @State private var text: String = ""
    @State private var editorVisible: Bool = true
    
    var body: some View {
        VStack {
            Button("Add to Custom Pasteboard") {
                editorVisible.toggle()
            }
            if editorVisible {
                TextEditor(text: $text)
                    .padding()
                    .onPasteboardChange {
                        print("pb changed")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
