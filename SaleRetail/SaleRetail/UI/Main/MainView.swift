//
//  MainView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var state: MainState
    let action: (Action) -> Void
    
    init(state: MainState, action: @escaping (Action) -> Void) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
    }
}

extension MainView {
    enum Action {
        case didTapItem
    }
}

extension MainView {
    var receiptView: some View {
        CreateReceiptView(state: .init()) { action in
            switch action {
            case .didTapItem:
                break
            }
        }
    }
    
    var contentView: some View {
        NavigationStack {
            VStack {
                Spacer()
                LazyVGrid(columns: state.columns, spacing: 20) {
                    ForEach(1...9, id: \.self) { index in
                        switch index {
                        case 1:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        case 2:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        case 3:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        case 4:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        case 5:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        case 6:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        case 7:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        case 8:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        case 9:
                            NavigationLink(destination: receiptView) {
                                Text("Button \(index)")
                                    .frame(width: 150, height: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        default:
                            EmptyView()
                        }
                        
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    MainView(state: .init()) { _ in }
}
