//
//  GradientView.swift
//  SmackChat
//
//  Created by Samiul Haque on 6/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {
    @IBInspectable var topColor : UIColor = #colorLiteral(red: 0.1093873158, green: 0.4554009438, blue: 0.758908689, alpha: 1)
    {
        didSet
        {
          self.setNeedsLayout()
        }
            
    }
    
    @IBInspectable var bottomColor : UIColor = #colorLiteral(red: 0, green: 0.7820728421, blue: 0.9638897777, alpha: 1)
        {
        didSet
        {
            self.setNeedsLayout()
        }
        
    }
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    

}
