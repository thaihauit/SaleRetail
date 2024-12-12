//
//  MainState.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import Foundation
import SwiftUI

class MainState: ObservableObject {
    
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
    ]
    
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var shouldShowLoginView = LoginManager.shared.shouldLogin
    @Published var isLoading = false
    @Published var isShowErrorDialog = false
    init() {}
    
}
