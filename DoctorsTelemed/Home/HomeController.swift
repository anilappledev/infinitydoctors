//
//  HomeController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 25/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var HomeTableView: UITableView!
    
    @IBOutlet weak var heightConst: NSLayoutConstraint!
    
    @IBOutlet weak var lbeListShow: UILabel!
    @IBOutlet weak var lbeHello: UILabel!
    
    
    @IBOutlet weak var btnMySchedule: UIButton!

    
    
    var objectHome = Dashboard()

    
    override func viewDidLoad() {
        super.viewDidLoad()
               getData()
               HomeTableView.reloadData()

        
    }
    
    //MARK:-   get Data Function
    func getData(){
        objectHome.imagesTitle = ["NextAppointments","MyDashboard","MyPrescriptions","hSetting","logout"]
        objectHome.title = ["Next Appointments","My Dashboard","My Prescriptions","Setting","Logout"]
        
    }
    
    @IBAction func MySchedule_Action(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MyScheduleController") as! MyScheduleController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
}

//MARK: - TableViewDataSource Delegate
extension HomeController : UITableViewDataSource, UITableViewDelegate
{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if strMoreList == "NO" {
//            return 4
//        }
//        else{
            return objectHome.title.count
            
       // }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellHome = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return HomeTableViewCell()
        }
        cellHome.selectionStyle = .none
        cellHome.lbeTitle.text = objectHome.title[indexPath.row]
        if indexPath.row < 4 {
            
            cellHome.img.image  =  UIImage (named: objectHome.imagesTitle[indexPath.row])
          //  cellHome.lbeTitle.textColor =  UIColor.white
          //  cellHome.img.alpha = 1
        }
        else{
            
            
            cellHome.img.image  =  UIImage (named: objectHome.imagesTitle[indexPath.row])
//            cellHome.lbeTitle.textColor =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.3)
         //   cellHome.img.alpha = 0.5
            
        }
        
        
        return cellHome
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:


            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AppointmentController") as! AppointmentController
            self.navigationController?.pushViewController(vc, animated: true)

            return
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DrDashboardController") as! DrDashboardController
            self.navigationController?.pushViewController(vc, animated: true)
            return
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MyConsultsController") as! MyConsultsController
            self.navigationController?.pushViewController(vc, animated: true)
            return

        case 3:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
            self.navigationController?.pushViewController(vc, animated: true)
            return

        case 4:
            LogoutAlertView.showLogout(view: self)
            return
        case 6:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TermsController") as! TermsController
            vc.strTitle = "About Us"
            self.navigationController?.pushViewController(vc, animated: true)
            return

        case 7:
           
            return


        case 8:

           

            return
        default :
            return
        }
    }
    
    
    
    
    
    
}

