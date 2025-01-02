//
//  ProductModel.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation

struct Product: Codable {
    let data: [ProductData]
}

struct ProductData: Codable {
    let id: Int
    let unit: Int
    let smallUnit: Int
    let discount: Int
    let unitExchangeRate: Int
    let code: String
    let name: String
    let units: [UnitModel]
    let quantity: Int
    let unitSelected: UnitModel?
    let amount: Int
    let isPromotionProduct: Bool
    let promotions: [SalePromotion]?
}

struct ProductModel: Identifiable, Codable {
    var uuid = UUID()
    let id: Int
    let unit: Int
    let smallUnit: Int
    let discount: Int
    let unitExchangeRate: Int
    let code: String
    let name: String
    let units: [UnitModel]
    let quantity: Int
    let unitSelected: UnitModel?
    let amount: Int
    let isPromotionProduct: Bool
    let promotions: [SalePromotion]?
}

struct SalePromotion: Codable {
    @Default var Promotion: Int
    @Default var Product: Int
    @Default var Provider: Int
    @Default var ProductGroup: [Int]
}

