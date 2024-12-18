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
            .frame(width: 92, height: 60, alignment: .leading)
            .onChange(of: text) { newValue in
                if type == .number {
                    if Int(newValue) != nil {
                        onChangeValue(newValue)
                    } else {
                        onChangeValue("0")
                        text = "0"
                    }
                } else {
                    onChangeValue(newValue)
                }
            }
            .submitLabel(.done)
            .onSubmit {
                hideKeyboard()
            }
    }
}

struct TextFieldFormView2: View {
    let title: String
    @Binding var text: String
    
    init(title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .padding(.horizontal, 4)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("", text: $text)
                .padding(.horizontal, 16)
                .frame(height: 60)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .submitLabel(.done)
                .onSubmit {
                    hideKeyboard()
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
