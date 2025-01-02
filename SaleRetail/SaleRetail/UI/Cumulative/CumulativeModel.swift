//
//  CumulativeModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct CumulativeModel: Codable {
    @Default var fromDate: String
    @Default var toDate: String
    @Default var requiredAmount: Int
    @Default var discountAmount: Int
}

struct Cumulative: Codable {
    let data: [CumulativeModel]
}

