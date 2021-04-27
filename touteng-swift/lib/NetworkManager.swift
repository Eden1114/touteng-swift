//
//  NetworkManager.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/21.
//

import Foundation
import Alamofire

private let NetworkAPIBaseURL = "https://i.snssdk.com/mooc/stream/api/"

typealias NetworkRequestResult = Result<Data, Error>
typealias NetworkRequestCompletion = (NetworkRequestResult) -> Void


typealias NetworkJSONRequestResult = Result<Any, Error>
typealias NetworkJSONRequestCompletion = (NetworkJSONRequestResult) -> Void


class NetworkManager {
    static let shared = NetworkManager() // Singlon Mode
    
    var commonHeaders: HTTPHeaders{[]}
    
    private init() {}
    
    @discardableResult
    func requestGet(path: String, parameters: Parameters?, completion: @escaping NetworkRequestCompletion) -> DataRequest {
        AF.request(NetworkAPIBaseURL + path,
                   parameters: parameters,
                   requestModifier: { $0.timeoutInterval = 15 })
            .responseData {response in
            switch response.result {
            case let .success(data):
                debugPrint(response)
                completion(.success(data))
            case let .failure(error): completion(.failure(error))
            }
        }
    }
    
    @discardableResult
    func requestPOST(path: String, parameters: Parameters?,
                     completion: @escaping NetworkRequestCompletion) -> DataRequest {
        AF.request(NetworkAPIBaseURL + path, method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.prettyPrinted,
                   requestModifier: { $0.timeoutInterval = 15 })
            .responseData {
                response in
                switch response.result {
                case let .success(data): completion(.success(data))
                case let .failure(error): completion(.failure(error))
                }
            }
    }
}
