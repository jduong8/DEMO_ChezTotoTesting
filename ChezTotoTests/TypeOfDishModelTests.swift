//
//  TypeOfDishModelTests.swift
//  ModelDataTests
//
//  Created by Jonathan Duong on 23/11/2023.
//

import XCTest

final class TypeOfDishModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTypeOfDishInit() {
        let name = "Entrées"
        let dishs = [Dish(name: "Salade", description: "Une salade fraîche", pictureName: "salade.jpg", price: 5.0),
                     Dish(name: "Soupe", description: "Une soupe chaude", pictureName: "soupe.jpg", price: 3.5)]

        let typeOfDish = TypeOfDish(name: name, dishs: dishs)

        XCTAssertEqual(typeOfDish.name, name, "Le nom du type de plat ne correspond pas")
        XCTAssertEqual(typeOfDish.dishs, dishs, "La liste des plats ne correspond pas")
    }

    func testTypeOfDishEquatable() {
        let dish1 = Dish(name: "Dish1", description: "Desc1", pictureName: "Pic1", price: 10.0)
        let dish2 = Dish(name: "Dish2", description: "Desc2", pictureName: "Pic2", price: 20.0)

        let typeOfDish1 = TypeOfDish(name: "Type1", dishs: [dish1, dish2])
        let typeOfDish2 = TypeOfDish(name: "Type1", dishs: [dish1, dish2])
        let typeOfDish3 = TypeOfDish(name: "Type2", dishs: [dish1]) // Différent de typeOfDish1 et typeOfDish2

        XCTAssertEqual(typeOfDish1, typeOfDish2, "Les instances identiques de TypeOfDish ne sont pas considérées comme égales")
        XCTAssertNotEqual(typeOfDish1, typeOfDish3, "Les instances différentes de TypeOfDish sont considérées à tort comme égales")
    }
}
