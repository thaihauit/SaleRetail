//
//  CreateReceiptState.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation
import UIKit

class CreateReceiptState: ObservableObject {
    
    @Published var isShowCustomerModal = false
    @Published var iShowProductModal = false
    @Published var customer: CustomerModel?
    @Published var products: [ProductModel] = []
    @Published var vehice: VehicleModel?
    @Published var depot: WarehouseModel?
    @Published var iShowVehiceModal = false
    @Published var iShowDepotModal = false
    @Published var isDisplayUnitModal = false
    @Published var iShowEdit = false
    
    var deliverString: String {
        dateFormatter.string(from: deliverDate)
    }
    @Published var deliverDate = Date()
    @Published var isShowDatePicker = false
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter
    }
    
    func selectedNumber(index: Int, value: Int) {
        let product = products[index]
        products[index] = ProductModel(
            id: product.id,
            unit: product.unit,
            unitName: product.unitName,
            smallUnit: product.smallUnit,
            sellPrice: product.sellPrice,
            unitExchangeRate: product.unitExchangeRate,
            smallUnitSellPrice: product.smallUnitSellPrice,
            hasExpiredDate: product.hasExpiredDate,
            groupName: product.groupName,
            code: product.code,
            name: product.name,
            units: product.units,
            smallUnitName: product.smallUnitName,
            minSellUnit: product.minSellUnit,
            minSellUnitName: product.minSellUnitName,
            number: value,
            unitSelected: product.unitSelected
        )
    }
    
    func selectedUnit(index: Int, unit: UnitModel) {
        let product = products[index]
        products[index] = ProductModel(
            id: product.id,
            unit: product.unit,
            unitName: product.unitName,
            smallUnit: product.smallUnit,
            sellPrice: product.sellPrice,
            unitExchangeRate: product.unitExchangeRate,
            smallUnitSellPrice: product.smallUnitSellPrice,
            hasExpiredDate: product.hasExpiredDate,
            groupName: product.groupName,
            code: product.code,
            name: product.name,
            units: product.units,
            smallUnitName: product.smallUnitName,
            minSellUnit: product.minSellUnit,
            minSellUnitName: product.minSellUnitName,
            number: product.quantity,
            unitSelected: unit
        )
    }
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
