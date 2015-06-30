//
//  PodcastDashViewController.swift
//  Dashcast
//
//  Created by Jia Chen on 6/28/15.
//  Copyright (c) 2015 com.bruinSquare. All rights reserved.
//

import UIKit
import Charts

class PodcastDashViewController: UIViewController {
    
    @IBOutlet var barChartView: BarChartView!
    @IBOutlet var lineChartView: LineChartView!
    
    var months: [String]!
    
    @IBOutlet var chartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.translucent = false
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(months, values: unitsSold)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setChart(dataPoints: [String], values: [Double]) {
        lineChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let lineDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")

        let chartData = LineChartData(xVals: months, dataSet: lineDataSet)

        lineChartView.data = chartData
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
