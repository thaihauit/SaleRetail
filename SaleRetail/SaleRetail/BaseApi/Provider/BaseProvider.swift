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
    
    func sellist(fromDate: String, toDate: String, completion: @escaping ([SalesOrderModel]) -> Void) {
        provider.request(.sellist(fromDate: fromDate, toDate: toDate)) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: SalesOrder.self) { (data) in
                        if let data = data as? SalesOrder {
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
    
    func sell(json: [String: Any], completion: @escaping (SellModel?) -> Void) {
        provider.request(.sell(json: json)) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: SellModel.self) { (data) in
                        if let data = data as? SellModel {
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
    
    func calculatePromotion(json: [String: Any], completion: @escaping (Receipt?) -> Void) {
        provider.request(.calculatePromotion(json: json)) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Receipt.self) { (data) in
                        if let data = data as? Receipt {
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
    
    func transfer(datas: [ProductData]) -> [ProductModel] {
        return datas.map {
           ProductModel(
               id: $0.id,
               unit: $0.unit,
               smallUnit: $0.smallUnit,
               discount: $0.discount,
               unitExchangeRate: $0.unitExchangeRate,
               code: $0.code,
               name: $0.name,
               units: $0.units,
               quantity: $0.quantity,
               unitSelected: $0.unitSelected,
               amount: $0.amount,
               isPromotionProduct: $0.isPromotionProduct
           )
       }
    }
    
    func productSell(completion: @escaping ([ProductModel]) -> Void) {
        provider.request(.productSell) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Product.self) { (data) in
                        if let data = data as? Product {
                            completion(transfer(datas: data.data))
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
    
    func vehicle(completion: @escaping ([VehicleModel]) -> Void) {
        provider.request(.vehicle) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Vehice.self) { (data) in
                        if let data = data as? Vehice {
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
    
    func warehouse(completion: @escaping ([WarehouseModel]) -> Void) {
        provider.request(.warehouse) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Warehouse.self) { (data) in
                        if let data = data as? Warehouse {
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
    
    func customer(completion: @escaping ([CustomerModel]) -> Void) {
        provider.request(.customer) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    BaseRestApi.decodingTask(with: response.data, decodingType: Customer.self) { (data) in
                        if let data = data as? Customer {
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
            case .failure:
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
