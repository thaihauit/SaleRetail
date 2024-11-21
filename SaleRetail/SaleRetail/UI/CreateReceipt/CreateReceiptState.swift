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
    @Published var isShowDatePicker = false
    @Published var deliverDate = Date()
    @Published var customer: CustomerModel?
    @Published var products: [ProductModel] = []
    @Published var vehice: VehiceModel?
    @Published var depot: DepotModel?
    @Published var iShowVehiceModal = false
    @Published var iShowDepotModal = false
    @Published var isDisplayUnitModal = false
    
    var deliverString: String {
        dateFormatter.string(from: deliverDate)
    }
    
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
            unitExchangeRate: product.unitExchangeRate,
            smallUnitSellPrice: product.smallUnitSellPrice,
            groupName: product.groupName,
            providerName: product.providerName,
            code: product.code,
            name: product.name,
            units: product.units,
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
            unitExchangeRate: product.unitExchangeRate,
            smallUnitSellPrice: product.smallUnitSellPrice,
            groupName: product.groupName,
            providerName: product.providerName,
            code: product.code,
            name: product.name,
            units: product.units,
            minSellUnit: product.minSellUnit,
            minSellUnitName: product.minSellUnitName,
            number: product.number,
            unitSelected: unit
        )
    }
    
    let width = UIApplication.shared.windows.first?.bounds.width ?? 0
}
