//
//  DetailTransaksiCell.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import UIKit

class DetailTransaksiCell: UITableViewCell {

    static let identifier = String(describing: DetailTransaksiCell.self)
    
    @IBOutlet weak var leftLbl: UILabel!
    @IBOutlet weak var rightLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
