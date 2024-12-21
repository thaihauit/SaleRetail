//
//  CreateReceiptState.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation
import UIKit

enum MessageType {
    case error(mess: String)
    case success(mess: String)
    case finish(mess: String)
    
    var message: String {
        switch self {
        case .error(let mess):
            return mess
        case .success(let mess):
            return mess
        case .finish(let mess):
            return mess
        }
    }
    
    var isFinished: Bool {
        switch self {
        case .finish:
            return true
        default: return false
        }
    }
}

enum ReceiptType {
    case edit
    case calculatedPromotion
}

class CreateReceiptState: ObservableObject {
    @Published var isShowCustomerModal = false
    @Published var iShowProductModal = false
    @Published var customer: CustomerModel?
    @Published var vehicle: VehicleModel?
    @Published var depot: WarehouseModel?
    @Published var iShowVehiceModal = false
    @Published var iShowDepotModal = false
    @Published var isDisplayUnitModal = false
    @Published var isLoading = false
    @Published var productAdditions: [ProductModel] = []
    @Published var products: [ProductModel] = []
    @Published var vehicles: [VehicleModel] = []
    @Published var customers: [CustomerModel] = []
    @Published var depots: [WarehouseModel] = []
    @Published var note: String = ""
    @Published var receipt: ReceiptModel?
    @Published var receiptType: ReceiptType = .edit
    @Published var isShowDialog = false
    @Published var messageType: MessageType?
    
    var deliverString: String { dateFormatter.string(from: deliverDate) }
    @Published var deliverDate = Date()
    @Published var isShowDatePicker = false
    
    var isDisableCreateButton: Bool {
        receipt == nil || receiptType != .calculatedPromotion
    }
    
    var isDisableEditButton: Bool {
        receiptType != .calculatedPromotion
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter
    }
    
    var dateFormatter2: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter
    }
    
    func reset() {
        customer = nil
        vehicle = nil
        depot = nil
        deliverDate = Date()
        receipt = nil
        products = []
        note = ""
        receiptType = .edit
    }
    
    var receiptRawModel: ReceiptModel? {
        guard isValidReceipt, let customer, let depot else { return nil }
        return ReceiptModel(
            cumulativeAmount: 0,
            customer: customer,
            deliveryDate: dateFormatter2.string(from: deliverDate),
            products: products.filter { !$0.isPromotionProduct },
            discount: 0,
            discountIds: [],
            note: note,
            paidAmount: 0,
            totalAmount: 0,
            vehicle: vehicle,
            warehouse: depot
        )
    }
    
    func receiptJson(model: ReceiptModel?) -> [String: Any]? {
        guard let model else { return nil }
        var params: [String: Any] = [:]
        do {
            let jsonData = try JSONEncoder().encode(model)
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
        let price = product.unitSelected?.price ?? 0
        let amount = price * value - product.discount
        products[index] = ProductModel(
            uuid: product.uuid,
            id: product.id,
            unit: product.unit,
            smallUnit: product.smallUnit,
            discount: product.discount,
            unitExchangeRate: product.unitExchangeRate,
            code: product.code,
            name: product.name,
            units: product.units,
            quantity: value,
            unitSelected: product.unitSelected,
            amount: amount,
            isPromotionProduct: product.isPromotionProduct,
            promotionId: product.promotionId
        )
    }
    
    func selectedUnit(index: Int, unit: UnitModel) {
        let product = products[index]
        let price = unit.price
        let number = product.quantity
        let amount = price * number - product.discount
        
        products[index] = ProductModel(
            uuid: product.uuid,
            id: product.id,
            unit: product.unit,
            smallUnit: product.smallUnit,
            discount: product.discount,
            unitExchangeRate: product.unitExchangeRate,
            code: product.code,
            name: product.name,
            units: product.units,
            quantity: product.quantity,
            unitSelected: unit,
            amount: amount,
            isPromotionProduct: product.isPromotionProduct,
            promotionId: product.promotionId
        )
    }
    
    var isValidReceipt: Bool {
        guard customer == nil || depot == nil || products.isEmpty || products.filter({ $0.quantity <= 0 }).count > 0 else {
            return true
        }
        return false
    }
    
    var isDisableCalculatedButton: Bool {
        !isValidReceipt || receiptType != .edit
    }
    
    func calculatePromotion() {
        guard let json = receiptJson(model: receiptRawModel) else {
            isShowDialog = true
            messageType = .error(mess: "Xin Nhập Đầy Đủ Thông Tin")
            return
        }
        isLoading = true
        BaseProvider().calculatePromotion(json: json) { receipt in
            self.isLoading = false
            self.isShowDialog = true
            if let receiptModel = receipt?.data {
                let model = self.transfer(data: receiptModel)
                self.receipt = model
                self.messageType = .success(mess: "Kiểm tra Khuyến Mãi Thành Công")
                self.receiptType = .calculatedPromotion
                self.products = model.products
            } else {
                self.messageType = .error(mess: receipt?.error_message ?? "Lỗi Kết Nối")
            }
        }
    }
    
    func transfer(data: ReceiptData) -> ReceiptModel {
        ReceiptModel(
            cumulativeAmount: data.cumulativeAmount,
            customer: data.customer,
            deliveryDate: data.deliveryDate,
            products: BaseProvider().transfer(datas: data.products),
            discount: data.discount,
            discountIds: data.discountIds,
            note: data.note,
            paidAmount: data.paidAmount,
            totalAmount: data.totalAmount,
            vehicle: data.vehicle,
            warehouse: data.warehouse
        )
    }
    
    func sell() {
        guard let json = receiptJson(model: receipt) else {
            return
        }
        isLoading = true
        BaseProvider().sell(json: json) { data in
            self.isShowDialog = true
            self.isLoading = false
            if let data, data.ok {
                self.messageType = .finish(mess: "Tạo Đơn Thành Công")
                self.receiptType = .edit
            } else {
                self.messageType = .error(mess: data?.error_message ?? "Lỗi Kết Nối")
            }
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
