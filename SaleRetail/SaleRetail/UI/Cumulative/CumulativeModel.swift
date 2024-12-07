//
//  CumulativeModel.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import Foundation

struct CumulativeModel: Decodable {
    let fromDate: String
    let toDate: String
    let requiredAmount: Int
    let discountAmount: Int
}

struct Cumulative: Decodable {
    let data: [CumulativeModel]
}

