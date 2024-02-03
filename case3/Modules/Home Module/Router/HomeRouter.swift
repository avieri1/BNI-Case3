//
//  HomeRouter.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation
import UIKit

typealias EntryPoint = AnyHomeView & UIViewController

protocol AnyHomeRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyHomeRouter
    func pushToDetail(on view: AnyHomeView, with detailData: datas)
}

class HomeRouter: AnyHomeRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyHomeRouter {
        let router = HomeRouter()
        
        var view: AnyHomeView = HomepageVC()
        var presenter: AnyHomePresenter = HomePresenter()
        var interactor: AnyHomeInteractor = HomeInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router  = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        return router
    }
    
    func pushToDetail(on view: AnyHomeView, with detailData: datas) {
        DispatchQueue.main.async {
            let detailVC = DetailRouter.start(with: detailData)
            let vc = view as! HomepageVC
            vc.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
