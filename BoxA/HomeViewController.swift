//
//  HomeViewController.swift
//  BoxA
//
//  Created by Ayush Shrivastava on 12/12/21.
//

import Foundation
import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var LogOutButton: UIButton!
    
    @IBAction func TapOnPersonalLoan(_ sender: UIButton) {
       
  
        
        
    }
    
    
    @IBAction func TappedLogOut(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
