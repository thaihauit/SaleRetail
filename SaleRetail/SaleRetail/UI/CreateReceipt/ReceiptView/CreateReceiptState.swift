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
    
    var receiptModel: ReceiptModel? {
        guard let customer, let depot, !products.isEmpty else {
            return nil
        }
        return ReceiptModel(
            cumulativeAmount: 0,
            customer: customer,
            deliveredDate: deliverString,
            products: products,
            discount: 0,
            discountIds: [],
            note: note,
            paidAmount: 0,
            totalAmount: 0,
            vehicle: vehicle,
            warehouse: depot
        )
    }
    
    var receiptJson: [String: Any]? {
        guard let receiptModel else {
            return nil
        }
        var params: [String: Any] = [:]
        do {
            let jsonData = try JSONEncoder().encode(receiptModel)
            if let parameters = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                params = parameters
            }
        } catch {
            return nil
        }
        return params
    }
    
    func selectedNumber(index: Int, value: Int) {
        let product = products[index]
        products[index] = ProductModel(
            id: product.id,
            unit: product.unit,
            smallUnit: product.smallUnit,
            discount: product.discount,
            unitExchangeRate: product.unitExchangeRate,
            code: product.code,
            name: product.name,
            units: product.units,
            quantity: value,
            unitSelected: product.unitSelected
        )
    }
    
    func selectedUnit(index: Int, unit: UnitModel) {
        let product = products[index]
        products[index] = ProductModel(
            id: product.id,
            unit: product.unit,
            smallUnit: product.smallUnit,
            discount: product.discount,
            unitExchangeRate: product.unitExchangeRate,
            code: product.code,
            name: product.name,
            units: product.units,
            quantity: product.quantity,
            unitSelected: unit
        )
    }
    
    func calculatePromotion() {
        guard let receiptJson else {
            return
        }
        BaseProvider().calculatePromotion(json: receiptJson) { data in
            print(data)
        }
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
