//
//  SignUpViewController.swift
//  PWCTask
//
//  Created by Hanriver MacBook on 25/08/22.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var vw1: UIView!
    @IBOutlet weak var vw2: UIView!
    @IBOutlet weak var vw3: UIView!
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        
        vw3.layer.cornerRadius = 6
        vw3.layer.masksToBounds = true
        
        vw3.layer.borderColor = UIColor.lightGray.cgColor
        vw3.layer.borderWidth = 1
    }


    @IBAction func btnSignupAction(_ sender: Any) {
       
        if (tfName!.text?.isEmpty ?? true)  {
           commonalert(message: "Please enter your name")
           return
       }
        if (tfEmail!.text?.isEmpty ?? true)  {
           commonalert(message: "Please enter your email id")
           return
       }
        if (tfPassword!.text?.isEmpty ?? true)  {
           commonalert(message: "Please enter your password")
           return
       }
        
       // Store User Details in Local storage
        let userDefaults = UserDefaults.standard
        guard let email = tfEmail.text else {return}
        
        guard let pass = tfPassword.text else {return}
        guard let name = tfName.text else {return}
        
        userDefaults.set(pass, forKey: email)
        userDefaults.set(name, forKey: pass)
        
    
        showSuccessAlert(message: "Registration completed successfully")
        
        
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func commonalert(message:String)
    {
        
        let alrt = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alrt.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alrt, animated: true, completion: nil)
    }
    
    func showSuccessAlert(message:String ){
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                self.navigationController?.popViewController(animated: true)
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                print("default")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
