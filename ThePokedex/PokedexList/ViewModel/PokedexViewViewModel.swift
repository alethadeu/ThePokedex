//
//  PokedexViewViewModel.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import SwiftUI

class PokedexViewViewModel: ObservableObject {
    private let getPokedexUseCase = GetPokedexUseCase()
    @Published var pokemons = [Pokemon]()
    @Published var selectPokemon = Pokemon(id: 0, name: "", imageUrl: "", type: "", description: "", height: 0, weight: 0, attack: 0, defense: 0, evolutionChain: [])
    @Published var show = false
    

    func fetchPokemons() {
        self.getPokedexUseCase.getPokedex { result in
            switch result {
            case .success(payload: let pokemons):
                DispatchQueue.main.async {
                    self.pokemons = pokemons
                }
            case .failure(error: let pokedexError):
                print(pokedexError.localizedDescription)
            }
        }
    }
    
    func loadEvolutionForSelectPokemon() -> [Pokemon] {
        guard let chain = selectPokemon.evolutionChain else { return [] }
        let evolutionChain  = Set(chain.map { $0.name })
        return pokemons.filter({ evolutionChain.contains($0.name) })
    }

}
