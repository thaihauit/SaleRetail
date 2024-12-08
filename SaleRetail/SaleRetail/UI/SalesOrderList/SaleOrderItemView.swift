//
//  SaleOrderItemView.swift
//  SaleRetail
//
//  Created by D.Ace on 8/12/24.
//

import SwiftUI

struct SaleOrderItemView: View {
    
    let item: SalesOrderModel
    @State var isTapItem = false
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                Text(item.invoiceNo)
                    .frame(width: 100, alignment: .leading)
                   
                Text(item.customerName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.createdDate)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.note)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(item.totalAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.discount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.cumulativeAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.paidAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đã Xuất Kho")
                    .frame(width: 100, alignment: .leading)

            }
            .foregroundColor(.black)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isTapItem = true
        }
        .fullScreenCover(isPresented: $isTapItem) {
            PopupView(isPresented: $isTapItem) {
                    ProductDetailListView(state: .init(products: item.products)) { action in
                        isTapItem = false
                    }
                
            }
        }
    }
}
