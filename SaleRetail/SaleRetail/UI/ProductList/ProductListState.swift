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
    
    init(items: [ProductListModel]) {
        self.items = [
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng"),
            .init(unitName:  "Thùng", smallUnit: 11, sellPrice: 400000, unitExchangeRate: 40, smallUnitSellPrice: 11, groupName: "Chao", code:  "SP00025", name: "Chao Nhỏ Vàng (Cao Cấp) -170G BD", smallUnitName: "Keo", minSellUnitName: "Thùng")
        ]
    }
    
}

struct ProductListModel {
        let unitName: String
        let smallUnit: Int
        let sellPrice: Int
        let unitExchangeRate: Int
        let smallUnitSellPrice: Int
        let groupName: String
        let code: String
        let name: String
        let smallUnitName: String
        let minSellUnitName: String
}
