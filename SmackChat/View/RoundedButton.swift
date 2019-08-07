//
//  RoundedButton.swift
//  SmackChat
//
//  Created by Samiul Haque on 8/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {

    //IB Inspectable Var is nothing but a public variable that can be edited in the inspector of the interface builder.Don't get Confused!
    @IBInspectable var cornerRadius : CGFloat = 5.0
        {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
        
    }
    override func awakeFromNib() {
        self.setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    
    }
    func setupView()
    {
       self.layer.cornerRadius = cornerRadius
    }

}
