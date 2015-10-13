//
//  EncounterVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/10/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class EncounterVC: UIViewController {

    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var encounterText: UITextView!
    @IBOutlet weak var button1Text: UIButton!
    @IBOutlet weak var button2Text: UIButton!
    @IBOutlet weak var button3Text: UIButton!
    
    @IBAction func button1(sender: AnyObject) {
    }

    @IBAction func button2(sender: AnyObject) {
    }

    @IBAction func button3(sender: AnyObject) {
    }
}
