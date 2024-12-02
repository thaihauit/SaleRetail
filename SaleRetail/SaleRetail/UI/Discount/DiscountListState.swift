//
//  DiscountListState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class DiscountListState: ObservableObject {
    
    @Published var items: [DiscountModel] = [
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000"),
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000"),
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000"),
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000"),
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000"),
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000"),
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000"),
        .init(id: 1, basedOn: "Tổng Tiền", requiredAmount: 10000, fromDate: "2024-11-01T00:00:00", toDate: "2024-11-30T00:00:00", productName: "Tương Ớt 250G (TNP)", productGroupName: "Gia Vị", discountDisplay: "10.000")
    ]
}
