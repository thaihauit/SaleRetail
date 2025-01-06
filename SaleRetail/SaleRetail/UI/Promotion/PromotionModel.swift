//
//  PromotionModel.swift
//  SaleRetail
//
//  Created by D.Ace on 22/11/24.
//

import Foundation

struct PromotionModel: Codable {
    
    @Default var  headerText: String
    @Default var  requiredUnitName: String
    @Default var  fromDate: String
    @Default var  toDate: String
    let promotionDetails: [PromotionDetail]
    
    struct PromotionDetail: Codable {
        @Default var requiredQuantity: Int
        let promotionProducts: [Product]
    }
    
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
