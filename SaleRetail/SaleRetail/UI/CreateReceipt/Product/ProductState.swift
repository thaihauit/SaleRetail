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
    @Published var unitTypes: [UnitType] = []
    
    init(products: [ProductModel]) {
        self.products = products
    }
}
