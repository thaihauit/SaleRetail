//
//  InventoryModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct InventoryModel: Decodable {
    let productCode: String
    let productName: String
    let productGroup: String
    let providerName: String
    let warehouseName: String
    let unitName: String
    let unit: Int
    let unitTemporary: Int
    let smallUnitTemporary: Int
    let smallUnitName: String
    let smallUnit: Int
}
