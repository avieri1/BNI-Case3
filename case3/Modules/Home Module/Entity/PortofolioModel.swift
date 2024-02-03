//
//  PortofolioModel.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation

struct portofolio: Decodable {
    var type: String?
    var data: Datas
}

enum Datas: Codable {
    case dict(months)
    case arr([datas])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(months.self) {
            self = .dict(x)
            return
        }
        if let x = try? container.decode([datas].self) {
            self = .arr(x)
            return
        }
        throw DecodingError.typeMismatch(Datas.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for datas"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .dict(let x):
            try container.encode(x)
        case .arr(let x):
            try container.encode(x)
        }
    }
}

struct datas: Codable {
    var label: String?
    var percentage: String?
    var data: [dataDetail]?
   
}
struct dataDetail: Codable {
    var trx_date: String?
    var nominal: Int?
}

struct months: Codable {
    var month: [Int]?
}

