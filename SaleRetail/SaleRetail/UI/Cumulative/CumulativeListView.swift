//
//  CumulativeListView.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import SwiftUI

struct CumulativeListView: View {
    
    @ObservedObject var state: CumulativeListState
    init(state: CumulativeListState) {
        self.state = state
    }
    
    var body: some View {
        NavigationStack {
            contentView
        }
        .padding(16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HeaderBaseView(name: "DANH SÁCH TÍCH LŨY")
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
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
    }
}

extension CumulativeListView {
    enum Action {
        case didTapItem(item: CumulativeModel)
    }
}

extension CumulativeListView {
    func itemRow(item: CumulativeModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.fromDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
                   
                Text(item.toDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(item.requiredAmount)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(item.discountAmount)")
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            .foregroundColor(.black)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                Text("Từ Ngày")
                    .frame(maxWidth: .infinity, alignment: .leading)
                   
                Text("Đến Ngày")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Tổng Tiền Yêu Cầu")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Số Tiền Chiết Khấu")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .semibold))
            .frame(height: 60)
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.items.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index)
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}
