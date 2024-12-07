//
//  DepotState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class DepotState: ObservableObject {
    let depots: [WarehouseModel]
    
    init(depots: [WarehouseModel]) {
        self.depots = [
            WarehouseModel(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false),
            WarehouseModel(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false),
            WarehouseModel(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false)
        ]
    }
}

struct Warehouse: Decodable {
    let data: WarehouseModel
}

struct WarehouseModel: Decodable {
    let id: Int
    let code: String
    let name: String
    let isLiquidation: Bool
    let isDeleted: Bool
}
