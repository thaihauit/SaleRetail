//
//  UnitState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class UnitState: ObservableObject {
    @Published var units: [UnitModel]
    
    init(units: [UnitModel]) {
        self.units = units
    }
}

struct Unit: Decodable {
    let data: UnitModel
}

struct UnitModel: Decodable {
    let id: Int
    let price: Int
    let name: String
}
