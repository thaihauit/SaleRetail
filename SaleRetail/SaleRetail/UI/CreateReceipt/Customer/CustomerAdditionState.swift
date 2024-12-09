//
//  CustomerAdditionState.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation
import UIKit

class CustomerAdditionState: ObservableObject {
    
    @Published var customers: [CustomerModel]
    
    init(customers: [CustomerModel]) {
        self.customers = customers
    }
}
