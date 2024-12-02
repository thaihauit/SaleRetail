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
        self.products = [
            .init(id: 1, unit: 1, unitName: "unitName", smallUnit: 111, sellPrice: 111, unitExchangeRate: 111, smallUnitSellPrice: 111, hasExpiredDate: false, groupName: "awdawd", code: "awdawd", name: "awdawdd", units: [], smallUnitName: "Awdawddwa", minSellUnit: 111, minSellUnitName: "awdawdawddwa")
        ]
    }
    
}
