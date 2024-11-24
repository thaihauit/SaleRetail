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
    let providerName: String
    let code: String
    let name: String
    let units: [UnitModel]
    let smallUnitName: String
    let minSellUnit: Int
    let minSellUnitName: String
    
    let number: Int
    let unitSelected: UnitModel?
    
    init(id: Int, unit: Int, unitName: String, smallUnit: Int, sellPrice: Int, unitExchangeRate: Int, smallUnitSellPrice: Int, hasExpiredDate: Bool, groupName: String, providerName: String, code: String, name: String, units: [UnitModel], smallUnitName: String, minSellUnit: Int, minSellUnitName: String, number: Int = 0, unitSelected: UnitModel? = nil) {
        self.id = id
        self.unit = unit
        self.unitName = unitName
        self.smallUnit = smallUnit
        self.sellPrice = sellPrice
        self.unitExchangeRate = unitExchangeRate
        self.smallUnitSellPrice = smallUnitSellPrice
        self.hasExpiredDate = hasExpiredDate
        self.groupName = groupName
        self.providerName = providerName
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

struct VehiceModel {
    let id: Int
    let licensePlate: String
    let code: String
    let lisDeleted: Bool
}

struct VatModel {
    let id: Int
    let value: Int
    let name: String
    let isDeleted: Bool
}

struct DepotModel {
    let id: Int
    let code: String
    let name: String
    let isLiquidation: Bool
    let isDeleted: Bool
}

struct UnitModel {
    let id: Int
    let price: Int
    let name: String
}

struct DiscountModel {
    let id: Int
    let type: Int
    let basedOn: Int
    let product: Int
    let requiredAmount: Int
    let fromDate: String
    let toDate: String
    let discountPercent: Int
    let discountAmount: Int
    let active: Bool
    let createdBy: Int
    let createdDate: String
    let modifiedDate: String
    let lastUpdate: String
    let productName: String
    let basedOnDisplay: String
    let createdByEmp: String
    let modifiedByEmp: String
    let isDeleted: Bool
}

struct CumulativeDiscountModel {
    let id: Int
    let fromDate: String
    let toDate: String
    let requiredAmount: Int
    let discountAmount: Int
    let active: Bool
    let createdBy: Int
    let createdDate: String
    let modifiedDate: String
    let lastUpdate: String
    let createdByEmp: String
    let modifiedByEmp: String
   let isDeleted: Bool
}

struct PaymentMethodModel {
    let id: Int
    let name: String
    let isDeleted: Bool
}




