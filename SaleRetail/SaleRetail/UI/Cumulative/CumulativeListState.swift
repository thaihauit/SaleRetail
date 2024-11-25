//
//  CumulativeListState.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation
import UIKit

class CumulativeListState: ObservableObject {
    
    @Published var items: [CumulativeModel] = []
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
