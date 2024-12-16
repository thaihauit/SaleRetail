//
//  DiscountListView.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import SwiftUI

struct DiscountListView: View {
    
    @ObservedObject var state: DiscountListState
    let action: (Action) -> Void
    
    init(state: DiscountListState, action: @escaping (Action) -> Void = { _ in }) {
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
                HeaderBaseView(name: "DANH SÁCH CHIẾT KHẤU")
            }
        }
        .onAppear {
            state.fetchDiscountList()
        }
        .overlay {
            if state.isLoading {
                ProgressView()
                    .tint(.blue)
                    .progressViewStyle(.circular)
            }
        }
        .refreshable {
            state.fetchDiscountList()
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

extension DiscountListView {
    enum Action {
        case didTapItem(item: DiscountModel)
    }
}

extension DiscountListView {
    func itemRow(item: DiscountModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                
                Text(item.productName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.productGroupName ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(item.requiredAmount)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.basedOnDisplay)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.fromDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.toDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(item.discountDisplay)")
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            .foregroundColor(.black)
            .padding(.leading, 4)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                
                Text("Sản Phẩm")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Nhóm Sản Phẩm")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Tổng Tiền/ SL YC")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Loại YC")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Từ Ngày")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Đến Ngày")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Chiết Khấu")
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                        action(.didTapItem(item: item))
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}
