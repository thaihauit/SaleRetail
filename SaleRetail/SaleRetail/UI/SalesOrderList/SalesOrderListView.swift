//
//  SalesOrderListView.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import SwiftUI

struct SalesOrderListView: View {
    
    @ObservedObject var state: SalesOrderListState
    
    init(state: SalesOrderListState) {
        self.state = state
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
        .overlay {
            if state.isLoading {
                ProgressView()
                    .tint(.blue)
                    .progressViewStyle(.circular)
            }
        }
        .refreshable {
            state.fetchItemList()
        }
        .onAppear {
            state.fetchItemList()
        }
    }
    
    var contentView: some View {
        VStack(spacing: 0) {
            filterView
                .frame(height: 100)
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
    }
    
    var filterView: some View {
        HStack(spacing: 32) {
            TextFormView(title: "TỪ NGÀY", content: state.createString)
                .contentShape(Rectangle())
                .onTapGesture {
                    state.isShowCreateDatePicker = true
                }
                .popover(
                    isPresented: $state.isShowCreateDatePicker,
                    attachmentAnchor: .rect(.bounds),
                    arrowEdge: .top
                ) {
                    DateView(selectedDate: $state.createDate)
                }
            
            TextFormView(title: "ĐẾN NGÀY", content: state.endString)
                .contentShape(Rectangle())
                .onTapGesture {
                    state.isShowEndDatePicker = true
                }
                .popover(
                    isPresented: $state.isShowEndDatePicker,
                    attachmentAnchor: .rect(.bounds),
                    arrowEdge: .top
                ) {
                    DateView(selectedDate: $state.endDate)
                }
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
                
                Text("Ngày Giao")
                    .frame(width: 150, alignment: .leading)
                
                Text("Xe Giao")
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


