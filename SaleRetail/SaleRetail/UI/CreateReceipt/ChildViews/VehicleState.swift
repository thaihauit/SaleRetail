//
//  VehicleState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class VehicleState: ObservableObject {
    let vehices: [VehicleModel]
    
    init(vehices: [VehicleModel]) {
        self.vehices = []
    }
}
struct Vehice: Decodable {
    let data: [VehicleModel]
}

struct VehicleModel: Decodable {
    let id: Int
    let licensePlate: String
    let code: String
}