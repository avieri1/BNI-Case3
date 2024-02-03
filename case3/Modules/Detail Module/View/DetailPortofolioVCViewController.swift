//
//  DetailPortofolioVCViewController.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import UIKit

protocol AnyDetailView {
    var presenter: AnyDetailPresenter? { get set }
    
    func show(with detailData: datas)
}

class DetailPortofolioVCViewController: UIViewController, AnyDetailView, UITableViewDelegate, UITableViewDataSource {
    var presenter: AnyDetailPresenter?
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var detailPortofolio: datas?
    
    func show(with detailData: datas) {
        DispatchQueue.main.async { [self] in
            detailPortofolio = detailData
            titleLbl.text = detailPortofolio?.label ?? ""
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = UIView()
        tableView.register(UINib(nibName: DetailTransaksiCell.identifier, bundle: nil), forCellReuseIdentifier: DetailTransaksiCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (detailPortofolio?.data?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTransaksiCell.identifier, for: indexPath) as! DetailTransaksiCell
        
        
        if indexPath.row == 0 {
            cell.leftLbl.text = "Tanggal Transaksi"
            cell.rightLbl.text = "Nominal"
        }
        else{
            cell.leftLbl.text = detailPortofolio?.data?[indexPath.item - 1].trx_date ?? ""
            cell.rightLbl.text = "Rp \(detailPortofolio?.data?[indexPath.item - 1].nominal?.formattedWithSeparator ?? "")"
        }
        
        return cell
    }

}
