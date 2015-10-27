//
//  WarpViewVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/26/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class WarpViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "messageHandler:", name: "encounterModalFireNotification", object: nil)

    }


    // FIRE ALERT MODALS
    // (maybe this should only fire the first? Let additional ones be sequential?)
    func messageHandler(notification: NSNotification) {
        let receivedMessage: String = notification.object! as! String
        
        if receivedMessage == "main" {
            performSegueWithIdentifier("encounterModal", sender: nil)
        } else if receivedMessage == "done" {
            performSegueWithIdentifier("encounterModal", sender: nil)
        }
        
        
//
//
//        if receivedMessage == "main" {
//            print("acknowledge main")
//            performSegueWithIdentifier("encounterModal", sender: nil)
//        } else if receivedMessage == "notification" {
//            print("acknowledge notification")
//            performSegueWithIdentifier("notificationSegue", sender: nil)
//        }
        
    }

}
