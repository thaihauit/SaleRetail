//
//  DiscountListState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class DiscountListState: ObservableObject {
    
    @Published var items: [DiscountModel] = []
    
    init() {
        fetchDiscountList()
    }
    
    func fetchDiscountList() {
        BaseProvider().discount { items in
            self.items = items
        }
    }
}
