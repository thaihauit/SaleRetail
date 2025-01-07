//
//  PromotionView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct PromotionView: View {
    
    @ObservedObject var state: PromotionState
    
    init(state: PromotionState) {
        self.state = state
    }
    
    var body: some View {
        NavigationStack {
            contentView
        }
        .padding(16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HeaderBaseView(name: "DANH SÁCH KHUYẾN MÃI")
            }
        }
        .onAppear {
            state.fetchItemList()
        }
        .overlay {
            if state.isLoading {
                ProgressView()
                    .tint(.blue)
                    .progressViewStyle(.circular)
            }
        }
        .refreshable {
            state.fetchItemList()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var contentView: some View {
        scrollView
            .padding(.horizontal, 8)
    }
}

extension PromotionView {
    enum Action {
        case didTapItem(item: PromotionModel)
    }
}

extension PromotionView {
    
    var scrollView: some View {
        List {
            ForEach(Array(state.items.enumerated()), id: \.offset) { (index, item) in
                VStack(spacing: 16) {
                    Text(item.headerText)
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .lineSpacing(20)
                        .fixedSize(horizontal: false, vertical: true)
                        .background(Color.blue)
                        
                    
                    ForEach(Array(item.promotionDetails.enumerated()), id: \.offset) { (index, row) in
                        PromotionItemView(item: row)
                            .padding(.horizontal, 16)
                    }
                    
                }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}
