//
//  ProductView.swift
//  SaleRetail
//
//  Created by D.Ace on 13/11/24.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var state: ProductState
    let action: (Action) -> Void
    
    init(state: ProductState, action: @escaping (Action) -> Void = { _ in }) {
        self.state = state
        self.action = action
    }
    
    var body: some View {
        contentView
            .frame(height: 500)
    }
}

extension ProductView {
    enum Action {
        case didRemoveItem(index: Int)
    }
}

extension ProductView {
    func itemRow(item: ProductModel, index: Int) -> some View {
        HStack(spacing: 0) {
            Group {
                Text("\(index)")
                    .frame(width: 70, alignment: .leading)
                
                Text(item.code)
                    .frame(width: 100, alignment: .leading)
                
                Text(item.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(item.unitName)
                    .frame(width: 100, alignment: .leading)
                
                TextFieldNumberView(onChangeValue: { value in
                    
                }).frame(width: 100, alignment: .leading)
                
                Text("\(item.sellPrice)")
                    .frame(width: 100, alignment: .leading)
                
                Text("\(item.unitExchangeRate)")
                    .frame(width: 100, alignment: .leading)
                
                Text("999999")
                    .frame(width: 150, alignment: .leading)
            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 12))
            .frame(height: 60)
        }
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
                
                Text("Đơn Vị")
                    .frame(width: 100, alignment: .leading)
                
                Text("Số Lượng")
                    .frame(width: 100, alignment: .leading)
                
                Text("Đơn Giá")
                    .frame(width: 100, alignment: .leading)
                
                Text("Chiết Khấu")
                    .frame(width: 100, alignment: .leading)
                
                Text("Thành Tiền")
                    .frame(width: 150, alignment: .leading)
            }
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .semibold))
            .frame(height: 60)
        }
    }
    
    var contentView: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
                .background(Color.blue)
            
            scrollView
        }
    }
    
    var scrollView: some View {
        List {
            ForEach(Array(state.products.enumerated()), id: \.offset) { (index, item) in
                itemRow(item: item, index: index + 1)
                    .contentShape(Rectangle())
                    .swipeActions {
                        Button(role: .destructive) {
                            action(.didRemoveItem(index: index))
                        } label: {
                            Label("Xóa", systemImage: "trash")
                        }
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ProductView(state: .init(products: [
        ProductModel(id: 1,
                     group: 1,
                     provider: 1,
                     unit: 1,
                     smallUnit: 1,
                     unitExchangeRate: 1,
                     buyPrice: 1242,
                     sellPrice: 234,
                     smallUnitSellPrice: 1111,
                     weight: 1111,
                     smallUnitWeight: 111,
                     minSellUnit: 111,
                     isDeleted: false,
                     hasExpiredDate: false,
                     groupName: "",
                     providerName: "",
                     unitName: "",
                     smallUnitName: "",
                     minSellUnitName: "",
                     code: "SP0001",
                     name: "Tuong ot ha anh"
                    ),
        ProductModel(id: 1,
                     group: 1,
                     provider: 1,
                     unit: 1,
                     smallUnit: 1,
                     unitExchangeRate: 1,
                     buyPrice: 1242,
                     sellPrice: 234,
                     smallUnitSellPrice: 1111,
                     weight: 1111,
                     smallUnitWeight: 111,
                     minSellUnit: 111,
                     isDeleted: false,
                     hasExpiredDate: false,
                     groupName: "",
                     providerName: "",
                     unitName: "",
                     smallUnitName: "",
                     minSellUnitName: "",
                     code: "SP0001",
                     name: "Tuong ot ha anh"
                    ),
        ProductModel(id: 1,
                     group: 1,
                     provider: 1,
                     unit: 1,
                     smallUnit: 1,
                     unitExchangeRate: 1,
                     buyPrice: 1242,
                     sellPrice: 234,
                     smallUnitSellPrice: 1111,
                     weight: 1111,
                     smallUnitWeight: 111,
                     minSellUnit: 111,
                     isDeleted: false,
                     hasExpiredDate: false,
                     groupName: "",
                     providerName: "",
                     unitName: "",
                     smallUnitName: "",
                     minSellUnitName: "",
                     code: "SP0001",
                     name: "Tuong ot ha anh"
                    ),
        ProductModel(id: 1,
                     group: 1,
                     provider: 1,
                     unit: 1,
                     smallUnit: 1,
                     unitExchangeRate: 1,
                     buyPrice: 1242,
                     sellPrice: 234,
                     smallUnitSellPrice: 1111,
                     weight: 1111,
                     smallUnitWeight: 111,
                     minSellUnit: 111,
                     isDeleted: false,
                     hasExpiredDate: false,
                     groupName: "",
                     providerName: "",
                     unitName: "",
                     smallUnitName: "",
                     minSellUnitName: "",
                     code: "SP0001",
                     name: "Tuong ot ha anh"
                    ),
        ProductModel(id: 1,
                     group: 1,
                     provider: 1,
                     unit: 1,
                     smallUnit: 1,
                     unitExchangeRate: 1,
                     buyPrice: 1242,
                     sellPrice: 234,
                     smallUnitSellPrice: 1111,
                     weight: 1111,
                     smallUnitWeight: 111,
                     minSellUnit: 111,
                     isDeleted: false,
                     hasExpiredDate: false,
                     groupName: "",
                     providerName: "",
                     unitName: "",
                     smallUnitName: "",
                     minSellUnitName: "",
                     code: "SP0001",
                     name: "Tuong ot ha anh"
                    ),
        ProductModel(id: 1,
                     group: 1,
                     provider: 1,
                     unit: 1,
                     smallUnit: 1,
                     unitExchangeRate: 1,
                     buyPrice: 1242,
                     sellPrice: 234,
                     smallUnitSellPrice: 1111,
                     weight: 1111,
                     smallUnitWeight: 111,
                     minSellUnit: 111,
                     isDeleted: false,
                     hasExpiredDate: false,
                     groupName: "",
                     providerName: "",
                     unitName: "",
                     smallUnitName: "",
                     minSellUnitName: "",
                     code: "SP0001",
                     name: "Tuong ot ha anh"
                    ),
        ProductModel(id: 1,
                     group: 1,
                     provider: 1,
                     unit: 1,
                     smallUnit: 1,
                     unitExchangeRate: 1,
                     buyPrice: 1242,
                     sellPrice: 234,
                     smallUnitSellPrice: 1111,
                     weight: 1111,
                     smallUnitWeight: 111,
                     minSellUnit: 111,
                     isDeleted: false,
                     hasExpiredDate: false,
                     groupName: "",
                     providerName: "",
                     unitName: "",
                     smallUnitName: "",
                     minSellUnitName: "",
                     code: "SP0001",
                     name: "Tuong ot ha anh"
                    )
    ]))
}
