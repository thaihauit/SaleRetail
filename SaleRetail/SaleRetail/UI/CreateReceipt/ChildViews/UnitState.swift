//
//  UnitState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class UnitState: ObservableObject {
    let units: [UnitModel]
    
    init(units: [UnitModel]) {
        self.units = [
            UnitModel(id: 1, price: 1234, name: "Tui"),
            UnitModel(id: 1, price: 2222, name: "Bich"),
            UnitModel(id: 1, price: 1111, name: "chai"),
        ]
    }
}

struct UnitModel: Decodable {
    let id: Int
    let price: Int
    let name: String
}
