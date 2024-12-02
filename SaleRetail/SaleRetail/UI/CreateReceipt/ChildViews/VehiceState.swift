//
//  VehiceState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class VehiceState: ObservableObject {
    let vehices: [VehiceModel]
    
    init(vehices: [VehiceModel]) {
        self.vehices = [
            VehiceModel(id: 1, licensePlate: "", code: "AB", lisDeleted: false),
            VehiceModel(id: 1, licensePlate: "", code: "NVX", lisDeleted: false),
            VehiceModel(id: 1, licensePlate: "", code: "Dream", lisDeleted: false),
            VehiceModel(id: 1, licensePlate: "", code: "Ware", lisDeleted: false)
        ]
    }
}

struct VehiceModel {
    let id: Int
    let licensePlate: String
    let code: String
    let lisDeleted: Bool
}
