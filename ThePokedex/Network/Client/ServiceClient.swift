//
//  ServiceClient.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import Alamofire

//protocol ServiceClientProtocol {
//    typealias requestResult = Result<SuccessData<Data>, Error>
//    typealias requestCompletion = (_ result: requestResult) -> Void
//
//    func doRequest(router: RouterProtocol, completion: @escaping requestCompletion)
//    func logRequestAndResponse(request: URLRequest?, response: HTTPURLResponse? )
//}

class ServiceClient  {
    typealias requestResult = Result<SuccessData<Data>, FailureReason>
    typealias requestCompletion = (_ result: requestResult) -> Void
    
    func doRequest(router: RouterProtocol, completion: @escaping requestCompletion) {
        if NetworkState.isConnected() {
            AF.request(router)
                .validate()
                .responseJSON { response  in
                    self.logRequestAndResponse(request: response.request, response: response.response)
                    switch response.result  {
                    case .success:
                        if let statusCode = response.response?.statusCode {
                            guard let data = response.data else {
                                let successData = SuccessData<Data>(successCode: statusCode, data: nil)
                                completion(.success(payload: successData))
                                return
                            }
                            let successData = SuccessData<Data>(successCode: statusCode, data: data)
                            completion(.success(payload: successData))
                        }
        
                        
                    case .failure(_):
                        if let statusCode = response.response?.statusCode, let reason = FailureReason(rawValue: statusCode) {
                            completion(.failure(error: reason))
                        } else {
                            completion(.failure(error: .badRequest))
                        }
                    }
            }
        } else {
            completion(.failure(error: .noNetwork))
        }
    }
    
    func logRequestAndResponse(request: URLRequest?, response: HTTPURLResponse? ) {
        if let request = request {
            NSLog("Request to: \(request.url?.absoluteString ?? "--")")
            //NSLog("Headers: \(request.allHTTPHeaderFields ?? [:])/n")
            NSLog("Method: \(request.httpMethod ?? "--")")
        }
        
        if let response = response {
            NSLog("Response Status Code: \(response.statusCode)")
        }
        
        NSLog("----------------------------------------------------------------")
    }
}

class NetworkState {
    class func isConnected() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

enum FailureReason: Int, Error {
    case unAuthorized   = 401
    case notFound       = 404
    case badRequest     = 400
    case noNetwork      = 0
}


extension Data {
    func printJSON()
        {
            if let JSONString = String(data: self, encoding: String.Encoding.utf8)
            {
                print(JSONString)
            }
        }
}
