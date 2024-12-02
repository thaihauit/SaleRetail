//
//  DepotState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class DepotState: ObservableObject {
    let depots: [DepotModel]
    
    init(depots: [DepotModel]) {
        self.depots = [
            DepotModel(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false),
            DepotModel(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false),
            DepotModel(id: 1, code: "", name: "Kho A", isLiquidation: false, isDeleted: false)
        ]
    }
}

struct DepotModel {
    let id: Int
    let code: String
    let name: String
    let isLiquidation: Bool
    let isDeleted: Bool
}
