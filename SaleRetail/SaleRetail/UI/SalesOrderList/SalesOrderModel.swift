//
//  SalesOrderModel.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation

struct SalesOrder: Codable {
    let ok: Bool
    let data: [SalesOrderModel]
}

struct SalesOrderModel: Codable {
    @Default var  invoiceNo: String
    @Default var  deliveryDate: String
    @Default var  customerName: String
    @Default var  warehouseName: String
    @Default var  note: String
    @Default var  vehicleLicensePlate: String
    @Default var  totalAmount: Int
    @Default var  discount: Int
    @Default var  cumulativeAmount: Int
    @Default var  paidAmount: Int
    let products: [Product]
    @Default var stockExported: Bool
    
    struct Product: Codable {
        @Default var  code: String
        @Default var  name: String
        @Default var  quantity: Int
        @Default var  discount: Int
        @Default var  price: Int
        @Default var  amount: Int
    }
}
