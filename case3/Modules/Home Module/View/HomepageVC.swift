//
//  HomepageVC.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import UIKit

protocol AnyHomeView {
    var presenter: AnyHomePresenter? { get set }
    
    func update(with portofolio: [datas])
    func update(with months: months)
    func update(with error: String)
}

class HomepageVC: UIViewController, AnyHomeView, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    var presenter: AnyHomePresenter?
    var portofolioData: [datas]?
    var MonthsData: months?
    
    func update(with portofolio: [datas]) {
        DispatchQueue.main.async { [self] in
            portofolioData = portofolio
            tableView.reloadData()
        }
        
    }
    
    func update(with months: months) {
        DispatchQueue.main.async { [self] in
            MonthsData = months
            tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: DonutChartCell.identifier, bundle: nil), forCellReuseIdentifier: DonutChartCell.identifier)
        tableView.register(UINib(nibName: LineChartCell.identifier, bundle: nil), forCellReuseIdentifier: LineChartCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DonutChartCell.identifier, for: indexPath) as! DonutChartCell
            
            cell.donutChartView.clearValues()
            cell.nameData.removeAll()
            cell.percentageData.removeAll()
            cell.numberOfEntry.removeAll()
            if portofolioData != nil {
                for i in 0...((portofolioData?.count ?? 0) - 1){
                    
                    cell.nameData.append(portofolioData?[i].label ?? "")
                    cell.percentageData.append(Double(portofolioData?[i].percentage ?? "") ?? 0.0)
                    
                }
            }
            cell.callbackIndex = {(index: Int) in
                self.presenter?.viewDidGetDetailData(with: self.portofolioData![index])
            }
            
            cell.setup()
            cell.layoutIfNeeded()
            cell.layoutSubviews()
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: LineChartCell.identifier, for: indexPath) as! LineChartCell
            
            cell.lineChart.clearValues()
            cell.months.removeAll()
           
            if MonthsData != nil {
                for i in 0...((MonthsData?.month?.count ?? 0) - 1){
                    
                    cell.months.append(MonthsData?.month?[i] ?? 0)
                }
            }
            
            cell.setup()
            cell.layoutIfNeeded()
            cell.layoutSubviews()
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: LineChartCell.identifier, for: indexPath) as! LineChartCell
            return cell
        }
        
    }
    


}
