//
//  ProductItemView.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import SwiftUI

struct ProductItemView: View {
    
    @ObservedObject var state: ProductItemState
    let action: (Action) -> Void
    
    init(state: ProductItemState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                Text("\(state.index)")
                    .frame(width: 70, alignment: .leading)
                
                Text(state.product.code)
                    .frame(width: 100, alignment: .leading)
                
                Text(state.product.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(state.unitSelected?.name ?? "")
                    .contentShape(Rectangle())
                    .onTapGesture {
                        state.isDisplayUnitModal = true
                    }
                    .frame(width: 100, alignment: .leading)
                
                TextFieldNumberView(number: state.product.quantity, onChangeValue: { value in
                    action(.didSelectedNumber(index: state.index, value: value ?? 0))
                })
                .frame(width: 100, alignment: .leading)
                
                Text("\(state.unitSelected?.price ?? 0)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(state.product.unitExchangeRate)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(state.totalCost)")
                    .frame(width: 150, alignment: .leading)
                
            }
            .contentShape(Rectangle())
            .onTapGesture {
                action(.didTapItem(index: state.index))
            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
        .fullScreenCover(isPresented: $state.isDisplayUnitModal) {
            PopupView(isPresented: $state.isDisplayUnitModal, content: {
                UnitView(state: .init(units: state.product.units)) { onAction in
                    switch onAction {
                    case let .didTapItem(item):
                        action(.didSelectedUnit(index: state.index, unit: item))
                    }
                }
            })
        }
    }
}

extension ProductItemView {
    enum Action {
        case didTapItem(index: Int)
        case didSelectedNumber(index: Int, value: Int)
        case didSelectedUnit(index: Int, unit: UnitModel)
    }
}

