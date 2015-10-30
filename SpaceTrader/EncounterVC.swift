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
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "messageHandler:", name: "encounterNotification", object: nil)
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
    
    // BUTTON FUNCTIONS***************************************************************************
    @IBAction func button1(sender: AnyObject) {
        let button1Text = galaxy.currentJourney!.currentEncounter!.button1Text
        if button1Text == "Attack" {
            print("attack pressed")
            attack()
        } else if button1Text == "Board" {
            print("board pressed")
            board()
        }
    }
    
    @IBAction func button2(sender: AnyObject) {
        let button2Text = galaxy.currentJourney!.currentEncounter!.button2Text
        if button2Text == "Flee" {
            print("flee pressed")
            flee()
        } else if button2Text == "Plunder" {
            print("plunder pressed")
            plunder()
        } else if button2Text == "Ignore" {
            print("ignore pressed")
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
    func messageHandler(notification: NSNotification) {
        let receivedMessage: String = notification.object! as! String
        
        if receivedMessage == "playerKilled" {
            gameOverModal()
        } else if receivedMessage == "dismissViewController" {
            dismissViewController()
        } else if receivedMessage == "simple" {
            launchGenericSimpleModal()
        } else if receivedMessage == "pirateDestroyed" {
            let statusType: IFFStatusType = galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus
            pirateOrTraderDestroyedAlert(statusType)
        } else if receivedMessage == "dismiss" {
            dismissViewController()
        } else if receivedMessage == "submit" {
            submit()
        }
    }
    
    func dismissViewController() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func redrawViewController() {
        self.viewDidLoad()
    }
    
    // END UTILITIES******************************************************************************
    // BUTTON ACTIONS*****************************************************************************
    func attack() {
        var actuallyAttack = true
        // warn if attacking police
        if (galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Police) && (player.policeRecordInt > 2) {
            
            let title: String = "Attack Police?"
            let message: String = "Are you sure you want to attack the police? Your police record will be set to criminal!"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Attack", style: UIAlertActionStyle.Destructive,handler: {
                (alert: UIAlertAction!) -> Void in
                // go ahead with it
                player.policeRecord = PoliceRecordType.criminalScore
                actuallyAttack = true
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
                actuallyAttack = true
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,handler: nil))
            // do nothing, dismiss modal
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            actuallyAttack = true
        }
        
        if actuallyAttack {
            var outcome = ""
            
            // if opponent is fleeing, harder to hit them
            var opponentFleeingMarksmanshipPenalty = 0
            if galaxy.currentJourney!.currentEncounter!.opponentFleeing {
                opponentFleeingMarksmanshipPenalty = 2
            }
            
            // player shoots at target. Determine outcome
            if rand(player.fighterSkill) + galaxy.currentJourney!.currentEncounter!.opponent.ship.probabilityOfHit > rand(galaxy.currentJourney!.currentEncounter!.pilotSkillOpponent) + opponentFleeingMarksmanshipPenalty {
                galaxy.currentJourney!.currentEncounter!.damageOpponent(25)
                galaxy.currentJourney!.currentEncounter!.youHitThem = true
                let damageToOpponent = rand((player.commanderShip.totalWeapons) * (100 + (2 * galaxy.currentJourney!.currentEncounter!.engineerSkillOpponent)) / 100)
                galaxy.currentJourney!.currentEncounter!.damageOpponent(damageToOpponent)
                //print("player hits target. Damage: \(damageToOpponent)")
            } else {
                //print("player misses target")
                galaxy.currentJourney!.currentEncounter!.youHitThem = false
            }
            
            // determine if player is damaged
            if !galaxy.currentJourney!.currentEncounter!.opponentFleeing {
                var playerFleeingMarksmanshipPenalty = 0
                
                if galaxy.currentJourney!.currentEncounter!.playerFleeing {
                    playerFleeingMarksmanshipPenalty = 2
                }
                
                if rand(galaxy.currentJourney!.currentEncounter!.fighterSkillOpponent) + player.commanderShip.probabilityOfHit > rand(player.pilotSkill) + playerFleeingMarksmanshipPenalty {
                    galaxy.currentJourney!.currentEncounter!.theyHitYou = true
                    let damageToPlayer = rand((galaxy.currentJourney!.currentEncounter!.opponent.ship.totalWeapons) * (100 + (2 * player.engineerSkill)) / 100)
                    galaxy.currentJourney!.currentEncounter!.damagePlayer(damageToPlayer)
                } else {
                    galaxy.currentJourney!.currentEncounter!.theyHitYou = false
                }
            }
            
            // determine outcome
            // default
            outcome = "fightContinues"
            
            
            if outcome == "fightContinues" {
                // if opponent is already fleeing, determine if he gets away
                if galaxy.currentJourney!.currentEncounter!.opponentFleeing {
                    if rand(10) < galaxy.currentJourney!.currentEncounter!.pilotSkillOpponent + 1 {
                        outcome = "opponentGetsAway"
                    }
                }
            }
            
            if outcome == "fightContinues" {        // ADD SURRENDER HERE
                // determine if opponent will flee--maybe do this by opponent type?
                if galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage < 10 {
                    if rand(10) > 3 {
                        galaxy.currentJourney!.currentEncounter!.opponentFleeing = true
                        outcome = "opponentFlees"
                    } else if rand(10) > 3 {
                        outcome = "opponentSurrenders"
                    }
                }
            }
            
            
            // if player is destroyed
            if player.commanderShip.hullPercentage <= 0 {
                if player.escapePod {
                    print("selecting escape pod")
                    outcome = "playerDestroyedEscapes"
                } else {
                    print("selecting no escape pod")
                    outcome = "playerDestroyedKilled"
                }
            }
            
            // if opponent is destroyed
            if galaxy.currentJourney!.currentEncounter!.opponent.ship.hullPercentage <= 0 {
                outcome = "opponentDestroyed"
            }
            
            // handle outcome
            switch outcome {
            case "opponentFlees":
                print("opponent flees")
                //outcomeOpponentFlees()
            case "playerDestroyedEscapes":
                print("player is destroyed but escapes")
                //outcomePlayerDestroyedEscapes()
            case "playerDestroyedKilled":
                print("player is killed, game over")
                //outcomePlayerDestroyedKilled()
            case "opponentDestroyed":
                print("opponent is destroyed")
                outcomeOpponentDestroyed()
            case "opponentGetsAway":
                print("opponent gets away")
                outcomeOpponentGetsAway()
            case "opponentSurrenders":
                print("opponent surrenders")
                //outcomeOpponentSurrenders()
            case "opponentDisabled":
                print("opponent is disabled")
                //outcomeOpponentDisabled()
            default:
                outcomeFightContinues()
                print("fight continues")
            }

        }
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
        if !contraband && (galaxy.currentJourney!.currentEncounter!.opponent.ship.IFFStatus == IFFStatusType.Police) {
            
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
            print("TODO: IMPLEMENT FLEEING")
        }
    }
    
    func plunder() {
        
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
        
    }
    
    func trade() {
        
    }
    
    func bribe() {
        // if system's bribe level is 0, display can't be bribed dialog
        let politics = Politics(type: galaxy.targetSystem!.politics)
        if politics.bribeLevel <= 0 {                                       // || Marie Celeste?
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
        print("ARREST!")
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
                self.runScoop()
            } else {
                self.dismissViewController()
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func runScoop() {
        print("scoop method firing")
    }
    
    
    // END CONSEQUENT ACTIONS*********************************************************************
    // ONLY OLD THINGS BENEATH HERE***************************************************************
    
    
    func fireAttackWarningModal(type: String) {
        var title: String = "Attack Police?"
        var message: String = "Are you sure you want to attack the police? Your police record will be set to criminal!"
        if type == "trader" {
            title = "Attack Trader?"
            message = "Are you sure you want to attack a trader? Your police record will be set to dubious!"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Attack", style: UIAlertActionStyle.Destructive,handler: {
            (alert: UIAlertAction!) -> Void in
            // go ahead with it
            if type == "police" {
                player.policeRecord = PoliceRecordType.criminalScore
            } else if type == "trader" {
                player.policeRecord = PoliceRecordType.dubiousScore
            }
            self.dismissViewControllerAnimated(false, completion: nil)
            //galaxy.currentJourney!.currentEncounter!.resumeEncounter(1)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    // use this when it is a notification with an OK button that does NOTHING but end the encounter
    func launchGenericSimpleModal() {
        let title = galaxy.currentJourney!.currentEncounter!.alertTitle
        let message = galaxy.currentJourney!.currentEncounter!.alertText
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss encounter dialog
            self.dismissViewControllerAnimated(false, completion: nil)
            // how to resume?
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func pirateOrTraderDestroyedAlert(type: IFFStatusType) {
        var title = ""
        var message = ""
        if type == IFFStatusType.Pirate && (player.policeRecordInt > 2) {
            let bounty = galaxy.currentJourney!.currentEncounter!.opponent.ship.bounty
            player.credits += bounty
            title = "Opponent Destroyed"
            message = "You have destroyed your opponent, earning a bounty of \(bounty) credits."
        } else {
            let bounty = galaxy.currentJourney!.currentEncounter!.opponent.ship.bounty
            player.credits += bounty
            
            title = "Opponent Destroyed"
            message = "You have destroyed your opponent."
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss encounter dialog
            //self.dismissViewControllerAnimated(false, completion: nil)
            var number = 0
            switch player.difficulty {
            case DifficultyType.beginner:
                number = 0
            case DifficultyType.easy:
                number = 0
            case DifficultyType.normal:
                number = 50
            case DifficultyType.hard:
                number = 66
            case DifficultyType.impossible:
                number = 75
            }
            
            if rand(100) > number {
                // scoop
                print("scooping...")
                self.scoop()
            } else {
                print("no scoop. Concluding encounter.")
                galaxy.currentJourney!.currentEncounter!.concludeEncounter()
            }
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func scoop() {
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
            // dismiss and resume, for now
            print("you picked it up")
            player.commanderShip.cargo.append(item)
            self.dismissViewControllerAnimated(false, completion: nil)
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        alertController.addAction(UIAlertAction(title: "Let It Go", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // dismiss and resume, for now
            print("you let it go")
            self.dismissViewControllerAnimated(false, completion: nil)
            galaxy.currentJourney!.currentEncounter!.concludeEncounter()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func gameOverModal() {
        let title: String = "You Lose"
        let message: String = "You ship has been destroyed by your opponent."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("gameOver", sender: nil)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}