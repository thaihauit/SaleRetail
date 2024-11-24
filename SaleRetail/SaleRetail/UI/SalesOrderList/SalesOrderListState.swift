//
//  SalesOrderListState.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation
import UIKit

class SalesOrderListState: ObservableObject {
    
    @Published var items: [SalesOrderModel] = []
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
