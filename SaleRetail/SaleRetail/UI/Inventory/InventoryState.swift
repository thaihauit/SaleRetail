//
//  InventoryState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class InventoryState: ObservableObject {
    
    @Published var items: [InventoryModel] = []
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
