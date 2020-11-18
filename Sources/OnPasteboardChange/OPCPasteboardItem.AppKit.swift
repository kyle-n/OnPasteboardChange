//
//  File.swift
//  
//
//  Created by Kyle Nazario on 11/18/20.
//

#if os(macOS)
import SwiftUI
import AppKit

class CrossPlatformPasteboardItem: NSPasteboardItem {
    
    required init?(pasteboardPropertyList propertyList: Any, ofType type: NSPasteboard.PasteboardType) {
        super.init(pasteboardPropertyList: propertyList, ofType: type)
    }
}

#endif
