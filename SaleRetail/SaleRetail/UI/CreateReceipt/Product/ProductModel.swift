//
//  ProductModel.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation

struct ProductModel {
    let id: Int
    let unitExchangeRate: Int
    let smallUnitSellPrice: Int
    let groupName: String
    let providerName: String
    let code: String
    let name: String
    let units: [UnitModel]
    let minSellUnit: Int
    let minSellUnitName: String
    let number: Int
    let unitSelected: UnitModel?
    
    init(id: Int, unitExchangeRate: Int, smallUnitSellPrice: Int, groupName: String, providerName: String, code: String, name: String, units: [UnitModel], minSellUnit: Int, minSellUnitName: String, number: Int = 0, unitSelected: UnitModel? = nil) {
        self.id = id
        self.unitExchangeRate = unitExchangeRate
        self.smallUnitSellPrice = smallUnitSellPrice
        self.groupName = groupName
        self.providerName = providerName
        self.code = code
        self.name = name
        self.units = units
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

struct PromotionModel {
    let id: Int
    let product: Int
    let requiredUnit: Int
    let requiredQuantity: Int
    let promotionProduct: Int
    let promotionQuantity: Int
    let promotionUnit: Int
    let totalPromotionQuantity: Int
    let active: Bool
    let createdDate: String
    let createdEmp: String
    let productCode: String
    let promotionProductCode: String
    let productName: String
    let requiredUnitName: String
    let promotionProductName: String
    let promotionUnitName: String
    let isDeleted: Bool
}


