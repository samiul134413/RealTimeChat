//
//  ChannelVC.swift
//  SmackChat
//
//  Created by Samiul Haque on 6/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func prepareForUnwind(segue:UIStoryboardSegue)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth =
            self.view.frame.size.width - 60
        
    }
    
    @IBAction func pressLogin(_ sender: Any)
    {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    

}
