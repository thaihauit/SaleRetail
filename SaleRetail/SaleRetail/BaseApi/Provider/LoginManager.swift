//
//  LoginManager.swift
//  SaleRetail
//
//  Created by D.Ace on 4/12/24.
//

import Foundation

class LoginManager {
    static let shared = LoginManager()
    @UserDefault(key: "username", defaultValue: "") var username: String
    @UserDefault(key: "password", defaultValue: "") var password: String
    @UserDefault(key: "token", defaultValue: "") var token: String
}
