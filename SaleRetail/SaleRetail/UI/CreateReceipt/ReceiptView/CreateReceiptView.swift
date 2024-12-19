//
//  CreateReceiptView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct CreateReceiptView: View {
    @ObservedObject var state: CreateReceiptState
    init(state: CreateReceiptState) {
        self.state = state
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                contentView
                    .padding(.horizontal, 16)
            }
        }
        .padding(16)
        .onDisappear {
            state.reset()
        }
        .onAppear {
            state.getDepots()
            state.getVehicle()
            state.getCustomers()
            state.getProducts()
        }
        .overlay {
            if state.isLoading {
                ProgressView()
                    .tint(.blue)
                    .progressViewStyle(.circular)
            }
        }
        .alert("Thông Báo", isPresented: $state.isShowDialog) {
            Button("OK", role: .cancel) {
                state.isShowDialog = false
                if state.messageType?.isFinished ?? false {
                    state.reset()
                }
            }
            
        } message: {
            Text(state.messageType?.message ?? "")
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HeaderBaseView(name: "TẠO ĐƠN HÀNG")
            }
        }
    }
}

extension CreateReceiptView {
    var customerView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    Text("KHÁCH HÀNG")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Tên", content: state.customer?.name ?? "")
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if state.receiptType == .edit {
                                    state.isShowCustomerModal = true
                                }
                            }
                        
                        TextFormView(title: "SĐT", content: state.customer?.phone ?? "")
                    }
                    TextFormView(title: "Địa Chỉ", content: state.customer?.address ?? "")
                        .padding(.bottom, 16)
                }
                .padding(16)
            }
            .frame(height: 250)
            .cornerRadius(8)
    }
    
    var noteView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    Text("GHI CHÚ")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                    
                    TextViewFromView(text: $state.note)
                        .disabled(state.receiptType == .calculatedPromotion)
                }
                .padding(16)
            }
            .frame(height: 270)
            .cornerRadius(8)
    }
    
    var productView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    HStack {
                        Text("SẢN PHẨM")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                        
                        HStack(spacing: 8) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                            
                            Text("THÊM SẢN PHẨM")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.blue)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if state.receiptType == .edit {
                                state.iShowProductModal = true
                            }
                        }
                    }
                    
                    ProductView(state: .init(products: state.products, isDisable: state.receiptType == .calculatedPromotion)) { action in
                        switch action {
                        case .didRemoveItem(let index):
                            state.products.remove(at: index)
                        case let .didSelectedNumber(index, value):
                            state.selectedNumber(index: index, value: value)
                        case let .didSelectedUnit(index, unit):
                            state.selectedUnit(index: index, unit: unit)
                        }
                    }
                }
                .padding(16)
            }
            .frame(height: 580)
            .cornerRadius(8)
    }
    
    var infoView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    Text("THÔNG TIN ĐƠN HÀNG")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Ngày Giao", content: state.deliverString)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if state.receiptType == .edit {
                                    state.isShowDatePicker = true
                                }
                            }
                            .popover(
                                isPresented: $state.isShowDatePicker,
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .top
                            ) {
                                DateView(selectedDate: $state.deliverDate)
                            }
                        
                        TextFormView(title: "Kho", content: state.depot?.name ?? "")
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if state.receiptType == .edit {
                                    state.iShowDepotModal = true
                                }
                            }
                            .popover(
                                isPresented: $state.iShowDepotModal,
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .top
                            ) {
                                DepotView(state: .init(depots: state.depots), action: { action in
                                    switch action {
                                    case .didTapItem(let item):
                                        state.depot = item
                                        state.iShowDepotModal = false
                                    case .onRefresh:
                                        state.getDepots()
                                    }
                                })
                            }
                        
                        TextFormView(title: "Xe", content: state.vehicle?.licensePlate ?? "")
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if state.receiptType == .edit {
                                    state.iShowVehiceModal = true
                                }
                            }
                            .popover(
                                isPresented: $state.iShowVehiceModal,
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .top
                            ) {
                                VehicleView(state: .init(vehices: state.vehicles), action: { action in
                                    switch action {
                                    case .didTapItem(let item):
                                        state.vehicle = item
                                        state.iShowVehiceModal = false
                                    case .onRefresh:
                                        state.getVehicle()
                                    }
                                })
                            }
                    }
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Thành Tiền", content: "\(state.receipt?.totalAmount ?? 0)")
                        TextFormView(title: "Chiết Khấu", content: "\(state.receipt?.discount ?? 0)")
                        TextFormView(title: "CK Tích Lũy", content: "\(state.receipt?.cumulativeAmount ?? 0)")
                        TextFormView(title: "Phải Thu", content: "\(state.receipt?.paidAmount ?? 0)")
                    }
                }
                .padding(16)
            }
            .frame(height: 250)
            .cornerRadius(8)
    }
    
    var contentView: some View {
        VStack(spacing: 16) {
            customerView
            infoView
            productView
            noteView
            
            ButtonView(title: "KIỂM TRA KHUYẾN MÃI", isDisable: state.isDisableCalculatedButton, onTap: {
                state.calculatePromotion()
            })
            
            HStack(spacing: 32) {
                ButtonView(title: "CHỈNH SỬA", isDisable: state.isDisableEditButton, onTap: {
                    state.receiptType = .edit
                    state.products = state.products.filter { !$0.isPromotionProduct }
               })
                
                ButtonView(title: "TẠO ĐƠN", isDisable: state.isDisableCreateButton, onTap: {
                   state.sell()
               })
            }
        }
        .fullScreenCover(isPresented: $state.iShowProductModal) {
            PopupView(isPresented: $state.iShowProductModal) {
                ProductAdditionView(state: .init(products: state.productAdditions)) { action in
                    switch action {
                    case .didTapItem(let item):
                        state.iShowProductModal = false
                        state.products.append(item)
                    case .onRefresh:
                        state.getProducts()
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $state.isShowCustomerModal) {
            PopupView(isPresented: $state.isShowCustomerModal) {
                CustomerAdditionView(state: .init(customers: state.customers)) { action in
                    switch action {
                    case .didTapCustomer(let item):
                        state.isShowCustomerModal = false
                        state.customer = item
                    case .onRefresh:
                        state.getCustomers()
                    }
                }
            }
        }
    }
}

extension CreateReceiptView {
    enum Action {
        case didTapItem
    }
}
