//
//  ProductDetailListView.swift
//  SaleRetail
//
//  Created by D.Ace on 8/12/24.
//

import SwiftUI

struct ProductDetailListView: View {
    @ObservedObject var state: ProductDetailListState
    let action: (Action) -> Void
    
    init(state: ProductDetailListState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue.opacity(0.6))
            
            scrollView
        }
        .frame(width: 732, height: 500)
    }
}

extension ProductDetailListView{
    enum Action {
        case didTapItem(item: SalesOrderModel.Product)
    }
}

extension ProductDetailListView {
    func itemRow(item: SalesOrderModel.Product, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.code)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.name)
                    .frame(width: 200, alignment: .leading)
                
                Text("\(item.quantity)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.price)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.discount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.amount)")
                    .frame(width: 100, alignment: .leading)
            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                Text("Mã Hàng Hóa")
                    .frame(width: 100, alignment: .leading)
                
                Text("Tên Hàng Hóa")
                    .frame(width: 200, alignment: .leading)
                
                Text("Số Lượng")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đơn Giá")
                    .frame(width: 100, alignment: .leading)
                
                Text("Chiết Khấu")
                    .frame(width: 100, alignment: .leading)
                
                Text("Thành Tiền")
                    .frame(width: 100, alignment: .leading)
                
            }
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .semibold))
            .frame(height: 60)
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.products.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index + 1)
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
