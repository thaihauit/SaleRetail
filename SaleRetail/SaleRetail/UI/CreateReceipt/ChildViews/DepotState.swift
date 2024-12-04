//
//  DepotState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class DepotState: ObservableObject {
    let depots: [Warehouse]
    
    init(depots: [Warehouse]) {
        self.depots = [
            Warehouse(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false),
            Warehouse(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false),
            Warehouse(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false)
        ]
    }
}

struct Warehouse: Decodable {
    let id: Int
    let code: String
    let name: String
    let isLiquidation: Bool
    let isDeleted: Bool
}
