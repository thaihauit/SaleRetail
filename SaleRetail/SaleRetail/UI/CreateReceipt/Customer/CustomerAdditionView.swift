//
//  CustomerAdditionView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct CustomerAdditionView: View {
    
    var body: some View {
        VStack(spacing: 16) {
            HeaderBaseView(name: "TẠO KHÁCH HÀNG")
            
            contentView
                .padding(.horizontal, 16)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
extension CustomerAdditionView {
    var contentView: some View {
        VStack(spacing: 8) {
            TextFormView(title: "Khách Hàng", content: "Ethan")
            TextFormView(title: "Nhóm", content: "Ethan")
            TextFormView(title: "Địa Chỉ", content: "Ethan")
            TextFormView(title: "Điện Thoại", content: "Ethan")
        }
    }
}

#Preview {
    CustomerAdditionView()
}
