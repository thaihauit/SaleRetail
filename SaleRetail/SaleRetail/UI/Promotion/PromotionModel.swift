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
    @Default var code: String
    @Default var name: String
    @Default var providerName: String
    let promotionProducts: [Product]
    
    struct Product: Codable {
        @Default var  productCode: String
        @Default var  productName: String
        @Default var  quantity: Int
        @Default var  unitName: String
    }
}

struct Promotion: Codable {
    let data: [PromotionModel]
}
