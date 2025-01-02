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
    @Default var id: Int
    @Default var licensePlate: String
    @Default var code: String
}
