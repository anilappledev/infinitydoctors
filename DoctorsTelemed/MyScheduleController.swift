//
//  MyScheduleController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 02/11/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class MyScheduleController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    

    var itemNameArray = ["9","10","11","12","13","14","15","16"]
    var currentDate = Date()
    var threeMonthDate = Date()

    var arrayMySchedule = NSMutableArray()
    
    @IBOutlet weak var lbeNextWeek: UILabel!
    
    @IBOutlet weak var lbeNewAppointments: UILabel!
    @IBOutlet weak var lbeClick: UILabel!


    
    @IBOutlet fileprivate var scheduleCollectionView : UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        lbeNewAppointments.numberOfLines = 1;
        lbeNewAppointments.adjustsFontSizeToFitWidth = true
        
        
        
        self.lbeNextWeek.text = String(format: "Next week - %@", convertTommDDyyyy(date:Date()))
        let nextThree = Calendar.current.date(byAdding: .day, value: 90, to: currentDate)
        threeMonthDate = nextThree!
        currentDate = Date()
        
         for i in 0..<56{
            var  addDictionary = Dictionary<String, Any> ()

            if i == 11{
                addDictionary.updateValue("0" as Any, forKey: "Alreadyblock")
                addDictionary.updateValue("0" as Any, forKey: "Open")
                addDictionary.updateValue("3" as Any, forKey: "Booking")
            }
            else if i == 27{
                addDictionary.updateValue("0" as Any, forKey: "Alreadyblock")
                addDictionary.updateValue("0" as Any, forKey: "Open")
                addDictionary.updateValue("3" as Any, forKey: "Booking")
            }
            else if i == 47{
                addDictionary.updateValue("0" as Any, forKey: "Alreadyblock")
                addDictionary.updateValue("0" as Any, forKey: "Open")
                addDictionary.updateValue("3" as Any, forKey: "Booking")
            }
            else{
                addDictionary.updateValue("1" as Any, forKey: "Alreadyblock")
                addDictionary.updateValue("0" as Any, forKey: "Open")
                addDictionary.updateValue("0" as Any, forKey: "Booking")
            }
           
            arrayMySchedule.add(addDictionary)

        }
        
        
    }
    
    @IBAction fileprivate func  Next_Week(_ sender : UIButton){

        if threeMonthDate > currentDate{
            let nextDate = Calendar.current.date(byAdding: .day, value: 7, to: currentDate)
            currentDate = nextDate!
            self.lbeNextWeek.text = String(format: "Next week - %@", convertTommDDyyyy(date:self.currentDate))
        }
         scheduleCollectionView.reloadData()
    }
    
    
    @IBAction fileprivate func  Back_Week(_ sender : UIButton){
        if currentDate > Date(){
        let nextDate = Calendar.current.date(byAdding: .day, value: -7, to: currentDate)
        currentDate = nextDate!
        self.lbeNextWeek.text = String(format: "Next week - %@", convertTommDDyyyy(date:self.currentDate))
        }
         scheduleCollectionView.reloadData()
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
   


// MARK: - Collection View Method

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    return arrayMySchedule.count
}


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
{
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! MonthCell
    
        if currentDate > Date(){
            cell.viewLbe.backgroundColor = AppColor.AppBlueRGB
            cell.lbeName.text = ""
        
        }
    
    else {
        var dict = NSDictionary()
        dict = arrayMySchedule[indexPath.row] as! NSDictionary
        
        var Alreadyblock = String()
        Alreadyblock = dict.value(forKey: "Alreadyblock") as! String
        if  Alreadyblock == "1"{
            cell.viewLbe.backgroundColor = AppColor.AppBlueRGB
            cell.lbeName.text = ""
        }
        
        var Open = String()
        Open = dict.value(forKey: "Open") as! String
        
        if  Open == "2"{
            cell.viewLbe.backgroundColor = UIColor.white
            cell.lbeName.text = "A"
            cell.lbeName.textColor = AppColor.AppBlueRGB
            
        }
        
        var Booking = String()
        Booking = dict.value(forKey: "Booking") as! String
        
        if  Booking == "3"{
            cell.viewLbe.backgroundColor = AppColor.AppPinkRGB
            cell.lbeName.text = "N"
            cell.lbeName.textColor = UIColor.white
            
        }
    }
   

    
       return cell
    
}
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
        
        if currentDate > Date(){
            
            
        }
        else{
            var dict = NSDictionary()
            dict = arrayMySchedule[indexPath.row] as! NSDictionary
            var  addDictionary = Dictionary<String, Any> ()
            var Booking = String()
            Booking = dict.value(forKey: "Booking") as! String
            
            if  Booking == "3"{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ConfirmAppointmentController") as! ConfirmAppointmentController
                
                vc.isMySedul = true
                self.navigationController?.pushViewController(vc, animated: true)
                return
            }
            
            var Alreadyblock = String()
            Alreadyblock = dict.value(forKey: "Alreadyblock") as! String
            if  Alreadyblock == "1"{
                
                addDictionary.updateValue("0" as Any, forKey: "Alreadyblock")
                addDictionary.updateValue("2" as Any, forKey: "Open")
                addDictionary.updateValue("0" as Any, forKey: "Booking")
                
                arrayMySchedule.replaceObject(at: indexPath.row, with: addDictionary)
                
                scheduleCollectionView.reloadData()
                
                return
                
            }
            
            var Open = String()
            Open = dict.value(forKey: "Open") as! String
            
            if  Open == "2"{
                addDictionary.updateValue("1" as Any, forKey: "Alreadyblock")
                addDictionary.updateValue("0" as Any, forKey: "Open")
                addDictionary.updateValue("0" as Any, forKey: "Booking")
                
                arrayMySchedule.replaceObject(at: indexPath.row, with: addDictionary)
                
                scheduleCollectionView.reloadData()
                return
            }
            
        }
        
 

       
    }
    

// MARK: - UICollectionViewDelegateFlowLayout methods

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    
    let screenSizeWidth = UIScreen.main.bounds.width - 57
    
    
    let cellSize = CGSize(width: screenSizeWidth / 7 , height: 35)
    return cellSize
    
}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
//MARK: - TableViewDataSource Delegate
extension MyScheduleController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemNameArray.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellOfProfile = tableView.dequeueReusableCell(withIdentifier: "TimeSlotCell", for: indexPath) as? TimeSlotCell else {
            return TimeSlotCell()
        }
        cellOfProfile.selectionStyle = .none
        
        cellOfProfile.lbeTime.text = itemNameArray[indexPath.row]
        
        return cellOfProfile
        
    }
}
//MARK: - TableViewDelegate Delegate
extension MyScheduleController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 35
        }
    
}
