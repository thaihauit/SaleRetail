//
//  ReceiptModel.swift
//  SaleRetail
//
//  Created by D.Ace on 9/12/24.
//

import Foundation

struct ReceiptModel: Codable {
    var cumulativeAmount: Int
    var customer: CustomerModel
    var deliveredDate: String
    var products: [ProductModel]
    var discount: Int
    var discountIds: [DiscountId]
    var note: String
    var paidAmount: Int
    var totalAmount: Int
    var vehicle: VehicleModel?
    var warehouse: WarehouseModel
}

struct ReceiptModel1: Codable {
    var cumulativeAmount: Int
    var customer: CustomerModel
    var deliveryDate: String
    var products: [ProductModel]
    var discount: Int
    var discountIds: [DiscountId]
    var note: String
    var paidAmount: Int
    var totalAmount: Int
    var vehicle: VehicleModel?
    var warehouse: WarehouseModel
}

struct DiscountId: Codable {
    let discountId: Int
    let amount: Int
}

struct Receipt: Codable {
    let data: ReceiptModel1
}
/*
{
    "ok": true,
    "error_message": null,
    "data": {
        "saleEmployee": 9,
        "customer": {
            "groupName": "Châu Thành",
            "phone": "0363384181",
            "address": "100m --> Cầu Cây Da",
            "id": 1,
            "code": "KH0001",
            "name": "TH NGỌC LOAN",
            "note": "Đặng Văn Tình"
        },
        "warehouse": {
            "id": 1,
            "code": "KHO001",
            "name": "Kho Chính"
        },
        "vehicle": {
            "licensePlate": "54",
            "id": 1,
            "code": "XE01"
        },
        "deliveryDate": "0001-01-01T00:00:00",
        "note": "",
        "discount": 32800,
        "cumulativeAmount": 0,
        "totalAmount": 820000,
        "paidAmount": 787500,
        "products": [
            {
                "unit": 5,
                "smallUnit": 4,
                "unitExchangeRate": 12,
                "id": 1,
                "code": "SP00001",
                "name": "Tương Ớt 250G (TNP)",
                "discountId": null,
                "promotionId": null,
                "units": [
                    {
                        "id": 5,
                        "name": "Block",
                        "price": 70000
                    },
                    {
                        "id": 4,
                        "name": "Chai",
                        "price": 5833
                    }
                ],
                "unitSelected": {
                    "id": 5,
                    "name": "Block",
                    "price": 60000
                },
                "quantity": 10,
                "discount": 0,
                "amount": 700000,
                "isPromotionProduct": false
            },
            {
                "unit": 5,
                "smallUnit": 4,
                "unitExchangeRate": 12,
                "id": 2,
                "code": "SP00002",
                "name": "Tương Ớt 100G (TNP)",
                "discountId": null,
                "promotionId": null,
                "units": [
                    {
                        "id": 5,
                        "name": "Block",
                        "price": 60000
                    }
                ],
                "unitSelected": {
                    "id": 5,
                    "name": "Block",
                    "price": 60000
                },
                "quantity": 2,
                "discount": 0,
                "amount": 120000,
                "isPromotionProduct": false
            },
            {
                "unit": 0,
                "smallUnit": 0,
                "unitExchangeRate": 0,
                "id": 1,
                "code": "SP00001",
                "name": null,
                "discountId": null,
                "promotionId": null,
                "units": [
                    {
                        "id": 5,
                        "name": "Block",
                        "price": 0
                    },
                    {
                        "id": 4,
                        "name": "Chai",
                        "price": 0
                    }
                ],
                "unitSelected": {
                    "id": 4,
                    "name": "Chai",
                    "price": 0
                },
                "quantity": 2,
                "discount": 0,
                "amount": 0,
                "isPromotionProduct": true
            }
        ],
        "discountIds": [
            {
                "discountId": 1,
                "amount": 32800
            }
        ]
    }
}
*/
