//
//  PromotionItemView.swift
//  SaleRetail
//
//  Created by D.Ace on 2/1/25.
//

import SwiftUI

struct PromotionItemView: View {
    
    let item: PromotionModel.PromotionDetail
    @State var isTapItem = false
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "list.bullet.clipboard")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            Text(" SỐ LƯỢNG YÊU CẦU ")
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 14))
            
            Text("\(item.requiredQuantity)")
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
