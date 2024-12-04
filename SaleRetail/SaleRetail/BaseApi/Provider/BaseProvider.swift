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
    
    func login(completion: @escaping (Login) -> Void) {
        provider.request(.login(userName: "saletest", password: "admin")) { result in
            switch result {
            case let .success(response):
                BaseRestApi.decodingTask(with: response.data, decodingType: Login.self) { (data) in
                    if let data = data as? Login {
                        completion(data)
                    }
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
