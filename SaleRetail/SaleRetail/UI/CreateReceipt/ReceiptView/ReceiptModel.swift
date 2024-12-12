//
//  ReceiptModel.swift
//  SaleRetail
//
//  Created by D.Ace on 9/12/24.
//

import Foundation

struct ReceiptModel: Codable {
    var cumulativeAmount: Int
    var customer: CustomerModel
    var deliverydate: String
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
    let data: ReceiptModel
}
