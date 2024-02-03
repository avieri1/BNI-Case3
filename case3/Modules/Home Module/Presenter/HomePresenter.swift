//
//  HomePresenter.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation

enum FetchErrorReason: Error {
    case failure
}

protocol AnyHomePresenter {
    var router: AnyHomeRouter? { get set }
    var interactor: AnyHomeInteractor? { get set }
    var view: AnyHomeView? { get set }
    
    func interactorDidFetchPortofolio(with result: Result<[datas], Error>)
    func interactorDidFetchMonths(with result: Result<months, Error>)
    func viewDidGetDetailData(with detailData: datas)
}

class HomePresenter: AnyHomePresenter {
    
    var router: AnyHomeRouter?
    
    var interactor: AnyHomeInteractor? {
        didSet {
            interactor?.getPortofolio()
        }
    }
    
    var view: AnyHomeView?
    
    func interactorDidFetchPortofolio(with result: Result<[datas], Error>) {
        switch result {
        case .success(let portofolio):
            view?.update(with: portofolio)
        case .failure:
            view?.update(with: "Error")
        }
    }
    func interactorDidFetchMonths(with result: Result<months, Error>) {
        switch result {
        case .success(let months):
            view?.update(with: months)
        case .failure:
            view?.update(with: "Error")
        }
    }
    
    func viewDidGetDetailData(with detailData: datas) {
        router?.pushToDetail(on: view!, with: detailData)
    }
    
}
