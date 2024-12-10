//
//  VehicleState.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import Foundation

class VehicleState: ObservableObject {
    @Published var vehicles: [VehicleModel]
    
    init(vehices: [VehicleModel]) {
        self.vehicles = vehices
    }
}
struct Vehice: Codable {
    let data: [VehicleModel]
}

struct VehicleModel: Codable {
    let id: Int
    let licensePlate: String
    let code: String
}
