//
//  PromotionView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct PromotionView: View {
    
    @ObservedObject var state: PromotionState
    let action: (Action) -> Void
    
    init(state: PromotionState, action: @escaping (Action) -> Void = { _ in }) {
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
                HeaderBaseView(name: "DANH SÁCH KHUYẾN MÃI")
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


extension PromotionView {
    enum Action {
        case didTapItem(item: PromotionModel)
    }
}

extension PromotionView {
    func itemRow(item: PromotionModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text("\(index + 1)")
                    .frame(width: 70, alignment: .leading)
                
                Text(item.productCode)
                    .frame(width: 100, alignment: .leading)
                   
                Text(item.productName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.requiredUnitName)
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.requiredQuantity)")
                    .frame(width: 100, alignment: .leading)
                
                Text(item.promotionProductName)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.promotionUnitName)
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.promotionQuantity)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.totalPromotionQuantity)")
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
                Text("STT")
                    .frame(width: 70, alignment: .leading)
                
                Text("Mã Phiếu")
                    .frame(width: 100, alignment: .leading)
                   
                Text("Tên Sản Phẩm")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Đơn Vị Yêu Cầu")
                    .frame(width: 100, alignment: .leading)
                
                Text("SL Yêu Cầu")
                    .frame(width: 100, alignment: .leading)
                
                Text("SP Khuyến Mãi")
                    .frame(width: 100, alignment: .leading)
                
                Text("ĐV-SP Khuyến Mãi")
                    .frame(width: 100, alignment: .leading)
                
                Text("SL Khuyến Mãi")
                    .frame(width: 100, alignment: .leading)
                
                Text("Tổng SL Hàng KM Còn Lại")
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
