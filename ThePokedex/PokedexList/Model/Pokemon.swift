//
//  Pokemon.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: [Type]
    
    var photoURL: URL {
        return URL(string: imageUrl)!
    }
}

let MOCK_POKEMON: [Pokemon] = [
    Pokemon(id: 1, name: "Bulbassaur", imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png", type: [.grass])
]
