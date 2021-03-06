//
//  Pokemon.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import UIKit


struct EvolutionChain: Codable, Identifiable {
    let id: String
    let name: String
}

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int
    let evolutionChain: [EvolutionChain]?
    var photoURL: URL {
        return URL(string: imageUrl)!
    }
    
    var colorType: UIColor {
        if let type = Type(rawValue: self.type), let color = type.color {
            return color
        }
        return UIColor.systemGray2
    }
    
    var pokedexNumber: String {
        if id < 10 {
            return "#00\(id)"
        }else if id < 100 {
            return "#0\(id)"
        } else {
            return "#\(id)"
        }
    }
}

let MOCK_POKEMON: [Pokemon] = [
    Pokemon(id: 1,
            name: "Bulbassaur",
            imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
            type: "grass",
            description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
            height: 7,
            weight: 69,
            attack: 49,
            defense: 49, evolutionChain: []),
    
    Pokemon(id: 2,
            name: "Bulbassaur",
            imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
            type: "grass",
            description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
            height: 7,
            weight: 69,
            attack: 49,
            defense: 49, evolutionChain: []),

]
