//
//  DiscountListState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class DiscountListState: ObservableObject {
    
    @Published var items: [DiscountModel] = []
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
