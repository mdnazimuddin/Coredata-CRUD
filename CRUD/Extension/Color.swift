//
//  UIColor.swift
//  CRUD
//
//  Created by Nazim Uddin on 8/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
class Color {
    static func backgroundGradient(view:UIView) {
        
        let colorTop = UIColor(red: 255.0 / 255.0, green: 128.0 / 255.0, blue: 0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0 / 255.0, green: 0/255.0, blue: 85.0 / 255.0, alpha: 1.0).cgColor
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [colorTop, colorBottom]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.addSublayer(layer)
    }
    static func buttonGradient(button:UIButton) {
        
        let colorTop = UIColor(red: 0, green: 102.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 204.0 / 255.0, green: 153.0/255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        
        let layer = CAGradientLayer()
        layer.frame.size = button.frame.size
        layer.colors = [colorTop, colorBottom]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        //button.layer.addSublayer(layer)
        button.layer.insertSublayer(layer, at: 0)
    }
}
