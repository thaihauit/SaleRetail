//
//  SalesOrderListView.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import SwiftUI

struct SalesOrderListView: View {
    
    @ObservedObject var state: SalesOrderListState
    let action: (Action) -> Void
    
    init(state: SalesOrderListState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        NavigationStack {
            contentView
        }
        .padding(16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HeaderBaseView(name: "DANH SÁCH PHIẾU BÁN HÀNG")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var contentView: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
        
    }
}

extension SalesOrderListView {
    enum Action {
        case didTapItem(item: SalesOrderModel)
        case didRemoveItem(item: SalesOrderModel)
        case didEditItem(item: SalesOrderModel)
    }
}

extension SalesOrderListView {
    func itemRow(item: SalesOrderModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.invoiceNo)
                    .frame(width: 100, alignment: .leading)
                   
                Text(item.customer.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.createdDate)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.note)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(item.totalAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.discount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.cumulativeAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.paidAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đã Xuất Kho")
                    .frame(width: 100, alignment: .leading)

            }
            .foregroundColor(.black)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                
                Text("Mã Phiếu")
                    .frame(width: 100, alignment: .leading)
                   
                Text("Khách Hàng")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Ngày Ghi Phiếu")
                    .frame(width: 100, alignment: .leading)
                
                Text("Ghi Chú")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Tổng Tiền")
                    .frame(width: 100, alignment: .leading)
                
                Text("Chiết Khấu")
                    .frame(width: 100, alignment: .leading)
                
                Text("CK Tích Lũy")
                    .frame(width: 100, alignment: .leading)
                
                Text("Phải Thu")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đã Xuất Kho")
                    .frame(width: 100, alignment: .leading)
            }
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .semibold))
            .frame(height: 60)
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.items.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        state.isTapItem = true
                    }
                    .fullScreenCover(isPresented: $state.isTapItem) {
                        PopupView(isPresented: $state.isTapItem) {
                            PopupView(isPresented: $state.isTapItem) {
                                ProductAdditionView(state: .init(products: item.detail)) { action in
                                    state.isTapItem = false
                                }
                            }
                        }
                    }
                    .swipeActions {
                        HStack {
                            Button(role: .destructive) {
                               
                            } label: {
                                Label("Xóa", systemImage: "trash")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.blue)
                        }
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}


