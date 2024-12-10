//
//  ReceiptModel.swift
//  SaleRetail
//
//  Created by D.Ace on 9/12/24.
//

import Foundation

struct ReceiptModel: Codable {
    var CumulativeAmount: Int
    var CumulativeId: String
    var Customer: CustomerModel
    var DeliveredDate: String
    var Products: [ProductModel]
    var Discount: Int
    var DiscountIds: [String]
    var Note: String
    var PaidAmount: Int
    var TotalAmount: Int
    var Vehicle: VehicleModel
    var Versio: Int
    var Warehouse: WarehouseModel
}
