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
    @Published var isEditItem = false
    @Published var isDeleteItem = false
    @Published var items: [SalesOrderModel] = []
    
}
