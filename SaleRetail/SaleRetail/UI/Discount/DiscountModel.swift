//
//  DiscountModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct DiscountModel: Decodable {
    @Default var basedOnDisplay: String
    @Default var requiredAmount: Int
    @Default var fromDate: String
    @Default var toDate: String
    @Default var productName: String
    @Default var productGroupName: String
    @Default var discountDisplay: String
}

struct Discount: Decodable {
    let data: [DiscountModel]
}
