//
//  SalesOrderListState.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation
import UIKit

class SalesOrderListState: ObservableObject {
    
    @Published var isTapItem = false
    @Published var items: [SalesOrderModel] = []
    
    init() {
        fetchItemList()
    }
    
    func fetchItemList() {
        BaseProvider().sell(fromDate: "2024-07-05", toDate: "2024-12-05") { items in
            self.items = items
        }
    }
    
}
