//
//  PromotionItemView.swift
//  SaleRetail
//
//  Created by D.Ace on 2/1/25.
//

import SwiftUI

struct PromotionItemView: View {
    
    let item: PromotionModel
    @State var isTapItem = false
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                Text(item.code)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.providerName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.requiredUnitName)
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.requiredQuantity)")
                    .frame(width: 100, alignment: .leading)
            }
            .foregroundColor(.black)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
            .contentShape(Rectangle())
            .onTapGesture {
                isTapItem = true
            }
            .fullScreenCover(isPresented: $isTapItem) {
                PopupView(isPresented: $isTapItem) {
                    PromotionListItemView(state: .init(products: item.promotionProducts))
                }
            }
        }
    }
}
