//
//  SignUpViewController.swift
//  BoxA
//
//  Created by Ayush Shrivastava on 12/12/21.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PassTextField: UITextField!
    
    
  
    
    @IBOutlet weak var GetStartedButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PassTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "Please fill in all fields"
        }
        
        return nil
        
        
    }

    @IBAction func GetStartedTapped(_ sender: Any) {
        
        _ = validateFields()
        let firstname = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastname = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PassTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
        
        let db = Firestore.firestore()
            db.collection("Users").addDocument(data: ["First_Name":firstname, "Last_Name":lastname, "uid": result!.user.uid]) { (error) in
                
                
            }
            self.HomeView()
        }
        
    }

    
    
    @IBAction func CancelTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func HomeView() {
        let HomeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.HomeVC) as? HomeViewController
        
        view.window?.rootViewController = HomeViewController
        view.window?.makeKeyAndVisible()
    }
    
    
}
