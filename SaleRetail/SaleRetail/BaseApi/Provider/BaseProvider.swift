//
//  BaseProvider.swift
//  Demo
//
//  Created by D.Ace on 10/08/2023.
//

import Foundation
import Moya

struct BaseProvider: Restable {
    var provider = MoyaProvider<ApiType>(plugins: [])
    
    func login(userName: String, password: String, completion: @escaping (Login?) -> Void) {
        provider.request(.login(userName: userName, password: password)) { result in
            switch result {
            case let .success(response):
                BaseRestApi.decodingTask(with: response.data, decodingType: Login.self) { (data) in
                    if let data = data as? Login {
                        completion(data)
                    } else {
                        completion(nil)
                    }
                }
            case let .failure(error):
                completion(nil)
            }
        }
    }
    
}
