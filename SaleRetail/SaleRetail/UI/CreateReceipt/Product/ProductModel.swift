//
//  ProductModel.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation

struct ProductModel {
    let id: Int
    let group: Int
    let provider: Int
    let unit: Int
    let smallUnit: Int
    let unitExchangeRate: Int
    let buyPrice: Int
    let sellPrice: Int
    let smallUnitSellPrice: Int
    let weight: Int
    let smallUnitWeight: Int
    let minSellUnit: Int
    let isDeleted: Bool
    let  hasExpiredDate: Bool
    let  groupName: String
    let  providerName: String
    let  unitName: String
    let  smallUnitName: String
    let  minSellUnitName: String
    let  code: String
    let  name: String
    
    let number: Int = 0
    let unitSelected: UnitModel? = nil
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
    let code: String
    let name: String
}

enum UnitType {
    case small(model: UnitModel)
    case big(model: UnitModel)
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

struct SalesOrderModel {
    struct DiscountId {
        let discountId: Int
        let amount: Int
    }
    
    struct Detail {
        let price: Int
        let priceOriginal: Int
        let amount: Int
        let discount: Int
        let discountId: Int
        let product: Int
        let unit: Int
        let quantity: Int
    }
    
    struct Promotion {
        let promotionId: Int
        let product: Int
        let unit: Int
        let quantity: Int
    }
    
    let id: Int
    let customer: Int
    let saleEmployee: Int
    let warehouse: Int
    let vehicle: Int
    let deliveredDate: String
    let invoiceDate: String
    let discountAmount: Int
    let cumulativeAmount: Int
    let paidAmount: Int
    let note: String
    let stockExported: Bool
    let delivered: Bool
    let returned: Bool
    let cumulativeId: Int
    let version: Int
    let discountIds: [DiscountId]
    let invoiceNo: String
    let discount: Int
    let totalAmount: Int
    let createdBy: Int
    let modifiedBy: Int
    let detail: [Detail]
    let promotion: [Promotion]
    let createdDate: String
}

