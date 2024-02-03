//
//  DetailInteractor.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation

protocol AnyDetailInteractor {
    var presenter: AnyDetailPresenter? { get set }
    var detailData: datas? { get set }
    func getDetailData()
}

class DetailInteractor: AnyDetailInteractor {
    var detailData: datas?
    
    var presenter: AnyDetailPresenter?
    
    func getDetailData() {
        presenter?.interactorDidFetchDetail(with: detailData!)
    }
    
    
}
