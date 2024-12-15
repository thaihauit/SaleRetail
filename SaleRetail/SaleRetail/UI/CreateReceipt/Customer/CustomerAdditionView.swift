//
//  CustomerAdditionView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct CustomerAdditionView: View {
    
    @ObservedObject var state: CustomerAdditionState
    let action: (Action) -> Void
    
    init(state: CustomerAdditionState, action: @escaping (Action) -> Void) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
        .frame(width: 882, height: 700)
    }
}

extension CustomerAdditionView {
    enum Action {
        case didTapCustomer(item: CustomerModel)
    }
}

extension CustomerAdditionView {
    func itemRow(item: CustomerModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.name)
                    .frame(width: 300, alignment: .leading)
                Text(item.phone)
                    .frame(width: 150, alignment: .leading)
                Text(item.address)
                    .frame(width: 400, alignment: .leading)
            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                Text("TÊN")
                    .frame(width: 300, alignment: .leading)
                Text("ĐIỆN THOẠI")
                    .frame(width: 150, alignment: .leading)
                Text("ĐỊA CHỈ")
                    .frame(width: 400, alignment: .leading)
            }
            .foregroundColor(.white)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12, weight: .semibold))
            .frame(height: 60)
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.customers.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index + 1)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        action(.didTapCustomer(item: item))
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}
