//
//  PersonalInfoController.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 25/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import DropDown

class PersonalInfoController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtNameDoctors: UITextField!
    @IBOutlet weak var txtSurnameDoctors: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDateBirth: UITextField!
    @IBOutlet weak var txtBirthCity: UITextField!
    @IBOutlet weak var txtBirthCountry: UITextField!
    @IBOutlet weak var txtCurrentAddress: UITextField!
    
    @IBOutlet weak var txtSpecialty: UITextField!
    @IBOutlet weak var txtSubSpecialty: UITextField!
    @IBOutlet weak var txtLanguage: UITextField!
    @IBOutlet weak var txtLanguage2: UITextField!

    @IBOutlet weak var btnSpeciality: UIButton!
    @IBOutlet weak var btnSubSpeciality: UIButton!
    @IBOutlet weak var btnLang1: UIButton!
    @IBOutlet weak var btnLang2: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnCancel: UIButton!

    @IBOutlet weak var lbeInfo: UILabel!
    @IBOutlet weak var lbeDoctorName: UILabel!
    @IBOutlet weak var lbeDoctorSurName: UILabel!
    @IBOutlet weak var lbeDateOfBirth: UILabel!
    @IBOutlet weak var lbeBirthCity: UILabel!
    @IBOutlet weak var lbeBirthCountry: UILabel!
    @IBOutlet weak var lbeSpecialty: UILabel!
    @IBOutlet weak var lbeSubSpecialty: UILabel!
    @IBOutlet weak var lbeLang1: UILabel!
    @IBOutlet weak var lbeLang2: UILabel!
    @IBOutlet weak var lbeAddess: UILabel!
    @IBOutlet weak var lbeEmail: UILabel!


    let dropSpeciality = DropDown()
    let dropSubSpeciality = DropDown()
    let dropLang = DropDown()
    let dropLang2 = DropDown()
    var userEmailString = String()
    var dateText = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.text = userEmailString
        setupDropDowns()
    }
    
    func setupDropDowns() {
        
        
        DropDown.appearance().backgroundColor = AppColor.AppPinkRGB
        DropDown.appearance().selectionBackgroundColor = AppColor.AppPinkRGB
        DropDown.appearance().cornerRadius = 10
        DropDown.appearance().textColor = UIColor.white

        
        setupSpecialityDropDown()
        setupSubSpecialityDropDown()
        setupLangDropDown()
        setupLangDropDown2()

       
    }
    
    
    func setupSpecialityDropDown() {
        
        dropSpeciality.anchorView = btnSpeciality
        dropSpeciality.bottomOffset = CGPoint(x: 0, y: btnSpeciality.bounds.height)
        
        dropSpeciality.dataSource = [
            "Dermotologiest",
            "Internal Medical",
            "Pediatrics"
            
        ]
        
        
        dropSpeciality.selectionAction = { [weak self] (index, item) in
            self!.txtSpecialty.text = item
        }
    }
    
    func setupSubSpecialityDropDown() {
        dropSubSpeciality.anchorView = btnSubSpeciality
        dropSubSpeciality.bottomOffset = CGPoint(x: 0, y: btnSubSpeciality.bounds.height)
        
        dropSubSpeciality.dataSource = [
            "Primary Care",
            "Family Medicine",
            "Internal Medicine",
            "Pediatrics"
        ]
        
        
        dropSubSpeciality.selectionAction = { [weak self] (index, item) in
            self!.txtSubSpecialty.text = item
        }
    }
    
    func setupLangDropDown() {
        dropLang.anchorView = btnLang1
        dropLang.bottomOffset = CGPoint(x: 0, y: btnLang1.bounds.height)

        dropLang.dataSource = [
            "English",
            "Spanish",
            "Portuguese"

        ]


        dropLang.selectionAction = { [weak self] (index, item) in
            self!.txtLanguage.text = item
       }
   }
    
    func setupLangDropDown2() {
        dropLang2.anchorView = btnLang2
        dropLang2.bottomOffset = CGPoint(x: 0, y: btnLang2.bounds.height)
        
        dropLang2.dataSource = [
            "English",
            "Spanish",
            "Portuguese"
        ]
        
        
        dropLang2.selectionAction = { [weak self] (index, item) in
            self!.txtLanguage2.text = item
        }
    }
    
    func addPicker(){
        
        let alert = UIAlertController(style: .alert, title: "Select Date of Birth")
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = AppColor.AppPinkRGB
        
         alert.setTitle(font: UIFont(name: "CircularStd-Bold", size: 17)!, color: UIColor.white)
        
       
            alert.view.tintColor = UIColor.white
        
        let date = Calendar.current.date(byAdding: .year, value: -14, to: Date())
        dateText = date ?? Date()
        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: date) { date in
            self.dateText = date
            }
        alert.addAction( title: "OK", style: .default, isEnabled: true) { (action) in
            
            self.txtDateBirth.text = convertTommDDyyyy(date:self.dateText)
            
            }
        alert.addAction(title: "Cancel", style: .cancel){ (action) in
            
        }
        
        alert.show()
        
    }
    
    //MARK: -  @IBAction
    
    @IBAction func DateOfBirth(_ sender: Any) {
        self.view.endEditing(true)
        addPicker()
        
    }
    
    
    @IBAction func Speciality(_ sender: Any) {
        
        dropSpeciality.show()
    }
    @IBAction func SubSpeciality(_ sender: Any) {
        
        dropSubSpeciality.show()
    }
    @IBAction func Lang(_ sender: Any) {
        
        dropLang.show()
    }
    
    @IBAction func Lang2(_ sender: Any) {
        
        dropLang2.show()
    }
    
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        SignUpValidation()
        
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //MARK: -  Login Validation --
    
    func SignUpValidation(){
        
        let nameText = txtNameDoctors.text ?? ""
        let surNameText = txtSurnameDoctors.text ?? ""
        let dbText = txtDateBirth.text ?? ""
        let birthCity = txtBirthCity.text ?? ""
        let birthCountry = txtBirthCountry.text ?? ""
        let CurrentAddress  = txtCurrentAddress.text ?? ""
        let emailText  = txtEmail.text ?? ""
        let specialtyText  = txtSpecialty.text ?? ""
        let subSpecialtyText  = txtSubSpecialty.text ?? ""
        let languageText  = txtLanguage.text ?? ""

        if nameText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Name Field")
            
            return
        }
        else if surNameText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Surname Field")
            
            return
        }
        else if dbText.isEmpty
        {
            self.showErrorMSg(text: "Please select Date of Birth")
            
            return
        }
        else if birthCity.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Birth-City Field")
            
            return
        }
        else if birthCountry.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Birth-Country Field")
            
            return
        }
            
        else if specialtyText.isEmpty
        {
            self.showErrorMSg(text: "Please select Specialty")
            
            return
        }
        else if subSpecialtyText.isEmpty
        {
            self.showErrorMSg(text: "Please select Sub-Specialty")
            
            return
        }
        else if languageText.isEmpty
        {
            self.showErrorMSg(text: "Please select Languages")
            
            return
        }
       
      
       
        else if CurrentAddress.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Current Address Field")
            
            return
        }
       
        else if emailText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Email Field")
            
            return
        }
        else if !emailText.EmailValidation()
        {
            self.showErrorMSg(text: "Please enter Correct Email ID")
            
            return
        }
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddtionalInfoController") as! AddtionalInfoController
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
 
    func showErrorMSg(text : String)
    {
        
        
        AlertView.oneButtonAction(title: "Oops!", text, self)
    }
    
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
