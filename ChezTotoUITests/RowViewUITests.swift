//
//  RowViewUITests.swift
//  MenuViewUITests
//
//  Created by Jonathan Duong on 23/11/2023.
//

import XCTest

class RowViewUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testRowViewDisplay() {
        
        let menuLink = app.buttons["MenuLink"]
        menuLink.tap()
        
        let dishName = "Potatoes"
        XCTAssertTrue(app.staticTexts["\(dishName)"].exists, "Le nom du plat n'est pas affiché")
    }
}
