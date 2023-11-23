//
//  ViewModelTests.swift
//  ModelDataTests
//
//  Created by Jonathan Duong on 23/11/2023.
//

import XCTest

final class ViewModelTests: XCTestCase {


    var viewModel: ViewModel!

    override func setUpWithError() throws {
        super.setUp()
        // Ici, vous pouvez initialiser le ViewModel avec des données mockées ou injectées si nécessaire
        viewModel = ViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }

    func testRemoveDish() {
        let initialDishName = "Garlic bread"
        viewModel.menuArray = [
            TypeOfDish(name: "Entrées", dishs: [Dish(name: initialDishName, description: "Description", pictureName: "garlicBread", price: 3.5)])
        ]

        viewModel.removeDish(dishName: initialDishName)

        XCTAssertTrue(viewModel.menuArray[0].dishs.allSatisfy { $0.name != initialDishName }, "Le plat \(initialDishName) n'a pas été supprimé correctement.")
    }

    func testAddDish() {
        let newDish = Dish(name: "Nouveau Plat", description: "Description", pictureName: "nouveauPlat", price: 4.5)
        let typeOfDishName = "Entrées"
        viewModel.menuArray = [TypeOfDish(name: typeOfDishName, dishs: [])]

        viewModel.addDish(dish: newDish, typeOfDish: typeOfDishName)

        XCTAssertTrue(viewModel.menuArray.first { $0.name == typeOfDishName }?.dishs.contains(where: { $0.name == newDish.name }) == true, "Le nouveau plat n'a pas été ajouté correctement.")
    }

    func testAddNewTypeOfDish() {
        let newTypeOfDishName = "Desserts"

        viewModel.addNewTypeOfDish(typeOfDish: newTypeOfDishName)

        XCTAssertTrue(viewModel.menuArray.contains(where: { $0.name == newTypeOfDishName }), "Le nouveau type de plat \(newTypeOfDishName) n'a pas été ajouté correctement.")
    }
}
