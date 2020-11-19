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
        
        XCTAssertTrue(app!.staticTexts["Changes: 0"].exists)
        XCTAssertFalse(app!.staticTexts["Changes: 1"].exists)
        print("8888888888888888888888 yep")
        
        let textView = app!.textViews.firstMatch
        textView.tap()
        textView.typeText("one")
        textView.doubleTap()
        app!.menuItems["Copy"].tap()

        XCTAssertFalse(app!.staticTexts["Changes: 0"].exists)
        XCTAssertTrue(app!.staticTexts["Changes: 1"].exists)
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
