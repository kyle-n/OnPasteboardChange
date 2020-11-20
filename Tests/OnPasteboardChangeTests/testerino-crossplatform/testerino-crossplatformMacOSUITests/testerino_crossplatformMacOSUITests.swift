//
//  testerino_crossplatformMacOSUITests.swift
//  testerino-crossplatformMacOSUITests
//
//  Created by Kyle Nazario on 11/20/20.
//

import XCTest

class testerino_crossplatformMacOSUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        XCUIApplication().terminate()
    }
    
    private static var window: XCUIElement {
        XCUIApplication().windows["SwiftUI.ModifiedContent<testerino_crossplatform.ContentView, SwiftUI._FrameLayout>-1-AppWindow-1"]
    }
    private static var textView: XCUIElement {
        window.scrollViews.children(matching: .textView).element
    }
    
    private func copyInApp() {
        let textView = testerino_crossplatformMacOSUITests.textView
        textView.click()
        textView.typeText("one")
        textView.typeKey("a", modifierFlags:.command)
        textView.typeKey("c", modifierFlags:.command)
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        copyInApp()
        
        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.label, "Changes: 1")
    }
}
