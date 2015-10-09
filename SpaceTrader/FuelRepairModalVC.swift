//
//  FuelRepairModalVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

protocol FuelRepairModalDelegate: class {
    func modalDidFinish()
    func getFuelAsOpposedToRepair() -> Bool
}

class FuelRepairModalVC: UIViewController {
    weak var delegate: FuelRepairModalDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainText: UITextView!
    @IBOutlet weak var entryField: UITextField!

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        entryField.becomeFirstResponder()
        
        let fuelAsOpposedToRepair = delegate!.getFuelAsOpposedToRepair()
        
        if !fuelAsOpposedToRepair {
            titleLabel.text = "Hull Repair"
            
            // put default value in entryField
        }
        
    }
    
    @IBAction func cancelButton() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func okButton() {
        var price: Int = 0
        if entryField.text != nil {
            price = Int(entryField.text!)!
            let amountOfFuelToBuy: Int = price / player.commanderShip.costOfFuel
            player.buyFuel(amountOfFuelToBuy)
            delegate?.modalDidFinish()
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }

    @IBAction func maxButton() {
        player.buyMaxFuel()
        delegate?.modalDidFinish()
        self.dismissViewControllerAnimated(false, completion: nil)
    }
}