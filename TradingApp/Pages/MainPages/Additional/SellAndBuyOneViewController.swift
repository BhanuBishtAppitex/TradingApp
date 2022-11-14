//
//  SellAndBuyOneViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 14/11/22.
//

import UIKit
import Charts

class SellAndBuyOneViewController: UIViewController, ChartViewDelegate {
    
    let candleStickChartView = CandleStickChartView()
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var topBarStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candleStickChartView.delegate = self
        candleStickChartView.translatesAutoresizingMaskIntoConstraints = false
        updateInitialView()
        
        
    }
    //MARK: - look and feel of candle stick chart
    func updateInitialView(){
        candleStickChartView.frame = CGRect(x: 0, y: 0, width: chartView.frame.width, height: chartView.frame.height)
        chartView.addSubview(candleStickChartView)

        candleStickChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        candleStickChartView.xAxis.labelCount = 3
        candleStickChartView.xAxis.labelWidth = 94
      
       
        candleStickChartView.leftAxis.enabled = false
        candleStickChartView.xAxis.labelFont = UIFont(name: C.Fonts.semiBold, size: 12)!
        candleStickChartView.rightAxis.labelFont = UIFont(name: C.Fonts.medium, size: 10)!
        
        self.candleStickChartView.xAxis.valueFormatter = XAxisNameFormater()
        self.candleStickChartView.xAxis.granularity = 1
       
        
        
        // candle stick chart look and feel
        // 1. x axis and y axis
        candleStickChartView.xAxis.labelCount = 1
        candleStickChartView.leftAxis.enabled = false
        candleStickChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        // 2. background color
        candleStickChartView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        candleStickChartView.gridBackgroundColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
        candleStickChartView.borderColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
        candleStickChartView.rightAxis.axisLineColor = .clear
        candleStickChartView.legend.enabled = false
        candleStickChartView.xAxis.labelTextColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
        candleStickChartView.rightAxis.labelTextColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
        updateDataForCandleStick()
    }
    //MARK: - data for candle Stick chart view
    func updateDataForCandleStick(){
        print("inside update method")
        //let oneDay:Double = 60*60*24
        let dataSet = CandleChartDataSet(entries: [
            CandleChartDataEntry(x: 30, shadowH: 238, shadowL: 222, open: 228, close: 235, data: .none),
            CandleChartDataEntry(x: 31, shadowH: 242, shadowL: 225, open: 238, close: 236, data: .none),
            CandleChartDataEntry(x: 32, shadowH: 235, shadowL: 222, open: 225, close: 232, data: .none),
            CandleChartDataEntry(x: 33, shadowH: 235, shadowL: 222, open: 232, close: 225, data: .none),
            CandleChartDataEntry(x: 34, shadowH: 228, shadowL: 218, open: 223, close: 220, data: .none),
            CandleChartDataEntry(x: 35, shadowH: 232, shadowL: 223, open: 224, close: 228, data: .none),
            CandleChartDataEntry(x: 36, shadowH: 240, shadowL: 225, open: 235, close: 228, data: .none),
            CandleChartDataEntry(x: 37, shadowH: 245, shadowL: 232, open: 233, close: 242, data: .none),
            CandleChartDataEntry(x: 38, shadowH: 221, shadowL: 235, open: 231, close: 225, data: .none),
            CandleChartDataEntry(x: 39, shadowH: 241, shadowL: 227, open: 229, close: 232, data: .none),
            CandleChartDataEntry(x: 40, shadowH: 319, shadowL: 305, open: 314, close: 318, data: .none),
            CandleChartDataEntry(x: 41, shadowH: 313, shadowL: 298, open: 311, close: 305, data: .none),
            CandleChartDataEntry(x: 42, shadowH: 313, shadowL: 299, open: 309, close: 299, data: .none),
            CandleChartDataEntry(x: 43, shadowH: 315, shadowL: 302, open: 311, close: 313, data: .none),
            CandleChartDataEntry(x: 44, shadowH: 311, shadowL: 298, open: 309, close: 301, data: .none),
            CandleChartDataEntry(x: 45, shadowH: 303, shadowL: 293, open: 301, close: 299, data: .none),
            CandleChartDataEntry(x: 46, shadowH: 299, shadowL: 290, open: 297, close: 292, data: .none),
            CandleChartDataEntry(x: 47, shadowH: 295, shadowL: 285, open: 292, close: 280, data: .none),
            CandleChartDataEntry(x: 48, shadowH: 295, shadowL: 285, open: 289, close: 292, data: .none),
        ])
        
        dataSet.decreasingColor = #colorLiteral(red: 0.9176470588, green: 0.2588235294, blue: 0.3098039216, alpha: 1)
        dataSet.increasingColor = #colorLiteral(red: 0.2196078431, green: 0.5568627451, blue: 0.8980392157, alpha: 1)
        dataSet.shadowColor = #colorLiteral(red: 0.2196078431, green: 0.5568627451, blue: 0.8980392157, alpha: 1)
        dataSet.increasingFilled = true
        
        let data = CandleChartData(dataSets: [
            dataSet
        ])
       data.setValueTextColor(.clear)
       candleStickChartView.data = data
    }


}


//MARK: - Custom Claass for x axis format
final class XAxisNameFormater: NSObject, AxisValueFormatter {

    func stringForValue( _ value: Double, axis _: AxisBase?) -> String {

      // let formatter = DateFormatter()
      // formatter.locale = Locale(identifier: "en_US_POSIX")
      //  formatter.dateFormat = "MMMM"
      // let string = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(value)))
      // return string
        
        if value >= 0 && value <= 30 {
            return "jan"
        } else if value >= 31 && value <= 58 {
            return "feb"
        } else if value >= 58 && value <= 90 {
            return "march"
        } else {
            return "april"
        }
       
    }

}


