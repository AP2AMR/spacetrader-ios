//
//  CustomButton.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/4/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation
import UIKit

//@IBDesignable
class CustomButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.whiteColor()
        self.tintColor = UIColor.blackColor()
        
        // downstate
        //self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        //self.setBackgroundColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
    }
    
    // use this instead of extension
    override var highlighted: Bool {
        didSet {
            
            if (highlighted) {
                self.backgroundColor = UIColor.grayColor()
                //self.tintColor = UIColor.whiteColor()
            }
            else {
                self.backgroundColor = UIColor.whiteColor()
                //self.tintColor = UIColor.blackColor()
            }
            
        }
    }
    
    // maybe make a "grayed out" state in which the button is invisible?

}

// works, but doesn't take into account corners. Must enable clip subviews on individual button, even then messy.
extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), color.CGColor)
        CGContextFillRect(UIGraphicsGetCurrentContext(), CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, forState: forState)
    }
}