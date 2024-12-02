//
//  ProductModel.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation

struct ProductModel {
    let id: Int
    let unit: Int
    let unitName: String
    let smallUnit: Int
    let sellPrice: Int
    let unitExchangeRate: Int
    let smallUnitSellPrice: Int
    let hasExpiredDate: Bool
    let groupName: String
    let code: String
    let name: String
    let units: [UnitModel]
    let smallUnitName: String
    let minSellUnit: Int
    let minSellUnitName: String
    
    let number: Int
    let unitSelected: UnitModel?
    
    init(id: Int, unit: Int, unitName: String, smallUnit: Int, sellPrice: Int, unitExchangeRate: Int, smallUnitSellPrice: Int, hasExpiredDate: Bool, groupName: String, code: String, name: String, units: [UnitModel], smallUnitName: String, minSellUnit: Int, minSellUnitName: String, number: Int = 0, unitSelected: UnitModel? = nil) {
        self.id = id
        self.unit = unit
        self.unitName = unitName
        self.smallUnit = smallUnit
        self.sellPrice = sellPrice
        self.unitExchangeRate = unitExchangeRate
        self.smallUnitSellPrice = smallUnitSellPrice
        self.hasExpiredDate = hasExpiredDate
        self.groupName = groupName
        self.code = code
        self.name = name
        self.units = units
        self.smallUnitName = smallUnitName
        self.minSellUnit = minSellUnit
        self.minSellUnitName = minSellUnitName
        self.number = number
        self.unitSelected = unitSelected
    }
}

