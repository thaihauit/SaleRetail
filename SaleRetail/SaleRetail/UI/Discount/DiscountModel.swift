//
//  DiscountModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct DiscountModel: Codable {
    @Default var basedOnDisplay: String
    @Default var requiredAmount: Int
    @Default var fromDate: String
    @Default var toDate: String
    @Default var code: String
    @Default var name: String
    @Default var discountDisplay: String
    @Default var providerName: String
}

struct Discount: Codable {
    let data: [DiscountModel]
}
