//
//  CreateReceiptView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct CreateReceiptView: View {
    
    @ObservedObject var state: CreateReceiptState
    let action: (Action) -> Void
    
    init(state: CreateReceiptState, action: @escaping (Action) -> Void) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                contentView
                    .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 16)
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
                                state.isShowCustomerModal = true
                            }
                            .popover(
                                isPresented: $state.isShowCustomerModal,
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .top
                            ) {
                                CustomerAdditionView(state: .init(customers: [])) { action in
                                    switch action {
                                    case .didTapCustomer(let item):
                                        state.isShowCustomerModal = false
                                        state.customer = item
                                    }
                                }
                                .frame(width: state.width - 40, height: 500)
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
    
    var productView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    HStack {
                        Text("SẢN PHẨM")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 12)
                        
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
                            state.iShowProductModal = true
                        }
                        .popover(
                            isPresented: $state.iShowProductModal,
                            attachmentAnchor: .rect(.bounds),
                            arrowEdge: .top
                        ) {
                            ProductAdditionView(state: .init(products: [])) { action in
                                switch action {
                                case .didTapItem(let item):
                                    state.iShowProductModal = false
                                    state.products.append(item)
                                }
                            }
                        }
                    }
                    
                    ProductView(state: .init(products: state.products)) { action in
                        switch action {
                        case .didRemoveItem(let index):
                            state.products.remove(at: index)
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
                        .padding(.vertical, 9)
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Ngày Giao", content: state.deliverString)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                state.isShowDatePicker = true
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
                                state.iShowDepotModal = true
                            }
                            .popover(
                                isPresented: $state.iShowDepotModal,
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .top
                            ) {
                                DepotView(state: .init(depots: []), action: { action in
                                    
                                })
                            }
                        TextFormView(title: "Xe", content: state.vehice?.code ?? "")
                            .contentShape(Rectangle())
                            .onTapGesture {
                                state.iShowVehiceModal = true
                            }
                            .popover(
                                isPresented: $state.iShowVehiceModal,
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .top
                            ) {
                                VehiceView(state: .init(vehices: []), action: { action in
                                    
                                })
                            }
                    }
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Chiết Khấu", content: "iPhone")
                        TextFormView(title: "Chuyển Khoản Tích Lũy", content: "iPhone")
                        TextFormView(title: "Thành Tiền", content: "iPhone")
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
            
            ButtonView(title: "TẠO ĐƠN") {
                
            }
        }
    }
}

extension CreateReceiptView {
    enum Action {
        case didTapItem
    }
}

#Preview {
    CreateReceiptView(state: .init()) { _ in }
}
