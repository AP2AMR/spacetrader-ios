//
//  Encounter.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/13/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation

class Encounter {
    let type: EncounterType
    let opponent: Opponent
    let clicks: Int
    var encounterText1 = "null"
    var encounterText2 = "null"
    var encounterText3 = "null"
    var encounterText4 = "null"
    var encounterText5 = "null"
    var encounterText6 = "null"
    var button1Text = "button1"
    var button2Text = "button2"
    var button3Text = "button3"
    var button4Text = "button4"
    
    init(type: EncounterType, clicks: Int) {
        self.type = type
        self.clicks = clicks
        
        let IFF = getIFFStatusTypeforEncounterType(type)
        
        // generate opponent
        opponent = Opponent(type: IFF)
        opponent.generateOpponent()
        
    }
    
    func beginEncounter() {
        // if this is null, skip right to the end
        if type == EncounterType.nullEncounter {
            concludeEncounter()
        }
        
        setEncounterTextAndButtons()
        
        fireModal()
        
        // set data for first modal, fire it, and return
    }
    
    func resumeEncounter(buttonPressed: Int) {
        print("button pressed: \(buttonPressed)")
        
        if buttonPressed == 1 {
            if button1Text == "Attack" {
                attack()
            } else if button1Text == "Board" {
                board()
            }
        } else if buttonPressed == 2 {
            if button2Text == "Flee" {
                flee()
            } else if button2Text == "Plunder" {
                plunder()
            } else if button2Text == "Ignore" {
                ignore()
            }
        } else if buttonPressed == 3 {
            if button3Text == "Surrender" {
                surrender()
            } else if button3Text == "Submit" {
                submit()
            } else if button3Text == "Yield" {
                yield()
            } else if button3Text == "Trade" {
                trade()
            }
        } else if buttonPressed == 4 {
            if button4Text == "Bribe" {
                bribe()
            }
        }
    }
    
    func concludeEncounter() {
        print("concluding encounter and carrying on")
        galaxy.currentJourney!.resumeJourney()
    }
    
    func getBounty() -> Int {
        var bounty = opponent.ship.price / 200
        if bounty <= 0 {
            bounty = 25
        } else if bounty > 2500 {
            bounty = 2500
        }
        return bounty
    }
    
    func setEncounterTextAndButtons() {
        if type == EncounterType.pirateAttack {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Surrender"
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a pirate \(opponent.ship.name)."
            encounterText2 = "Your opponent attacks."

        } else if type == EncounterType.pirateSurrender {
            button1Text = "Attack"
            button2Text = "Plunder"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a pirate \(opponent.ship.name)."
            encounterText2 = "Your opponent hails that he surrenders to you."

        } else if type == EncounterType.pirateIgnore {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a pirate \(opponent.ship.name)."
            encounterText2 = "It ignores you."

        } else if type == EncounterType.pirateFlee {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a pirate \(opponent.ship.name)."
            encounterText2 = "Your opponent is fleeing."

        } else if type == EncounterType.policeInspection {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Submit"
            button4Text = "Bribe"
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a police \(opponent.ship.name)."
            encounterText2 = "The police summon you to submit to an inspection"

        } else if type == EncounterType.policeFlee {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a police \(opponent.ship.name)."
            encounterText2 = "Your opponent is fleeing."

        } else if type == EncounterType.policeAttack {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Surrender"
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a police \(opponent.ship.name)."
            encounterText2 = "Your opponent attacks."

        } else if type == EncounterType.policeIgnore {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a police \(opponent.ship.name)."
            encounterText2 = "It ignores you."

        } else if type == EncounterType.policeSurrenderDemand {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Surrender"
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a police \(opponent.ship.name)."
            encounterText2 = "The police hail that they want you to surrender."

        } else if type == EncounterType.postMariePoliceEncounter {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Yield"
            button4Text = "Bribe"
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a police \(opponent.ship.name)."
            encounterText2 = "We know you removed illegal goods from the Marie Celeste. You must give them up at once!"

        } else if type == EncounterType.pirateIgnore {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a pirate \(opponent.ship.name)."
            encounterText2 = "It ignores you."

        } else if type == EncounterType.pirateFlee {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a pirate \(opponent.ship.name)."
            encounterText2 = "Your opponent is fleeing."

        } else if type == EncounterType.marieCelesteEncounter {
            button1Text = "Board"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter the a trader ship, the Marie Celeste"
            encounterText2 = "The Marie Celeste appears to be completely abandoned."
        } else if type == EncounterType.traderBuy {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = "Trade"
            button4Text = ""
            
            encounterText2 = "You are hailed with an offer to trade goods."
            
        } else if type == EncounterType.traderSell {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = "Trade"
            button4Text = ""
            
            encounterText2 = "You are hailed with an offer to trade goods."
        } else if type == EncounterType.traderIgnore {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText2 = "It ignores you."
        } else if type == EncounterType.traderFlee {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText2 = "Your opponent is fleeing."
        } else if type == EncounterType.traderSurrender {
            button1Text = "Attack"
            button2Text = "Plunder"
            button3Text = ""
            button4Text = ""
            
            encounterText2 = "Your opponent hails that he surrenders to you."
        }
        

//        *case policeInspection
//        *case postMariePoliceEncounter
//        *case policeFlee
//        -case traderFlee
//        *case pirateFlee
//        *case pirateAttack
//        *case policeAttack
//        *case policeSurrenderDemand
//        case scarabAttack
//        case famousCapAttack
//        case spaceMonsterAttack
//        case dragonflyAttack
//        -case traderIgnore
//        *case policeIgnore
//        *case pirateIgnore
//        case spaceMonsterIgnore
//        case dragonflyIgnore
//        case scarabIgnore
//        case traderSurrender
//        -case pirateSurrender
//        -case marieCelesteEncounter
//        case HWAttack
//        case bottleGoodEncounter
//        case bottleOldEncounter
//        -case traderSell
//        -case traderBuy
        

    }
    
    func fireModal() {
        let passedText = NSString(string: "nothing needed here")
        NSNotificationCenter.defaultCenter().postNotificationName("encounterModalFireNotification", object: passedText)
    }
    
    func attack() {
        print("attack function called")
    }
    
    func flee() {
        print("flee function called")
    }
    
    func ignore() {
        print("ignore function called")
        //concludeEncounter()
    }
    
    func plunder() {
        print("plunder called")
    }
    
    func surrender() {
        print("surrender called")
    }
    
    func submit() {
        print("submit called")
    }
    
    func bribe() {
        print("bribe called")
    }
    
    func trade() {
        print("trade called")
    }
    
    func board() {
        print("board called")
    }
    
    func yield() {
        print("yield called")
    }
}