//
//  case3Tests.swift
//  case3Tests
//
//  Created by aldo on 02/02/24.
//

import XCTest
@testable import case3

final class case3Tests: XCTestCase {

    func testPortofolioGet() {
        let portofolio = portofolio(type: "donutChart", data: .arr([datas(label: "Tarik Tunai",percentage: "55",data: [dataDetail(trx_date: "21/01/2023",nominal: 1000000)])]))
        
        XCTAssertEqual(portofolio.type, "donutChart")
        
        switch portofolio.data {
        case .arr(let datas):
            XCTAssertEqual(datas[0].label, "Tarik Tunai")
            XCTAssertEqual(datas[0].data?[0].nominal, 1000000)
        default:
            ()
        }
    }

}
