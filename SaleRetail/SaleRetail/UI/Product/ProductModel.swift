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
}

