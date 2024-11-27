//
//  ReturnReceiptListState.swift
//  SaleRetail
//
//  Created by D.Ace on 27/11/24.
//

import Foundation
import UIKit

class ReturnReceiptListState : ObservableObject {
    @Published var items: [ReturnReceiptModel] = []
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
