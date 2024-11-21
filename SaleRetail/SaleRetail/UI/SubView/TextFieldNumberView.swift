//
//  TextFieldNumberView.swift
//  SaleRetail
//
//  Created by D.Ace on 18/11/24.
//

import SwiftUI

struct TextFieldNumberView: View {
    @State private var number: Int? = 0
    let onChangeValue: (Int?) -> Void
    
    init(number: Int?, onChangeValue: @escaping (Int?) -> Void) {
        self.number = number
        self.onChangeValue = onChangeValue
    }
    
    var body: some View {
        TextField("0", value: $number, formatter: NumberFormatter.integerFormatter)
            .foregroundColor(.black)
            .keyboardType(.numberPad)
            .font(.system(size: 12, weight: .bold))
            .frame(width: 100, height: 60, alignment: .leading)
            .onChange(of: number ?? 0) { newValue in
                onChangeValue(newValue)
            }
    }
}

extension NumberFormatter {
    static var integerFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }
}

#Preview {
    TextFieldNumberView(number: 0) { _ in }
}
