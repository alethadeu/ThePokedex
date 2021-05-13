//
//  Pokemon.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import UIKit

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    
    var photoURL: URL {
        return URL(string: imageUrl)!
    }
    
    var colorType: UIColor {
        if let type = Type(rawValue: self.type), let color = type.color {
            return color
        }
        return UIColor.systemGray2
    }
}

let MOCK_POKEMON: [Pokemon] = [
    Pokemon(id: 1, name: "Bulbassaur", imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png", type: "grass"),
    Pokemon(id: 2, name: "Ivyssaur", imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png", type: "grass")

]
