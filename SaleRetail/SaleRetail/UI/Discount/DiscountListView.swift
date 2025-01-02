//
//  DiscountListView.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import SwiftUI

struct DiscountListView: View {
    
    @ObservedObject var state: DiscountListState
    
    init(state: DiscountListState) {
        self.state = state
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
                
                Text(item.code)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.providerName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(item.requiredAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text(item.basedOnDisplay)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.fromDate)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.toDate)
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.discountDisplay)")
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
                
                Text("Mã")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Tên")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Nhà Cung Cấp")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Tổng Tiền/SLYC")
                    .frame(width: 100, alignment: .leading)
                
                Text("Loại YC")
                    .frame(width: 100, alignment: .leading)
                
                Text("Từ Ngày")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đến Ngày")
                    .frame(width: 100, alignment: .leading)
                
                Text("Chiết Khấu")
                    .frame(width: 100, alignment: .leading)
            }
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .semibold))
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: 60)
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.items.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index)
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}
