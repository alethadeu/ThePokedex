//
//  PokedexDetailViewModel.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 16/05/21.
//

import Foundation
import SwiftUI

class PokedexDetailViewMode: ObservableObject {
    @Published var selectedPokemon = Pokemon(id: 0,
                                             name: "",
                                             imageUrl: "",
                                             type: "",
                                             description: "",
                                             height: 0,
                                             weight: 0,
                                             attack: 0,
                                             defense: 0, evolutionChain: [])
    
    @Published var show = false
}
