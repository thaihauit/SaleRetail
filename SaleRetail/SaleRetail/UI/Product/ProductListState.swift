//
//  ProductListState.swift
//  SaleRetail
//
//  Created by D.Ace on 24/11/24.
//

import Foundation
import UIKit

class ProductListState: ObservableObject {
    @Published var items: [ProductModel] = []
    
    init(items: [ProductModel]) {
        self.items = []
    }
    
}
