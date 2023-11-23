//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 14/11/2023.
//

import Foundation

// Represente l'objet plat, qui figurent sur la carte du menu
struct Dish: Codable {
    var name: String
    var description: String
    var pictureName: String
    var price: Float
    
    init(name: String, description: String, pictureName: String = "placeholder", price: Float) {
        self.name = name
        self.description = description
        self.pictureName = pictureName
        self.price = price
    }
}

extension Dish: Equatable {
    
}

// Permet de categoriser les differents types de plats dans le menu
// Pour le moment on utilise les 2 categories suivantes : entrée et plat principal
struct TypeOfDish: Codable {
    var name: String
    var dishs: [Dish]
    
    init(name: String = "", dishs: [Dish] = []) {
        self.name = name
        self.dishs = dishs
    }
}

extension TypeOfDish: Equatable {
    static func == (lhs: TypeOfDish, rhs: TypeOfDish) -> Bool {
        lhs.name == rhs.name && lhs.dishs == rhs.dishs
    }
}

class ModelData {
    enum LoadError: Error {
        case fileNotFound(String)
        case loadFailed(String)
        case parsingFailed(String)
    }

    func load<T: Decodable>(_ filename: String) throws -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            throw LoadError.fileNotFound("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            throw LoadError.loadFailed("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw LoadError.parsingFailed("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

}

