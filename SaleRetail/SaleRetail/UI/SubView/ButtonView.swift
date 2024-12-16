//
//  ButtonView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let isDisable: Bool
    let onTap: () -> Void
    
    init(title: String, isDisable: Bool = false, onTap: @escaping () -> Void) {
        self.title = title
        self.onTap = onTap
        self.isDisable = isDisable
    }
    
    var body: some View {
        Button(action: {
            onTap()
               }) {
                   Text(title)
                       .foregroundColor(.white)
                       .frame(height: 60)
                       .frame(maxWidth: .infinity)
                       .background(isDisable ? Color.blue.opacity(0.3) : Color.blue)
                       .cornerRadius(8)
               }
               .disabled(isDisable)
    }
}

#Preview {
    ButtonView(title: "CLICK") {}
}
