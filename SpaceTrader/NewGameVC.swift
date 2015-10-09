//
//  NewGameVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class NewGameVC: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        triggerSegue()
    }
    
    @IBAction func triggerSegue() {
        performSegueWithIdentifier("newGame", sender: self)
    }
}
