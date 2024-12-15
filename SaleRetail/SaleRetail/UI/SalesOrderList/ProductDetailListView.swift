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
                .background(Color.blue)
            
            scrollView
        }
        .frame(width: 882, height: 700)
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
                    .frame(width: 150, alignment: .leading)
                
                Text(item.name)
                    .frame(width: 300, alignment: .leading)
                
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
                Text("MÃ HÀNG HÓA")
                    .frame(width: 150, alignment: .leading)
                
                Text("TÊN HÀNG HÓA")
                    .frame(width: 300, alignment: .leading)
                
                Text("SỐ LƯỢNG")
                    .frame(width: 100, alignment: .leading)
                
                Text("ĐƠN GIÁ")
                    .frame(width: 100, alignment: .leading)
                
                Text("CHIẾT KHẤU")
                    .frame(width: 100, alignment: .leading)
                
                Text("THÀNH TIỀN")
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
