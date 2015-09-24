//
//  SellVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/22/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class SellVC: UIViewController {
    
    @IBAction func CreateAlert(sender: AnyObject) {
        var alert = UIAlertController(title: "Escaped", message: "You have successfully escaped your opponent.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func CreateCustom(sender: AnyObject) {    // makes action sheet, thing that comes up from the bottom with several hamburger options
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: "Delete", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File Deleted")
        })
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File Saved")
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        
        // 4
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    
    @IBAction func ProgrammaticallyLaunchModal(sender: AnyObject) {
        var modal : BuyModalVC = BuyModalVC()
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.modalPresentationStyle = .CurrentContext
        self.presentViewController(modal, animated: true, completion: nil)
    }
    
    
}
