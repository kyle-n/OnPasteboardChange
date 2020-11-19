//
//  testerino_crossplatformUITests.swift
//  testerino-crossplatformUITests
//
//  Created by Kyle Nazario on 11/19/20.
//

import XCTest

class testerino_crossplatformUITests: XCTestCase {
    
    var app: XCUIApplication? = nil

    override func setUpWithError() throws {
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app?.launch()
        print(app?.buttons as Any)
    }

    override func tearDownWithError() throws {
        app?.terminate()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChangesOnInAppCopy() throws {
        print("----------------------- hai")
        
        
        
        let textView = app!.textViews.firstMatch
        textView.tap()
        textView.typeText("one")
        textView.doubleTap()
        app!.menuItems["Copy"].tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
