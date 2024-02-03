//
//  DetailRouter.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation
import UIKit

protocol AnyDetailRouter {
    
    static func start(with detailData: datas) -> UIViewController
}

class DetailRouter: AnyDetailRouter {
   
    static func start(with detailData: datas) -> UIViewController {
        let viewController = DetailPortofolioVCViewController()
        
        let presenter: AnyDetailPresenter = DetailPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.detailData = detailData
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
}
