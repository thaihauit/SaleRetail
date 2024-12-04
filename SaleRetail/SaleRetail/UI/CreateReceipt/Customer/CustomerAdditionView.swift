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
                .background(Color.blue.opacity(0.6))
            scrollView
        }
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.phone)
                    .frame(width: 300, alignment: .leading)
                Text(item.address)
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("ĐIỆN THOẠI")
                    .frame(width: 300, alignment: .leading)
                Text("ĐỊA CHỈ")
                    .frame(maxWidth: .infinity, alignment: .leading)
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

#Preview {
    CustomerAdditionView(state: .init(customers: [
        CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false),
        CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false),
        CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false),
        CustomerModel(id: 1, group: 1, groupName: "111", phone: "1234567890", address: "London", code: "1234", name: "Ethan", note: "", isDeleted: false)
    ])) {_ in }
}
