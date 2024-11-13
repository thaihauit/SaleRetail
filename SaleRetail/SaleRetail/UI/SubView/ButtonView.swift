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
                       .padding()
                       .frame(maxWidth: .infinity)
               }
               .buttonStyle(.bordered)
               .tint(.blue)
               .cornerRadius(10)
               
    }
}

#Preview {
    ButtonView(title: "CLICK") {}
}
