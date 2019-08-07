//
//  CreateAccountVC.swift
//  SmackChat
//
//  Created by Samiul Haque on 6/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToChannel", sender: nil)
    }
    
    @IBAction func generateBgPressed(_ sender: Any) {
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailText.text, emailText.text != "" else{return}
        guard let pass = passText.text, passText.text != "" else{return}
        
        AuthService.instance.registerUser(email: email, password: pass) {
            (success) in
            if(success)
            {
                print("registered user!")
            }
        }
        
    }
}
