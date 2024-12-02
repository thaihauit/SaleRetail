//
//  CumulativeListState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class CumulativeListState: ObservableObject {
    
    @Published var items: [CumulativeModel] = [
        .init(fromDate: "5/11/2024", toDate: "17/11/2024", requiredAmount: 5000000, discountAmount: 70000),
        .init(fromDate: "5/11/2024", toDate: "17/11/2024", requiredAmount: 5000000, discountAmount: 70000),
        .init(fromDate: "5/11/2024", toDate: "17/11/2024", requiredAmount: 5000000, discountAmount: 70000),
        .init(fromDate: "5/11/2024", toDate: "17/11/2024", requiredAmount: 5000000, discountAmount: 70000),
        .init(fromDate: "5/11/2024", toDate: "17/11/2024", requiredAmount: 5000000, discountAmount: 70000),
        .init(fromDate: "5/11/2024", toDate: "17/11/2024", requiredAmount: 5000000, discountAmount: 70000)
    ]
}
