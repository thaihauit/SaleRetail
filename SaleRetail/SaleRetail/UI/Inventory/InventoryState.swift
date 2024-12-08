//
//  InventoryState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class InventoryState: ObservableObject {
    @Published var items: [InventoryModel] = []
    @Published var isLoading = false
    
    func fetchItemList() {
        isLoading = true
        BaseProvider().inventory { items in
            self.items = items
            self.isLoading = false
        }
    }
}
