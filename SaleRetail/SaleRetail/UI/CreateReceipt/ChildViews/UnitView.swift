//
//  UnitView.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import SwiftUI

struct UnitView: View {
    @ObservedObject var state: UnitState
    let action: (Action) -> Void
    
    init(state: UnitState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
            .frame(width: 200, height: 300)
    }
}

extension UnitView {
    enum Action {
        case didTapItem(item: UnitModel)
    }
}

extension UnitView {
    func itemRow(item: UnitModel, index: Int) -> some View {
        Text(item.name)
            .frame(width: 100, alignment: .leading)
            .font(.system(size: 13))
            .frame(height: 60)
            .background(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var headerView: some View {
        Text("ĐƠN VỊ")
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
            .font(.system(size: 13, weight: .semibold))
            .frame(height: 60)
    }
    
    var contentView: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.units.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        action(.didTapItem(item: item))
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    UnitView(state: .init(units:  [
        UnitModel(id: 1, price: 1234, name: "Tui"),
        UnitModel(id: 1, price: 2222, name: "Bich"),
        UnitModel(id: 1, price: 1111, name: "chai"),
    ]))
}
