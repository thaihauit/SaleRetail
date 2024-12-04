//
//  LoginModel.swift
//  SaleRetail
//
//  Created by D.Ace on 4/12/24.
//

import Foundation

struct Login: Decodable {
    let ok: Bool
    let data: Data
    
    struct Data: Decodable {
        let token: String
        let refToken: String
        let expiredTime: String
    }
}


