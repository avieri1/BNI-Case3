//
//  HomeInteractor.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation

protocol AnyHomeInteractor {
    var presenter: AnyHomePresenter? { get set }
    
    func getPortofolio()
}

class HomeInteractor: AnyHomeInteractor {
    var presenter: AnyHomePresenter?
    
    func getPortofolio() {
        guard let path = Bundle.main.url(forResource: "portofolio", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: path)
            let result = try JSONDecoder().decode([portofolio].self, from: data)
            
            switch result[0].data {
            case .arr(let datas):
                self.presenter?.interactorDidFetchPortofolio(with: .success(datas))
            default:
                ()
            }
            
            switch result[1].data {
            case .dict(let datas):
                self.presenter?.interactorDidFetchMonths(with: .success(datas))
            default:
                ()
            }
            
        } catch {
            print(error)
            self.presenter?.interactorDidFetchPortofolio(with: .failure(error))
        }
    }
    
    
}
