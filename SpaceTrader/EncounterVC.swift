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
        
        playerShipType.text = player.commanderShip.name
        playerHull.text = "Hull at \(player.commanderShip.hullPercentage)%"
        playerShields.text = player.getShieldStrengthString(player.commanderShip)
        opponentShipType.text = galaxy.currentJourney!.currentEncounter!.opponent.ship.name
        opponentHull.text = "Hull at \(galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage)%"
        opponentShields.text = player.getShieldStrengthString(galaxy.currentJourney!.currentEncounter!.opponent.ship)
        
        firstTextBlock.text = "At \(galaxy.currentJourney!.clicks) clicks from \(galaxy.targetSystem!.name) you encounter a \(galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus.rawValue) \(galaxy.currentJourney!.currentEncounter!.opponent.ship.name)."
        
        //firstTextBlock.text = galaxy.currentJourney!.currentEncounter!.encounterText1
        secondTextBlock.text = galaxy.currentJourney!.currentEncounter!.encounterText2
        
        let controlState = UIControlState()
        button1Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button1Text)", forState: controlState)
        button2Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button2Text)", forState: controlState)
        button3Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button3Text)", forState: controlState)
        button4Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button4Text)", forState: controlState)
    }

    
    @IBOutlet weak var playerShipType: UILabel!
    @IBOutlet weak var playerHull: UILabel!
    @IBOutlet weak var playerShields: UILabel!
    @IBOutlet weak var opponentShipType: UILabel!
    @IBOutlet weak var opponentHull: UILabel!
    @IBOutlet weak var opponentShields: UILabel!
    
    
    @IBOutlet weak var firstTextBlock: UITextView!
    @IBOutlet weak var secondTextBlock: UITextView!


    @IBOutlet weak var button1Text: UIButton!
    @IBOutlet weak var button2Text: UIButton!
    @IBOutlet weak var button3Text: UIButton!
    @IBOutlet weak var button4Text: UIButton!
    
    @IBAction func button1(sender: AnyObject) {
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(1)
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func button2(sender: AnyObject) {
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(2)
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func button3(sender: AnyObject) {
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(3)
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func button4(sender: AnyObject) {
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(4)
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    // FOR TESTING PURPOSES ONLY
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        print("test encounter escape button used. Concluding encounter...")
    }
    
    
    
}
