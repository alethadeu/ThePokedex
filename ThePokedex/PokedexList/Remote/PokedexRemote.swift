//
//  PokedexRemote.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation

class PokedexRemote {
    typealias getPokedexResult = Result<[Pokemon], PokedexNetworkError>
    typealias getPokedexCompletion =  (_ result: getPokedexResult) -> Void
    
    func getPokedex(completion: @escaping getPokedexCompletion) {
        ServiceClient().doRequest(router: PokedexRouter.getPokedex) { result in
            switch result {
            
            case .success(payload: let successData):
                guard let data = successData.data else {
                    completion(.failure(error: .pokedexError))
                    return 
                }
                do {
                    let pokedex = try [Pokemon].decode(data: data )
                    completion(.success(payload: pokedex))
                } catch {
                    completion(.failure(error: .pokedexError))
                }
                
            case .failure(error: let failureReason):
                switch failureReason {
                case .noNetwork:
                    completion(.failure(error: .noConnection))
                case .badRequest, .unAuthorized:
                    completion(.failure(error: .pokedexError))
                case .notFound:
                    completion(.failure(error: .pokedexNotFound))
                }
            }
        }
    }
}
