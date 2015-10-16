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
    let opponent: SpaceShip
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
        
        // generate opponent--original function GenerateOpponent in traveler.c
        // set opponent ShipType
        var opponentShipType = ShipType.Gnat
        
        // obviously just a test
        let testIFF = IFFStatusType.Pirate
        self.opponent = SpaceShip(type: ShipType.Beetle, IFFStatus: testIFF)
    }
    
    func beginEncounter() {
        // HandleEncounterType? What type will be given here? Presumably a specific one?
        // DrawEncounterTextAndButtons
        setEncounterTextAndButtons()
        
        fireModal()
        
        // set data for first modal, fire it, and return
    }
    
    func resumeEncounter(buttonPressed: Int) {
        print("button pressed: \(buttonPressed)")
    }
    
    func concludeEncounter() {
        galaxy.currentJourney!.resumeJourney()
    }
    
    func getBounty() -> Int {
        var bounty = opponent.price / 200
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
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "pirate \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "Your opponent attacks."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.pirateSurrender {
            button1Text = "Attack"
            button2Text = "Plunder"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "pirate \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "Your opponent hails that he"
            encounterText5 = "surrenders to you."
            encounterText6 = ""
        } else if type == EncounterType.pirateIgnore {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "pirate \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "It ignores you."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.pirateFlee {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "pirate \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "Your opponent is fleeing."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.policeInspection {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Submit"
            button4Text = "Bribe"
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "police \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "The police summon you to submit to an"
            encounterText5 = "inspection."
            encounterText6 = ""
        } else if type == EncounterType.policeFlee {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "police \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "Your opponent is fleeing."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.policeAttack {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Surrender"
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "police \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "Your opponent attacks."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.policeIgnore {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "police \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "It ignores you."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.policeSurrenderDemand {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Surrender"
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "police \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "The police hail they want"
            encounterText5 = "you to surrender."
            encounterText6 = ""
        } else if type == EncounterType.postMariePoliceEncounter {
            button1Text = "Attack"
            button2Text = "Flee"
            button3Text = "Yield"
            button4Text = "Bribe"
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "police \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "We know you removed illegal"
            encounterText5 = "goods from the Marie Celeste."
            encounterText6 = "You must give them up at once!"
        } else if type == EncounterType.pirateIgnore {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "pirate \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "It ignores you."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.pirateFlee {
            button1Text = "Attack"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "pirate \(opponent.name)."
            encounterText3 = ""
            encounterText4 = "Your opponent is fleeing."
            encounterText5 = ""
            encounterText6 = ""
        } else if type == EncounterType.marieCelesteEncounter {
            button1Text = "Board"
            button2Text = "Ignore"
            button3Text = ""
            button4Text = ""
            
            encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a"
            encounterText2 = "[SOMETHING]"
            encounterText3 = ""
            encounterText4 = "The Marie Celeste appears to"
            encounterText5 = "be completely abandoned."
            encounterText6 = ""
        }
        
        // UP NEXT
        // traderBuy
        // traderSell
        // traderFlee
        // traderIgnore
        
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
}