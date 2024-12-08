//
//  CumulativeListState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class CumulativeListState: ObservableObject {
    
    @Published var items: [CumulativeModel] = []
    
    init() {
        fetchItemList()
    }
    
    func fetchItemList() {
        BaseProvider().cumulative { items in
            self.items = items
        }
    }
    
}
