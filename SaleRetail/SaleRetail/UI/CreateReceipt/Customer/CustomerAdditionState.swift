//
//  CustomerAdditionState.swift
//  SaleRetail
//
//  Created by D.Ace on 14/11/24.
//

import Foundation
import UIKit

class CustomerAdditionState: ObservableObject {
    let customers: [CustomerModel]
    
    init(customers: [CustomerModel]) {
        self.customers = [
        ]
    }
}
