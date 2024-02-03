//
//  DetailPresenter.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation

protocol AnyDetailPresenter {
    var router: AnyDetailRouter? { get set }
    var interactor: AnyDetailInteractor? { get set }
    var view: AnyDetailView? { get set }
    
    func interactorDidFetchDetail(with detailData: datas)

}

class DetailPresenter: AnyDetailPresenter {
    
    var router: AnyDetailRouter?
    
    var interactor: AnyDetailInteractor? {
        didSet {
            interactor?.getDetailData()
        }
    }
    
    var view: AnyDetailView?
    
    func interactorDidFetchDetail(with detailData: datas) {
        view?.show(with: detailData)
    }
    
    
}
