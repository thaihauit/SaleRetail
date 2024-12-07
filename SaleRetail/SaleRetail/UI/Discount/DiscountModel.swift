//
//  DiscountModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct DiscountModel: Decodable {
    let basedOn: Int
    let requiredAmount: Int
    let fromDate: String
    let toDate: String
    let productName: String
    let productGroupName: String
    let discountDisplay: String
}

struct Discount: Decodable {
    let data: [DiscountModel]
}
