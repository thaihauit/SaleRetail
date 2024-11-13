//
//  TextFormView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct TextFormView: View {
    
    let title: String
    let content: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .padding(.horizontal, 4)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .padding(.horizontal, 4)
                .frame(height: 50)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 11))
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.blue, lineWidth: 1)
                )
        }
    }
}

#Preview {
    TextFormView(title: "title", content: "content")
}
