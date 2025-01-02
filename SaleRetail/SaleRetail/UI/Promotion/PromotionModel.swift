//
//  PromotionModel.swift
//  SaleRetail
//
//  Created by D.Ace on 22/11/24.
//

import Foundation

struct PromotionModel: Codable {
    @Default var requiredQuantity: Int
    @Default var requiredUnitName: String
    @Default var productCode: String
    @Default var productName: String
    @Default var providerName: String
    @Default var promotionQuantity: Int
    @Default var promotionProductName: String
    @Default var promotionUnitName: String
    @Default var totalPromotionQuantity: Int
}

struct Promotion: Codable {
    let data: [PromotionModel]
}
