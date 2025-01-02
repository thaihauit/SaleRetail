//
//  PromotionState.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation
import UIKit

class PromotionState: ObservableObject {
    
    @Published var items: [PromotionModel] = []
    @Published var isLoading = false
    
    init() {}
    
    func fetchItemList() {
        isLoading = true
        BaseProvider().promotion { items in
            self.items = items
            self.isLoading = false
        }
    }
}
