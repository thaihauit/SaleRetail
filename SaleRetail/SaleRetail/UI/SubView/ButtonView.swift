//
//  ButtonView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
               }) {
                   Text(title)
                       .foregroundColor(.white)
                       .frame(height: 60)
                       .frame(maxWidth: .infinity)
                       .background(Color.blue)
                       .cornerRadius(8)
               }
    }
}

#Preview {
    ButtonView(title: "CLICK") {}
}
