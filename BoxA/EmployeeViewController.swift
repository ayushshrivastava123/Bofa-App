//
//  EmployeeViewController.swift
//  BoxA
//
//  Created by Ayush Shrivastava on 12/24/21.
//

import Foundation
import UIKit
import Firebase



class EmployeeViewController: UIViewController {
    
    
    
    @IBOutlet weak var ViewDocumentsButton: UIButton!
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    
    
    
    
}
    
 
    @IBAction func TappedOnViewDocuments(_ sender: Any) {
        
        let myUrl = "https://account.box.com/login?"
            if let url = URL(string: "\(myUrl)"), !url.absoluteString.isEmpty {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }

            // or outside scope use this
            guard let url = URL(string: "\(myUrl)"), !url.absoluteString.isEmpty else {
               return
            }
             UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
    }
    
    
    
    
    
    
}

