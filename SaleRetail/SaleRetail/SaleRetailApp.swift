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
            MainView(state: .init())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        LoginManager.shared.asynLogin()
        return true
    }
}
