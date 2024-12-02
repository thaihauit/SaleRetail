//
//  SalesOrderListState.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation
import UIKit

class SalesOrderListState: ObservableObject {
    
    @Published var items: [SalesOrderModel] = [
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00"),
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17T00:00:00", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00"),
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17T00:00:00", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00"),
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17T00:00:00", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00"),
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17T00:00:00", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00"),
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17T00:00:00", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00"),
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17T00:00:00", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00"),
        .init(id: 1, deliveredDate: "2024-11-17T00:00:00", invoiceDate: "2024-11-15T00:00:00", cumulativeAmount: 111111, paidAmount: 1111111, note: "Don hang khach VIP ", stockExported: false, delivered: false, returned: false, customerName: "Nguyen van A", saleEmployeeName: "Nguyen van B", vehicleLicensePlate: "SH", invoiceNo: "123432", discount: 50000, totalAmount: 193718367, createdEmp: "2024-11-17T00:00:00", createdDate: "2024-11-17T00:00:00", modifiedEmp: "2024-11-17T00:00:00", modifiedDate: "2024-11-17T00:00:00")
        
    ]
    
    
}
