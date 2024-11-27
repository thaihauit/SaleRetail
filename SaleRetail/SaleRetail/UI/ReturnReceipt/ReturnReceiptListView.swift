//
//  ReturnReceiptListView.swift
//  SaleRetail
//
//  Created by D.Ace on 27/11/24.
//

import SwiftUI


struct ReturnReceiptListView: View {
    
    @ObservedObject var state: ReturnReceiptListState
    let action: (Action) -> Void
    
    init(state: ReturnReceiptListState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                contentView
            }
        }
        .padding(16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HeaderBaseView(name: "DANH SÁCH PHIẾU TRẢ HÀNG")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var contentView: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
    }
}

extension ReturnReceiptListView {
    enum Action {
        case didTapItem(item: ReturnReceiptModel)
    }
}

extension ReturnReceiptListView {
    func itemRow(item: ReturnReceiptModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text("\(index + 1)")
                    .frame(width: 70, alignment: .leading)
                
                Text(item.invoiceNo)
                    .frame(width: 100, alignment: .leading)
                   
                Text(item.sellInvoiceNo)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.customerName)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.sellInvoiceDate)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.sellDeliveryDate)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.vehicleLicensePlate)
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.totalAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.discount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.cumulativeAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.paidAmount)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.receivedAll)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.stockImported)")
                    .frame(width: 100, alignment: .leading)
                
                Text(item.createdEmp)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.createdDate)
                    .frame(width: 100, alignment: .leading)

            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            Group {
                Text("STT")
                    .frame(width: 70, alignment: .leading)
                
                Text("Mã Phiếu")
                    .frame(width: 100, alignment: .leading)
                   
                Text("Mã Phiếu Gốc")
                    .frame(width: 100, alignment: .leading)
                
                Text("Tên Khách Hàng")
                    .frame(width: 100, alignment: .leading)
                
                Text("Ngày Ghi Phiếu")
                    .frame(width: 100, alignment: .leading)
                
                Text("Ngày Giao Hàng")
                    .frame(width: 100, alignment: .leading)
                
                Text("Xe Nhận")
                    .frame(width: 100, alignment: .leading)
                
                Text("Tổng Tiền")
                    .frame(width: 100, alignment: .leading)
                
                Text("Chiết Khấu")
                    .frame(width: 100, alignment: .leading)
                
                Text("CK Tích Lũy")
                    .frame(width: 100, alignment: .leading)
                
                Text("Phải Trả")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đã Nhận Đủ Hàng")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đã Nhập Kho Tất Cả")
                    .frame(width: 100, alignment: .leading)
                
                Text("Người Tạo")
                    .frame(width: 100, alignment: .leading)
                
                Text("Ngày Tạo")
                    .frame(width: 100, alignment: .leading)
            }
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .semibold))
            .frame(height: 60)
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.items.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        action(.didTapItem(item: item))
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}
