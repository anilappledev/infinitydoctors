//
//  VideoCallController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 30/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class VideoCallController: UIViewController {
    
    @IBOutlet weak var img_Doctor: UIImageViewX!
    
    @IBOutlet weak var userLbe: UILabel!
    @IBOutlet weak var lbeTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showImageAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ImagesConfirmController") as! ImagesConfirmController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func showDocument(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConfirmAppointmentController") as! ConfirmAppointmentController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func stopVoice(_ sender: Any) {
    }
    @IBAction func endCall(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RatingViewController") as! RatingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
