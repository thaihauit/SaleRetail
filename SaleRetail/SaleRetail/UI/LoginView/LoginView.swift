//
//  LoginView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var state: LoginState
    let action: (Action) -> Void
    
    init(state: LoginState, action: @escaping (Action) -> Void = { _ in}) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
    }
}

extension LoginView {
    enum Action {
        case didTapItem
    }
}

extension LoginView {
    var contentView: some View {
        VStack(spacing: 32) {
            Image("loginIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.bottom, 48)
            
            Group {
                TextFieldFormView2(title: "Tài Khoản", text: "") { text in
                    text
                }
                
                TextFieldFormView2(title: "Mật Khẩu", text: "") { text in
                    text
                }
                
                ButtonView(title: "Đăng Nhập") {
                }
            }
            .frame(width: 600)
        }
    }
}

#Preview {
    LoginView(state: .init())
}
