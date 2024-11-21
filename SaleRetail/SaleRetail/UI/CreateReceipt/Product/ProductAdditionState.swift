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
            .init(
                id: 1,
                unitExchangeRate: 1,
                smallUnitSellPrice: 1,
                groupName: "abcd",
                providerName: "cabdd",
                code: "SP1111",
                name: "tuong ot",
                units: [
                    .init(id: 1, price: 1111, name: "bich"),
                        .init(id: 1, price: 1111, name: "chai")
                ],
                minSellUnit: 1,
                minSellUnitName: "chai"
            ),
            .init(
                id: 2,
                unitExchangeRate: 1,
                smallUnitSellPrice: 1,
                groupName: "abcd",
                providerName: "cabdd",
                code: "SP1111",
                name: "tuong ot",
                units: [
                    .init(id: 1, price: 1111, name: "bich"),
                        .init(id: 1, price: 1111, name: "chai")
                ],
                minSellUnit: 1,
                minSellUnitName: "chai"
            ),
            .init(
                id: 3,
                unitExchangeRate: 1,
                smallUnitSellPrice: 1,
                groupName: "abcd",
                providerName: "cabdd",
                code: "SP1111",
                name: "tuong ot",
                units: [
                    .init(id: 1, price: 1111, name: "bich"),
                        .init(id: 1, price: 1111, name: "chai")
                ],
                minSellUnit: 1,
                minSellUnitName: "chai"
            )
        ]
    }
    
    
}
