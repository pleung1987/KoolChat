//
//  LoginVC.swift
//  KoolChat
//
//  Created by Patrick Leung on 29/3/2017.
//  Copyright © 2017 Patrick Leung. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: UIViewController{
    
    @IBOutlet weak var emailField: RoundTextField!
    
    @IBOutlet weak var passwordField: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginPressed(_ sender: RoundButton) {
        if let email = emailField.text , let pass = passwordField.text, (email.characters.count > 0 && pass.characters.count > 0) {
            
            //Call the login service
            AuthService.instance.login(email: email, password: pass, onComplete: { (errMsg, data) in
                guard errMsg == nil else{
                    let alert = UIAlertController(title: "Error Authentication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            })
            
        }else{
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            }
        }
}
    
    
