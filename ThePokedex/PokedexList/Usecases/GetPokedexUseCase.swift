//
//  GetPokedexUseCase.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 13/05/21.
//

import Foundation


class GetPokedexUseCase {
    typealias getPokedexResult = Result<[Pokemon], PokedexNetworkError>
    typealias getPokedexCompletion = (_ result: getPokedexResult) -> Void
    private let pokedexRemote = PokedexRemote()
    
    func getPokedex() async throws -> getPokedexResult {
        do {
            let result = try await pokedexRemote.getPokedex()
            switch result {
            case .success(payload: let pokemons):
                return .success(payload: pokemons)
            case .failure(error: let pokedexNetworkError):
                return .failure(error: pokedexNetworkError)
            }
        } catch {
            return .failure(error: PokedexNetworkError.pokedexError)
        }
    
    }
}
