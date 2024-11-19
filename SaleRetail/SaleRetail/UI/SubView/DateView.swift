//
//  DateView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct DateView: View {
    
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                       .datePickerStyle(.graphical)
                       .padding()
                       .frame(width: 450, height: 400)
    }
    
    // Định dạng ngày
       var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }
}

