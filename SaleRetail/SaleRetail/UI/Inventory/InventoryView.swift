//
//  InventoryView.swift
//  SaleRetail
//
//  Created by D.Ace on 25/11/24.
//

import SwiftUI


struct InventoryView: View {
    
    @ObservedObject var state: InventoryState
    let action: (Action) -> Void
    
    init(state: InventoryState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        NavigationStack {
            contentView
        }
        .padding(16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HeaderBaseView(name: "DANH SÁCH TỒN KHO")
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

extension InventoryView {
    enum Action {
        case didTapItem(item: InventoryModel)
    }
}

extension InventoryView {
    func itemRow(item: InventoryModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text("\(index + 1)")
                    .frame(width: 70, alignment: .leading)
                
                Text(item.productCode)
                    .frame(width: 100, alignment: .leading)
                   
                Text(item.productName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.providerName)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.warehouseName)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.unitName)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.smallUnitName)
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.smallUnit)")
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
                
                Text("Mã Hàng Hóa")
                    .frame(width: 100, alignment: .leading)
                   
                Text("Tên Hàng Hóa")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Nhà Phân Phối")
                    .frame(width: 100, alignment: .leading)
                
                Text("Kho")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đơn Vị")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đơn vị QĐ")
                    .frame(width: 100, alignment: .leading)
                
                Text("SL tổn của ĐVQĐ")
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
