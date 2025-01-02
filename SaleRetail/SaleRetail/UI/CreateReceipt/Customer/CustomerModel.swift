//
//  CustomerModel.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation

struct CustomerModel: Codable {
    @Default var  id: Int
    @Default var  phone: String
    @Default var  address: String
    @Default var  code: String
    @Default var  name: String
    @Default var  note: String
}

struct Customer: Codable {
    let data: [CustomerModel]
}
