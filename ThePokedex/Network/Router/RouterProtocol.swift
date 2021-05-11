//
//  RouterProtocol.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import Alamofire

protocol RouterProtocol: URLRequestConvertible {
    var baseUrl: String { get }
    var path: String { get }
    var requestURL: URL { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var enconding: ParameterEncoding { get }
    var urlRequest: URLRequest { get }
}

extension RouterProtocol {
    var requestURL: URL {
        let urlString = "\(baseUrl)\(path)"
        return URL(string: urlString)!
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { header in
            request.addValue(header.value, forHTTPHeaderField: header.name)
        }
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        return try enconding.encode(urlRequest, with: parameters)
    }
    
}
