//
//  EncounterVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/10/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class EncounterVC: UIViewController, PlunderDelegate {
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
        
        // turn buttons off if disabled
        if galaxy.currentJourney!.currentEncounter!.button3Text == "" {
            button3Text.enabled = false
        }
        
        if galaxy.currentJourney!.currentEncounter!.button4Text == "" {
            button4Text.enabled = false
        }
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "messageHandler:", name: "encounterNotification", object: nil)
        
        // images
        
        displayImages()
        
        setBadgeImage()
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
    
    var closed = false

    @IBOutlet weak var playerImageBackground: UIImageView!
    @IBOutlet weak var playerImageUnderlay: UIImageView!
    @IBOutlet weak var playerImageOverlay: UIImageView!
    
    @IBOutlet weak var opponentImageBackground: UIImageView!
    @IBOutlet weak var opponentImageUnderlay: UIImageView!
    @IBOutlet weak var opponentImageOverlay: UIImageView!
    
    @IBOutlet weak var badge: UIImageView!
    
    
    // BUTTON FUNCTIONS***************************************************************************
    @IBAction func button1(sender: AnyObject) {
        let button1Text = galaxy.currentJourney!.currentEncounter!.button1Text
        if button1Text == "Attack" {
            print("attack pressed")
            attack()
        } else if button1Text == "Board" {
            print("board pressed")
            board()
        } else if button1Text == "Pick It Up" {
            pickUp()
        }
    }
    
    @IBAction func button2(sender: AnyObject) {
        let button2Text = galaxy.currentJourney!.currentEncounter!.button2Text
        if button2Text == "Flee" {
            flee()
        } else if button2Text == "Plunder" {
            plunder()
        } else if button2Text == "Ignore" {
            // handle marie celeste ignore situation--if player ignores it, it's over
            if player.specialEvents.marieCelesteStatus == 1 {
                player.specialEvents.marieCelesteStatus = 2
            }
            ignore()
        }
    }
    
    @IBAction func button3(sender: AnyObject) {
        let button3Text = galaxy.currentJourney!.currentEncounter!.button3Text
        if button3Text == "Surrender" {
            print("surrender pressed")
            surrender()
        } else if button3Text == "Submit" {
            print("submit pressed")
            submit()
        } else if button3Text == "Yield" {
            print("yield pressed")
            yield()
        } else if button3Text == "Trade" {
            print("trade pressed")
            trade()
        } else if button3Text == "Accept" {
                accept()
        } else if button3Text == "" {
            // Not a button. Do nothing.
        }
    }
    
    @IBAction func button4(sender: AnyObject) {
        let button4Text = galaxy.currentJourney!.currentEncounter!.button4Text
        if button4Text == "Bribe" {
            print("bribe pressed")
            bribe()
        } else if button4Text == "" {
            // do nothing
        }
    }
    
    // FOR TESTING PURPOSES ONLY
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        galaxy.currentJourney!.currentEncounter!.concludeEncounter()
    }
    // END BUTTON FUNCTIONS***********************************************************************
    // UTILITIES**********************************************************************************
    func messageHandler(notification: NSNotification) {      // I THINK THIS IS (MOSTLY) DELETABLE
        //let receivedMessage: String = notification.object! as! String
        
//        if receivedMessage == "playerKilled" {
//            gameOverModal()
//        } else if receivedMessage == "dismissViewController" {
//            dismissViewController()
//        } else if receivedMessage == "simple" {
//            launchGenericSimpleModal()
//        } else if receivedMessage == "pirateDestroyed" {
//            let statusType: IFFStatusType = galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus
//            pirateOrTraderDestroyedAlert(statusType)
//        } else if receivedMessage == "dismiss" {
//            dismissViewController()
//        } else if receivedMessage == "submit" {
//            submit()
//        }
    }
    
    // delegate function
    func plunderDidFinish(controller: PlunderVC) {
        
        // the closure fixes the issue
        self.dismissViewControllerAnimated(false, completion: {
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        })

    }
    
    func dismissViewController() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func redrawViewController() {
        self.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "plunderModal" {
            let modalVC: PlunderVC = segue.destinationViewController as! PlunderVC
            modalVC.delegate = self
        }
    }
    
    // END UTILITIES******************************************************************************
    // BUTTON ACTIONS*****************************************************************************
    func attack() {
        // this function makes sure player wants to attack, warns if necessary. If so, actuallyAttack() is called
        // warn if attacking police
        if (galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Police) && (player.policeRecordInt > 2) {
            
            let title: String = "Attack Police?"
            let message: String = "Are you sure you want to attack the police? Your police record will be set to criminal!"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Attack", style: UIAlertActionStyle.Destructive,handler: {
                (alert: UIAlertAction!) -> Void in
                // go ahead with it
                player.policeRecord = PoliceRecordType.criminalScore
                self.actuallyAttack()
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,handler: nil))
            // do nothing, dismiss modal
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else if (galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Trader) && (player.policeRecordInt > 4) {
            
            // warn about attacking trader
            let title: String = "Attack Trader?"
            let message: String = "Are you sure you want to attack the police? Your police record will be set to dubious!"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Attack", style: UIAlertActionStyle.Destructive,handler: {
                (alert: UIAlertAction!) -> Void in
                // go ahead with it
                player.policeRecord = PoliceRecordType.dubiousScore
                self.actuallyAttack()
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,handler: nil))
            // do nothing, dismiss modal
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Scorpion {
            
            // make sure player is using disabling weapons
            var disruptorFlag = false
            for weapon in player.commanderShip.weapon {
                if weapon.type == WeaponType.quantumDisruptor || weapon.type == WeaponType.photonDisruptor {
                    disruptorFlag = true
                }
            }
            if !disruptorFlag {
                // ALERT, if user presses no, I guess do nothing?
                let title: String = "No Disabling Weapons"
                let message: String = "You have no disabling weapons! You would only be able to destroy your opponent, which would defeat the purpose of your quest."
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: {
                    (alert: UIAlertAction!) -> Void in
                    // flag to false, can't attack
                    self.actuallyAttack()
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else {
                // if you do have a disruptor, fire away
                self.actuallyAttack()
            }
        } else if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.FamousCaptain && (!galaxy.currentJourney!.currentEncounter!.warnedYet) {
            
            // warn about attacking famous captain
            let title: String = "Really Attack?"
            let message: String = "Famous Captains get famous by, among other things, destroying everyone who attacks them. Do you really want to attack?"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Really Attack", style: UIAlertActionStyle.Destructive,handler: {
                (alert: UIAlertAction!) -> Void in
                // go ahead with it
                galaxy.currentJourney!.currentEncounter!.warnedYet = true
                self.actuallyAttack()
            }))
            alertController.addAction(UIAlertAction(title: "OK, I Won't", style: UIAlertActionStyle.Cancel,handler: nil))
            // do nothing, dismiss modal
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            self.actuallyAttack()
        }
    }
    
    // needed to break this function out. attack() will now make sure user really wants to, this will be called when they do
    func actuallyAttack() {
        // perform attack, using outsourced function
        let outcome = galaxy.currentJourney!.currentEncounter!.attack()
        
        // handle outcome
        switch outcome {
        case "opponentFlees":
            //                print("opponent flees")
            outcomeOpponentFlees()
        case "playerDestroyedEscapes":
            //                print("TAG")
            //                print("player is destroyed but escapes")
            outcomePlayerDestroyedEscapes()
        case "playerDestroyedKilled":
            //                print("TAG")
            outcomePlayerDestroyedKilled()
        case "opponentDestroyed":
            //                print("opponent is destroyed")
            outcomeOpponentDestroyed()
        case "opponentGetsAway":
            //                print("opponent gets away")
            outcomeOpponentGetsAway()
        case "opponentSurrenders":
            //                print("opponent surrenders")
            outcomeOpponentSurrenders()
        case "opponentDisabled":
            //                print("opponent is disabled")
            outcomeOpponentDisabled()
        default:
            outcomeFightContinues()
            //                print("fight continues")
        }

    }
    
    func accept() {
        // message based on which famous captain you are dealing with
        if galaxy.currentJourney!.currentEncounter!.type == EncounterType.famousCaptainAhab {
            let title = "Meet Captain Ahab"
            let message = "Captain Ahab is in need of a spare shield for an upcoming mission. He offers to trade you some piloting lessons for your reflective shield. Do you wish to trade?"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes, Trade Shield", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // give up shield
                player.commanderShip.removeShield(ShieldType.reflectiveShield)
                
                // gain 3 points piloting skill
                player.initialPilotSkill += 3
                
                // fire second alert and close
                self.famousCaptainTraining()
            }))
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else if galaxy.currentJourney!.currentEncounter!.type == EncounterType.famousCaptainConrad {
            let title = "Meet Captain Conrad"
            let message = "Captain Conrad is in need of a military laser. She offers to trade you some engineering training for your military laser. Do you wish to trade?"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes, Trade Laser", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // TRADE LASER
                // give up laser
                player.commanderShip.removeWeapon(WeaponType.militaryLaser)
                
                // gain 3 points engineering skill
                player.initialEngineerSkill += 3
                
                // fire second alert and close
                self.famousCaptainTraining()
            }))
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else if galaxy.currentJourney!.currentEncounter!.type == EncounterType.famousCaptainHuie {
            let title = "Meet Captain Huie"
            let message = "Captain Huie is in need of a military laser. She offers to exchange some bargaining training for your military laser. Do you wish to trade?"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes, Trade Laser", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // TRADE LASER
                // give up laser
                player.commanderShip.removeWeapon(WeaponType.militaryLaser)
                
                // gain 3 points engineering skill
                player.initialTraderSkill += 3
                
                // fire second alert and close
                self.famousCaptainTraining()
            }))
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    func pickUp() {
        let title = "Drink Contents?"
        let message = "You have come across an extremely rare bottle of Captain Marmoset's Amazing Skill Tonic! The \"use-by\" date is illegible, but might still be good.  Would you like to drink it?"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Yes, Drink It", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // DRINK IT
            self.drinkTonic()
            
        }))
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss and conclude encounter
            self.dismissViewController()
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func board() {
        let title = "Engage Marie Celeste"
        let message = "The ship is empty: there is nothing in the ship’s log, but the crew has vanished, leaving food on the tables and cargo in the holds. Do you wish to offload the cargo into your own holds?"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Yes, Take Cargo", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // PLUNDER. Marie celeste should have 5 narcotics
            self.plunder()
        }))
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss and conclude encounter
            self.dismissViewController()
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func flee() {
        var actuallyFlee = true
        
        // see if unnecessarily running from the police
        let contraband = getContrabandStatus()
        
        // only marie warning once
        
        if galaxy.currentJourney!.currentEncounter!.type == EncounterType.postMariePoliceEncounter && (player.policeRecordInt > 4) {
            let title: String = "Criminal Act!"
            let message: String = "Are you sure you want to do that? The Customs Police know you have engaged in criminal activity, and will report it!"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes, I still want to", style: UIAlertActionStyle.Destructive ,handler: {
                (alert: UIAlertAction!) -> Void in
                // set police record to dubious if better, flee
                if player.policeRecordInt > 4 {
                    player.policeRecord = PoliceRecordType.crookScore
                }
                actuallyFlee = true
            }))
            alertController.addAction(UIAlertAction(title: "OK, I won't", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // nothing, just close the modal
                actuallyFlee = false
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if !contraband && (galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Police) {
            
            let title: String = "You Have Nothing Illegal"
            let message: String = "Are you sure you want to do that? You are not carrying illegal goods, so you have nothing to fear!"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes, I still want to", style: UIAlertActionStyle.Destructive ,handler: {
                (alert: UIAlertAction!) -> Void in
                // set police record to dubious if better, flee
                if player.policeRecordInt > 4 {
                    player.policeRecord = PoliceRecordType.dubiousScore
                }
                actuallyFlee = true
            }))
            alertController.addAction(UIAlertAction(title: "OK, I won't", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // nothing, just close the modal
                actuallyFlee = false
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        // the part of it where you actually flee
        if actuallyFlee {
            galaxy.currentJourney!.currentEncounter!.playerFleeing = true
            
            // determine whether you'll escape
            var escape = false
            if player.difficulty == DifficultyType.beginner {
                escape = true
            } else {
                if ((rand(7) + player.pilotSkill)/3 * 2) >= (rand(galaxy.currentJourney!.currentEncounter!.opponent.commander.pilotSkill) * (2 + player.difficultyInt)) {
                    escape = true
                } else {
                    escape = false
                }
            }
            
            
            // display escaped alert
            if escape {
                let title = "Escaped"
                let message = "You have managed to escape your opponent."
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                    (alert: UIAlertAction!) -> Void in
                    // dismiss and conclude encounter
                    self.dismissViewController()
                    galaxy.currentJourney!.currentEncounter!.concludeEncounter()
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                // opponent gets a shot at you
                galaxy.currentJourney!.currentEncounter!.fleeAttack()
                outcomeOpponentPursues()
            }
        }
    }
    
    func plunder() {
        self.performSegueWithIdentifier("plunderModal", sender: nil)
    }
    
    func ignore() {
        dismissViewController()
        galaxy.currentJourney!.currentEncounter!.concludeEncounter()
    }
    
    func surrender() {
        if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Pirate {
            // plunder
            // see if player has cargo
            var noCargo = false
            if player.commanderShip.cargo.count == 0 {
                noCargo = true
            }
            if noCargo {
                // take your money
                let moneyToTake = max(Int((Double(player.netWorth) * 0.05)), 500)
                player.credits -= moneyToTake
                if player.credits < 0 {
                    player.credits = 0
                }
                
                // alert
                let title = "Pirates Find No Cargo"
                let message = "The pirates are very angry that they find no cargo on your ship. To stop them from destroying you, you have no choice but to pay them an amount equal to 5% of your current worth - \(moneyToTake) credits."
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                    (alert: UIAlertAction!) -> Void in
                    // dismiss and conclude encounter
                    self.dismissViewController()
                    galaxy.currentJourney!.currentEncounter!.concludeEncounter()
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else {
                // regular looting
                let baysOnPirateShip = galaxy.currentJourney!.currentEncounter!.opponent.ship.baysAvailable
                //print("pirate ship has \(baysOnPirateShip) bays available")
                
                
                for _ in 0..<baysOnPirateShip {
                    // take the most valuable piece of cargo
                    if player.commanderShip.cargo.count != 0 {
                        // find most valuable thing you have
                        var currentHighestItem: TradeItemType? = nil
                        var currentHighestPrice = 0
                        for item in player.commanderShip.cargo {
                            let price = galaxy.getAverageSalePrice(item.item)
                            if price > currentHighestPrice {
                                currentHighestPrice = price
                                currentHighestItem = item.item
                            }
                        }
                        
                        //print("item is being stolen: \(currentHighestItem)")
                        
                        // remove one of these items, delete if empty
                        var i = 0
                        var indexToDelete = 0
                        var flag = false
                        for item in player.commanderShip.cargo {
                            if item.item == currentHighestItem! {
                                item.quantity -= 1
                                
                                if item.quantity <= 0 {
                                    indexToDelete = i
                                    flag = true
                                }
                            }
                            i += 1
                        }
                        if flag {
                            player.commanderShip.cargo.removeAtIndex(indexToDelete)
                        }
                        
                    }
                }
                
                
                // alert
                let title = "Looting"
                let message = "The pirates board your ship and transfer as much of your cargo to their own ship as their cargo bays can hold."
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                    (alert: UIAlertAction!) -> Void in
                    // dismiss and conclude encounter
                    self.dismissViewController()
                    galaxy.currentJourney!.currentEncounter!.concludeEncounter()
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
            
                
            }
            
        } else if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Mantis {
            // remove artifact
            player.specialEvents.artifactOnBoard = false            // this seems to be the wrong one. Should be taken out.
            player.commanderShip.artifactSpecialCargo = false
            
            // generate alert
            let title = "Artifact Relinquished"
            let message = "The aliens take the artifact from you."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func submit() {
        // see if you have anything to worry about
        let contraband = getContrabandStatus()
        
        // if not, apologise
        if !contraband {
            let title = "Nothing Found"
            let message = "The police find nothing illegal in your cargo holds, and apologise for the inconvenience."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            // if so, ask if you really want to submit to an inspection
            let title = "You Have Illegal Goods"
            let message = "Are you sure you want to let the police search you? You are carrying illegal goods!"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes, let them", style: UIAlertActionStyle.Destructive ,handler: {
                (alert: UIAlertAction!) -> Void in
                // arrest. SHOULD WE DISMISS THIS VIEW AND DO THIS FROM THE PARENT?
                self.arrest()
            }))
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // nothing, dismiss alert
                
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    func yield() {
        // end marie celeste business
        player.specialEvents.marieCelesteStatus = 2
        
        // alert, offload cargo
        let title = "Contraband Removed"
        let message = "The Customs Police confiscated all of your illegal cargo, but since you were cooperative, you avoided stronger fines or penalties."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // remove illegal and dismiss
            self.removeIllegal()
            
            // if you ran before, you get another chance
            player.policeRecord = PoliceRecordType.cleanScore
            
            // dismess, ONLY THEN concludeEncounter()
            self.dismissViewController()
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func trade() {
        
    }
    
    func bribe() {
        // if system's bribe level is 0, display can't be bribed dialog
        let politics = Politics(type: galaxy.targetSystem!.politics)
        if galaxy.currentJourney!.currentEncounter!.type == EncounterType.postMariePoliceEncounter {
            let title = "No Bribe"
            let message = "We'd love to take your money, but Space Command already knows you've got illegal goods onboard."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss alert
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if politics.bribeLevel <= 0 {
            let title = "No Bribe"
            let message = "These police officers can't be bribed."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss alert
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            // calculate bribe
            var bribe = player.netWorth / (15 * (5 - player.getDifficultyInt()) * politics.bribeLevel)
            if bribe % 100 != 0 {
                bribe += (100 - (bribe % 100))
            }
            bribe = max(100, min(bribe, 10000))
            
            // display bribe modal
            let title = "Bribe"
            let message = "These police officers are willing to forego inspection for the amount of 100 credits."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Offer Bribe", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                if player.credits >= bribe {
                    player.credits -= bribe
                    self.dismissViewController()
                    galaxy.currentJourney!.currentEncounter!.concludeEncounter()
                } else {
                    let title = "Not Enough Cash"
                    let message = "You don't have enough cash for a bribe."
                    
                    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                        (alert: UIAlertAction!) -> Void in
                        // dismiss alert
                    }))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
                
            }))
            alertController.addAction(UIAlertAction(title: "Forget It", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss alert
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    // END BUTTON ACTIONS*************************************************************************
    // CONSEQUENT ACTIONS*************************************************************************
    func arrest() {
//        print("ARREST!")
        // Figure out punishment
        // close journey
        // mete out punishment
        // display appropriate modal
        // conclude journey
        
    }
    
    func getContrabandStatus() -> Bool {
        var contraband = false
        for item in player.commanderShip.cargo {
            if (item.item == TradeItemType.Firearms) || (item.item == TradeItemType.Narcotics) {
                contraband = true
            }
        }
        return contraband
    }
    
    func outcomeFightContinues() {
        // report who hit whom
        var reportString1 = ""
        var reportString2 = ""
        if galaxy.currentJourney!.currentEncounter!.youHitThem {
            reportString1 = "You hit the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        } else {
            reportString1 = "You missed the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        }
        if galaxy.currentJourney!.currentEncounter!.theyHitYou {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) hits you."
        } else {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) misses you."
        }
        galaxy.currentJourney!.currentEncounter!.encounterText1 = reportString1 + reportString2
        
        // redraw view
        redrawViewController()
    }
    
    func outcomeOpponentGetsAway() {
        let title = "Opponent Escapes"
        let message = "Your opponent has gotten away."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss and conclude encounter
            self.dismissViewController()
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func outcomeOpponentDestroyed() {
        var type = ""
        if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Pirate {
            player.pirateKills += 1
            type = "pirate"
        } else if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Trader {
            player.traderKills += 1
            type = "trader"
        } else if galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Police {
            player.policeKills += 1
            type = "other"
        }
        
        // special situations
        if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Dragonfly {
            player.specialEvents.dragonflyDestroyed()
            // modal?
        } else if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Mantis {
            // call special function
        } else if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Scorpion {
            // YOU KILLED THE PRINCESS, YOU BASTARD!    --alert here, telling player he is a bastard?
            player.specialEvents.addQuestString("", ID: QuestID.princess)
        } else if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Scarab {
            // call special function
            player.specialEvents.scarabDestroyed()
        } else if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.SpaceMonster {
            player.specialEvents.spaceMonsterKilled()
        }
        
        var title = ""
        var message = ""
        if type == "pirate" && (player.policeRecordInt > 2) {
            let bounty = galaxy.currentJourney!.currentEncounter!.opponent.ship.bounty
            player.credits += bounty
            title = "Bounty"
            message = "You destroyed the pirate ship and earned a bounty of \(bounty)"
        } else {
            title = "Opponent Destroyed"
            message = "You have destroyed your opponent."
        }
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // determine whether scoop will happen
            let random = rand(100)
            var scoop = false
            if type == "pirate" || type == "trader" {
                if (player.difficulty == DifficultyType.beginner) || (player.difficulty == DifficultyType.easy ) {
                    scoop = true
                } else if player.difficulty == DifficultyType.normal {
                    if random > 50 {
                        scoop = true
                    }
                } else if player.difficulty == DifficultyType.hard {
                    if random > 66 {
                        scoop = true
                    }
                    
                } else {
                    if random > 75 {
                        scoop = true
                    }
                }
            }
            
            // call scoop if indicated, else dismiss and end encounter
            if scoop {
                self.Scoop()
            } else {
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func Scoop() {
        // figure out what floated by
        let random = rand(galaxy.currentJourney!.currentEncounter!.opponent.ship.cargo.count)
        let itemType = galaxy.currentJourney!.currentEncounter!.opponent.ship.cargo[random].item
        let item = TradeItem(item: itemType, quantity: 1, pricePaid: 0)
        
        // launch alert to pick it up
        let title = "Scoop"
        let message = "A canister from the destroyed ship, labeled \(item.name), drifts within range of your scoops."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Pick It Up", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            if player.commanderShip.baysAvailable == 0 {
                print("NO ROOM TO SCOOP! HOW TO HANDLE THIS?")
                galaxy.currentJourney!.currentEncounter!.scoopableItem = item
            }
            
            // dismiss and resume, for now
//            print("you picked it up")
            player.commanderShip.cargo.append(item)
            self.dismissViewControllerAnimated(false, completion: nil)
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        alertController.addAction(UIAlertAction(title: "Let It Go", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss and resume, for now
//            print("you let it go")
            self.dismissViewControllerAnimated(false, completion: nil)
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func outcomeOpponentFlees() {                   // CHECK IF THIS DOES THE RIGHT THING
        // report who hit whom
        var reportString1 = ""
        var reportString2 = ""
        if galaxy.currentJourney!.currentEncounter!.youHitThem {
            reportString1 = "You hit the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        } else {
            reportString1 = "You missed the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        }
        if galaxy.currentJourney!.currentEncounter!.theyHitYou {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) hits you."
        } else {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) misses you."
        }
        galaxy.currentJourney!.currentEncounter!.encounterText1 = reportString1 + reportString2
        galaxy.currentJourney!.currentEncounter!.encounterText2 = "Your opponent is fleeing."
        
        redrawViewController()
    }
    
    func outcomeOpponentSurrenders() {
        // report who hit whom
        var reportString1 = ""
        var reportString2 = ""
        if galaxy.currentJourney!.currentEncounter!.youHitThem {
            reportString1 = "You hit the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        } else {
            reportString1 = "You missed the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        }
        if galaxy.currentJourney!.currentEncounter!.theyHitYou {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) hits you."
        } else {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) misses you."
        }
        galaxy.currentJourney!.currentEncounter!.encounterText1 = reportString1 + reportString2
        galaxy.currentJourney!.currentEncounter!.encounterText2 = "Your opponent hails that he surrenders to you."
        
        galaxy.currentJourney!.currentEncounter!.setButtons("Surrender")
        
        redrawViewController()
    }
    
    func outcomeOpponentDisabled() {
        // report who hit whom
        var reportString1 = ""
        var reportString2 = ""
        if galaxy.currentJourney!.currentEncounter!.youHitThem {
            reportString1 = "You hit the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        } else {
            reportString1 = "You missed the \(galaxy.currentJourney!.currentEncounter!.opposingVessel).\n"
        }
        if galaxy.currentJourney!.currentEncounter!.theyHitYou {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) hits you."
        } else {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) misses you."
        }
        galaxy.currentJourney!.currentEncounter!.encounterText1 = reportString1 + reportString2
        galaxy.currentJourney!.currentEncounter!.encounterText2 = "Your opponent has been disabled."
        
        galaxy.currentJourney!.currentEncounter!.setButtons("Surrender")
        
        // special situations. We don't plunder special ships
        if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Dragonfly {
            galaxy.currentJourney!.currentEncounter!.setButtons("IgnoreFlee")
        } else if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Mantis {
            galaxy.currentJourney!.currentEncounter!.setButtons("IgnoreFlee")
        } else if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Scorpion {
            // if scorpion is disabled, alert. On closing, call function and terminate the encounter.
            let title = "Scorpion Disabled"
            let message = "You have disabled the Scorpion. Without life support they'll have to hibernate. You notify Space Corps, and they come and tow the Scorpion to the planet, where the crew is revived and then arrested."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                player.specialEvents.scorpionDisabled()
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if galaxy.currentJourney!.currentEncounter!.opponent.type == IFFStatusType.Scarab {
            galaxy.currentJourney!.currentEncounter!.setButtons("IgnoreFlee")
        }
        
        redrawViewController()
    }
    
    func outcomePlayerDestroyedKilled() {
        player.endGameType = EndGameStatus.Killed
        print("end game status: \(player.endGameType)")
        
        print("running new player destroyed killed function")
        
        let title = "You Lose"
        let message = "Your ship has been destroyed by your opponent."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
        (alert: UIAlertAction!) -> Void in
            // trigger segue to game over
            self.performSegueWithIdentifier("gameOver", sender: nil)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func outcomePlayerDestroyedEscapes() {
        // close view
        self.dismissViewControllerAnimated(false, completion: nil)
        
        // call function in parent
        let stringToPass = NSString(string: "playerDestroyedEscapes")
        NSNotificationCenter.defaultCenter().postNotificationName("encounterModalFireNotification", object: stringToPass)
    }
    
    func outcomeOpponentPursues() {
        // opponent has taken shot at you. Damage is done, youHitThem business set

        // display situation
        // report who hit whom
        let reportString1 = "The \(galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus.rawValue) \(galaxy.currentJourney!.currentEncounter!.opponent.ship.name) is still following you.\n"
        var reportString2 = ""

        if galaxy.currentJourney!.currentEncounter!.theyHitYou {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) hits you.\n"
        } else {
            reportString2 = "The \(galaxy.currentJourney!.currentEncounter!.opposingVessel) misses you.\n"
        }
        galaxy.currentJourney!.currentEncounter!.encounterText1 = reportString1 + reportString2
        galaxy.currentJourney!.currentEncounter!.encounterText2 = "The \(galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus.rawValue) ship attacks."
        
        redrawViewController()
    }
    
    
    // utility function, used to remove all illegal things from ship without compensation
    func removeIllegal() {
        let firearmsOnBoard = player.commanderShip.getQuantity(TradeItemType.Firearms)
        let narcoticsOnBoard = player.commanderShip.getQuantity(TradeItemType.Narcotics)
        
        if firearmsOnBoard > 0 {
            player.commanderShip.removeCargo(TradeItemType.Firearms, quantity: firearmsOnBoard)
        }
        if narcoticsOnBoard > 0 {
            player.commanderShip.removeCargo(TradeItemType.Narcotics, quantity: narcoticsOnBoard)
        }
    }
    
    func famousCaptainTraining() {
        let title = "Training"
        let message = "Under the watchful eye of the Captain, you demonstrate your abilities. The Captain provides some helpful pointers and tips, and teaches you a few new techniques. The few hours pass quickly, but you feel you've gained a lot from the experience."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss and conclude encounter
            self.dismissViewController()
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func drinkTonic() {
        if galaxy.currentJourney!.currentEncounter!.type == EncounterType.bottleGoodEncounter {
            print("drinking good tonic. Display alert, increase random skill")
            self.increaseRandomSkill()
            
            let title = "Tonic Consumed"
            let message = "Mmmmm. Captain Marmoset's Amazing Skill Tonic not only fills you with energy, but tastes like a fine single-malt."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            print("drinking old tonic. Display alert, mess up skills")
            self.messUpSkills()
            
            let title = "Tonic Consumed"
            let message = "While you don't know what it was supposed to taste like, you get the feeling that this dose of tonic was a bit off."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // dismiss and conclude encounter
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func increaseRandomSkill() {
        let random = rand(4)
        switch random {
            case 0:
                player.initialPilotSkill += 3
            case 1:
                player.initialFighterSkill += 3
            case 2:
                player.initialTraderSkill += 3
            case 3:
                player.initialEngineerSkill += 3
            default:
                print("error")
        }
    }
    
    func messUpSkills() {
        // increase one skill somewhat
        let random1 = rand(4)
        switch random1 {
        case 0:
            player.initialPilotSkill += 1
        case 1:
            player.initialFighterSkill += 1
        case 2:
            player.initialTraderSkill += 1
        case 3:
            player.initialEngineerSkill += 1
        default:
            print("error")
        }
        
        // diminish another a bit more
        let random2 = rand(4)
        switch random2 {
        case 0:
            player.initialPilotSkill -= 2
        case 1:
            player.initialFighterSkill -= 2
        case 2:
            player.initialTraderSkill -= 2
        case 3:
            player.initialEngineerSkill -= 2
        default:
            print("error")
        }
    }
    
    // END CONSEQUENT ACTIONS*********************************************************************
    // IMAGE STUFF********************************************************************************
    func displayImages() {
        

        // set images
        let playerLayer1 = getBackgroundImage(true)
        let playerLayer2 = getLayer2(true)
        let playerLayer3 = getLayer3(true)
        
        let opponentLayer1 = getBackgroundImage(false)
        let opponentLayer2 = getLayer2(false)
        let opponentLayer3 = getLayer3(false)
        
        // set overlay widths
        //let playerLayer2Width = getOverlayWidthForDamage(true, shieldNotHull: <#T##Bool#>)
        
        // modify images with overlay widths
        
        // write images
        playerImageBackground.image = playerLayer1
        playerImageUnderlay.image = playerLayer2
        playerImageOverlay.image = playerLayer3
        
        opponentImageBackground.image = opponentLayer1
        opponentImageUnderlay.image = opponentLayer2
        opponentImageOverlay.image = opponentLayer3
        
        // test structure
//        var overlay = UIImage(named: "ship3s")
//        overlay = cropToWidth(overlay!, width: 70)
//        opponentImageUnderlay.image = overlay
        
        
        
        
        // ALL BELOW HERE IS OLD
        
        //var playerImageBackground = UIImage(named: "")
        //var playerUnderlayImage = UIImage(named: "ship7s")
        //var playerOverlayImage = UIImage(named: "ship7")
        
        // set hull of player correctly
        //let playerOverlayWidth = getOverlayWidthForDamage(true, shieldNotHull: false)
        
        //print("player's hull is at \(player.commanderShip.hullPercentage)%, overlay width computed to be \(playerOverlayWidth)")
        
        // FOR TESTING
        //let playerOverlayWidth: Double = 50
        
        //playerOverlayImage = cropToWidth(playerOverlayImage!, width: playerOverlayWidth)
        
        // complete damage is 140
        // damage begins at 60
       
        //playerImageUnderlay.image = playerUnderlayImage
        //playerImageOverlay.image = playerOverlayImage
        
        
        //*******
        //opponentImageUnderlay.image = UIImage(named: "preppo")

        
    }
    
    func getOverlayWidthForDamage(playerNotOpponent: Bool, croppingShield: Bool, readingShield: Bool) -> Double {
        // determine if the overlay is shield or hull, get initial values
        var ship: ShipType
        var hullIntegrityPercent: Int
        var shieldStrengthPercent: Int
        var percentage: Double
        
        if playerNotOpponent {
            ship = player.commanderShip.type
            hullIntegrityPercent = player.commanderShip.hullPercentage
            shieldStrengthPercent = player.commanderShip.shieldPercentage
        } else {
            ship = galaxy.currentJourney!.currentEncounter!.opponent.ship.type
            hullIntegrityPercent = galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage
            shieldStrengthPercent = galaxy.currentJourney!.currentEncounter!.opponent.ship.shieldPercentage
        }
        
        // lookup range values
        var healthy: Int = 0      // zero damage
        var empty: Int = 0        // full damage
        
        if readingShield {
            percentage = Double(shieldStrengthPercent)
        } else {
            percentage = Double(hullIntegrityPercent)
        }
        
        if croppingShield {
            // shields
            
            if ship == ShipType.Flea {
                // no shields
                //healthy = 70
                //empty = 126
            } else if ship == ShipType.Gnat {
                // no shields
                //healthy = 55
                //empty = 140
            } else if ship == ShipType.Firefly {
                healthy = 53
                empty = 145
            } else if ship == ShipType.Mosquito {
                healthy = 55
                empty = 145
            } else if ship == ShipType.Bumblebee {
                healthy = 35
                empty = 167
            } else if ship == ShipType.Beetle {
                healthy = 35
                empty = 165
            } else if ship == ShipType.Hornet {
                healthy = 25
                empty = 180
            } else if ship == ShipType.Grasshopper {
                healthy = 20
                empty = 183
            } else if ship == ShipType.Termite {
                healthy = 0
                empty = 200
            } else if ship == ShipType.Wasp {
                healthy = 0
                empty = 200
            } else if ship == ShipType.Custom {
                healthy = 10
                empty = 190
            } else if ship == ShipType.SpaceMonster {               // EVERYTHING BELOW NOT VETTED
                healthy = 0
                empty = 200
            } else if ship == ShipType.Dragonfly {
                healthy = 10
                empty = 190
            } else if ship == ShipType.Mantis {
                healthy = 190
                empty = 10
            } else if ship == ShipType.Scarab {
                healthy = 0
                empty = 200
            } else if ship == ShipType.Scorpion {
                healthy = 35
                empty = 170
            } else {
                // ship == ShipType.Bottle
                healthy = 0
                empty = 200
            }

        } else {
            // hull damage
            if ship == ShipType.Flea {
                healthy = 70
                empty = 126
            } else if ship == ShipType.Gnat {
                healthy = 55
                empty = 140
            } else if ship == ShipType.Firefly {
                healthy = 55
                empty = 140
            } else if ship == ShipType.Mosquito {
                healthy = 60
                empty = 140
            } else if ship == ShipType.Bumblebee {
                healthy = 40
                empty = 162
            } else if ship == ShipType.Beetle {
                healthy = 40
                empty = 155
            } else if ship == ShipType.Hornet {
                healthy = 30
                empty = 175
            } else if ship == ShipType.Grasshopper {
                healthy = 25
                empty = 180
            } else if ship == ShipType.Termite {
                healthy = 10
                empty = 190
            } else if ship == ShipType.Wasp {
                healthy = 10
                empty = 190
            } else if ship == ShipType.Custom {
                healthy = 10
                empty = 190
            } else if ship == ShipType.SpaceMonster {
                healthy = 10
                empty = 190
            } else if ship == ShipType.Dragonfly {
                healthy = 60
                empty = 140
            } else if ship == ShipType.Mantis {
                healthy = 10
                empty = 190
            } else if ship == ShipType.Scarab {
                healthy = 10
                empty = 190
            } else if ship == ShipType.Scorpion {
                healthy = 40
                empty = 155
            } else {
                // ship == ShipType.Bottle
                healthy = 0
                empty = 200
            }
        }
        
        // calculate & return overlay width
        let range: Double = Double(empty - healthy)
        let percentageDamage: Double = 100 - percentage
        var width: Double = ((percentageDamage * range) / 100)
        width += Double(healthy)
        return width
    }
    
    func getBackgroundImage(playerNotOpponent: Bool) -> UIImage {
        var ship: ShipType
        var hullPercentage: Int
        var shieldPercentage: Int
        var state: String
        var disabled: Bool
        
        if playerNotOpponent {
            ship = player.commanderShip.type
            hullPercentage = player.commanderShip.hullPercentage
            shieldPercentage = player.commanderShip.shieldPercentage
            if player.commanderShip.disabled {
                disabled = true
            } else {
                disabled = false
            }
        } else {
            ship = galaxy.currentJourney!.currentEncounter!.opponent.ship.type
            hullPercentage = galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage
            shieldPercentage = galaxy.currentJourney!.currentEncounter!.opponent.ship.shieldPercentage
            if galaxy.currentJourney!.currentEncounter!.opponent.ship.disabled {
                disabled = true
            } else {
                disabled = false
            }
        }
        
        // this can be: shielded, healthy, sd, or d (only d if disabled) - [h, d, s, sd]
        // cases:
        
        // NEXT, MAKE FIRST ONE D IF BOTH ARE DAMAGED
        
        if disabled {
            state = "d"
        } else if (shieldPercentage == 100) && (hullPercentage == 100) {
            state = "s"
        } else if (shieldPercentage > 0) && (hullPercentage == 100) {
            state = "s"
        } else if shieldPercentage == 0 {
            state = "h"
        } else if (hullPercentage < 100) && (shieldPercentage < 100) {
            state = "s"
        } else if (hullPercentage < 100) && (shieldPercentage > hullPercentage) {
            //state = "sd"
            state = "s"
            // THIS IS WRONG AND BACKWARDS. CAN BE REMOVED, BUT JUST IN CASE I DISABLED IT
        } else if shieldPercentage > 0 && (hullPercentage > shieldPercentage) {
            state = "s"
        } else {
            state = "sd"
        }
        
        let image = getImageForShipAndState(ship, state: state)

        return image
    }
    
    func getLayer2(playerNotOpponent: Bool) -> UIImage? {
        
        var ship: ShipType
        var hullPercentage: Int
        var shieldPercentage: Int
        var state: String = ""
        var disabled: Bool
        
        if playerNotOpponent {
            ship = player.commanderShip.type
            hullPercentage = player.commanderShip.hullPercentage
            shieldPercentage = player.commanderShip.shieldPercentage
            if player.commanderShip.disabled {
                disabled = true
            } else {
                disabled = false
            }
        } else {
            ship = galaxy.currentJourney!.currentEncounter!.opponent.ship.type
            hullPercentage = galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage
            shieldPercentage = galaxy.currentJourney!.currentEncounter!.opponent.ship.shieldPercentage
            if galaxy.currentJourney!.currentEncounter!.opponent.ship.disabled {
                disabled = true
            } else {
                disabled = false
            }
        }
        
        // cases:
        // if disabled, nothing
        // if fully healthy, no sheilds, or fully shielded, no damage, nothing
        // if partly shielded, shields
        // if partly damaged and no shields, damage
        // if damaged and shielded but shields > damage, shielded
        
        var croppingShield = true
        var readingShield = true
        
        if disabled {
            state = "n"
        } else if (hullPercentage == 100) && (shieldPercentage == 0) {
            state = "n"
        } else if (shieldPercentage == 100) && (hullPercentage == 100) {
            state = "n"
        } else if (shieldPercentage == 0) && (hullPercentage < 100) {
            state = "d"
            readingShield = false
            croppingShield = false
        } else if (hullPercentage == 100) && (shieldPercentage < 100) {
            // full hull, partial shield
            state = "h"
            readingShield = true
            croppingShield = false
        } else if (shieldPercentage > hullPercentage) && (shieldPercentage < 100) {
            state = "sd"                                        // check this
            readingShield = false
            croppingShield = false
        } else if (shieldPercentage > hullPercentage) && (shieldPercentage == 100){
            state = "sd"                                        // check this
            readingShield = false       // THIS IS TROUBLE. SAYS IT'S DOING THIS, BUT JUST SHOWS SD
            croppingShield = true
        }
        else if hullPercentage > shieldPercentage {
            state = "h"
            croppingShield = false
            readingShield = true
        } else {
            state = "n"
        }
        
        if state != "n" {
            var image = getImageForShipAndState(ship, state: state)
            // set width
            let width = getOverlayWidthForDamage(playerNotOpponent, croppingShield: croppingShield, readingShield: readingShield)
            image = cropToWidth(image, width: width)
            
            return image
        } else {
            return nil
        }
    }
    
    func getLayer3(playerNotOpponent: Bool) -> UIImage? {
        
        var ship: ShipType
        var hullPercentage: Int
        var shieldPercentage: Int
        var state: String = ""
        
        if playerNotOpponent {
            ship = player.commanderShip.type
            hullPercentage = player.commanderShip.hullPercentage
            shieldPercentage = player.commanderShip.shieldPercentage
        } else {
            ship = galaxy.currentJourney!.currentEncounter!.opponent.ship.type
            hullPercentage = galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage
            shieldPercentage = galaxy.currentJourney!.currentEncounter!.opponent.ship.shieldPercentage
        }
        
        // cases:
        // if both hull and shield are at partial damage, add last bit of damaged hull
        //
        
        var croppingShield = false
        var readingShield = false
        
        if (shieldPercentage < 100) && (hullPercentage < 100) && (shieldPercentage > 0) && (shieldPercentage > hullPercentage) {
            state = "d"
            readingShield = true
            croppingShield = false
        } else if (shieldPercentage < 100) && (hullPercentage < 100) && (shieldPercentage > 0) && (hullPercentage > shieldPercentage) {
            state = "d"
            readingShield = false
            croppingShield = false
        } else {
            state = "n"
            croppingShield = false
            readingShield = true
        }
        
        if state != "n" {
            var image = getImageForShipAndState(ship, state: state)
            // set width
            let width = getOverlayWidthForDamage(playerNotOpponent, croppingShield: croppingShield, readingShield: readingShield)
            image = cropToWidth(image, width: width)
            
            return image
        } else {
            return nil
        }
    }

    
    func getImageForShipAndState(ship: ShipType, state: String) -> UIImage {
        var image: UIImage = UIImage(named: "ship0")!   // default, so the compiler doesn't get upset
        
        if ship == ShipType.Flea {
            if state == "h" {
                image = UIImage(named: "ship0")!
            } else if state == "d" {
                image = UIImage(named: "ship0d")!
            } else if state == "s" {
                //image = UIImage(named: "ship0s")
            } else {
                // state == "sd"
                //image = UIImage(named: "ship0sd")
            }
        } else if ship == ShipType.Gnat {
            if state == "h" {
                image = UIImage(named: "ship1")!
            } else if state == "d" {
                image = UIImage(named: "ship1d")!
            } else if state == "s" {
                //image = UIImage(named: "ship0s")
            } else {
                // state == "sd"
                //image = UIImage(named: "ship0sd")
            }
        } else if ship == ShipType.Firefly {
            if state == "h" {
                image = UIImage(named: "ship2")!
            } else if state == "d" {
                image = UIImage(named: "ship2d")!
            } else if state == "s" {
                image = UIImage(named: "ship2s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship2sd")!
            }
        } else if ship == ShipType.Mosquito {
            if state == "h" {
                image = UIImage(named: "ship3")!
            } else if state == "d" {
                image = UIImage(named: "ship3d")!
            } else if state == "s" {
                image = UIImage(named: "ship3s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship3sd")!
            }
        } else if ship == ShipType.Bumblebee {
            if state == "h" {
                image = UIImage(named: "ship4")!
            } else if state == "d" {
                image = UIImage(named: "ship4d")!
            } else if state == "s" {
                image = UIImage(named: "ship4s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship4sd")!
            }
        } else if ship == ShipType.Beetle {
            if state == "h" {
                image = UIImage(named: "ship5")!
            } else if state == "d" {
                image = UIImage(named: "ship5d")!
            } else if state == "s" {
                image = UIImage(named: "ship5s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship5sd")!
            }
        } else if ship == ShipType.Hornet {
            if state == "h" {
                image = UIImage(named: "ship6")!
            } else if state == "d" {
                image = UIImage(named: "ship6d")!
            } else if state == "s" {
                image = UIImage(named: "ship6s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship6sd")!
            }
        } else if ship == ShipType.Grasshopper {
            if state == "h" {
                image = UIImage(named: "ship7")!
            } else if state == "d" {
                image = UIImage(named: "ship7d")!
            } else if state == "s" {
                image = UIImage(named: "ship7s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship7sd")!
            }
        } else if ship == ShipType.Termite {
            if state == "h" {
                image = UIImage(named: "ship8")!
            } else if state == "d" {
                image = UIImage(named: "ship8d")!
            } else if state == "s" {
                image = UIImage(named: "ship8s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship8sd")!
            }
        } else if ship == ShipType.Wasp {
            if state == "h" {
                image = UIImage(named: "ship9")!
            } else if state == "d" {
                image = UIImage(named: "ship9d")!
            } else if state == "s" {
                image = UIImage(named: "ship9s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship9sd")!
            }
        } else if ship == ShipType.Custom {
            if state == "h" {
                image = UIImage(named: "ship10")!
            } else if state == "d" {
                image = UIImage(named: "ship10d")!
            } else if state == "s" {
                image = UIImage(named: "ship10s")!
            } else {
                // state == "sd"
                image = UIImage(named: "ship10sd")!
            }
        } else if ship == ShipType.SpaceMonster {
            if state == "h" {
                image = UIImage(named: "spaceMonster")!
            } else if state == "d" {
                image = UIImage(named: "spaceMonsterd")!
            } else if state == "s" {
                image = UIImage(named: "spaceMonsters")!
            } else {
                // state == "sd"
                image = UIImage(named: "spaceMonstersd")!
            }
        } else if ship == ShipType.Dragonfly {
            if state == "h" {
                image = UIImage(named: "dragonfly")!
            } else if state == "d" {
                image = UIImage(named: "dragonflyd")!
            } else if state == "s" {
                image = UIImage(named: "dragonflys")!
            } else {
                // state == "sd"
                image = UIImage(named: "dragonflysd")!
            }
        } else if ship == ShipType.Mantis {
            if state == "h" {
                image = UIImage(named: "mantis")!
            } else if state == "d" {
                image = UIImage(named: "mantisd")!
            } else if state == "s" {
                image = UIImage(named: "mantiss")!
            } else {
                // state == "sd"
                image = UIImage(named: "mantissd")!
            }
        } else if ship == ShipType.Scarab {
            if state == "h" {
                image = UIImage(named: "scarab")!
            } else if state == "d" {
                image = UIImage(named: "scarabd")!
            } else if state == "s" {
                image = UIImage(named: "scarabs")!
            } else {
                // state == "sd"
                image = UIImage(named: "scarabsd")!
            }
        } else if ship == ShipType.Scorpion {
            if state == "h" {
                image = UIImage(named: "scorpion")!
            } else if state == "d" {
                image = UIImage(named: "scorpiond")!
            } else if state == "s" {
                image = UIImage(named: "scorpions")!
            } else {
                // state == "sd"
                image = UIImage(named: "scorpionsd")!
            }
        } else {
            // ship == ShipType.Bottle
            if state == "h" {
                image = UIImage(named: "bottle")!
            } else if state == "d" {
                image = UIImage(named: "bottled")!
            } else if state == "s" {
                //image = UIImage(named: "ship0s")
            } else {
                // state == "sd"
                //image = UIImage(named: "ship0sd")
            }
        }
        
        return image
    }
    
    func cropToWidth(image: UIImage, width: Double) -> UIImage {
        
        let contextImage: UIImage = UIImage(CGImage: image.CGImage!)
        
        let contextSize: CGSize = contextImage.size
        
        let posX: CGFloat = 0.0
        let posY: CGFloat = 0.0
        
        let cgheight: CGFloat = contextSize.height
        
        let rect: CGRect = CGRectMake(posX, posY, CGFloat(width), cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    func setBadgeImage() {
        var image = UIImage(named: "badge_bang")
        
        switch galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus {
            case IFFStatusType.Pirate:
                image = UIImage(named: "badge_pirate")
            case IFFStatusType.Police:
                image = UIImage(named: "badge_police")
            case IFFStatusType.Trader:
                image = UIImage(named: "badge_trader")
            case IFFStatusType.Mantis:
                image = UIImage(named: "badge_alien")
            default:
                image = UIImage(named: "badge_bang")
        }
        
        badge.image = image
    }
    
    
    
    // END IMAGE STUFF****************************************************************************

}