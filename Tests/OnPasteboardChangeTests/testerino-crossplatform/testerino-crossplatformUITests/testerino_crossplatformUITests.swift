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
        print("1666666666666666666666666666666666666666666666666666")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChangesOnInAppCopy() throws {
        print("19999999999999999999999999999999999999999999999999999999")
        let app = XCUIApplication(bundleIdentifier: "com.kylenazario.testerino-crossplatform")
        app.launch()
        let textView = app.textViews.firstMatch
//        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        
        app.keys["O"].tap()
        app.keys["n"].tap()
        app.keys["e"].tap()
        
        textView.doubleTap()
        app.staticTexts["Copy"].tap()
        
        print("------------------------------------ qq before assert")
        print(app.staticTexts)
        let counter = app.staticTexts["counter"]
        print(app.staticTexts["Changes: 1"].exists, "999999999999999999")
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
