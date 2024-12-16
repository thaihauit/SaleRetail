//
//  LoginState.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation

class LoginState: ObservableObject {
    @Published var userName: String = "saletest"
    @Published var password: String = "admin"
}
