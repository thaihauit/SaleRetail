//
//  ProductItemState.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation

class ProductItemState: ObservableObject {
    @Published var product: ProductModel
    var index: Int
    @Published var isDisplayUnitModal = false
    
    init(product: ProductModel, index: Int, isDisplayUnitModal: Bool = false) {
        self.product = product
        self.index = index
        self.isDisplayUnitModal = isDisplayUnitModal
    }
    
    var quantityText: String {
        if product.quantity > 0 {
            return "\(product.quantity)"
        }
        return ""
    }
}
