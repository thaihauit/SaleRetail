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
    var promotions: [Int]
}

struct ReceiptModel: Codable {
    @Default var cumulativeAmount: Int
    var customer: CustomerModel
    @Default var deliveryDate: String
    var products: [ProductModel]
    @Default var discount: Int
    var discountIds: [DiscountId]
    @Default var note: String
    @Default var paidAmount: Int
    @Default var totalAmount: Int
    var vehicle: VehicleModel?
    var warehouse: WarehouseModel
    var promotions: [Int]
}

struct DiscountId: Codable {
    @Default var discountId: Int
    @Default var amount: Int
}

struct Receipt: Codable {
    let data: ReceiptData?
    let error_message: String?
}

struct SellModel: Codable {
    let ok: Bool
    @Default var error_message: String
}
