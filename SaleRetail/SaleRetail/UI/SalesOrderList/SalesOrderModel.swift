//
//  SalesOrderModel.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation

struct SalesOrderModel {
    let id: Int
    let deliveredDate: String
    let invoiceDate: String
    let cumulativeAmount: Int
    let paidAmount: Int
    let note: String
    let stockExported: Bool
    let delivered: Bool
    let returned: Bool
    let customerName: String
    let saleEmployeeName: String
    let vehicleLicensePlate: String
    let invoiceNo: String
    let discount: Int
    let totalAmount: Int
    let createdEmp: String
    let createdDate: String
    let modifiedEmp: String
    let modifiedDate: String
}
