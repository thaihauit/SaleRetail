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
    
    init(state: UnitState, action: @escaping (Action) -> Void) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
            .background(Color.white)
            .frame(height: 450)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

extension UnitView {
    enum Action {
        case didTapItem(item: UnitModel)
    }
}

extension UnitView {
    func itemRow(item: UnitModel, index: Int) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Group {
                    Text("\(index)")
                        .padding(.leading, 8)
                        .frame(width: 150, alignment: .leading)
                    
                    Text(item.name)
                        .frame(width: 300, alignment: .leading)
                }
                .padding(.horizontal, 4)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 12))
                .frame(height: 60)
            }
            
            Divider()
        }
        .background(Color.white)
        .padding(.horizontal, 12)
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                Text("STT")
                    .padding(.leading, 8)
                    .frame(width: 50, alignment: .leading)
                Text("Loại Xe")
                    .frame(width: 100, alignment: .leading)
            }
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .semibold))
            .frame(height: 60)
        }
    }
    
    
    var contentView: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue.opacity(0.6))
            scrollView
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.units.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index + 1)
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
        UnitModel(id: 1, code: "1234", name: "Tui"),
        UnitModel(id: 1, code: "1234", name: "Bich"),
        UnitModel(id: 1, code: "1234", name: "kg")
    ])) { _ in }
}
