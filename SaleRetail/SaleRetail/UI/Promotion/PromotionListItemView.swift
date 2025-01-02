//
//  PromotionListItemView.swift
//  SaleRetail
//
//  Created by D.Ace on 2/1/25.
//

import SwiftUI

struct PromotionListItemView: View {
    @ObservedObject var state: PromotionListItemState
    
    init(state: PromotionListItemState) {
        self.state = state
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
        .frame(width: 682, height: 700)
    }
}

extension PromotionListItemView {
    func itemRow(item: PromotionModel.Product, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.productCode)
                    .frame(width: 150, alignment: .leading)
                
                Text(item.productName)
                    .frame(width: 300, alignment: .leading)
                
                Text("\(item.quantity)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.unitName)")
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
                
                Text("ĐƠN VỊ")
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
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}

