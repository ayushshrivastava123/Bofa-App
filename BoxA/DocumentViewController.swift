//
//  DocumentViewController.swift
//  BoxA
//
//  Created by Ayush Shrivastava on 12/19/21.
//

import Foundation
import UIKit
import BoxSDK


class DocumentViewController: UIViewController {

    @IBOutlet weak var UploadButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://upload.box.com/api/2.0/files/content")!
        
        let task = URLSession.shared.dataTask(with: url) {  (data, response, error) in
        }
        
        task.resume()
    
    
        
    
    }

    
    
    @IBAction func UploadTapped(_ sender: Any) {
        
        let client = BoxSDK.getClient(token: "MDOMb04OymEdfvDqFn0ler6ewPt7SrJd")

        client.users.getCurrent(fields:["name", "login"]) { (result: Result<User,
          BoxSDKError>) in
          guard case let .success(user) = result else {
              print("Error getting user information")
              return
          }
          print("Authenticated as \(user.name)")
        }
        
        
      
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


