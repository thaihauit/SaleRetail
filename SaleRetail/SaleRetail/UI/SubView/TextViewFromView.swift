//
//  TextViewFromView.swift
//  SaleRetail
//
//  Created by D.Ace on 10/12/24.
//

import SwiftUI

struct TextViewFromView: View {
    @Binding private var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    var body: some View {
        TextEditor(text: $text)
            .padding(4)
            .background(Color(.blue).opacity(0.15))
            .cornerRadius(10)
            .frame(height: 200)
            .frame(maxWidth: .infinity)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
