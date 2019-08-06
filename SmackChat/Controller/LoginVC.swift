//
//  LoginVC.swift
//  SmackChat
//
//  Created by Samiul Haque on 6/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: "createSegue", sender: nil)
    }
    
}
