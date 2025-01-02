//
//  ProductListState.swift
//  SaleRetail
//
//  Created by D.Ace on 24/11/24.
//

import Foundation
import UIKit

class ProductListState: ObservableObject {
    @Published var items: [ProductListModel] = []
    @Published var isLoading = false
    init() {}
    
    func fetchProductList() {
        isLoading = true
        BaseProvider().product { items in
            self.items = items
            self.isLoading = false
        }
    }
}

struct ProductList: Codable {
    let data: [ProductListModel]
}

struct ProductListModel: Codable {
    @Default var unitName: String
    @Default var sellPrice: Int
    @Default var unitExchangeRate: Int
    @Default var smallUnitSellPrice: Int
    @Default var groupName: String
    @Default var code: String
    @Default var name: String
    @Default var smallUnitName: String
    @Default var minSellUnitName: String
}

