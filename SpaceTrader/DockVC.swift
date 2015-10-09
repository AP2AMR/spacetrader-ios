//
//  DockVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/4/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class DockVC: UIViewController, FuelRepairModalDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var techLevelLabel: UILabel!
    @IBOutlet weak var governmentLabel: UILabel!
    @IBOutlet weak var resourceLabel: UILabel!
    @IBOutlet weak var policeLabel: UILabel!
    @IBOutlet weak var piratesLabel: UILabel!
    @IBOutlet weak var fuelMessage: UITextView!
    @IBOutlet weak var repairsMessage: UITextView!
    @IBOutlet weak var shipsMessage: UITextView!
    @IBOutlet weak var equipmentMessage: UITextView!
    @IBOutlet weak var escapePodMessage: UITextView!
    
    @IBOutlet weak var fuelButtonAccess: UIButton!
    @IBOutlet weak var repairButtonAccess: UIButton!
    @IBOutlet weak var shipInfoAccess: UIButton!
    @IBOutlet weak var buySellEquipmentAccess: UIButton!
    @IBOutlet weak var buyEscapePodAccess: UIButton!
    
    var fuelAsOpposedToRepair = true
    
    
    
    override func viewDidLoad() {
        updateUI()
    }
    
    func updateUI() {
        let localPolitics = Politics(type: galaxy.currentSystem!.politics)
        
        nameLabel.text = galaxy.currentSystem!.name
        sizeLabel.text = galaxy.currentSystem!.size.rawValue
        techLevelLabel.text = galaxy.currentSystem!.techLevel.rawValue
        governmentLabel.text = galaxy.currentSystem!.politics.rawValue
        resourceLabel.text = galaxy.currentSystem!.specialResources.rawValue
        policeLabel.text = galaxy.getActivityForInt(localPolitics.activityPolice)
        piratesLabel.text = galaxy.getActivityForInt(localPolitics.activityPirates)
        
        let fuelNeeded = player.commanderShip.fuelTanks - player.commanderShip.fuel
        let fullTankCost = fuelNeeded * player.commanderShip.costOfFuel
        if fuelNeeded == 0 {
            fuelMessage.text = "You have enough fuel to fly \(player.commanderShip.fuel) parsecs. Your tank is full."
            // disappear fuel button
        } else {
            fuelMessage.text = "You have enough fuel to fly \(player.commanderShip.fuel) parsecs. A full tank costs \(fullTankCost) cr."
            // make fuel button visible
        }
        
        let repairsNeeded = player.commanderShip.hull - player.commanderShip.hullStrength
        let repairsCost = repairsNeeded * player.commanderShip.repairCosts
        if repairsNeeded == 0 {
            repairsMessage.text = "Your hull strength is at 100%. No repairs are needed"
            // disappear repairs button
        } else {
            repairsMessage.text = "Your hull strength is at \(player.commanderShip.hullStrength)%. Full repairs will cost \(repairsCost) cr."
            // make repairs button visible
        }
        
        // display ships for sale message if ships are for sale
        
        // display equipment for sale message if equipment is for sale
        
        if player.credits < 2000 {
            escapePodMessage.text = "You need at least 2,000 cr. to buy an escape pod."
            // make button available
        } else {
            // if current system is advanced enough to sell escape pods, make available
            // if not, don't
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        updateUI()
    }

    
    @IBAction func fuelButtonTapped() {
        fuelAsOpposedToRepair = true
        performSegueWithIdentifier("fuelRepairModal", sender: self)
    }
    
    @IBAction func repairButtonTapped() {
        fuelAsOpposedToRepair = false
        performSegueWithIdentifier("fuelRepairModal", sender: self)
    }
    
    @IBAction func viewShipInfoTapped() {
    }
    
    @IBAction func buySellEquipmentTapped() {
    }

    @IBAction func buyEscapePodTapped() {
    }
    
    func modalDidFinish() {
        updateUI()
    }
    
    func getFuelAsOpposedToRepair() -> Bool {
        return fuelAsOpposedToRepair
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fuelRepairModal" {
            let modalVC: FuelRepairModalVC = segue.destinationViewController as! FuelRepairModalVC
            modalVC.delegate = self
        }
    }
    
}
