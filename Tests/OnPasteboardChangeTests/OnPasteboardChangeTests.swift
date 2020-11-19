import XCTest
import SwiftUI
import UIKit
@testable import OnPasteboardChange

final class OnPasteboardTests: XCTestCase {
    
    func testCopyTriggersPasteboard() {
        print("-------------------------")
        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
        print(app.buttons as Any)
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
