//
//  HeaderView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct HeaderView<Content: View>: View {
    
    let content: Content
    let count: Int
    
    init(@ViewBuilder content: () -> Content, count: Int) {
        self.content = content()
        self.count = count
    }
    
    var body: some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(.flexible(minimum: 100, maximum: 300)),
                count: count
            ),
            spacing: 10
        ) {
            content
        }
    }
}

#Preview {
    HeaderView(content: {
        HStack {}
    }, count: 5)
}
