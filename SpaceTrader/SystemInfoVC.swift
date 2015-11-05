//
//  SystemInfoVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/3/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class SystemInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var techLabel: UILabel!
    @IBOutlet weak var governmentLabel: UILabel!
    @IBOutlet weak var resourceLabel: UILabel!
    @IBOutlet weak var policeLabel: UILabel!
    @IBOutlet weak var piratesLabel: UILabel!
    
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var specialButton: UIButton!
    @IBOutlet weak var mercenariesButton: UIButton!
    @IBOutlet weak var fuelButton: UIButton!
    @IBOutlet weak var repairsButton: UIButton!
    
    @IBOutlet weak var fuelText: UITextView!
    @IBOutlet weak var hullText: UITextView!
    @IBOutlet weak var baysLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    
    func updateUI() {
        let localPolitics = Politics(type: galaxy.currentSystem!.politics)
        
        nameLabel.text = galaxy.currentSystem!.name
        sizeLabel.text = galaxy.currentSystem!.size.rawValue
        techLabel.text = galaxy.currentSystem!.techLevel.rawValue
        governmentLabel.text = galaxy.currentSystem!.politics.rawValue
        resourceLabel.text = galaxy.currentSystem!.specialResources.rawValue
        policeLabel.text = galaxy.getActivityForInt(localPolitics.activityPolice)
        piratesLabel.text = galaxy.getActivityForInt(localPolitics.activityPirates)
        
        //baysLabel.text = "Bays: \(player.commanderShip.getTotalCargo())/\(player.commanderShip.totalBays)"
        //cashLabel.text = "Cash: \(player.credits) cr."
        
//        fuelButton.backgroundColor = UIColor.clearColor()
//        fuelButton.layer.cornerRadius = 5
//        fuelButton.layer.borderWidth = 1
//        fuelButton.layer.borderColor = UIColor.blackColor().CGColor
//        fuelButton.titleEdgeInsets.left = 35
//        fuelButton.titleEdgeInsets.right = 35
        
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        //fuelButton.frame = CGRectMake(100, 100, 200, 40)
        //fuelButton.setTitle("Get Started", forState: UIControlState.Normal)
//        fuelButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        fuelButton.backgroundColor = UIColor.clearColor()
//        fuelButton.layer.borderWidth = 1.0
//        fuelButton.layer.borderColor = UIColor.blackColor().CGColor         //UIColor(white: 0.0, alpha: borderAlpha).CGColor
//        fuelButton.layer.cornerRadius = cornerRadius
        
        
        let fuelNeeded = player.commanderShip.fuelTanks - player.commanderShip.fuel
        let fullTankCost = fuelNeeded * player.commanderShip.costOfFuel
        if fuelNeeded == 0 {
            //fuelText.text = "You have enough fuel to fly \(player.commanderShip.fuel) parsecs. \nYour tank is full."
            // disappear fuel button
        } else {
            //fuelText.text = "You have enough fuel to fly \(player.commanderShip.fuel) parsecs. \nA full tank costs \(fullTankCost) cr."
            // make fuel button visible
        }

        
        let repairsNeeded = player.commanderShip.hullStrength - player.commanderShip.hull
        let repairsCost = repairsNeeded * player.commanderShip.repairCosts
        if repairsNeeded == 0 {
            //hullText.text = "Your hull strength is at 100%. \nNo repairs are needed"
            // disappear repairs button
        } else {
            //hullText.text = "Your hull strength is at \(player.commanderShip.hullStrength)%. \nFull repairs will cost \(repairsCost) cr."
            // make repairs button visible
        }
        
    }
    
    @IBAction func maxFuel(sender: AnyObject) {
        // figure out how much it will cost
        let fuelNeeded = player.commanderShip.fuelTanks - player.commanderShip.fuel
        let costOfFuel = fuelNeeded * player.commanderShip.costOfFuel
        
        // buy if possible
        if player.credits >= costOfFuel {
            player.credits -= costOfFuel
            player.commanderShip.fuel = player.commanderShip.fuelTanks
        }
        updateUI()
    }
    
    @IBAction func maxRepairs(sender: AnyObject) {
        let repairsNeeded = player.commanderShip.hullStrength - player.commanderShip.hull
        let costOfRepairs = repairsNeeded * player.commanderShip.repairCosts
        
        if player.credits >= costOfRepairs {
            player.credits -= costOfRepairs
            player.commanderShip.hull = player.commanderShip.hullStrength
        }
        updateUI()
        
    }
    
}
