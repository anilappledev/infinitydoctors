//
//  MyProfileController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 12/11/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class MyProfileController: UIViewController {
    
    @IBOutlet weak var btnRedBasic: UIButton!
    @IBOutlet weak var btnRedProfessional: UIButton!
    @IBOutlet weak var btnRedBank: UIButton!
    
    
    @IBOutlet weak var viewRedBasic: UIView!
    @IBOutlet weak var viewRedProfessional: UIView!
    @IBOutlet weak var viewRedBank: UIView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        btnRedBasic.isHidden = false
        btnRedProfessional.isHidden = true
        btnRedBank.isHidden = true
        
        viewRedBasic.isHidden = false
        viewRedProfessional.isHidden = true
        viewRedBank.isHidden = true

        

    }
    

    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func RedBasic(_ sender: Any) {
        
       
        
    }
    @IBAction func RedProfessional(_ sender: Any) {
        
    }
    @IBAction func RedBank(_ sender: Any) {
        
    }
    
    @IBAction func Basic(_ sender: Any) {
        btnRedBasic.isHidden = false
        btnRedProfessional.isHidden = true
        btnRedBank.isHidden = true
        
        viewRedBasic.isHidden = false
        viewRedProfessional.isHidden = true
        viewRedBank.isHidden = true
    }
    @IBAction func Professional(_ sender: Any) {
        btnRedBasic.isHidden = true
        btnRedProfessional.isHidden = false
        btnRedBank.isHidden = true
        
        viewRedBasic.isHidden = true
        viewRedProfessional.isHidden = false
        viewRedBank.isHidden = true
        
        
    }
    @IBAction func Bank(_ sender: Any) {
        btnRedBasic.isHidden = true
        btnRedProfessional.isHidden = true
        btnRedBank.isHidden = false
        
        viewRedBasic.isHidden = true
        viewRedProfessional.isHidden = true
        viewRedBank.isHidden = false
    }
   

}
