//
//  TextViewFromView.swift
//  SaleRetail
//
//  Created by D.Ace on 10/12/24.
//

import SwiftUI

struct TextViewFromView: View {
    @Binding private var text: String
    let title: String
    
    init(text: Binding<String>, title: String) {
        self._text = text
        self.title = title
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .padding(.horizontal, 4)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextEditor(text: $text)
                .padding(4)
                .background(Color(.blue).opacity(0.15))
                .cornerRadius(10)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
            
        }
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
