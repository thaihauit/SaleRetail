//
//  VehicleView.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import SwiftUI

struct VehicleView: View {
    
    @ObservedObject var state: VehicleState
    let action: (Action) -> Void
    
    init(state: VehicleState, action: @escaping (Action) -> Void) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
            .frame(height: 300)
    }
}

extension VehicleView {
    enum Action {
        case didTapItem(item: VehicleModel)
    }
}

extension VehicleView {
    func itemRow(item: VehicleModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text(item.code)
                    .frame(width: 200, alignment: .leading)
            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                Text("Loại Xe")
                    .frame(width: 200, alignment: .leading)
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
                .background(Color.blue)
            scrollView
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.vehices.enumerated()), id: \.offset) { (index, item) in
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
