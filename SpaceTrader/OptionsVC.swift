//
//  OptionsVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 1/20/16.
//  Copyright © 2016 Marc Auger. All rights reserved.
//

import UIKit

class OptionsVC: UIViewController {
    
    @IBOutlet weak var fullTanksOutlet: UISwitch!
    @IBOutlet weak var hullRepairOutlet: UISwitch!
    @IBOutlet weak var newspaperOutlet: UISwitch!
    @IBOutlet weak var remindLoansOutlet: UISwitch!
    @IBOutlet weak var ignorePiratesOutlet: UISwitch!
    @IBOutlet weak var ignorePoliceOutlet: UISwitch!
    @IBOutlet weak var ignoreTradersOutlet: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullTanksOutlet.on = false

        // Do any additional setup after loading the view.
    }

    @IBAction func fuelTanksToggled(sender: AnyObject) {
        if fullTanksOutlet.on {
            print("full tanks on arrival is on")
        } else {
            print("full tanks on arrival is off")
        }
    }
    


}
