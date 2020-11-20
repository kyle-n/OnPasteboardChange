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

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        
    }
}
