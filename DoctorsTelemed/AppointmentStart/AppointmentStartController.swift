//
//  AppointmentStartController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 31/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class AppointmentStartController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction fileprivate func JoinCall(_ sender : UIButton){

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VideoCallController") as! VideoCallController
        self.navigationController?.pushViewController(vc, animated: true)
    
      }
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
  

}
