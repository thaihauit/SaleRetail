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
    @UserDefault(key: "expiredTime", defaultValue: -1) var expiredTime: Double
    
    var shouldLogin: Bool {
        expiredTime < Date().timeIntervalSince1970
    }
    
    func asynLogin() {
        guard !username.isEmpty, !password.isEmpty, shouldLogin else { return }
        BaseProvider().login(userName: username, password: password) { login in
            if let token = login?.data.token, let expiredTime = login?.data.expiredTime {
                self.token = token
                if let date = ISO8601DateFormatter().date(from: expiredTime) {
                    self.expiredTime = date.timeIntervalSince1970
                }
            } else {
                self.reset()
            }
        }
    }
    
    func reset() {
        self.token = ""
        self.username = ""
        self.password = ""
    }
    
    func asynLogin(userName: String, password: String, completion: @escaping (Bool) -> Void) {
        BaseProvider().login(userName: username, password: password) { login in
            if let token = login?.data.token, let expiredTime = login?.data.expiredTime {
                self.token = token
                self.username = userName
                self.password = password
                if let date = ISO8601DateFormatter().date(from: expiredTime) {
                    self.expiredTime = date.timeIntervalSince1970
                }
                completion(true)
            } else {
                self.reset()
                completion(false)
            }
        }
    }
}
