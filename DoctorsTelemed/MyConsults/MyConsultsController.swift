//
//  MyConsultsController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 29/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class MyConsultsController: UIViewController {
    @IBOutlet fileprivate var tableViewMyConsults : UITableView!
    @IBOutlet weak var lbeNav: UILabel!
    @IBOutlet weak var lbeFilters: UILabel!
    @IBOutlet weak var lbeSortBy: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Cancel(_ sender: Any) {
        pressed()
    }
    
    func pressed()
    {
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
    
    @IBAction func FiltersAction(_ sender: Any) {
        
        
       // self.navigationController?.popViewController(animated: true)
    }


}
//MARK: - TableViewDataSource Delegate
extension MyConsultsController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return 11
        
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellOfProfile = tableView.dequeueReusableCell(withIdentifier: "MyConsultsCell", for: indexPath) as? MyConsultsCell else {
            return MyConsultsCell()
        }
        cellOfProfile.selectionStyle = .none
        return cellOfProfile
        
    }
    
    
}
//MARK: - TableViewDelegate Delegate
extension MyConsultsController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 111
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       
        return
    }
    
    
}

