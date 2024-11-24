//
//  PromotionState.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation
import UIKit

class PromotionState: ObservableObject {
    
    @Published var items: [PromotionModel] = []
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
