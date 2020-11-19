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

    func testChangesOnInAppCopy() throws {
        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
        app.launch()
        let textView = app.textViews.firstMatch
        textView.tap()
        
        app.keys["O"].tap()
        app.keys["n"].tap()
        app.keys["e"].tap()
        
        textView.doubleTap()
        app.staticTexts["Copy"].tap()
        
        print("--------------------- labels")
        let counter = app.staticTexts["counter"]
        print(counter.value, "-------------------------- val")
        XCTAssertTrue(counter.exists)
    }
}
