//
//  ChannelVC.swift
//  SmackChat
//
//  Created by Samiul Haque on 6/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth =
            self.view.frame.size.width - 60
        
    }
    

    

}
