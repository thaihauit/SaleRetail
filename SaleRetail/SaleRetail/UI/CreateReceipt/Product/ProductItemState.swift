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
    
    var unitSelected: UnitModel? {
        if let unit = product.unitSelected {
            return unit
        }
        return product.units.first
    }
    
    var totalCost: Int {
        let price = unitSelected?.price ?? 1
        let number = product.number
        return price * number
    }
}
