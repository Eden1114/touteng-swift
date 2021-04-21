//
//  network.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/21.
//

import Foundation
import Alamofire


func stack(data: String) {
    let url = "www.baidu.com"
    AF.request(url).responseData { response in
        switch response.result {
        case let .success(data):
            // handle data
            _ = data
            // no need async
            break
        case let .failure(data):
            // handle error
            _ = data
            break
        }
    }
}

private let NetworkAPIBaseURL = "https://base.url"

typealias NetworkRequestResult = Result<Data, Error>
typealias NetworkRequestCompletion = (NetworkRequestResult) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    
    var commonHeaders: HTTPHeaders{
        ["userid":"123", "token": "123",
         "userid":"123", "token": "123"]
    }
    
    private init() {}
    
    @discardableResult
    func requestGet(path: String, parameters: Parameters?, completion: @escaping NetworkRequestCompletion) -> DataRequest {
        AF.request(NetworkAPIBaseURL + path,
                   parameters: parameters,
                   headers: ["user_id":"123"],
                   requestModifier: { $0.timeoutInterval = 15})
            .responseData {response in
            switch response.result {
            case let .success(data): completion(.success(data))
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
                   headers: ["userid": "123"],
                   requestModifier: {$0.timeoutInterval = 15})
            .responseData {
                response in
                switch response.result {
                case let .success(data): completion(.success(data))
                case let .failure(error): completion(.failure(error))
                }
            }
        
    
    
    }
}
