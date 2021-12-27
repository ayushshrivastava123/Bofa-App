//
//  ViewController.swift
//  BoxA
//
//  Created by Ayush Shrivastava on 12/12/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

  
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var EmployeeSignInButton: UIButton!
    

    
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    @IBAction func LoginTapped(_ sender: Any) {
        
        
        
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email , password: password) { (result, error) in
            
            if (error != nil){
               
                let ErrorMessage = UIAlertController(title: "Error", message: "Incorrect email/password", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("OK tapped")
                })
                ErrorMessage.addAction(ok)
                
                self.present(ErrorMessage, animated: true, completion: nil)
            }
            else{
                let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.HomeVC) as? HomeViewController
                
                self.view.window?.rootViewController = HomeViewController
                self.view.window?.makeKeyAndVisible()
            
            }
            
    }
    
}
    
    

    
    
    
    
    @IBAction func DidTapOnEmployeeLogin(_ sender: Any) {
        
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email , password: password) { (result, error) in
            
            if (error != nil){
               
                let ErrorMessage = UIAlertController(title: "Error", message: "Incorrect email/password", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("OK tapped")
                })
                ErrorMessage.addAction(ok)
                
                self.present(ErrorMessage, animated: true, completion: nil)
            }
            else{
                let EmployeeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.EmployeeVC) as? EmployeeViewController
                
                self.view.window?.rootViewController = EmployeeViewController
                self.view.window?.makeKeyAndVisible()
            
            }
            
    }
        
        
    }
    
    
    
    
    
  
}

