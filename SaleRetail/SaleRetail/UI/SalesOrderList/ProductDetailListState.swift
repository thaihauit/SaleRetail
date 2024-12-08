//
//  ProductDetailListState.swift
//  SaleRetail
//
//  Created by D.Ace on 8/12/24.
//

import Foundation

class ProductDetailListState: ObservableObject {
    @Published var products: [SalesOrderModel.Product] = []
   
    init(products: [SalesOrderModel.Product]) {
        self.products = products
    }
    
}
