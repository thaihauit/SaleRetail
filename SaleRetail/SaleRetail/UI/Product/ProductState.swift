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
    @Published var isDisable = false
    
    init(products: [ProductModel], isDisplayUnitModal: Bool = false, isDisable: Bool = false) {
        self.products = products
        self.isDisplayUnitModal = isDisplayUnitModal
        self.isDisable = isDisable
    }
}
