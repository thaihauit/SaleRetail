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
    @Published var vehicle: VehicleModel?
    @Published var depot: WarehouseModel?
    @Published var iShowVehiceModal = false
    @Published var iShowDepotModal = false
    @Published var isDisplayUnitModal = false
    
    @Published var productAdditions: [ProductModel] = []
    @Published var products: [ProductModel] = []
    @Published var vehicles: [VehicleModel] = []
    @Published var customers: [CustomerModel] = []
    @Published var depots: [WarehouseModel] = []
    @Published var note: String = ""
    
    var deliverString: String { dateFormatter.string(from: deliverDate) }
    @Published var deliverDate = Date()
    @Published var isShowDatePicker = false
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter
    }
    
    func reset() {
        customer = nil
        vehicle = nil
        depot = nil
        deliverDate = Date()
        products = []
    }
    
    func convert(receiptModel: ReceiptModel) -> [String: Any] {
        var params: [String: Any] = [:]
        do {
            let jsonData = try JSONEncoder().encode(receiptModel)
            if let parameters = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                params = parameters
            }
        } catch {
            print("Failed to convert object to parameters: \(error)")
        }
        return params
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
    
    func getVehicle() {
        BaseProvider().vehicle { items in
            self.vehicles = items
        }
    }
    
    func getDepots() {
        BaseProvider().warehouse { items in
            self.depots = items
        }
    }
    
    func getCustomers() {
        BaseProvider().customer { items in
            self.customers = items
        }
    }
    
    func getProducts() {
        BaseProvider().productSell { items in
            self.productAdditions = items
        }
    }
    
}
