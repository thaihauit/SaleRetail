//
//  HeaderBaseView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct HeaderBaseView: View {
    let name: String
    
    var body: some View {
        Text(name)
            .padding(4)
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .frame(height: 70)
            .ignoresSafeArea(.all)
    }
}

#Preview {
    HeaderBaseView(name: "TẠO ĐƠN HÀNG")
}
