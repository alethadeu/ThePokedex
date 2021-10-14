//
//  PokedexRemote.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation

class PokedexRemote {
    typealias getPokedexResult = Result<[Pokemon], PokedexNetworkError>
    
    func getPokedex() async throws -> getPokedexResult {
        do {
            let request = try await ServiceClient().doRequest(router: PokedexRouter.getPokedex)
            switch request {
                case .success(payload: let successData):
                    guard let data = successData.data?.parseData(removeString: "null,") else {
                        return .failure(error: .pokedexError)
                    }
                    do {
                        let pokedex = try [Pokemon].decode(data: data )
                       return .success(payload: pokedex)
                    } catch let error {
                        print(error.localizedDescription)
                        return .failure(error: .pokedexError)
                    }
                case .failure(error: let failureReason):
                    switch failureReason {
                        case .noNetwork:
                         return .failure(error: .noConnection)
                        case .badRequest, .unAuthorized:
                           return .failure(error: .pokedexError)
                        case .notFound:
                          return .failure(error: .pokedexNotFound)
                    }
            }
        } catch {
            return .failure(error: .pokedexError)
        }
    }
    
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
