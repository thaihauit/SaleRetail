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
    
    init(state: MainState, action: @escaping (Action) -> Void = { _ in}) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        NavigationStack {
            contentView
                .overlay {
                    if state.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                    }
                }
                .alert("Thông Báo", isPresented: $state.isShowErrorDialog) {
                    Button("OK", role: .cancel) {
                        state.isShowErrorDialog = false
                    }
                } message: {
                    Text(state.message)
                }
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        if state.shouldShowLoginView {
            LoginView(state: .init()) { action in
                switch action {
                case let .didTapItem(userName, password):
                    state.isLoading = true
                    LoginManager.shared.asynLogin(userName: userName, password: password) { (success, mess) in
                        state.isShowErrorDialog = !success
                        state.shouldShowLoginView = !success
                        state.isLoading = false
                        state.message = mess
                    }
                }
            }
        } else {
            mainView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    if state.isShowLogoutIcon {
                        Button {
                            state.logout()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.blue)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding([.top, .trailing], 50)
                    }
                }
        }
    }
}

extension MainView {
    enum Action {
        case didTapItem
    }
}

extension MainView {
    var receiptView: some View {
        CreateReceiptView(state: .init())
    }
    
    var saleOrderView: some View {
        SalesOrderListView(state: .init())
    }
    
    var productListView: some View {
        ProductListView(state: .init())
    }
    
    var inventoryView: some View {
        InventoryView(state: .init())
    }
    
    var cumulativeListView: some View {
        CumulativeListView(state: .init())
    }
    
    var discountListView: some View {
        DiscountListView(state: .init())
    }
    
    var promotionView: some View {
        PromotionView(state: .init())
    }
    
    var mainView: some View {
        LazyVGrid(columns: state.columns, spacing: 64) {
            ForEach(1...10, id: \.self) { index in
                switch index {
                case 1:
                    NavigationLink(destination: receiptView) {
                        VStack(spacing: 16) {
                            Image("createOrder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text("TẠO ĐƠN HÀNG")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                case 2:
                    NavigationLink(destination: saleOrderView) {
                        VStack(spacing: 16) {
                            Image("order")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text("DANH SÁCH ĐƠN HÀNG")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                case 3:
                    NavigationLink(destination: inventoryView) {
                        VStack(spacing: 16) {
                            Image("inventory")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text("TỒN KHO")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                case 4:
                    NavigationLink(destination: productListView) {
                        VStack(spacing: 16) {
                            Image("product")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text("DANH SÁCH HÀNG HÓA")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                case 5:
                    NavigationLink(destination: promotionView) {
                        VStack(spacing: 16) {
                            Image("promotion")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text("DANH SÁCH KHUYẾN MÃI")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                case 6:
                    NavigationLink(destination: discountListView) {
                        VStack(spacing: 16) {
                            Image("discount")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text("DANH SÁCH CHIẾT KHẤU")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                case 7:
                    NavigationLink(destination: cumulativeListView) {
                        VStack(spacing: 16) {
                            Image("acumulative")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                            
                            Text("DANH SÁCH TÍCH LŨY")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                default:
                    EmptyView()
                }
            }
        }
        .padding(.horizontal, 150)
    }
}
