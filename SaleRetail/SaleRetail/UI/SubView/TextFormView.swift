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
    let height: CGFloat
    
    init(title: String, content: String, height: CGFloat = 50) {
        self.title = title
        self.content = content
        self.height = height
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .padding(.horizontal, 4)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .padding(.horizontal, 8)
                .frame(height: height)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .background(Color.white)
        }
    }
}

#Preview {
    TextFormView(title: "title", content: "content")
}
