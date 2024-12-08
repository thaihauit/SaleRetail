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
    
    init() {
        fetchItemList()
    }
    
    func fetchItemList() {
        BaseProvider().promotion { items in
            self.items = items
        }
    }
}
