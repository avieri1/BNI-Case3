//
//  DonutChartCell.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import UIKit
import Charts

class DonutChartCell: UITableViewCell, ChartViewDelegate {

    static let identifier = String(describing: DonutChartCell.self)
    
    @IBOutlet weak var donutChartView: PieChartView!
    
    var numberOfEntry = [PieChartDataEntry]()
    var nameData: [String] = []
    var percentageData: [Double] = []
    var callbackIndex : ((Int)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        donutChartView.delegate = self
        donutChartView.legend.enabled = true
        donutChartView.highlightPerTapEnabled = true
        donutChartView.animate(xAxisDuration: 1, easingOption: .easeOutBack)
        for i in 0..<nameData.count {
            let entry = PieChartDataEntry()
            entry.value = percentageData[i]
            entry.label = nameData[i]
            entry.y = percentageData[i]
            numberOfEntry.append(entry)
        }
        
        let chartDataset = PieChartDataSet(entries: numberOfEntry, label: "percentages")
        
        let chartData = PieChartData(dataSet: chartDataset)
      
        chartDataset.drawValuesEnabled = true
        chartDataset.colors = [UIColor.red,UIColor.green,UIColor.brown,UIColor.magenta]
        donutChartView.drawEntryLabelsEnabled = false
        donutChartView.data = chartData
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {

        guard let dataSet = chartView.data?.dataSets[highlight.dataSetIndex] else { return }
        
        let entryIndex = dataSet.entryIndex(entry: entry as! PieChartDataEntry)
       
        callbackIndex!(entryIndex)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
