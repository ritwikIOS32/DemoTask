//
//  ViewController.swift
//  PWCTask
//
//  Created by Hanriver MacBook on 24/08/22.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var vw1: UIView!
    @IBOutlet weak var vw2: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        
        vw1.layer.cornerRadius = 6
        vw1.layer.masksToBounds = true
        
        vw1.layer.borderColor = UIColor.lightGray.cgColor
        vw1.layer.borderWidth = 1
        
        vw2.layer.cornerRadius = 6
        vw2.layer.masksToBounds = true
        
        vw2.layer.borderColor = UIColor.lightGray.cgColor
        vw2.layer.borderWidth = 1
    }
    @IBAction func btnLoginAction(_ sender: Any) {
        
        
        if (tfEmail!.text?.isEmpty ?? true)  {
           commonalert(message: "Please enter the email id")
           return
       }
        if (tfPassword!.text?.isEmpty ?? true)  {
           commonalert(message: "Please enter the password")
           return
       }
        
        let userDefaults = UserDefaults.standard
        guard let email = tfEmail.text else {return}
        
        
        
        if UserDefaults.standard.object(forKey: email) != nil {
            let pass = userDefaults.object(forKey: email) as? String
            
            guard let password = pass else {return}
            if pass == tfPassword.text{
                let vc = HomeScreenViewController()
                vc.name = userDefaults.object(forKey: password) as? String ?? ""
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }else{
            commonalert(message: "Invalid login id or password")
        }
        
        
    }
    func commonalert(message:String)
    {
        
        let alrt = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alrt.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alrt, animated: true, completion: nil)
    }
    
    @IBAction func btnSignupAction(_ sender: Any) {
        
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}


