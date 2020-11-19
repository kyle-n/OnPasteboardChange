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
        print("----------------------------------------------------------------")
    }

//    func testChangesOnInAppCopy() throws {
//        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
//        app.launch()
//        let textView = app.textViews.firstMatch
//        textView.tap()
//
//        app.keys["O"].tap()
//        app.keys["n"].tap()
//        app.keys["e"].tap()
//
//        textView.doubleTap()
//        app.staticTexts["Copy"].tap()
//
//        let counter = app.staticTexts["counter"]
//        XCTAssertEqual(counter.label, "Changes: 1")
//    }
    
    func testCopyOutsideApp() {
        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
        app.launch()
        
        let contacts = XCUIApplication(bundleIdentifier: "com.apple.MobileAddressBook")
        contacts.launch()
        contacts.tables["ContactsListView"].staticTexts["John Appleseed"].tap()
        contacts.tables.staticTexts["(888) 555-5512"].press(forDuration: 2.0);
        contacts.staticTexts["Copy"].tap()
              
        app.activate()
        let counter = app.staticTexts["counter"]
        XCTAssertEqual(counter.label, "Changes: 1")
    }
}
