//
//  DiscountModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct DiscountModel: Decodable {
    let basedOnDisplay: String
    let requiredAmount: Int
    let fromDate: String
    let toDate: String
    let productName: String
    let productGroupName: String?
    let discountDisplay: String
}

struct Discount: Decodable {
    let data: [DiscountModel]
}
