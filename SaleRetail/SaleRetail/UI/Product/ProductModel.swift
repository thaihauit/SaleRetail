//
//  ProductModel.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation

struct Product: Codable {
    let data: [ProductModel]
}

struct ProductModel: Codable, Identifiable {
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
    
    init(id: Int, unit: Int, smallUnit: Int, discount: Int, unitExchangeRate: Int, code: String, name: String, units: [UnitModel], quantity: Int, unitSelected: UnitModel? = nil, amount: Int) {
        self.id = id
        self.unit = unit
        self.smallUnit = smallUnit
        self.discount = discount
        self.unitExchangeRate = unitExchangeRate
        self.code = code
        self.name = name
        self.units = units
        self.quantity = quantity
        self.unitSelected = unitSelected
        self.amount = amount
    }
}

