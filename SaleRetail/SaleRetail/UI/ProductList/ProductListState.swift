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
    
    init() {
        fetchProductList()
    }
    
    func fetchProductList() {
        BaseProvider().product { items in
            self.items = items
        }
    }
}

struct ProductList: Decodable {
    let data: [ProductListModel]
}

struct ProductListModel: Decodable {
    let unitName: String
    let sellPrice: Int
    let unitExchangeRate: Int
    let smallUnitSellPrice: Int
    let groupName: String
    let code: String
    let name: String
    let smallUnitName: String
    let minSellUnitName: String
}
