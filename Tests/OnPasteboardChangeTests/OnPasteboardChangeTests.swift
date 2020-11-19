import XCTest
import SwiftUI
import UIKit
@testable import OnPasteboardChange

final class OnPasteboardTests: XCTestCase {
    
    func testCopyTriggersPasteboard() {
        print("-------------------------")
        var pbChangeCounter = 0
        let label = Text("Label").onPasteboardChange { pbChangeCounter += 1 }
        
        let mockPBItem = ["fake": "item"]
        let loops = 3
        for _ in (0..<loops) {
            UIPasteboard.general.addItems([mockPBItem])
        }
        XCTAssertEqual(pbChangeCounter, loops)
    }

    static var allTests = [
        ("testCopyTriggersPasteboard", testCopyTriggersPasteboard)
    ]
}
