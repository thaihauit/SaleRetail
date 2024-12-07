//
//  PromotionModel.swift
//  SaleRetail
//
//  Created by D.Ace on 22/11/24.
//

import Foundation

struct PromotionModel: Decodable {
    let id: Int
    let requiredQuantity: Int
    let requiredUnitName: String
    let productCode: String
    let productName: String
    let promotionQuantity: Int
    let promotionProductName: String
    let promotionUnitName: String
    let totalPromotionQuantity: Int
}

struct Promotion: Decodable {
    let data: [PromotionModel]
}
