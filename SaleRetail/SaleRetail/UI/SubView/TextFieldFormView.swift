//
//  TextFieldFormView.swift
//  SaleRetail
//
//  Created by D.Ace on 18/11/24.
//

import SwiftUI

struct TextFieldFormView: View {
    @State private var text: String
    let onChangeValue: (String) -> Void
    let type: TextType
    
    init(text: String, type: TextType = .text, onChangeValue: @escaping (String) -> Void) {
        self.text = text
        self.type = type
        self.onChangeValue = onChangeValue
    }
    
    var body: some View {
        TextField("", text: $text)
            .foregroundColor(.black)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(type == .number ? .numberPad : .alphabet)
            .font(.system(size: 12, weight: .bold))
            .frame(width: 100, height: 60, alignment: .leading)
            .onChange(of: text) { newValue in
                if type == .number, let value = Int(newValue) {
                    onChangeValue(newValue)
                } else {
                    onChangeValue(newValue)
                }
            }
    }
}

struct TextFieldFormView2: View {
    @State private var text: String
    let title: String
    let onChangeValue: (String) -> Void
    
    init(title: String, text: String, onChangeValue: @escaping (String) -> Void) {
        self.text = text
        self.title = title
        self.onChangeValue = onChangeValue
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .padding(.horizontal, 4)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("", text: $text)
                .padding(.horizontal, 8)
                .frame(height: 60)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .onChange(of: text) { newValue in
                    onChangeValue(newValue)
                }
                .background(Color.white)
        }
            
    }
}

extension TextFieldFormView {
    enum TextType {
        case text
        case number
    }
}
