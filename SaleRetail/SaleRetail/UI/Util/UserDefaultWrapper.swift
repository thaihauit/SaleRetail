//
//  UserDefaultWrapper.swift
//  SaleRetail
//
//  Created by D.Ace on 4/12/24.
//

import Foundation
import SwiftUICore

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    // Getter và Setter
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt64(&hexNumber)
        let r = Double((hexNumber & 0xFF0000) >> 16) / 255.0
        let g = Double((hexNumber & 0x00FF00) >> 8) / 255.0
        let b = Double(hexNumber & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
