//
//  ProductAdditionState.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation
import UIKit

class ProductAdditionState: ObservableObject {
    @Published var products: [ProductModel] = []
    
    init(products: [ProductModel]) {
        self.products = []
    }
    
}
