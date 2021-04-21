//
//  File.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/21.
//

import Foundation

class NetworkAPI {
    static func recoomendPostList(completion: @escaping (Result<PostList, Error>)-> Void)
    {
        NetworkManager.shared.requestGet(path: "123", parameters: nil) { result in
            switch result {
            case let .success(data):
                let parseResult:Result<PostList, Error> = self.parseData(data)
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
