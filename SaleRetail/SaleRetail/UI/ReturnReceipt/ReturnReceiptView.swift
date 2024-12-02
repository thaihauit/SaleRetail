//
//  ReturnReceiptView.swift
//  SaleRetail
//
//  Created by D.Ace on 26/11/24.
//
 
import SwiftUI

struct ReturnReceiptView: View {
    
    @ObservedObject var state: ReturnReceiptState
    let action: (Action) -> Void
    
    init(state: ReturnReceiptState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                contentView
                    .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HeaderBaseView(name: "TRẢ HÀNG")
            }
        }
    }
}

extension ReturnReceiptView {
    var customerView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    Text("KHÁCH HÀNG")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Tên", content: "")
                        TextFormView(title: "SĐT", content: "")
                    }
                    
                    TextFormView(title: "Địa Chỉ", content: "")
                        .padding(.bottom, 16)
                }
                .padding(16)
            }
            .frame(height: 250)
            .cornerRadius(8)
    }
    
    var productView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    HStack {
                        Text("SẢN PHẨM")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 12)
                        
                        Text("TRẢ HẾT SẢN PHẨM")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    
                    ProductView(state: .init(products: []))
                }
                .padding(16)
            }
            .frame(height: 580)
            .cornerRadius(8)
    }
    
    var infoView: some View {
        Color.blue.opacity(0.15)
            .overlay {
                VStack(spacing: 16) {
                    Text("THÔNG TIN ĐƠN HÀNG")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 9)
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Mã Phiếu", content: "")
                        TextFormView(title: "Ngày Giao", content: "")
                        TextFormView(title: "Kho", content: "")
                        TextFormView(title: "Xe", content: "")
                    }
                    
                    HStack(spacing: 8) {
                        TextFormView(title: "Chiết Khấu", content: "iPhone")
                        TextFormView(title: "Chiết Khấu Tích Lũy", content: "iPhone")
                        TextFormView(title: "Thành Tiền", content: "iPhone")
                        TextFormView(title: "Phải Trả", content: "iPhone")
                    }
                }
                .padding(16)
            }
            .frame(height: 250)
            .cornerRadius(8)
    }
    
    var contentView: some View {
        VStack(spacing: 16) {
            customerView
            infoView
            productView
            
            ButtonView(title: "SAVE") {
                
            }
        }
        
    }
}

extension ReturnReceiptView {
    enum Action {
        case didTapItem
    }
}
