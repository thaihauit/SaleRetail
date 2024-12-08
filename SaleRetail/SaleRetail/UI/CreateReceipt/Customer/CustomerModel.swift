//
//  CustomerModel.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation

struct CustomerModel: Decodable {
    let  id: Int
    let  phone: String
    let  address: String
    let  code: String
    let  name: String
    let  note: String
}

struct Customer: Decodable {
    let data: [CustomerModel]
}
