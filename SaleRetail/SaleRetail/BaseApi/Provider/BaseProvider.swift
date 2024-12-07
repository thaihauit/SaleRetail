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
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Login.self) { (data) in
                        if let data = data as? Login {
                            completion(data)
                        } else {
                            completion(nil)
                        }
                    }
                }
            case .failure:
                completion(nil)
            }
        }
    }
    
    func cumulative(completion: @escaping ([CumulativeModel]) -> Void) {
        provider.request(.cumulative) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Cumulative.self) { (data) in
                        if let data = data as? Cumulative {
                            completion(data.data)
                        } else {
                            completion([])
                        }
                    }
                }
            case .failure:
                completion([])
            }
        }
    }
    
    func inventory(completion: @escaping ([InventoryModel]) -> Void) {
        provider.request(.inventory) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Inventory.self) { (data) in
                        if let data = data as? Inventory {
                            completion(data.data)
                        } else {
                            completion([])
                        }
                    }
                }
            case .failure:
                completion([])
            }
        }
    }
    
    
    func discount(completion: @escaping ([DiscountModel]) -> Void) {
        provider.request(.discount) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Discount.self) { (data) in
                        if let data = data as? Discount {
                            completion(data.data)
                        } else {
                            completion([])
                        }
                    }
                }
            case .failure(let err):
                completion([])
            }
        }
    }
    
    func promotion(completion: @escaping ([PromotionModel]) -> Void) {
        provider.request(.promotion) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Promotion.self) { (data) in
                        if let data = data as? Promotion {
                            completion(data.data)
                        } else {
                            completion([])
                        }
                    }
                }
            case .failure:
                completion([])
            }
        }
    }
    
    func product(completion: @escaping ([ProductListModel]) -> Void) {
        provider.request(.product) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: ProductList.self) { (data) in
                        if let data = data as? ProductList {
                            completion(data.data)
                        } else {
                            completion([])
                        }
                    }
                }
            case .failure:
                completion([])
            }
        }
    }
    
}
