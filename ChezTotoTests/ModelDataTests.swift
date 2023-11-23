//
//  ModelDataTests.swift
//  ModelDataTests
//
//  Created by Jonathan Duong on 23/11/2023.
//

import XCTest

final class ModelDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadTypeOfDishes() throws {
        let modelData = ModelData()
        let expectedFirstDish = Dish(name: "Garlic bread",
                                     description: "Du pain legèrement croustillant parfumé à l’ail",
                                     pictureName: "garlicBread",
                                     price: 3.5)

        let typeOfDishes: [TypeOfDish] = try modelData.load("Source.json")

        XCTAssertNotNil(typeOfDishes, "Failed to load typeOfDishes from source.json")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.name, expectedFirstDish.name, "First dish name does not match expected value")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.description, expectedFirstDish.description, "First dish description does not match expected value")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.pictureName, expectedFirstDish.pictureName, "First dish pictureName does not match expected value")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.price, expectedFirstDish.price, "First dish price does not match expected value")
    }

    func testLoadFileNotFound() {
        let modelData = ModelData()
        
        XCTAssertThrowsError(try modelData.load("non_existent_file.json") as [Dish]) { error in
            guard let loadError = error as? ModelData.LoadError else {
                return XCTFail("Expected LoadError")
            }

            switch loadError {
            case .fileNotFound:
                // Test succeeded
                break
            default:
                XCTFail("Expected fileNotFound error")
            }
        }
    }

    func testLoadParsingFailed() {
        let modelData = ModelData()

        XCTAssertThrowsError(try modelData.load("Source.json") as Dish) { error in
            guard let loadError = error as? ModelData.LoadError else {
                return XCTFail("Expected LoadError")
            }

            switch loadError {
            case .parsingFailed:
                // Test succeeded
                break
            default:
                XCTFail("Expected parsingFailed error")
            }
        }
    }

}
