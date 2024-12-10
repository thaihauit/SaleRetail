//
//  SalesOrderListState.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation
import UIKit

class SalesOrderListState: ObservableObject {
    
    @Published var isTapItem = false
    @Published var items: [SalesOrderModel] = []
    @Published var isLoading = false
    
    var createString: String {
        dateFormatter.string(from: createDate)
    }
    @Published var createDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date()) ?? Date() {
        didSet {
            isShowCreateDatePicker = false
            fetchItemList()
        }
    }
    @Published var isShowCreateDatePicker = false
    
    var endString: String { dateFormatter.string(from: endDate)}
    @Published var endDate = Date() {
        didSet {
            isShowEndDatePicker = false
            fetchItemList()
        }
    }
    @Published var isShowEndDatePicker = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter
    }
    var dateFormatter2: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter
    }
    
    var createDateString: String {
        dateFormatter2.string(from: createDate)
    }
    
    var endDateString: String {
        dateFormatter2.string(from: endDate)
    }
    
    init() {
    }
    
    func fetchItemList() {
        isLoading = true
        BaseProvider().sellist(fromDate: createDateString, toDate: endDateString) { items in
            self.items = items
            self.isLoading = false
        }
    }
    
}
