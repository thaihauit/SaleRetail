//
//  SalesOrderModel.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import Foundation

struct SalesOrder: Decodable {
    let ok: Bool
    let data: SalesOrderModel
}

struct SalesOrderModel: Decodable {
    let invoiceNo: String
    let customer: CustomerModel
    let warehouse: WarehouseModel
    let vehicle: VehiceModel
    let deliveryDate: String
    let note: String
    let discount: Int
    let cumulativeAmount: Int
    let totalAmount: Int
    let paidAmount: Int
    let detail: [ProductModel]
    let stockExported: Bool
    let createdDate: String
}
/*
{
    "ok": true,
    "data": [
        {
            "invoiceNo": "PB2411220001",
            "customer": {
                "name": "TH HOÀNG LIÊN"
            },
            "warehouse": {
                "name": "Kho Chính"
            },
            "vehicle": {
                "licensePlate": "54"
            },
            "deliveryDate": "2024-11-23T00:00:00",
            "note": "",
            "discount": 0,
            "cumulativeAmount": 0,
            "totalAmount": 157500,
            "paidAmount": 0,
            "stockExported": true,
            "createdDate": "2024-11-22T10:42:26.633",
            "detail": [
                {
                    "code": "SP00007",
                    "name": "Tương Xí Muội Ớt 500G (TNP)",
                    "unitName": "Kg",
                    "quantity": 0,
                    "discount": 0,
                    "amount": 17500
                },
                {
                    "code": "SP00008",
                    "name": "Tương Xí Muội Ớt (Chai Sành-TNP)",
                    "unitName": "Block",
                    "quantity": 0,
                    "discount": 0,
                    "amount": 140000
                }
            ]
        },
        {
            "invoiceNo": "PB2411220002",
            "customer": {
                "name": "CHỊ THƯ"
            },
            "warehouse": {
                "name": "Kho Chính"
            },
            "vehicle": {
                "licensePlate": "54"
            },
            "deliveryDate": "2024-11-23T00:00:00",
            "note": "",
            "discount": 0,
            "cumulativeAmount": 0,
            "totalAmount": 4890000,
            "paidAmount": 0,
            "stockExported": true,
            "createdDate": "2024-11-22T11:00:23.94",
            "detail": [
                {
                    "code": "SP00010",
                    "name": "Sate Tôm Ly Quay - (TNP)",
                    "unitName": "Block",
                    "quantity": 0,
                    "discount": 0,
                    "amount": 590000
                },
                {
                    "code": "SP00030",
                    "name": "Chao Đại Đỏ (Cao Cấp) - 800G BD",
                    "unitName": "Thùng",
                    "quantity": 0,
                    "discount": 0,
                    "amount": 4300000
                }
            ]
        },
        {
            "invoiceNo": "PB2411220003",
            "customer": {
                "name": "TH CẨM TÚ"
            },
            "warehouse": {
                "name": "Kho Chính"
            },
            "vehicle": {
                "licensePlate": "54"
            },
            "deliveryDate": "2024-11-23T00:00:00",
            "note": "",
            "discount": 0,
            "cumulativeAmount": 0,
            "totalAmount": 414163,
            "paidAmount": 0,
            "stockExported": true,
            "createdDate": "2024-11-22T11:27:48.207",
            "detail": [
                {
                    "code": "SP00001",
                    "name": "Tương Ớt 250G (TNP)",
                    "unitName": "Block",
                    "quantity": 0,
                    "discount": 0,
                    "amount": 350000
                },
                {
                    "code": "SP00001",
                    "name": "Tương Ớt 250G (TNP)",
                    "unitName": "Block",
                    "quantity": 0,
                    "discount": 0,
                    "amount": 64163
                }
            ]
        },
        {
            "invoiceNo": "PB2411220005",
            "customer": {
                "name": "CHỊ NHỰT"
            },
            "warehouse": {
                "name": "Kho Chính"
            },
            "deliveryDate": "2024-11-23T00:00:00",
            "note": "",
            "discount": 0,
            "cumulativeAmount": 0,
            "totalAmount": 118000,
            "paidAmount": 118000,
            "stockExported": false,
            "createdDate": "2024-11-22T12:13:28.823",
            "detail": [
                {
                    "code": "SP00010",
                    "name": "Sate Tôm Ly Quay - (TNP)",
                    "unitName": "Block",
                    "quantity": 0,
                    "discount": 0,
                    "amount": 118000
                }
            ]
        }
    ]
}
*/
