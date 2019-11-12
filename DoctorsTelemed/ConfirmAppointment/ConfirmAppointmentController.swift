//
//  ConfirmAppointmentController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 30/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class ConfirmAppointmentController: UIViewController {

    var isMySedul = Bool()
    
    
    @IBOutlet weak var DenyView: UIView!

    @IBOutlet weak var ConfView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          if !isMySedul {
             DenyView.isHidden = true
             ConfView.isHidden = true
           }
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
     @IBAction func Continue(_ sender: Any) {
        
        if isMySedul {
            self.navigationController?.popViewController(animated: true)

        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AppoSummaryController") as! AppoSummaryController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func ViewRecord(_ sender: Any) {
         if isMySedul {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MedicalRecordController") as! MedicalRecordController
            self.navigationController?.pushViewController(vc, animated: true)
        }
         else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
   

}
