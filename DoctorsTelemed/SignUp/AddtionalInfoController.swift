//
//  AddtionalInfoController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 25/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class AddtionalInfoController: UIViewController {

    
    @IBOutlet weak var txtMedicaldegree: UITextField!
    @IBOutlet weak var txtWhereMedicaldegree: UITextField!
    @IBOutlet weak var txtOtherdegrees: UITextField!
    @IBOutlet weak var txtWhereOtherdegrees: UITextField!
    @IBOutlet weak var txtDEA: UITextField!
    
    @IBOutlet weak var lbeAddInfo: UILabel!
    @IBOutlet weak var lbeMedicalDegree: UILabel!
    @IBOutlet weak var lbeMedicalDegreeWhere: UILabel!
    @IBOutlet weak var lbeOtherDegree: UILabel!
    @IBOutlet weak var lbeOtherDegreeWhere: UILabel!
    @IBOutlet weak var lbeDEA: UILabel!
    
    @IBOutlet weak var imgVwChe: UIImageView!

    var isSelect = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: -  @IBAction
    
    @IBAction func SignUp(_ sender: Any) {
        
        SignUpValidation()
        
    }
    
    
     @IBAction func AttachedResume(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func Treams(_ sender: Any) {
        self.view.endEditing(true)
        imgVwChe.image = UIImage (named: "checkWhite")
        isSelect = true
    }
    
    @IBAction func TreamsViewOpen(_ sender: Any) {
        self.view.endEditing(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TermsController") as! TermsController
        vc.strTitle = "Terms and Conditions"

        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func PrivayViewOpen(_ sender: Any) {
        self.view.endEditing(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyController") as! PrivacyPolicyController

        self.navigationController?.pushViewController(vc, animated: true)
    }

   
    func SignUpValidation(){
        
        let Medicaldegree = txtMedicaldegree.text ?? ""
        let WhereMedicaldegree = txtWhereMedicaldegree.text ?? ""
        let DEA = txtDEA.text ?? ""
      
        
        
        if Medicaldegree.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Medical Degree Field")
            
            return
        }
        
        if WhereMedicaldegree.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Medical Degree get Place Field")
            
            return
        }
        
        if DEA.isEmpty
        {
            self.showErrorMSg(text: "Please enter in DEA# Field")
            
            return
        }
        else if !isSelect{
            self.showErrorMSg(text: "Please read and accept Terms of Use and Privacy Policy")
            return
        }
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func showErrorMSg(text : String)
    {
        AlertView.oneButtonAction(title: "Oops!", text, self)
    }

    //MARK: - textField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.count == 0 {
            if string == " " {
                return false
            }
        }
        
        return true
    }
    
    //MARK: - touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
