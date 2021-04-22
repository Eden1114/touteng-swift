//
//  File.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/21.
//

import Foundation
import Alamofire

class NetworkAPI {
    static func getList(parameters:Parameters,
                        completion: @escaping (Result<Article, Error>)-> Void) {
        NetworkManager.shared.requestGet(path: "list", parameters: parameters) { result in
            switch result {
            case let .success(data):
                let parseResult:Result<Article, Error> = self.parseData(data)
                completion(parseResult)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    static func getAdInfo(parameters:Parameters,
                          completion: @escaping (Result<Advertisement, Error>) -> Void) {
        NetworkManager.shared.requestGet(path: "ad_info", parameters: parameters) { result in
            switch result {
            case let .success(data):
                let parseResult:Result<Advertisement, Error> = self.parseData(data)
                completion(parseResult)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    
    //    generic type
    private static func parseData<T: Decodable> (_ data: Data) -> Result<T, Error> {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            let error = NSError(domain: "network api error",code: 201, userInfo: [NSLocalizedDescriptionKey : "Can not parse data"])
            return .failure(error)
        }
        return .success(decodedData)
    }
}
