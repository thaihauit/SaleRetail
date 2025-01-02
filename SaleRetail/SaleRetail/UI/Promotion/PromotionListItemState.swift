//
//  PromotionListItemState.swift
//  SaleRetail
//
//  Created by D.Ace on 2/1/25.
//

import Foundation

class PromotionListItemState: ObservableObject {
    
    @Published var products: [PromotionModel.Product] = []
    
    init(products: [PromotionModel.Product]) {
        self.products = products
    }
}
    
