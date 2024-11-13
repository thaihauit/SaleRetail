//
//  ListContentView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct ListContentView<Content: View>: View {
    
    let content: Content
    let count: Int
    
    init(@ViewBuilder content: () -> Content, count: Int) {
        self.content = content()
        self.count = count
    }
    
    var body: some View {
        ScrollView(.vertical) {
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
}

#Preview {
    ListContentView(content: {
        HStack {}
    }, count: 5)
}
