//
//  PromotionState.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation
import UIKit

class PromotionState: ObservableObject {
    
    @Published var items: [PromotionModel] = [
        .init(id: 1, requiredQuantity: 1, requiredUnitName: "Thùng", productCode: "SP00383", productName: "Bột Năng Song Long (Gói 500G)", promotionQuantity: 1, promotionProductName: "Bánh Hoàng Gia - Gấc", promotionUnitName: "Chai", totalPromotionQuantity: 972),
        .init(id: 1, requiredQuantity: 1, requiredUnitName: "Thùng", productCode: "SP00383", productName: "Bột Năng Song Long (Gói 500G)", promotionQuantity: 1, promotionProductName: "Bánh Hoàng Gia - Gấc", promotionUnitName: "Chai", totalPromotionQuantity: 972),
        .init(id: 1, requiredQuantity: 1, requiredUnitName: "Thùng", productCode: "SP00383", productName: "Bột Năng Song Long (Gói 500G)", promotionQuantity: 1, promotionProductName: "Bánh Hoàng Gia - Gấc", promotionUnitName: "Chai", totalPromotionQuantity: 972),
        .init(id: 1, requiredQuantity: 1, requiredUnitName: "Thùng", productCode: "SP00383", productName: "Bột Năng Song Long (Gói 500G)", promotionQuantity: 1, promotionProductName: "Bánh Hoàng Gia - Gấc", promotionUnitName: "Chai", totalPromotionQuantity: 972),
        .init(id: 1, requiredQuantity: 1, requiredUnitName: "Thùng", productCode: "SP00383", productName: "Bột Năng Song Long (Gói 500G)", promotionQuantity: 1, promotionProductName: "Bánh Hoàng Gia - Gấc", promotionUnitName: "Chai", totalPromotionQuantity: 972),
        .init(id: 1, requiredQuantity: 1, requiredUnitName: "Thùng", productCode: "SP00383", productName: "Bột Năng Song Long (Gói 500G)", promotionQuantity: 1, promotionProductName: "Bánh Hoàng Gia - Gấc", promotionUnitName: "Chai", totalPromotionQuantity: 972)
    ]
}
