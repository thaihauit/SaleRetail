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

struct Unit: Codable {
    let data: UnitModel
}

struct UnitModel: Codable {
    @Default var id: Int
    @Default var price: Int
    @Default var name: String
}
