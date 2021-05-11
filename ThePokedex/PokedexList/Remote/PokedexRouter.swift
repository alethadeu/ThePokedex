//
//  PokedexRouter.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import Alamofire

enum PokedexRouter: RouterProtocol {
    case getPokedex
    
    var baseUrl: String {
        return RouterConstant.baseURL
    }
    
    var path: String {
        return "/pokemon.json"
    }
    
    var headers: HTTPHeaders {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var enconding: ParameterEncoding {
        return URLEncoding.default
    }
}
