//
//  SalesOrderModel.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation

struct SalesOrder: Decodable {
    let ok: Bool
    let data: [SalesOrderModel]
}

struct SalesOrderModel: Decodable {
    let invoiceNo: String
    let deliveryDate: String
    let customerName: String
    let warehouseName: String
    let note: String
    let createdDate: String
    let totalAmount: Int
    let discount: Int
    let cumulativeAmount: Int
    let paidAmount: Int
    let products: [Product]
    
    struct Product: Decodable {
        let code: String
        let name: String
        let quantity: Int
        let discount: Int
        let price: Int
        let amount: Int
    }
}
