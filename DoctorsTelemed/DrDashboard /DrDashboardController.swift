//
//  DrDashboardController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 29/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import Charts

class DrDashboardController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var lineChart: LineChartView!
    
    @IBOutlet fileprivate var monthCollectionView : UICollectionView!

    
    var lineChartEntry = [ChartDataEntry]()
    var lineChartEntry2 = [ChartDataEntry]()
    
    var total = NSMutableArray()
    var total2 = NSMutableArray()
    
    var months: [String]!
    var selectIndex = Int()

    
     var itemNameArray = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov", "Dec"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectIndex = 10
        monthCollectionView.reloadData()
        months = ["01", "02","03","04","05"]
        LineChatDataShow()
    }
    
    func LineChatDataShow(){
        total = [25,30,45,48,45,52]
        total2 = [7,18,30,22,28,36]
        for i in 0..<total.count {
            let values = ChartDataEntry(x: Double(i), y:total[i] as! Double)
            lineChartEntry.append(values)
        }
        for i in 0..<total2.count{
            let values2 = ChartDataEntry(x: Double(i) , y:total2[i] as! Double)
            lineChartEntry2.append(values2)
        }
        
        let line1 = LineChartDataSet(entries: lineChartEntry,label : "Dr Miguel")
        let line2 = LineChartDataSet(entries: lineChartEntry2,label : "Average")
        
        line1.setCircleColor(AppColor.AppPinkRGB)
        line2.setCircleColor(AppColor.AppBlueRGB)
        
        line1.drawCircleHoleEnabled = false
        line1.circleRadius = 4.0
        line1.circleHoleRadius = 0.0
        
        line2.drawCircleHoleEnabled = false
        line2.circleRadius = 4.0
        line2.circleHoleRadius = 0.0
        
        line1.colors = [AppColor.AppPinkRGB]
        
        line1.valueColors = [AppColor.AppPinkRGB]
        line1.valueFormatter = DefaultValueFormatter(decimals: 0)

        line1.valueFont = UIFont(name: "CircularStd-Medium", size: 16)!
    
        line2.colors = [AppColor.AppBlueRGB]
        
        line2.valueColors = [AppColor.AppBlueRGB]
        line2.valueFormatter = DefaultValueFormatter(decimals: 0)

        line2.valueFont = UIFont(name: "CircularStd-Medium", size: 16)!
        
        let data = LineChartData()
        
        
        data.addDataSet(line1)
        data.addDataSet(line2)
        lineChart.data = data
        
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        
        lineChart.leftAxis.axisMinimum = 0
        lineChart.leftAxis.axisMaximum = 60
        lineChart.rightAxis.enabled = false
        
        lineChart.xAxis.labelPosition = .bottom
        lineChart.scaleXEnabled = false
        lineChart.scaleYEnabled = false
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.leftAxis.drawGridLinesEnabled = false
        
         lineChart.leftAxis.labelCount = 5
         lineChart.xAxis.setLabelCount(5, force: false)
         lineChart.leftAxis.axisLineColor = UIColor.clear
         lineChart.xAxis.axisLineColor = UIColor.clear
         lineChart.xAxis.labelTextColor = UIColor.clear
         lineChart.leftAxis.labelTextColor = UIColor.clear
        
        
        line1.lineWidth = 1.6
        line2.lineWidth = 1.6
        line1.drawValuesEnabled = true
        line2.drawValuesEnabled = true
        
        
        let legend = lineChart.legend
        legend.font = UIFont(name: "CircularStd-Bold", size: 15)!
        
        legend.textColor = (UIColor(red: 88/255.00, green: 93/255.00, blue: 128/255.00, alpha: 1.0))
        
        legend.xEntrySpace = 40
        legend.yEntrySpace = 40
        legend.xOffset = 0
        legend.yOffset = 10
        legend.wordWrapEnabled = true
        legend.form = Legend.Form(rawValue: 3)!
        
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    // MARK: - Collection View Method
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 12
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! MonthCell
        cell.lbeName.text = itemNameArray[indexPath.row]
        
       
            if selectIndex == indexPath.row{
                cell.viewLbe.backgroundColor = AppColor.AppPinkRGB
                cell.viewLbe.layer.borderWidth = 0
                cell.lbeName.textColor = UIColor.white
            }
            else{
                cell.viewLbe.backgroundColor = UIColor.clear
                cell.viewLbe.layer.borderWidth = 1.3
                cell.viewLbe.layer.borderColor = AppColor.AppBlueRGB.cgColor
                cell.lbeName.textColor = AppColor.AppBlueRGB

        }
    
        
        return cell
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let cellSize = CGSize(width: 76, height: 55)
        return cellSize
        
    }
    
    override func viewDidLayoutSubviews() {
        
        monthCollectionView.scrollToItem(at:IndexPath(item: 11, section: 0), at: .right, animated: false)
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectIndex = indexPath.row
        monthCollectionView.reloadData()

        
        
        }
}
