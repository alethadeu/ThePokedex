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
    
    func getPokedex(completion: @escaping getPokedexCompletion) {
        pokedexRemote.getPokedex { result in
            switch result {
            case .success(payload: let pokemons):
                completion(.success(payload: pokemons))
            case .failure(error: let pokedexNetworkError):
                completion(.failure(error: pokedexNetworkError))
            }
        }
    }
}
