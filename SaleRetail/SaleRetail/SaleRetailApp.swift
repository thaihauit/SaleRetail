//
//  SaleRetailApp.swift
//  SaleRetail
//
//  Created by D.Ace on 11/11/24.
//

import SwiftUI

@main
struct SaleRetailApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoginView(state: .init())
//            MainView(state: .init()) { action in
//                print("")
//            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        LoginManager.shared.asynLogin()
        return true
    }
}
