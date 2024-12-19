//
//  ProductView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var state: ProductState
    let action: (Action) -> Void
    
    init(state: ProductState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
            .frame(height: 500)
    }
}

extension ProductView {
    enum Action {
        case didRemoveItem(index: Int)
        case didSelectedNumber(index: Int, value: Int)
        case didSelectedUnit(index: Int, unit: UnitModel)
    }
}

extension ProductView {
    func itemRow(item: ProductModel, index: Int) -> some View {
        ProductItemView(state: .init(product: item, index: index)) { onAction in
            switch onAction {
            case .didSelectedNumber(let index, let value):
                action(.didSelectedNumber(index: index, value: value))
            case .didSelectedUnit(let index, let unit):
                action(.didSelectedUnit(index: index, unit: unit))
            }
        }
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                Text("Mã Hàng Hóa")
                    .frame(width: 100, alignment: .leading)
                
                Text("Tên Hàng Hóa")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Đơn Vị")
                    .frame(width: 100, alignment: .leading)
                
                Text("Số Lượng")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đơn Giá")
                    .frame(width: 100, alignment: .leading)
                
                Text("Chiết Khấu")
                    .frame(width: 100, alignment: .leading)
                
                Text("Thành Tiền")
                    .frame(width: 150, alignment: .leading)
                
            }
            .foregroundColor(.white)
            .font(.system(size: 13, weight: .semibold))
            .frame(height: 60)
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
    
    var scrollView: some View {
        List {
            ForEach(Array(state.products.enumerated()), id: \.element.uuid) { (index, item) in
                itemRow(item: item, index: index)
                    .disabled(state.isDisable || item.isPromotionProduct)
                    .contentShape(Rectangle())
                    .swipeActions {
                        if !state.isDisable, !item.isPromotionProduct {
                            HStack {
                                Button(role: .destructive) {
                                    action(.didRemoveItem(index: index))
                                } label: {
                                    Label("Xóa", systemImage: "trash")
                                }
                            }
                        }
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
