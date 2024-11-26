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
    var isReturn: Bool
    
    init(products: [ProductModel], isDisplayUnitModal: Bool = false, isReturn: Bool) {
        self.products = products
        self.isDisplayUnitModal = isDisplayUnitModal
        self.isReturn = isReturn
    }
}
