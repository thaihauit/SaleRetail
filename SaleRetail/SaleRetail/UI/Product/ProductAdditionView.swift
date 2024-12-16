//
//  ProductAdditionView.swift
//  SaleRetail
//
//  Created by D.Ace on 19/11/24.
//

import SwiftUI

struct ProductAdditionView: View {
    @ObservedObject var state: ProductAdditionState
    let action: (Action) -> Void
    
    init(state: ProductAdditionState, action: @escaping (Action) -> Void = { _ in }) {
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
        .refreshable {
            action(.onRefresh)
        }
        .frame(width: 832, height: 700)
    }
}

extension ProductAdditionView{
    enum Action {
        case didTapItem(item: ProductModel)
        case onRefresh
    }
}

extension ProductAdditionView {
    func itemRow(item: ProductModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.code)
                    .frame(width: 200, alignment: .leading)
                
                Text(item.name)
                    .frame(width: 300, alignment: .leading)
                
                Text(item.unitSelected?.name ?? "")
                    .frame(width: 150, alignment: .leading)
                
                Text("\(item.unitSelected?.price ?? 0)")
                    .frame(width: 150, alignment: .leading)
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
                    .frame(width: 200, alignment: .leading)
                
                Text("TÊN HÀNG HÓA")
                    .frame(width: 300, alignment: .leading)
                
                Text("ĐƠN VỊ")
                    .frame(width: 150, alignment: .leading)
               
                Text("ĐƠN GIÁ")
                    .frame(width: 150, alignment: .leading)
                
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

#Preview {
    ProductView(state: .init(products: []))
}
