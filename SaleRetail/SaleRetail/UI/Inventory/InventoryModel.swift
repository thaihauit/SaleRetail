//
//  InventoryModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct InventoryModel: Decodable {
    @Default var productCode: String
    @Default var productName: String
    @Default var productGroup: String
    @Default var providerName: String
    @Default var warehouseName: String
    @Default var unitName: String
    @Default var unit: Int
    @Default var unitTemporary: Int
    @Default var smallUnitTemporary: Int
    @Default var smallUnitName: String
    @Default var smallUnit: Int
}

struct Inventory: Decodable {
    let data: [InventoryModel]
}
