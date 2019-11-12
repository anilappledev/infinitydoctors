//
//  AppointmentController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 25/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class AppointmentController: UIViewController {

    @IBOutlet fileprivate var tableViewAppo : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @objc func buttonSelected_Est(sender: UIButton){
        print(sender.tag)
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AppointmentStartController") as! AppointmentStartController
        self.navigationController?.pushViewController(vc, animated: true)
        
      
    }
    
    
    @objc func buttonSelected_Medical(sender: UIButton){
        print(sender.tag)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MedicalRecordController") as! MedicalRecordController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

//MARK: - TableViewDataSource Delegate
extension AppointmentController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 3
        }
        else
        {
            return 5
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = AppColor.AppPinkRGB
        var label = UILabel(frame: CGRect(x: 24, y: 0, width: 200, height: 22))
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.font = UIFont(name: "CircularStd-Bold", size: 15)
        
        if section  == 0{
            label.text = "Upcoming Appointments"
        }
        else{
            label = UILabel(frame: CGRect(x: 24, y: 13, width: 200, height: 22))
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.white
            label.font = UIFont(name: "CircularStd-Bold", size: 15)
            
            label.text = "Last Appointments"
        }
        vw.addSubview(label)
        
        return vw
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 23
        }
        else
        {
            return 35
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cellOfUp = tableView.dequeueReusableCell(withIdentifier: "UpcomingBookingCell", for: indexPath) as? UpcomingBookingCell else {
                return UpcomingBookingCell()
            }
            cellOfUp.selectionStyle = .none
            cellOfUp.btnEst.tag = indexPath.row
            cellOfUp.btnEst.addTarget(self, action: #selector(buttonSelected_Est), for: .touchUpInside)
            
            cellOfUp.btnMedicalRec.tag = indexPath.row
            cellOfUp.btnMedicalRec.addTarget(self, action: #selector(buttonSelected_Medical), for: .touchUpInside)
            
            
            
            return cellOfUp
        case 1:
            guard let cellOfLast = tableView.dequeueReusableCell(withIdentifier: "LastAppointmentCell", for: indexPath) as? LastAppointmentCell else {
                return LastAppointmentCell()
            }
            cellOfLast.selectionStyle = .none
            
            return cellOfLast
            
        default:
            return UITableViewCell()
        }
        
    }
}
//MARK: - TableViewDelegate Delegate
extension AppointmentController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if DeviceType.IS_IPHONE_5 {
            return 200
        }
        return 195
      //  return UITableView.automaticDimension
}

}
