//
//  VehiceView.swift
//  SaleRetail
//
//  Created by D.Ace on 17/11/24.
//

import SwiftUI

struct VehiceView: View {
    
    @ObservedObject var state: VehiceState
    let action: (Action) -> Void
    
    init(state: VehiceState, action: @escaping (Action) -> Void) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
            .frame(height: 300)
    }
}

extension VehiceView {
    enum Action {
        case didTapItem(item: VehiceModel)
    }
}

extension VehiceView {
    func itemRow(item: VehiceModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text("\(index)")
                    .padding(.leading, 8)
                    .frame(width: 100, alignment: .leading)
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
                Text("STT")
                    .padding(.leading, 8)
                    .frame(width: 100, alignment: .leading)
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
                .background(Color.blue.opacity(0.6))
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

#Preview {
    VehiceView(state: .init(vehices: [
        VehiceModel(id: 1, licensePlate: "", code: "AB", lisDeleted: false),
        VehiceModel(id: 1, licensePlate: "", code: "NVX", lisDeleted: false),
        VehiceModel(id: 1, licensePlate: "", code: "Dream", lisDeleted: false),
        VehiceModel(id: 1, licensePlate: "", code: "Ware", lisDeleted: false)
    ])) { _ in }
}
