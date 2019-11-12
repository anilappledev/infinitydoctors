//
//  ImagesConfirmController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 02/11/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class ImagesConfirmController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
//MARK: - TableViewDataSource Delegate
extension ImagesConfirmController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return 3
       
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cellImage = tableView.dequeueReusableCell(withIdentifier: "ImagesViewCell", for: indexPath) as? ImagesViewCell else {
                return ImagesViewCell()
            }
        cellImage.selectionStyle = .none

        if indexPath.row == 0 {
            cellImage.imgViews.image = UIImage (named: "Picture1")
            cellImage.lbeTitle.text = "Picture 1"

        }
        if indexPath.row == 1 {
            cellImage.imgViews.image = UIImage (named: "Picture2")
            cellImage.lbeTitle.text = "Picture 2"

            
        }
        if indexPath.row == 2 {
            cellImage.imgViews.image = UIImage (named: "Picture3")
            cellImage.lbeTitle.text = "Picture 3"

            
        }

            return cellImage
        }
        
    }

//MARK: - TableViewDelegate Delegate
extension ImagesConfirmController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
}

