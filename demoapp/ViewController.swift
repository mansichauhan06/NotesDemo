//
//  ViewController.swift
//  demoapp
//
//  Created by mansi chauhan on 02/12/22.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var mobileTextField : UITextField!
    @IBOutlet var emailTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    
    var nameString : String?
    var mobileString :String?
    var emailString : String?
    var passwordString : String?
    
    @IBOutlet var submitButton : UIButton!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nameString  = nameTextField.text
        mobileString = mobileTextField.text
        emailString  = emailTextField.text
        passwordTextField.isSecureTextEntry = true
        passwordString = passwordTextField.text
    }

    func validateEmailId()-> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]=\\.[A-Za-z]{2,4}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailString)
    }
    
    func validatePassword()-> Bool
    {
        let passRegEx = "[0-9a-zA-Z!@#$%0-9]*[!@#$0-9]+[0-9a-zA-Z!@#$0-9]*{8,15}"
        let passPred = NSPredicate (format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: passwordString)
    }
    func validateMobileNumber()->Bool
    {
    let str = "+91"
        var result : Bool
        if(mobileString!.prefix(3) == str){
            result = true
        }else {
            result = false
        }
        return result
    }
    @IBAction func submitBut (_sender :UIButton)
    {
         didTapOnSubmit()
    }
    func didTapOnSubmit(){
        if (validateEmailId() && validatePassword() && validateMobileNumber()){
            print ("yes")
        }else {
            print ("no")
        }
    }
}

