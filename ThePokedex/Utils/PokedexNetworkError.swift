//
//  PokedexNetworkError.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation


enum PokedexNetworkError: Error {
    case noConnection
    case pokedexNotFound
    case pokedexError
    case pokedexEmpty
}
