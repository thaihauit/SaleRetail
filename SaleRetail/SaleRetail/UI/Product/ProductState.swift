//
//  ProductState.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation
import UIKit

class ProductState: ObservableObject {
    @Published var products: [ProductModel] = []
    @Published var isDisplayUnitModal = false
    
    init(products: [ProductModel], isDisplayUnitModal: Bool = false) {
        self.products = products
        self.isDisplayUnitModal = isDisplayUnitModal
    }
}
