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
        super.viewDidLoad()
        
        playerShipType.text = player.commanderShip.name
        playerHull.text = "Hull at \(player.commanderShip.hullPercentage)%"
        playerShields.text = player.getShieldStrengthString(player.commanderShip)
        opponentShipType.text = galaxy.currentJourney!.currentEncounter!.opponent.ship.name
        opponentHull.text = "Hull at \(galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage)%"
        opponentShields.text = player.getShieldStrengthString(galaxy.currentJourney!.currentEncounter!.opponent.ship)
        
        // if encounterText1 not otherwise set, display first context information. Else, display it
        if galaxy.currentJourney!.currentEncounter!.encounterText1 == "" {
            firstTextBlock.text = "At \(galaxy.currentJourney!.clicks) clicks from \(galaxy.targetSystem!.name) you encounter a \(galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus.rawValue) \(galaxy.currentJourney!.currentEncounter!.opponent.ship.name)."
        } else {
            firstTextBlock.text = galaxy.currentJourney!.currentEncounter!.encounterText1
        }
        
        //firstTextBlock.text = galaxy.currentJourney!.currentEncounter!.encounterText1
        secondTextBlock.text = galaxy.currentJourney!.currentEncounter!.encounterText2
        
        let controlState = UIControlState()
        button1Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button1Text)", forState: controlState)
        button2Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button2Text)", forState: controlState)
        button3Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button3Text)", forState: controlState)
        button4Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button4Text)", forState: controlState)
        
        // deal with text size issue
        
        //let font = firstTextBlock.font?.fontName
        //firstTextBlock.font = UIFont(name: font!, size: 18)
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
        // ask if you really want to attack police/trader if your criminal record isn't bad
        if galaxy.currentJourney!.currentEncounter!.button1Text == "Attack" {
            // we only make a fuss if this is an encounter with police or trader
            if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Police {
                print("you are firing on the police!")
                if player.policeRecordInt > 2 {
                    // modal!
                    let alertController = UIAlertController(title: "Attack Police?", message:
                        "Are you sure you want to attack the police! Your police record will be set to criminal!", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Attack", style: UIAlertActionStyle.Destructive,handler: {
                            (alert: UIAlertAction!) -> Void in
                            print("carrying on with attack!")
                    }))
                    alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                } else {
                    // you're a criminal anyway. Carry on.
                    self.dismissViewControllerAnimated(false, completion: nil)
                    galaxy.currentJourney!.currentEncounter!.resumeEncounter(1)
                }
            } else if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Trader {
                print("you are attacking a trader!")
                if player.policeRecordInt > 4 {
                    print("and you are not a hardened criminal. Time to fire the modal.")
                } else {
                    // police record bad enough not to make a fuss
                    self.dismissViewControllerAnimated(false, completion: nil)
                    galaxy.currentJourney!.currentEncounter!.resumeEncounter(1)
                }
            }
        } else {
            
        }
        
        self.dismissViewControllerAnimated(false, completion: nil)
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(1)
        
    }

    @IBAction func button2(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(2)
    }

    @IBAction func button3(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(3)
    }
    
    @IBAction func button4(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(4)
    }
    
    // FOR TESTING PURPOSES ONLY
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        print("test encounter escape button used. Concluding encounter...")
    }
    
    
    
}
