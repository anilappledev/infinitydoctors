//
//  AppoSummaryController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 30/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class AppoSummaryController: UIViewController {

    @IBOutlet fileprivate var tableMedicalList : UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func Finish(_ sender: Any) {
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for vc in viewControllers {
            if(vc is VideoCallController){
                self.navigationController!.popToViewController(vc, animated: true)
            }
            else {
                // self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
   

}
//MARK: - TableViewDataSource Delegate
extension AppoSummaryController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return 4
        
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            guard let cellOfProfile = tableView.dequeueReusableCell(withIdentifier: "MedicalListCell", for: indexPath) as? MedicalListCell else {
                return MedicalListCell()
            }
            cellOfProfile.selectionStyle = .none
        
        if indexPath.row == 0 {
            cellOfProfile.lbeTitle.text = "Prescribed Dexamethasone 0.5mg"
        }
        if indexPath.row == 1 {
            cellOfProfile.lbeTitle.text = "Prescribed painkiller 1000mg"
        }
        if indexPath.row == 2 {
            cellOfProfile.lbeTitle.text = "Prescribed anti-itch cream 10mg"
        }
        if indexPath.row == 3 {
            cellOfProfile.lbeTitle.text = "Prescribed antibiotic 100mg"
        }
       
            return cellOfProfile
      
    }
}
//MARK: - TableViewDelegate Delegate
extension AppoSummaryController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if DeviceType.IS_IPHONE_5 {
            return 55
        }
        return 55
    }
    
}
