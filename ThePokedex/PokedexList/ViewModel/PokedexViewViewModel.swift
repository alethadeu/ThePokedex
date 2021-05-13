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
    
    init() {
        fetchPokemons()
    }
    
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

}
