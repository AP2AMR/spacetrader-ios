//
//  BuyModalVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/23/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class BuyModalVC: UIViewController {

    var max = 5
    
    @IBOutlet weak var quantityField: UITextField!
        
    override func viewDidLoad() {
        quantityField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
   
    @IBAction func buy() {
        if quantityField.text != nil {
            let quantity = Int(quantityField.text!)
            if quantity <= max {
                print("buy \(quantity!) items")
                self.dismissViewControllerAnimated(false, completion: nil)
            } else {
                self.dismissViewControllerAnimated(false, completion: nil)
            }
        }
    }
    
    
}
