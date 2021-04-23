//
//  File.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/21.
//

import Foundation
import Alamofire

typealias APICompletion = (Result<Any, Error>) -> Void

class NetworkAPI {
    static func getList(parameters:Parameters,
                        completion: @escaping (Result<Data, Error>) -> Void) {
        NetworkManager.shared.requestGet(path: "list/", parameters: parameters) { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    static func getList1(parameters:Parameters,
                        completion: @escaping APICompletion) {
        NetworkManager.shared.requestJSONGet(path: "list/", parameters: parameters) { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    static func getAdInfo(parameters:Parameters,
                          completion: @escaping APICompletion) {
        NetworkManager.shared.requestJSONGet(path: "ad_info/", parameters: parameters) { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    
    // generic type
    // depreated
//    private static func parseData<T: Decodable> (_ data: Data) -> Result<T, Error> {
//        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
//            let error = NSError(domain: "network api error",code: 201, userInfo: [NSLocalizedDescriptionKey : "Can not parse data"])
//            return .failure(error)
//        }
//        return .success(decodedData)
//    }
}
