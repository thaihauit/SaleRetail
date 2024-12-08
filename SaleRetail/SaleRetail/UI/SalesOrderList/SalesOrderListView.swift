//
//  SalesOrderListView.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import SwiftUI

struct SalesOrderListView: View {
    
    @State var isTapItem = false
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
    }
}

extension SalesOrderListView {
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
            ForEach(Array(state.items.enumerated()), id: \.offset) { (_, item) in
                SaleOrderItemView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}


