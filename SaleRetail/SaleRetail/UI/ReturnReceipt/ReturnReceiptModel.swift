//
//  ReturnReceiptModel.swift
//  SaleRetail
//
//  Created by D.Ace on 27/11/24.
//

import Foundation

struct ReturnReceiptModel {
    let  id: Int
    let  sellId: Int
    let  customer: Int
    let  saleEmployee: Int
    let   warehouse: Int
    let vehicle: Int
    let  sellInvoiceNo: String
    let  sellDeliveryDate: String
    let  sellInvoiceDate: String
    let  cumulativeAmount: Int
    let  paidAmount: Int
    let  stockImported: Bool
    let  receivedAll: Bool
    let  version: Int
    let  lastUpdate: String
    let  customerName: String
    let  saleEmployeeName: String
    let  vehicleLicensePlate: String
    let  invoiceNo: String
    let  discount: Int
    let  totalAmount: Int
    let  createdEmp: String
    let  createdDate: String
}
