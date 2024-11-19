//
//  SaleRetailApp.swift
//  SaleRetail
//
//  Created by D.Ace on 11/11/24.
//

import SwiftUI

@main
struct SaleRetailApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(state: .init()) { action in
                print("")
            }
        }
    }
}
