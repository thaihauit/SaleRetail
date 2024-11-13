//
//  CreateReceiptView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct CreateReceiptView: View {
    
    @ObservedObject var state: CreateReceiptState
    let action: (Action) -> Void
    
    init(state: CreateReceiptState, action: @escaping (Action) -> Void) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HeaderBaseView(name: "TẠO ĐƠN HÀNG")
            
            contentView
                .padding(.horizontal, 16)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        
    }
}

extension CreateReceiptView {
    var contentView: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                TextFormView(title: "Mã Phiếu Xuất", content: "Ethan")
                TextFormView(title: "Ngày Giao", content: "Ethan")
            }
            
            HStack(spacing: 8) {
                TextFormView(title: "Kho", content: "Ethan")
                TextFormView(title: "Xe", content: "Ethan")
            }
            .padding(.bottom, 16)
            
            HStack(spacing: 8) {
                TextFormView(title: "Tên Khách Hàng", content: "Ethan")
                TextFormView(title: "SĐT", content: "iPhone")
            }
            TextFormView(title: "Địa Chỉ", content: "iPhone")
                .padding(.bottom, 16)
            
            
            
            TextFormView(title: "Ngày Xuất", content: "iPhone")
            TextFormView(title: "Chiết Khấu", content: "iPhone")
            TextFormView(title: "Chuyển Khoản Tích Lũy", content: "iPhone")
            TextFormView(title: "Thành Tiền", content: "iPhone")
        }
    }
}

extension CreateReceiptView {
    enum Action {
        case didTapItem
    }
}

#Preview {
    CreateReceiptView(state: .init()) { _ in }
}
