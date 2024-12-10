//
//  DepotState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class DepotState: ObservableObject {
    @Published var depots: [WarehouseModel]
    
    init(depots: [WarehouseModel]) {
        self.depots = depots
    }
}

struct Warehouse: Codable {
    let data: [WarehouseModel]
}

struct WarehouseModel: Codable {
    let id: Int
    let code: String
    let name: String
}
