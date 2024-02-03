//
//  LineChartCell.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import UIKit
import Charts

class LineChartCell: UITableViewCell, ChartViewDelegate {
    
    static let identifier = String(describing: LineChartCell.self)
    
    @IBOutlet weak var lineChart: LineChartView!
    
    var months: [Int] = []
    var monthsString = ["Jan","Feb","Mar","Apr","Mei","Jun","Agu","Sep","Okt","Nov","Des"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        lineChart.rightAxis.enabled = false
        lineChart.rightAxis.drawAxisLineEnabled = false
        lineChart.xAxis.drawAxisLineEnabled = true
        lineChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.leftAxis.drawGridLinesEnabled = false
        lineChart.drawBordersEnabled = false
        lineChart.setScaleEnabled(false)
        lineChart.legend.enabled = false
        lineChart.animate(yAxisDuration: 0.5)
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: monthsString)
        let data = LineChartData()
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<months.count {
            let value = ChartDataEntry(x: Double(i), y: Double(months[i]))
            lineChartEntry.append(value)
        }
        
        let line = LineChartDataSet(entries: lineChartEntry, label: "months")
        line.lineWidth = 2.5
        line.circleRadius = 4
        
        line.drawValuesEnabled = true
        line.mode = .horizontalBezier
        line.setColor(.blue)
        line.setCircleColor(.blue)
        line.fillAlpha = 0.25
        
        line.drawFilledEnabled = true
        
        data.append(line)
        self.lineChart.data = data
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

 
    }
    
}
