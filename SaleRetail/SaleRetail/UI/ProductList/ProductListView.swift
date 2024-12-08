//
//  ProductListView.swift
//  SaleRetail
//
//  Created by D.Ace on 24/11/24.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject var state: ProductListState
    let action: (Action) -> Void
    
    init(state: ProductListState, action: @escaping (Action) -> Void = { _ in }) {
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
                HeaderBaseView(name: "DANH SÁCH HÀNG HÓA")
            }
        }
        .onAppear {
            state.fetchProductList()
        }
        .overlay {
            if state.isLoading {
                ProgressView()
                    .tint(.blue)
                    .progressViewStyle(.circular)
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

extension ProductListView {
    enum Action {
        case didTapItem(item: ProductListModel)
    }
}

extension ProductListView {
    func itemRow(item: ProductListModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.code)
                    .frame(width: 100, alignment: .leading)
                   
                Text(item.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.groupName)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.unitName)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.smallUnitName)
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.unitExchangeRate)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.sellPrice)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.smallUnitSellPrice)")
                    .frame(width: 100, alignment: .leading)
                
                Text(item.minSellUnitName)
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
                    .frame(width: 100, alignment: .leading)
                   
                Text("Tên")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Loại")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đơn Vị")
                    .frame(width: 100, alignment: .leading)
                
                Text("Quy Đổi")
                    .frame(width: 100, alignment: .leading)
                
                Text("Tỷ Lệ")
                    .frame(width: 100, alignment: .leading)
                
                Text("Giá Bán")
                    .frame(width: 100, alignment: .leading)
                
                Text("Giá Bán QĐ")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đơn Vị Bán Tối Thiểu")
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
                        action(.didTapItem(item: item))
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}
