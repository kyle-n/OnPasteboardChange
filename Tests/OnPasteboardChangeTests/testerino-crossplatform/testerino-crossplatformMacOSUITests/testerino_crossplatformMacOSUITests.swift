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
    
    private func copyOutsideApp() {
        let textEdit = XCUIApplication(bundleIdentifier: "com.apple.TextEdit")
        textEdit.launch()
        
        textEdit.typeKey("n", modifierFlags: .command)
        let textView = textEdit.textViews.firstMatch
        textView.typeText("two")
        textView.typeKey("a", modifierFlags: .command)
        textView.typeKey("c", modifierFlags: .command)
        
        textView.typeKey("q", modifierFlags: .command)
        textView.typeKey(.delete, modifierFlags: .command)
    }

//    func testChangesOnInAppCopy() throws {
//        let app = XCUIApplication()
//        app.launch()
//
//        copyInApp()
//
//        sleep(3)
//        let counter = app.staticTexts["counter"]
//        XCTAssertEqual(counter.value as! String, "Changes: 1")
//    }
    
    func testCopyOutsideApp() {
        let app = XCUIApplication()
        app.launch()

        copyOutsideApp()

        app.activate()
        sleep(3)
        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.value as! String, "Changes: 1")
    }
    
    func testCopyInAppToGeneralWithCustomPasteboard() {
                
//        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
//        app.launch()
//
//        app.buttons["Toggle Custom"].tap()
//
//        copyInApp(app: app)
//
//        sleep(1)
//
//        let counter = app.staticTexts["counter"]
//        XCTAssertEqual(counter.label, "Changes: 0")
    }
    
    func testCopyOutsideAppWithCustomPasteboard() {
//        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
//        app.launch()
//
//        app.buttons["Toggle Custom"].tap()
//
//        copyOutsideApp()
//
//        app.activate()
//        sleep(1)
//        let counter = app.staticTexts["counter"]
//        XCTAssertEqual(counter.label, "Changes: 0")
    }
    
    func testCopyInAppToCustomPasteboard() {
//        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
//        app.launch()
//
//        app.buttons["Toggle Custom"].tap()
//        app.buttons["Add to Custom Pasteboard"].tap()
//
//        sleep(1)
//        let counter = app.staticTexts["counter"]
//        XCTAssertEqual(counter.label, "Changes: 1")
    }

}
