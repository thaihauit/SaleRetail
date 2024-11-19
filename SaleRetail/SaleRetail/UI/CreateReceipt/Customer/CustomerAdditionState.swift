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
            CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false),
            CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false),
            CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false),
            CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false)
        ]
    }
    
    let width = UIApplication.shared.windows.first?.bounds.width
}
