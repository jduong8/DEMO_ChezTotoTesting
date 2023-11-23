//
//  MenuViewUITests.swift
//  MenuViewUITests
//
//  Created by Jonathan Duong on 23/11/2023.
//

import XCTest

class MenuViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testMenuView() {
        let menuLink = app.buttons["MenuLink"]
        menuLink.tap()
        // Test l'affichage des sections et des plats.
        XCTAssertTrue(app.staticTexts["Entrées"].exists, "La section 'Entrée' n'est pas affichée")
    }
}
