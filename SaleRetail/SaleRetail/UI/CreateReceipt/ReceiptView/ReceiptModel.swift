//
//  ReceiptModel.swift
//  SaleRetail
//
//  Created by D.Ace on 9/12/24.
//

import Foundation

struct ReceiptData: Codable {
    var cumulativeAmount: Int
    var customer: CustomerModel
    var deliveryDate: String
    var products: [ProductData]
    var discount: Int
    var discountIds: [DiscountId]
    var note: String
    var paidAmount: Int
    var totalAmount: Int
    var vehicle: VehicleModel?
    var warehouse: WarehouseModel
}

struct ReceiptModel: Codable {
    var cumulativeAmount: Int
    var customer: CustomerModel
    var deliveryDate: String
    var products: [ProductModel]
    var discount: Int
    var discountIds: [DiscountId]
    var note: String
    var paidAmount: Int
    var totalAmount: Int
    var vehicle: VehicleModel?
    var warehouse: WarehouseModel
}

struct DiscountId: Codable {
    let discountId: Int
    let amount: Int
}

struct Receipt: Codable {
    let data: ReceiptData?
    let error_message: String?
}

struct SellModel: Codable {
    let ok: Bool
    let error_message: String?
}
