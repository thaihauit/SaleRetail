//
//  RoomMainApi.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/14/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya

enum ApiType {
    case login(userName: String, password: String)
    case sellist(fromDate: String, toDate: String)
    case product
    case promotion
    case discount
    case cumulative
    case inventory
    case vehicle
    case warehouse
    case customer
    case productSell
    case calculatePromotion(json: [String: Any])
    case sell(json: [String: Any])
    
}

private extension String {
    var urlEscaped: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

extension ApiType: TargetType {
    
    public var headers: [String: String]? {
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        default:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(LoginManager.shared.token)"
            ]
        }
    }
   
    var baseURL: URL {
        URL(string: "https://qlbhkh.com:500/mobile")!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/login"
        case .sellist:
            return "/sell/list"
        case .product:
            return "/product/list"
        case .promotion:
            return "/promotion/list"
        case .discount:
            return "/discount/list"
        case .cumulative:
            return "/cumulative/list"
        case .inventory:
            return "/inventories/list"
        case .vehicle:
            return "/vehicle/list"
        case .warehouse:
            return "/warehouse/list"
        case .customer:
            return "/customer/list"
        case .productSell:
            return "/product/listforsell"
        case .calculatePromotion:
            return "/sell/calculatepromotion"
        case .sell:
            return "/sell"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login, .sellist, .calculatePromotion, .sell:
            return .post
            
        default: return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    public var task: Task {
        switch self {
        case .login(let userName, let password):
            let parameters: [String: Any] = [
                        "username": userName,
                        "password": password
                    ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case let .sellist(fromDate, toDate):
            let parameters: [String: Any] = [
                        "fromDate": fromDate,
                        "toDate": toDate
                    ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case let .calculatePromotion(json):
            return .requestParameters(parameters: json, encoding: JSONEncoding.default)
        case let .sell(json):
            return .requestParameters(parameters: json, encoding: JSONEncoding.default)
            
        default:
            return .requestPlain
        }
        
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}


