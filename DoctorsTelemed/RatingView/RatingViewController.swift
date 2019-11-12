//
//  RatingViewController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 29/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import Cosmos

class RatingViewController: UIViewController {

    @IBOutlet weak var RatingVw: CosmosView!
    
    @IBOutlet weak var lbeNav: UILabel!
    
    @IBOutlet weak var imgDoctor: UIImageViewX!
    
    @IBOutlet weak var lbeDes: UILabel!
    
    @IBOutlet weak var lbeRevData: UILabel!
    
    @IBOutlet weak var lbeRev: UILabel!
    
    @IBOutlet weak var lbeDoctorName: UILabel!
    
    @IBOutlet weak var lbeLangData: UILabel!
    
    @IBOutlet weak var lbeLang: UILabel!
    
    @IBOutlet weak var btnRating: UIButtonX!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func Close(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers

        for vc in viewControllers {
            if(vc is HomeController){
                self.navigationController!.popToViewController(vc, animated: true)
            }
            else {
                // self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func Rate(_ sender: Any) {
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        
        for vc in viewControllers {
            if(vc is HomeController){
                self.navigationController!.popToViewController(vc, animated: true)
            }
            else {
                // self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
   

}
