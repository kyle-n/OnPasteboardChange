//
//  testerino_crossplatformApp.swift
//  Shared
//
//  Created by Kyle Nazario on 11/18/20.
//

import SwiftUI

@main
struct testerino_crossplatformApp: App {
    var body: some Scene {
        WindowGroup {
            windowContent
        }
    }
    
    private var windowContent: some View {
        #if os(macOS)
        return ContentView()
            .frame(width: 300, height: 300)
        #else
        return ContentView()
        #endif
    }
}
