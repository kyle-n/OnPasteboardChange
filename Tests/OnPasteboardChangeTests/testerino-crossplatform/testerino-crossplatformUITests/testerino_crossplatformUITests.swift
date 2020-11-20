//
//  testerino_crossplatformUITests.swift
//  testerino-crossplatformUITests
//
//  Created by Kyle Nazario on 11/19/20.
//

import XCTest

class testerino_crossplatformUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        XCUIApplication().terminate()
    }
    
    private func copyInApp(app: XCUIApplication) {
        let textView = app.textViews.firstMatch
        textView.tap()

        app.keys["O"].tap()
        app.keys["n"].tap()
        app.keys["e"].tap()

        textView.doubleTap()
        app.staticTexts["Copy"].tap()
    }
    
    private func copyOutsideApp() {
        let contacts = XCUIApplication(bundleIdentifier: "com.apple.MobileAddressBook")
        contacts.launch()
        let phoneNumber = contacts.tables.staticTexts["(888) 555-5512"]
        if (!phoneNumber.exists) {
            contacts.tables["ContactsListView"].staticTexts["John Appleseed"].tap()
        }
        phoneNumber.press(forDuration: 2.0);
        sleep(1)
        contacts.staticTexts["Copy"].tap()
        sleep(1)
    }

    func testChangesOnInAppCopy() throws {
        let app = XCUIApplication()
        app.launch()
        
        copyInApp(app: app)

        sleep(1)

        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.label, "Changes: 1")
    }
    
    func testCopyOutsideApp() {
        let app = XCUIApplication()
        app.launch()

        copyOutsideApp()

        app.activate()
        sleep(1)
        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.label, "Changes: 1")
    }
    
    func testCopyInAppToGeneralWithCustomPasteboard() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Toggle Custom"].tap()
        
        copyInApp(app: app)

        sleep(1)

        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.label, "Changes: 0")
    }
    
    func testCopyOutsideAppWithCustomPasteboard() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Toggle Custom"].tap()

        copyOutsideApp()

        app.activate()
        sleep(1)
        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.label, "Changes: 0")
    }
    
    func testCopyInAppToCustomPasteboard() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Toggle Custom"].tap()
        app.buttons["Add to Custom Pasteboard"].tap()
        
        sleep(1)
        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.label, "Changes: 1")
    }
}
