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
    
    func updateUI() {
        let localPolitics = Politics(type: galaxy.currentSystem!.politics)
        
        nameLabel.text = galaxy.currentSystem!.name
        sizeLabel.text = galaxy.currentSystem!.size.rawValue
        techLabel.text = galaxy.currentSystem!.techLevel.rawValue
        governmentLabel.text = galaxy.currentSystem!.politics.rawValue
        resourceLabel.text = galaxy.currentSystem!.specialResources.rawValue
        policeLabel.text = galaxy.getActivityForInt(localPolitics.activityPolice)
        piratesLabel.text = galaxy.getActivityForInt(localPolitics.activityPirates)
        
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
    }
    
    @IBAction func maxRepairs(sender: AnyObject) {
    }
    
}
